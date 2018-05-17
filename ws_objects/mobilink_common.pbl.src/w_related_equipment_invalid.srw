$PBExportHeader$w_related_equipment_invalid.srw
forward
global type w_related_equipment_invalid from window
end type
type manual_configuration_t from statictext within w_related_equipment_invalid
end type
type dw_1 from datawindow within w_related_equipment_invalid
end type
type dw_log from datawindow within w_related_equipment_invalid
end type
type st_label from statictext within w_related_equipment_invalid
end type
type cb_ok from commandbutton within w_related_equipment_invalid
end type
type cb_cancel from commandbutton within w_related_equipment_invalid
end type
end forward

global type w_related_equipment_invalid from window
integer width = 1097
integer height = 1280
string menuname = "mnu_blank"
windowtype windowtype = response!
string icon = "AppIcon!"
boolean contexthelp = true
manual_configuration_t manual_configuration_t
dw_1 dw_1
dw_log dw_log
st_label st_label
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_related_equipment_invalid w_related_equipment_invalid

type prototypes
Function Long RegisterWindowMessage(string lpString) Library "coredll" ALIAS FOR "RegisterWindowMessageW"
FUNCTION unsignedlong FindWindow_CE(long ClassName, string WindowName) LIBRARY "coredll.dll" ALIAS FOR "FindWindowW"
end prototypes

type variables
public integer		ii_Log_Id
public string		is_Arguments

string				is_Action // UPLOAD or DOWNLOAD
string				is_Host_Name
string				is_Engine_Name
transaction			db_Consolidated_Trans
//string				is_SerialNumber
//u_user_ml			uo_user_ml
end variables

forward prototypes
public subroutine wf_disconnect_from_consolidated ()
public function string wf_get_host_name ()
public function boolean wf_authorize_device ()
public function string wf_get_engine_name ()
public function boolean wf_retrieve ()
public function boolean wf_connect_to_consolidated ()
public subroutine wf_process_related_equipment_config ()
end prototypes

public subroutine wf_disconnect_from_consolidated ();DISCONNECT USING db_Consolidated_Trans ;

end subroutine

public function string wf_get_host_name ();string ls_Host

SELECT ISNULL(value_id, '') 
  INTO :ls_Host 
  FROM mobilink_settings 
 WHERE ( key_id = 'ml_host' ) ;

IF Empty(ls_Host) THEN
	MessageBox(f_dW_Language_call_2('Host is empty'), f_dW_Language_call_2('You require an updated esoms.db / esoms.log file.  Please contact your administrator.'))
END IF

RETURN ls_Host
end function

public function boolean wf_authorize_device ();string ls_Message
boolean lb_Return
string ls_DateTime
integer li_License_Count
integer li_Count
string ls_IP_Address
string ls_Name
string ls_Description
string ls_MB_String
string ls_MB_String_2
string ls_Parameters[]
string ls_Delimiters[]
string ls_Blank[]

ls_DateTime = String(DateTime(Today(), Now()))
IF gb_platform_is_ce THEN
	ls_IP_Address = fnGetIPAddress()
	ls_IP_Address = fnGetIPAddress()
ELSE
	ls_IP_Address = '127.0.0.1'
END IF
RegistryGet("HKEY_LOCAL_MACHINE\IDENT", "NAME", RegString!, ls_Name)
RegistryGet("HKEY_LOCAL_MACHINE\IDENT", "DESC", RegString!, ls_Description)

SELECT COUNT(*) 
  INTO :li_Count
  FROM mobile_esoms_devices 
 WHERE ( serialnumber = :gs_serialnumber ) 
 USING db_Consolidated_Trans ;

IF ( li_Count > 0 ) THEN
	ROLLBACK USING db_Consolidated_Trans ;
	lb_Return = TRUE
ELSE

	SELECT COUNT(*) 
	  INTO :li_Count 
	  FROM mobile_esoms_devices 
	 USING db_Consolidated_Trans ;

	SELECT ISNULL(license_count, 0) 
	  INTO :li_License_Count 
	  FROM mobile_esoms_licenses 
	 USING db_Consolidated_Trans ;

    IF ( li_Count > li_License_Count ) THEN
		ROLLBACK USING db_Consolidated_Trans ;
		ls_Message = f_Dw_Language_call_2('License count is maxed out.')
		lb_Return = FALSE
	 ELSE
		ls_Parameters[1] = ls_DateTime
		ls_Delimiters[1] = '###DATE###'
		ls_MB_String = 'Mobile Device added on ###DATE###'
		ls_MB_String = guo_user_settings.uf_LanguageString_2('MOBILE_DEVICE_ADDED_ON_###DATE###', ls_MB_String, ls_Parameters, ls_Delimiters)
		ls_Parameters = ls_Blank
		ls_Delimiters = ls_Blank

		INSERT INTO mobile_esoms_devices 
					( serialnumber, 
            	  ipaddress, 
            	  name, 
            	  description, 
            	  notes ) 
        VALUES ( :gs_Serialnumber, 
            	  :ls_IP_Address, 
            	  :ls_Name, 
	              :ls_Description, 
            	  :ls_MB_String ) 
			USING db_Consolidated_Trans ;

		IF ( db_Consolidated_Trans.SQLCode = 0 ) THEN
			lb_Return = TRUE
			COMMIT USING db_Consolidated_Trans ;
		ELSE
			ls_Message = f_DW_Language_call_2('Error inserting device into mobile_esoms_devices table.')
			lb_Return = FALSE
			ROLLBACK USING db_Consolidated_Trans ;
		END IF
	END IF
END IF

IF NOT lb_Return THEN
//	MessageBox('Error', ls_Message)
END IF

RETURN lb_Return
end function

public function string wf_get_engine_name ();string ls_Engine

SELECT ISNULL(value_id, '') 
  INTO :ls_Engine 
  FROM mobilink_settings 
 WHERE ( key_id = 'ml_engine' ) ;

IF Empty(ls_Engine) THEN
	MessageBox(f_DW_Language_call_2('Engine name is empty'), f_DW_Language_call_2('You require an updated esoms.db / esoms.log file.  Please contact your administrator.'))
END IF

RETURN ls_Engine
end function

public function boolean wf_retrieve ();boolean lb_Connected_Consol
integer li_Return
boolean lb_Return
integer li_Num_Rows

dw_log.SetRedraw(FALSE)
dw_1.SetRedraw(FALSE)
lb_Connected_Consol = wf_Connect_To_Consolidated()
IF lb_Connected_Consol THEN
	SetPointer(HourGlass!)
	li_Return = dw_log.SetTransObject(db_Consolidated_Trans)
	li_Return = dw_1.SetTransObject(db_Consolidated_Trans)
	li_Num_Rows = dw_log.Retrieve(gs_SerialNumber)
	li_Num_Rows = li_Num_Rows + dw_1.Retrieve(gs_SerialNumber)
	lb_Return = ( li_Num_Rows > 0 )
ELSE
	MessageBox(f_DW_Language_call_2('Error'), f_DW_Language_call_2('Unable to connect to the consolidated database'), Exclamation!)
	SetPointer(Arrow!)
	lb_Return = FALSE
END IF
dw_log.SetRedraw(TRUE)
dw_1.SetRedraw(TRUE)
wf_Disconnect_From_Consolidated()

RETURN lb_Return
end function

public function boolean wf_connect_to_consolidated ();string ls_MB_String
string ls_Connection_Consol
boolean lb_Connected_Consol
string ls_ASA_Port

SELECT value_id 
  INTO :ls_ASA_Port 
  FROM mobilink_settings 
 WHERE ( key_id = 'ml_engine_port' ) ;

IF Empty(ls_ASA_Port) THEN
	ls_ASA_Port = '2639'
END IF
IF gb_SA11 THEN
	IF gb_platform_is_ce THEN
//		ls_Connection_Consol = "ConnectString='Driver=dbodbc11.dll;UID=dba;PWD=sql;ENG=" + is_Engine_Name + ";DBN=" + is_Engine_Name + ";commlinks=tcpip{dobroadcast=none;host=" + is_Host_Name + ":" + ls_ASA_Port + "}',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT',DisableBind=1"
		ls_Connection_Consol = "ConnectString='Driver=\Windows\dbodbc11.dll;UID=dba;PWD=sql;ENG=" + is_Engine_Name + ";DBN=" + is_Engine_Name + ";commlinks=tcpip{dobroadcast=none;host=" + is_Host_Name + ":" + ls_ASA_Port + "}'"
	ELSE
//		ls_Connection_Consol = "ConnectString='Driver=SQL Anywhere 11;UID=dba;PWD=sql;eng=" + is_Engine_Name + ";dbn=" + is_Engine_Name + ";commlinks=tcpip{dobroadcast=none;host=" + is_Host_Name + ":" + ls_ASA_Port + "}',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
		ls_Connection_Consol = "ConnectString='Driver=SQL Anywhere 11;UID=dba;PWD=sql;ENG=" + is_Engine_Name + ";DBN=" + is_Engine_Name + ";LINKS=TCPIP(IP=" + is_Host_Name + ";PORT=" + ls_ASA_Port + ")"
//		ls_Connection_Consol = "ConnectString='DSN=esoms_sa11;UID=dba;PWD=sql;',PBCatalogOwner='DBA'"
	END IF
ELSE
	IF gb_platform_is_ce THEN
		ls_Connection_Consol = "ConnectString='Driver=dbodbc9.dll;UID=dba;PWD=sql;ENG=" + is_Engine_Name + ";DBN=" + is_Engine_Name + ";commlinks=tcpip{dobroadcast=none;host=" + is_Host_Name + ":" + ls_ASA_Port + "}',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT',DisableBind=1"
	ELSE
		ls_Connection_Consol = "ConnectString='Driver=Adaptive Server Anywhere 9.0;UID=dba;PWD=sql;eng=" + is_Engine_Name + ";dbn=" + is_Engine_Name + ";commlinks=tcpip{dobroadcast=none;host=" + is_Host_Name + ":" + ls_ASA_Port + "}',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
	END IF
END IF

DISCONNECT USING db_Consolidated_Trans;

IF NOT IsValid(db_Consolidated_Trans) THEN
	db_Consolidated_Trans = CREATE transaction
END IF

db_Consolidated_Trans.DBMS = 'ODBC'
db_Consolidated_Trans.AutoCommit = False
db_Consolidated_Trans.DBPARM = ls_Connection_Consol

CONNECT USING db_Consolidated_Trans;

lb_Connected_Consol = ( db_Consolidated_Trans.SQLCode = 0 )
IF lb_Connected_Consol THEN
	IF gb_SA11 THEN
		string ls_SQL
		ls_SQL = "SET TEMPORARY OPTION CONNECTION_AUTHENTICATION='Company=Ventyx;Application=eSOMS;Signature=000fa55157edb8e14d818eb4fe3db41447146f1571g59565faf413c2f174c22c14a17adeee0bdf212ca'"
		EXECUTE IMMEDIATE :ls_SQL USING db_Consolidated_Trans ;
	END IF	
	
	integer li_temp
	SELECT COUNT(*) INTO :li_temp FROM userlog USING db_Consolidated_Trans ;
		
	IF NOT wf_Authorize_device() THEN
		MessageBox(f_DW_Language_call_2('Sybase ASA License Limit Exceeded'), f_DW_Language_call_2('This Mobile Device is not allowed to synchronize with the Sybase ASA 9 consolidated database.'), StopSign!)
		lb_Connected_Consol = FALSE
	END IF
ELSE
	MessageBox(f_DW_Language_call_2('Connection Error'), f_DW_Language_call_2('Unable to connect to consolidated.') + '~n~r~n~r' + db_Consolidated_Trans.SQLErrText) 
END IF

RETURN lb_Connected_Consol

end function

public subroutine wf_process_related_equipment_config ();boolean lb_Add_Row
string ls_Serialnumber
string ls_User_Id
datetime ldt_Equip_History_Event_DT
string ls_Equip_History_Instruction
integer li_Log_Id
integer li_Shift_Id
datetime ldt_Shift_Date
datetime ldt_Entry_Timestamp
integer li_Annotation_Number
string ls_Equip_History_Event_Desc
string ls_Service_Status
integer li_Service_Status
string ls_SQL_Error_Text
string ls_equip_performance_notes
integer li_Response
integer li_Count
integer li_Num_Rows
boolean lb_Update_Equip_Config
boolean lb_Conflict
string ls_Equip_Operator_Id
string ls_Config

ls_equip_performance_notes	= f_DW_Language_call_2('Uploaded from Mobile Device')
ldt_Equip_History_Event_DT = DateTime(Today(), Now())
IF wf_Connect_To_Consolidated() THEN
	li_Num_Rows = dw_1.RowCount()
	FOR li_Count = 1 TO li_Num_Rows
		IF ( dw_1.Object.process[li_Count] = 1 ) THEN
			li_Log_Id = dw_1.Object.log_id[li_Count]
			string ls_Value_Id
			
			SELECT value_id 
			  INTO :ls_Value_Id 
			  FROM log_preferences 
			 WHERE ( log_id = :li_Log_Id ) 
			   AND ( key_id = 'UpdateEquipmentConfig' ) 
			 ORDER BY 1, 2, 3 ;
			
			IF Empty(ls_Value_Id) THEN
				ls_Value_Id = f_DW_Language_call_2('No')
			END IF
			lb_Update_Equip_Config = ( Upper(ls_Value_Id) = Upper(f_DW_Language_call_2('Yes')) )
//			lb_Update_Equip_Config = ( Upper(f_Log_ProfileString(li_Log_Id, 'UpdateEquipmentConfig', f_DW_Language_call_2('No'))) = Upper(f_DW_Language_call_2('Yes')) )
			IF lb_Update_Equip_Config THEN
				ls_Equip_Operator_Id = dw_1.Object.equip_operator_id[li_Count]
				ls_Config = dw_1.Object.config[li_Count]
				li_Service_Status = dw_1.Object.service_status[li_Count]
				ls_Serialnumber = dw_1.Object.serialnumber[li_Count]
				li_Shift_Id = dw_1.Object.shift_id[li_Count]
				ldt_Shift_Date = dw_1.Object.shift_date[li_Count]
				ldt_Entry_Timestamp = dw_1.Object.entry_timestamp[li_Count]
				li_Annotation_Number = dw_1.Object.annotation_number[li_Count]
				li_Response	= f_Check_Equip_Status_Entries(ls_Equip_Operator_Id, ls_Config, db_Consolidated_Trans)
				CHOOSE CASE li_Response
					CASE 1 // 'Yes' Selected, accept Configuration
			
						UPDATE equip 
							SET config = :ls_Config 
						 WHERE ( equip_operator_id = :ls_Equip_Operator_Id ) 
						 USING db_consolidated_trans ;
							
						IF ( db_consolidated_trans.SQLCode <> 0 ) THEN
							CONTINUE
						ELSE
							CHOOSE CASE li_Service_Status
								CASE 0		// OOS
									ls_Service_Status = f_DW_Language_call_2('OUT_OF_SERVICE', 'OOS')
								CASE 1		// IS
									ls_Service_Status = f_DW_Language_call_2('IN_SERVICE', 'IS')
								CASE ELSE	// NA
									ls_Service_Status = f_DW_Language_call_2('NA_SERVICE', 'NA')
							END CHOOSE
							ls_Equip_History_Event_Desc = f_DW_Language_call_2('Log') + ': ' + String(li_Log_Id) + ', ' + f_DW_Language_call_2('Shift') + ': ' + String(li_Shift_Id) + ', ' + f_DW_Language_call_2('Shift Date') + ': ' + String(ldt_Shift_Date, '[shortdate]') + ', ' + f_DW_Language_call_2('Entry Timestamp') + ': ' + String(ldt_Entry_Timestamp, 'mm/dd/yyyy hh:mm:ss')
							ls_Equip_History_Instruction = ''
							IF NOT Empty(ls_Service_Status) THEN
								ls_Equip_History_Event_Desc = f_DW_Language_call_2('Status') + ': ' + ls_Service_Status + ', ' + ls_Equip_History_Event_Desc
							END IF
						END IF			
						lb_Add_Row = TRUE
					CASE 2 // 'No' Selected, Set Configuration to Null
						SetNull(ls_Config)
						IF NOT Empty(ls_Service_Status) THEN
							ls_Equip_History_Event_Desc = f_DW_Language_call_2('Status') + ': ' + ls_Service_Status + ', ' + ls_Equip_History_Event_Desc
							lb_Add_Row = TRUE
						ELSE
							lb_Add_Row = FALSE
						END IF
					CASE 3 // 'Cancel' Selected, Exit
						lb_Add_Row = FALSE
				END CHOOSE
				IF lb_Add_Row THEN
	
					SELECT user_id 
					  INTO :ls_User_Id 
					  FROM log_entries 
					 WHERE ( log_id = :li_Log_Id ) 
						AND ( shift_id = :li_Shift_Id ) 
						AND ( shift_date = :ldt_Shift_Date ) 
						AND ( entry_timestamp = :ldt_Entry_timestamp ) 
						AND ( annotation_number = :li_Annotation_Number ) 
					USING db_consolidated_trans ;
			
					INSERT INTO equip_history 
								 ( module_id, 
									event_id, 
									equip_operator_id, 
									equip_history_event_dt, 
									user_id, 
									equip_history_config, 
									equip_history_instruction, 
									equip_history_event_desc,
									equip_performance_notes ) 
						VALUES ( 'NLOGS', 
									10, 
									:ls_Equip_Operator_Id, 
									:ldt_Equip_History_Event_DT, 
									:ls_User_Id, 
									:ls_Config, 
									:ls_Equip_History_Instruction, 
									:ls_Equip_History_Event_Desc,
									:ls_equip_performance_notes) 
							USING db_consolidated_trans ;
							
					IF ( db_consolidated_trans.SQLCode = 0 ) THEN
	
						DELETE FROM related_equipment_upload_hold 
						 WHERE ( equip_operator_id = :ls_Equip_Operator_Id ) 
							AND ( serialnumber = :ls_Serialnumber ) 
							AND ( log_id = :li_Log_Id ) 
							AND ( shift_id = :li_Shift_Id ) 
							AND ( shift_date = :ldt_Shift_Date ) 
							AND ( entry_timestamp = :ldt_Entry_Timestamp ) 
						 USING db_consolidated_trans ;
	
					END IF
				END IF
			END IF
		END IF
	NEXT

	COMMIT USING db_consolidated_trans ;
	
END IF

end subroutine

on w_related_equipment_invalid.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.manual_configuration_t=create manual_configuration_t
this.dw_1=create dw_1
this.dw_log=create dw_log
this.st_label=create st_label
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.Control[]={this.manual_configuration_t,&
this.dw_1,&
this.dw_log,&
this.st_label,&
this.cb_ok,&
this.cb_cancel}
end on

on w_related_equipment_invalid.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.manual_configuration_t)
destroy(this.dw_1)
destroy(this.dw_log)
destroy(this.st_label)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;integer li_Width
long ll_Num_Rows

SetPointer(Arrow!)
db_Consolidated_Trans = CREATE transaction
is_Host_Name = wf_Get_Host_Name()
is_Engine_Name = wf_Get_Engine_Name()
IF Empty(is_Host_Name) OR Empty(is_Engine_Name) THEN
	Close	(This)
ELSE
//	li_Width = 100 + f_Get_TextBox_Width_From_String(st_label.Text, dw_log.Width, FALSE)
//	st_label.Width = li_Width
	This.Title = gs_Window_Title
	st_label.Text = f_DW_Language_call_2('Invalid Related Equipment')
	cb_ok.Text = f_DW_Language_call_2('Ok')
	cb_cancel.Text = f_DW_Language_call_2('Cancel')
	manual_configuration_t.Text = f_DW_Language_call_2('Manual Equipment Configuration')
	IF NOT wf_Retrieve() THEN
		Post Close(This)
		RETURN
	ELSE
		guo_window.Post uf_ReSize(w_related_equipment_invalid)
	END IF
END IF
end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event close;gl_X = This.X
gl_Y = This.Y
DESTROY db_Consolidated_Trans ;

end event

event closequery;//// Remove any invalid equipment after review
//	
//DELETE FROM related_equipment_upload_hold 
// WHERE ( serialnumber = :gs_Serialnumber ) 
// USING db_consolidated_trans ;
//
//MessageBox('', db_consolidated_trans.SQLerrtext)
//
//COMMIT USING db_consolidated_trans ;
end event

event activate;This.X = gl_X
This.Y = gl_Y

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type manual_configuration_t from statictext within w_related_equipment_invalid
integer x = 18
integer y = 480
integer width = 1042
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Manual Equipment Configuration"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_related_equipment_invalid
integer x = 18
integer y = 552
integer width = 1042
integer height = 416
integer taborder = 40
string title = "none"
string dataobject = "d_manual_configuration"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;string ls_Column

ls_Column = dwo.Name
CHOOSE CASE ls_Column
	CASE 'process'
		IF ( This.Object.process[row] = 0 ) THEN
			This.Object.process[row] = 1
		ELSE
			This.Object.process[row] = 0
		END IF
END CHOOSE
end event

type dw_log from datawindow within w_related_equipment_invalid
integer x = 18
integer y = 64
integer width = 1042
integer height = 416
integer taborder = 30
string title = "none"
string dataobject = "d_related_equipment_invalid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type st_label from statictext within w_related_equipment_invalid
integer x = 18
integer width = 1061
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Invalid Related Equipment"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_related_equipment_invalid
integer x = 201
integer y = 976
integer width = 274
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;wf_Process_Related_Equipment_Config()

CLOSE(Parent)
end event

type cb_cancel from commandbutton within w_related_equipment_invalid
integer x = 567
integer y = 976
integer width = 274
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CLOSE(Parent)
end event

