$PBExportHeader$w_select_from_asa.srw
forward
global type w_select_from_asa from window
end type
type dw_step from datawindow within w_select_from_asa
end type
type dw_log from datawindow within w_select_from_asa
end type
type pb_calendar from picturebutton within w_select_from_asa
end type
type em_scheduled from editmask within w_select_from_asa
end type
type st_scheduled from statictext within w_select_from_asa
end type
type dw_tour from datawindow within w_select_from_asa
end type
type cbx_hang from checkbox within w_select_from_asa
end type
type cbx_restore from checkbox within w_select_from_asa
end type
type cbx_verbosity from checkbox within w_select_from_asa
end type
type cbx_common from checkbox within w_select_from_asa
end type
type st_rev_no from statictext within w_select_from_asa
end type
type st_tour from statictext within w_select_from_asa
end type
type st_label from statictext within w_select_from_asa
end type
type cb_ok from commandbutton within w_select_from_asa
end type
type cb_cancel from commandbutton within w_select_from_asa
end type
type cb_refresh from commandbutton within w_select_from_asa
end type
type dw_section from datawindow within w_select_from_asa
end type
type cbx_select_all from checkbox within w_select_from_asa
end type
end forward

global type w_select_from_asa from window
integer width = 1097
integer height = 1280
string menuname = "mnu_blank"
windowtype windowtype = response!
string icon = "AppIcon!"
boolean contexthelp = true
dw_step dw_step
dw_log dw_log
pb_calendar pb_calendar
em_scheduled em_scheduled
st_scheduled st_scheduled
dw_tour dw_tour
cbx_hang cbx_hang
cbx_restore cbx_restore
cbx_verbosity cbx_verbosity
cbx_common cbx_common
st_rev_no st_rev_no
st_tour st_tour
st_label st_label
cb_ok cb_ok
cb_cancel cb_cancel
cb_refresh cb_refresh
dw_section dw_section
cbx_select_all cbx_select_all
end type
global w_select_from_asa w_select_from_asa

type prototypes
Function Long RegisterWindowMessage(string lpString) Library "coredll" ALIAS FOR "RegisterWindowMessageW"
FUNCTION unsignedlong FindWindow_CE(long ClassName, string WindowName) LIBRARY "coredll.dll" ALIAS FOR "FindWindowW"
end prototypes

type variables
public string		is_Arguments

string				is_Action // UPLOAD or DOWNLOAD
string				is_Host_Name
string				is_Engine_Name
transaction			db_Consolidated_Trans
u_user_ml			uo_user_ml
boolean				ib_Deadlock
// New
boolean				ib_NCS
boolean				ib_NCCS
boolean				ib_NLOGS
boolean				ib_NPTS
boolean				ib_Sync_NCS
boolean				ib_Sync_NCCS
boolean				ib_Sync_NLOGS
boolean				ib_Sync_NPTS
string				is_Section_Label
string				is_Tagout_Label
boolean				ib_Related_Equipment
// New
end variables

forward prototypes
public function boolean wf_authorize_device ()
public function boolean wf_connect_to_consolidated ()
public subroutine wf_disconnect_from_consolidated ()
public subroutine wf_display_messages ()
public function string wf_get_engine_name ()
public function string wf_get_host_name ()
public function integer wf_set_system_time ()
public function boolean wf_synchronize ()
public subroutine wf_setup_npts_for_synch ()
public subroutine wf_setup_nlogs_for_synch ()
public subroutine wf_setup_ncs_for_synch ()
public subroutine wf_setup_nccs_for_synch ()
public function boolean wf_retrieve_step_list ()
public function boolean wf_retrieve_tour_list ()
public function boolean wf_retrieve_log_list ()
public function boolean wf_retrieve_section_list ()
end prototypes

public function boolean wf_authorize_device ();// multimodulesynch good
string ls_Message
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
		ls_Message = f_DW_Language_call_2('License count is maxed out.')
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
			ls_Message = f_DW_Language_call_2('Error inserting device into mobile_esoms_devices table.' + CHAR(13) + CHAR(10) + db_consolidated_trans.SQLErrText)
			lb_Return = FALSE
			ROLLBACK USING db_Consolidated_Trans ;
		END IF
	END IF
END IF

IF NOT lb_Return THEN
	MessageBox(f_DW_Language_call_2('Error'), ls_Message)
END IF

RETURN lb_Return
end function

public function boolean wf_connect_to_consolidated ();// multimodulesynch good
string ls_MB_String
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
	IF NOT wf_Authorize_device() THEN
		MessageBox(f_DW_Language_call_2('Sybase ASA License Limit Exceeded'), f_DW_Language_call_2('This Mobile Device is not allowed to synchronize with the Sybase ASA 9 consolidated database.'), StopSign!)
		lb_Connected_Consol = FALSE
	END IF
ELSE
	MessageBox(f_DW_Language_call_2('Connection Error'), f_DW_Language_call_2('Unable to connect to consolidated.') + '~n~r~n~r' + db_Consolidated_Trans.SQLErrText) 
END IF

RETURN lb_Connected_Consol

end function

public subroutine wf_disconnect_from_consolidated ();// multimodulesynch good
DISCONNECT USING db_Consolidated_Trans ;

end subroutine

public subroutine wf_display_messages ();// multimodulesynch good
string ls_Module_Id
integer li_Count

ls_Module_Id = gs_Module_Id

SELECT COUNT(*) 
  INTO :li_Count 
  FROM ml_sync_messages 
 WHERE ( module_id = :ls_Module_Id ) ;

IF ( li_Count > 0 ) THEN
	Open(w_messages)
END IF
end subroutine

public function string wf_get_engine_name ();// multimodulesynch good
string ls_Engine

SELECT value_id 
  INTO :ls_Engine 
  FROM mobilink_settings 
 WHERE ( key_id = 'ml_engine' ) ;

IF Empty(ls_Engine) THEN
	MessageBox(f_DW_Language_call_2('Engine name is empty'), f_DW_Language_call_2('You require an updated esoms.db / esoms.log file.  Please contact your administrator.'))
END IF

RETURN ls_Engine
end function

public function string wf_get_host_name ();// multimodulesynch good
string ls_Host

SELECT value_id 
  INTO :ls_Host 
  FROM mobilink_settings 
 WHERE ( key_id = 'ml_host' ) ;

IF Empty(ls_Host) THEN
	MessageBox(f_dW_Language_call_2('Host is empty'), f_dW_Language_call_2('You require an updated esoms.db / esoms.log file.  Please contact your administrator.'))
END IF

RETURN ls_Host
end function

public function integer wf_set_system_time ();// multimodulesynch good
string ls_eSOMS_TZ_Offset
string ls_Sql
integer li_Return
datetime ldt_Sync_DateTime
datetime ldt_Sync_DateTime_Blank
integer li_eSOMS_TZ_Offset
	
IF wf_Connect_To_Consolidated() THEN

	integer li_Num_Rows
//	string ls_Sql_Test
//	datastore lds_temp
	
//	lds_temp = CREATE datastore
//	lds_temp.SetTransObject(db_Consolidated_Trans)
//	ls_Sql_Test = "SELECT fn_Get_eSOMS_Datetime(0) FROM DUMMY "
////	ls_Sql_Test = "SELECT CURRENT TIMESTAMP FROM DUMMY "
//
//	li_Num_Rows = f_Datastore_From_Sql_With_Trans(ls_Sql, lds_temp, db_Consolidated_Trans)
//	lds_temp.Reset()
//	DESTROY lds_temp

	SELECT value_id 
	  INTO :ls_eSOMS_TZ_Offset 
	  FROM mobilink_settings 
	 WHERE ( key_id = 'ml_tz_offset' ) 
	 USING SQLCA ;

	IF Empty(ls_eSOMS_TZ_Offset) THEN
		ls_eSOMS_TZ_Offset = ''
	END IF
	li_eSOMS_TZ_Offset = Integer(ls_eSOMS_TZ_Offset)
	li_Num_Rows = SQLCA.SQLNRows

	INSERT INTO ml_timezone_offset 
					( serialnumber, 
					  esoms_tz_offset ) 
		  VALUES ( :gs_serialnumber, 
					  :ls_eSOMS_TZ_Offset ) 
	USING db_Consolidated_Trans ;

	UPDATE ml_timezone_offset 
		SET esoms_tz_offset = :ls_eSOMS_TZ_Offset 
	 WHERE ( serialnumber = :gs_serialnumber ) 
	USING db_Consolidated_Trans ;

//	IF ( li_Num_Rows = 1 ) THEN
//
//		ls_Sql = " &
//			INSERT INTO sync &
//				 ( serialnumber, &
//					ml_uuid, &
//					sync_time, &
//					action ) &
//			VALUES ( '" + gs_SerialNumber + "' , &
//					'set_system_time' , &
//					fn_Get_eSOMS_Datetime(" + ls_eSOMS_TZ_Offset + "), &
//					'set_system_time " + ls_eSOMS_TZ_Offset + "' ) ; "
//	ELSE
		ls_Sql = " &
			INSERT INTO sync &
				 ( serialnumber, &
					ml_uuid, &
					sync_time, &
					action ) &
			VALUES ( '" + gs_SerialNumber + "' , &
					'set_system_time' , &
					GetDate(), &
					'set_system_time " + ls_eSOMS_TZ_Offset + "' ) ; "
//	END IF

	EXECUTE IMMEDIATE :ls_Sql USING db_Consolidated_Trans ;

	COMMIT USING db_Consolidated_Trans ;

	SELECT DateAdd(hour, :li_eSOMS_TZ_Offset, MAX(sync_time)) 
	  INTO :ldt_Sync_DateTime 
	  FROM sync 
	 WHERE ( serialnumber = :gs_SerialNumber ) 
	   AND ( ml_uuid = 'set_system_time' ) 
	 USING db_Consolidated_Trans ;

// 2010-08-16 RPR - Added the test against a blank time to see if the time changed because the above SELECT ALWAYS returned -100 for SQLNRows for some odd reason when connected to MSS with a long database name
	IF ( db_Consolidated_Trans.SQLCode = 0 ) AND ( ldt_Sync_DateTime_Blank <> ldt_Sync_DateTime ) THEN //( db_Consolidated_Trans.SQLNRows = 1 ) THEN
		IF gb_Platform_Is_CE THEN
			fnSetSystemTime(String(ldt_Sync_DateTime, 'yyyymmddhhmmss'))
		END IF
		li_Return = 1
	ELSE
		li_Return = -1
	END IF
ELSE
	li_Return = -1
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE.__UNABLE_TO_UPDATE_SYSTEM_DATE/TIME.', 'Unable to connect to the consolidated database.  Unable to update system date/time.'), Exclamation!)
END IF
ROLLBACK USING db_Consolidated_Trans ;
wf_Disconnect_From_Consolidated()

RETURN li_Return
end function

public function boolean wf_synchronize ();boolean lb_Synchronize
integer i
integer li_Sleep
string ls_Filename
blob lb_blob
integer li_Abnormal_Equipment_Count
integer li_Return
integer li_Count
boolean lb_Close
datastore lds_temp
string ls_Sql
long ll_Num_Rows

SetPointer(Hourglass!)
lb_Close = TRUE

IF NOT IsValid(guo_sync) THEN
	guo_sync = CREATE nvo_eSOMS_mlsync
END IF
IF NOT Empty(is_Host_Name) THEN
	guo_sync.Host = is_Host_Name
	IF cbx_verbosity.checked THEN
		guo_sync.logopts = ' -v+ '
	ELSE
		guo_sync.logopts = ' -v '
	END IF
	IF wf_Connect_To_Consolidated() THEN
		ls_Sql = " &
		SELECT b.publication_name &
		  FROM SYSSYNC a, &
				 SYSPUBLICATION b &
		 WHERE ( a.publication_id = b.publication_id ) &
			AND ( b.publication_name IN ( 'clearances', 'config', 'logs', 'rounds' ) ) &
			AND ( a.last_download_time IS NOT NULL ) "
		lds_temp = CREATE datastore
		integer li_Num_Rows
		integer li_Found_Row
		string ls_Publication
		li_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
		CHOOSE CASE gs_Module_Id
			CASE 'NCS'
				ls_Publication = 'clearances'
			CASE 'NCCS'
				ls_Publication = 'config'
			CASE 'NLOGS'
				ls_Publication = 'logs'
			CASE 'NPTS'
				ls_Publication = 'rounds'
		END CHOOSE
		IF ( li_Num_Rows > 0 ) THEN // at least one module has synchronized in the past
			li_Found_Row = lds_temp.Find("#1 = '" + ls_Publication + "'", 1, li_Num_Rows)
		ELSE // no module has synchronized in the past
			li_Found_Row = 0
		END IF
		IF ( li_Found_Row = 0 ) THEN
			// THIS module has not synchronized in teh past so must add to the datastore to queue it up
			li_Found_Row = lds_temp.InsertRow(0)
			lds_temp.SetItem(li_Found_Row, 1, ls_Publication)
		END IF
		// Set the ib_sync_XXX for any publications previously synched as well as the current calling module
		li_Num_Rows = lds_temp.RowCount()
		FOR li_Count = 1 TO li_Num_Rows
			ls_Publication = lds_temp.GetItemString(li_Count, 1)
			IF ( ls_Publication = 'clearances' ) THEN
				IF ( gs_Module_Id <> 'NCS' ) THEN
					// meaning that NCS has been synched before but it is not the currently open module
					wf_Retrieve_Section_List()
				END IF
				ib_Sync_NCS = TRUE
				wf_Setup_NCS_For_Synch()
			END IF
			IF ( ls_Publication = 'config' ) THEN
				IF ( gs_Module_Id <> 'NCCS' ) THEN
					// meaning that NCCS has been synched before but it is not the currently open module
					wf_Retrieve_Step_List()
				END IF
				ib_Sync_NCCS = TRUE
				wf_Setup_NCCS_For_Synch()
			END IF
			IF ( ls_Publication = 'logs' ) THEN
				IF ( gs_Module_Id <> 'NLOGS' ) THEN
					// meaning that NLOGS has been synched before but it is not the currently open module
					wf_Retrieve_Log_List()
				END IF
				ib_Sync_NLOGS = TRUE
				wf_Setup_NLOGS_For_Synch()
			END IF
			IF ( ls_Publication = 'rounds' ) THEN
				IF ( gs_Module_Id <> 'NPTS' ) THEN
					// meaning that NPTS has been synched before but it is not the currently open module
					wf_Retrieve_Tour_List()
				END IF
				ib_Sync_NPTS = TRUE
				wf_Setup_NPTS_For_Synch()
			END IF
		NEXT
		lds_temp.Reset()
		DESTROY lds_temp

		lb_Synchronize = ib_Sync_NCS OR ib_Sync_NCCS OR ib_Sync_NLOGS OR ib_Sync_NPTS
		
		SELECT COUNT(*) INTO :li_Abnormal_Equipment_Count FROM abnormal_equipment USING SQLCA ;
				
		IF lb_Synchronize THEN
			li_Return = f_Upload_Scratchpad()

			guo_sync.additionalopts = ' -k -q -c "ENG=esoms;DBN=esoms;UID=DBA;PWD=sql"'
			guo_sync.logfilename = gs_Temp_Folder + 'dbmlsync_download_log.txt '
			guo_sync.publication = ''
			IF ib_Sync_NCS THEN
				guo_sync.publication += 'ml_clearances,clearances,clearances_common,'
			END IF
			IF ib_Sync_NCCS THEN
				guo_sync.publication += 'ml_config,config,config_common,'
			END IF
			IF ib_Sync_NLOGS THEN
				guo_sync.publication += 'ml_logs,logs,logs_common,'
			END IF
			IF ib_Sync_NPTS THEN
				guo_sync.publication += 'ml_rounds,rounds,rounds_common,'
			END IF
			IF cbx_common.Checked THEN
				guo_sync.publication += 'common'
			END IF
	
			INSERT INTO mobilink_settings ( key_id, value_id ) VALUES ( 'download_application', gs_Module_Id ) USING SQLCA ;
			
			string ls_ML_Port
			
			SELECT value_id 
			  INTO :ls_ML_Port 
			  FROM mobilink_settings 
			 WHERE ( key_id = 'ml_host_port' ) ;
			
			IF Empty(ls_ML_Port) THEN
				ls_ML_Port = '2439'
			END IF
			guo_sync.Port = ls_ML_Port
			syncparm l_parm
			l_parm.MLUser = gs_Serialnumber
			l_parm.DBPass = 'sql'
			l_parm.DBUser = 'dba'
			l_parm.AuthenticateParms = ''
			guo_sync.ProgressWindowName = 'w_esoms_syncprogress'
			guo_sync.DownloadOnly = FALSE
			guo_sync.UploadOnly = FALSE
			guo_sync.UseWindow = TRUE
			guo_sync.UseLogFile = TRUE
			guo_sync.datasource = "xxx"
			guo_sync.SetParm(l_parm)
			FOR li_Count = 1 TO 5
				ib_Deadlock = FALSE
//				OpenWithParm(w_sync, guo_sync)
//				li_Return = Message.DoubleParm

//				OpenWithParm(w_esoms_sync_options, guo_sync)
//				l_parm = Message.PowerObjectParm
//				guo_sync.SetParm(l_parm)
////				li_Return = gf_eSOMS_Configure_Sync()

//				li_Return = gf_eSOMS_Sync(l_parm)
				OpenWithParm(w_esoms_syncprogress, guo_sync)
				li_Return = Message.DoubleParm
				IF ( li_Return = 1 ) THEN
					f_update_user_preferences()
					lb_Close = TRUE
					// Successful upload, delete scratchpad files
					FOR i = 1 TO 2
						IF ( i = 1 ) THEN
							ls_Filename = MID(gs_Scratchpad_File, 1, POS(gs_Scratchpad_File, '.') - 1)
							ls_Filename = GetCurrentDirectory() + "\" + ls_Filename + ".pwi"
						ELSE
							ls_Filename = GetCurrentDirectory() + "\" + gs_Scratchpad_File
						END IF
						IF FileExists(ls_FileName) THEN
							FileDelete(ls_Filename)
						END IF
					NEXT
					EXIT
				ELSE
					lb_Close = FALSE
					IF ib_Deadlock THEN
						cb_ok.Enabled = FALSE
						RANDOMIZE(0)
						li_Sleep = RAND(30)
						OpenWithParm(w_countdown, li_Sleep)
					ELSE
						lb_Close = TRUE
						EXIT
					END IF
				END IF
			NEXT
			cb_ok.Enabled = TRUE
			IF ( li_Return = 1 ) THEN
				lds_temp = CREATE datastore
				lds_temp.dataobject = 'd_manual_configuration'
				ls_Sql = lds_temp.Object.Datawindow.Table.Select
				ls_Sql = StrTran(ls_Sql, ':ls_serialnumber', "'" + gs_SerialNumber + "'")
				ll_Num_Rows = f_Datastore_From_SQL_With_Trans(ls_Sql, lds_temp, db_Consolidated_Trans)
				lds_temp.dataobject = 'd_related_equipment_invalid'
				ls_Sql = lds_temp.Object.Datawindow.Table.Select
				ls_Sql = StrTran(ls_Sql, ':ls_serialnumber', "'" + gs_SerialNumber + "'")
				ll_Num_Rows = ll_Num_Rows + f_Datastore_From_SQL_With_Trans(ls_Sql, lds_temp, db_Consolidated_Trans)
				ib_Related_Equipment = ( ll_Num_Rows > 0 )
				lds_temp.Reset()
				DESTROY lds_temp
				IF ( li_Abnormal_Equipment_Count > 0 ) THEN
//					IF wf_Connect_To_Consolidated() THEN
						//Display abnormal equipment document
		
						DELETE FROM abnormal_equipment USING SQLCA ;
						COMMIT USING SQLCA ;
		
						ls_Filename = 'Abnormal_Equipment_Document.txt'
		
						SELECTBLOB log_text 
						  INTO :lb_blob
						  FROM abnormal_equipment_log 
						 WHERE ( serialnumber = :gs_SerialNumber ) 
						 USING db_Consolidated_Trans ;
		
						IF ( LEN(lb_blob) > 0 ) THEN
							li_Return = f_Blob_To_File_With_Blob_Arg(ls_FileName, lb_blob)
							IF ( li_Return = 1 ) THEN
								IF FileExists(ls_Filename) THEN
									f_Open_File(ls_Filename)
								END IF
							END IF
						END IF
									
						DELETE FROM abnormal_equipment_log 
						 WHERE ( serialnumber = :gs_SerialNumber ) 
						 USING db_Consolidated_Trans ;
									
						COMMIT USING db_Consolidated_Trans ;
									
//					ELSE
//						lb_Close = FALSE
//						MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE.__UNABLE_TO_RETRIEVE_ABNORMAL_EQUIPMENT_PROCESS_SUMMARY.', 'Unable to connect to the consolidated database.  Unable to retrieve abnormal equipment process summary.'), Exclamation!)
//					END IF
//					wf_Disconnect_From_Consolidated()
				END IF
			ELSE
				lb_Close = FALSE
			END IF
			integer li_Count2
			string ls_Message

			IF wf_Connect_To_Consolidated() THEN
				lds_temp = CREATE datastore
				li_Return = lds_temp.SetTransObject(db_Consolidated_Trans)
				ls_Sql = ''
				IF ib_Sync_NCS THEN
					ls_Sql = "&
					SELECT DISTINCT upload_condition &
					  FROM ncs_upload_temp &
					 WHERE ( serialnumber = '" + gs_SerialNumber + "' ) "
				END IF
				IF ib_Sync_NCCS THEN
					IF NOT Empty(ls_Sql) THEN
						ls_Sql += " UNION "
					END IF
					ls_Sql += "&
					SELECT DISTINCT upload_condition &
					  FROM nccs_pse_p_upload_temp &
					 WHERE ( serialnumber = '" + gs_SerialNumber + "' ) "
				END IF
	
				li_Count2 = f_Datastore_From_Sql_With_Trans(ls_Sql, lds_temp, db_Consolidated_Trans)
				ls_Message = ''
				FOR li_Count = 1 TO li_count2
					ls_Message += lds_temp.GetItemString(li_Count, 'upload_condition') + CHAR(13) + CHAR(10)
				NEXT
				lds_temp.Reset()
				DESTROY lds_temp ;
			END IF
//			SELECT COUNT(*) 
//			  INTO :li_Count2 
//			  FROM ncs_upload_temp 
//			 WHERE ( serialnumber = :gs_SerialNumber ) 
//			 USING db_Consolidated_Trans ;
//			
//			li_Count2 = db_Consolidated_Trans.sqlnrows
			IF ( li_Count2 > 0 ) THEN
				OpenWithParm(w_detail, f_DW_Language_call_2('Synchronization Message') + '|' + ls_Message)
//				MessageBox('Warning', String(li_Count2) + ' items were not processed due to ...')
			END IF
		END IF
	ELSE
		wf_Disconnect_From_Consolidated()
		lb_Close = FALSE
		MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE.__UNABLE_TO_START_THE_UPLOAD_PROCESS.', 'Unable to connect to the consolidated database.  Unable to start the upload process.'), Exclamation!)
	END IF
	wf_Disconnect_From_Consolidated()
	SetPointer(Arrow!)
ELSE
	lb_Close = FALSE
END IF

RETURN lb_Close

end function

public subroutine wf_setup_npts_for_synch ();integer li_Return
string ls_Sql
string ls_User_Id
integer li_Tour
integer li_Rev_No
string ls_Arguments
string ls_Remote_Name
string ls_Remote_Description
long ll_Num_Rows
datetime ldt_Future
integer li_Count
boolean lb_Selected
long ll_Count
string ls_Tour_Name
string ls_MB_String
string ls_MB_String_2
integer li_Result

RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Name", RegString!, ls_Remote_Name)
RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Desc", RegString!, ls_Remote_Description)

ls_Sql = 'STOP SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

DELETE FROM ml_npts_request_for_dl USING SQLCA ;
DELETE FROM ml_npts_exists_on_hh USING SQLCA ;

ls_Sql = 'START SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
		
IF Empty(guo_user.id) THEN
	IF Empty(w_select_from_asa.uo_user_ml.ID) THEN
		SetNull(ls_User_Id)
	ELSE
		ls_User_Id = w_select_from_asa.uo_user_ml.ID
	END IF
ELSE
	ls_User_Id = guo_user.id
END IF

ll_Num_Rows = dw_tour.RowCount()
// For now, ALL tours on handheld get synchronized
ldt_Future  = DateTime(RelativeDate(Today(), 1), Now()) ;
FOR li_Count = 1 TO ll_Num_Rows
	lb_Selected = ( dw_tour.Object.selected[li_Count] = 1 )
	IF lb_Selected THEN
		li_Tour = dw_tour.Object.tour[li_Count]
		li_Rev_No = dw_tour.Object.rev_no[li_Count]
					
		SELECT COUNT(*) 
		  INTO :ll_Count 
		  FROM history_upload 
		 WHERE ( tour = :li_Tour ) 
			AND ( dt > :ldt_future ) 
		 USING db_Consolidated_Trans ;

		IF ( ll_Count > 0 ) THEN
			ls_Tour_Name = dw_tour.Object.tour_name[li_Count]
			ls_MB_String = f_LanguageString('WARNING_-_###_FUTURE_READINGS_FOUND', 'Warning - ### Future Readings Found')
			ls_MB_String = StrTran(ls_MB_String, '###', String(ll_Count))
			ls_MB_String_2 = f_LanguageString('@@@_-_$$$_READINGS_TAKEN_AFTER_###', '@@@ - $$$ readings were taken after ###.  These readings will not be uploaded, do you want to continue?')
			ls_MB_String_2 = StrTran(ls_MB_String_2, '@@@', ls_Tour_Name)
			ls_MB_String_2 = StrTran(ls_MB_String_2, '$$$', String(ll_Count))
			ls_MB_String_2 = StrTran(ls_MB_String_2, '###', String(ldt_future, date_format))
			li_Result = MessageBox(ls_MB_String, ls_MB_String_2, Exclamation!, YesNo!)
			IF ( li_Result = 2 ) THEN
							
				DELETE FROM history_upload 
				 WHERE ( tour = :li_tour ) 
				 USING db_Consolidated_Trans ;
						
				COMMIT USING db_Consolidated_Trans ;
						
				CONTINUE
			END IF
		END IF

		INSERT INTO ml_npts_request_for_dl 
				 ( serialnumber, 
					tour, 
					rev_no, 
					user_id, 
					remote_name, 
					remote_description ) 
		VALUES ( :gs_SerialNumber, 
					:li_Tour, 
					:li_Rev_No, 
					:ls_User_Id, 
					:ls_Remote_Name, 
					:ls_Remote_Description ) 
			USING SQLCA ;
	
		INSERT INTO ml_npts_exists_on_hh 
				 ( serialnumber, 
					tour, 
					rev_no ) 
		  SELECT DISTINCT 
					:gs_SerialNumber, 
					tour, 
					rev_no 
			 FROM tour 
			WHERE ( tour = :li_Tour ) 
			USING SQLCA ;
	
	END IF
NEXT
	
COMMIT USING SQLCA ;

end subroutine

public subroutine wf_setup_nlogs_for_synch ();string ls_Sql
string ls_User_Id
integer li_Log_Id
string ls_Arguments
string ls_Remote_Name
string ls_Remote_Description
long ll_Num_Rows
integer li_Count
boolean lb_Selected
long ll_Current_Shift_Id
long ll_current_shift_id_mobile
datetime ldt_Current_Shift_Date
datetime ldt_current_shift_date_mobile
string ls_message

RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Name", RegString!, ls_Remote_Name)
RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Desc", RegString!, ls_Remote_Description)

ls_Sql = 'STOP SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

DELETE FROM ml_nlogs_request_for_dl USING SQLCA ;
DELETE FROM ml_nlogs_exists_on_hh USING SQLCA ;

ls_Sql = 'START SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
		
IF Empty(guo_user.id) THEN
	IF Empty(w_select_from_asa.uo_user_ml.ID) THEN
		SetNull(ls_User_Id)
	ELSE
		ls_User_Id = w_select_from_asa.uo_user_ml.ID
	END IF
ELSE
	ls_User_Id = guo_user.id
END IF

ll_Num_Rows = dw_log.RowCount()
// For now, ALL logs on handheld get synchronized
FOR li_Count = 1 TO ll_Num_Rows
	lb_Selected = ( dw_log.Object.selected[li_Count] = 1 )
	IF lb_Selected THEN
		li_Log_Id = dw_log.Object.log_id[li_Count]

// vv ?? what to do about below check which wants to cancel the synch?
//		ls_message	= f_ProfileString(gs_module_id, 'ActiveAndCurrentDiffersMessage', '')
//		
//		SELECT a.shift_id, 
//				 a.shift_date
//		  INTO :ll_Current_Shift_Id,  
//				 :ldt_Current_Shift_Date
//		  FROM current_log_list a, 
//				 shift_list b 
//		 WHERE ( a.log_id = :li_Log_Id ) 
//			AND ( a.log_id = b.log_id ) 
//			AND ( a.shift_id = b.shift_id ) 
//		USING SQLCA ;
//		
//		SELECT a.shift_id, 
//				 a.shift_date 
//		  INTO :ll_Current_Shift_Id_mobile,  
//				 :ldt_Current_Shift_Date_mobile
//		  FROM current_log_list a, 
//				 shift_list b 
//		 WHERE ( a.log_id = :li_Log_Id ) 
//			AND ( a.log_id = b.log_id ) 
//			AND ( a.shift_id = b.shift_id ) 
//		 USING db_Consolidated_Trans ;
//		
//		IF NOT ( ll_Current_Shift_Id = ll_Current_Shift_Id_mobile ) AND ( ldt_Current_Shift_Date = ldt_Current_Shift_Date_mobile ) THEN
//			IF NOT Empty(ls_message) THEN
//				IF MessageBox('Warning',ls_message,Exclamation!,OkCancel!) = 2 THEN
//					wf_Disconnect_From_Consolidated()
//					RETURN FALSE
//				END IF
//			END IF
//		END IF
// ^^ ?? what to do about above check which wants to cancel the synch?
				
		INSERT INTO ml_nlogs_request_for_dl 
				 ( serialnumber, 
					log_id, 
					user_id, 
					remote_name, 
					remote_description ) 
		VALUES ( :gs_SerialNumber, 
					:li_Log_Id, 
					:ls_User_Id, 
					:ls_Remote_Name, 
					:ls_Remote_Description ) 
			USING SQLCA ;
	
		INSERT INTO ml_nlogs_exists_on_hh 
				 ( serialnumber, 
					log_id ) 
		  SELECT DISTINCT 
					:gs_SerialNumber, 
					log_id 
			 FROM log_list 
			WHERE ( log_id = :li_Log_Id ) 
			USING SQLCA ;
		
	END IF
NEXT

COMMIT USING SQLCA ;

end subroutine

public subroutine wf_setup_ncs_for_synch ();string ls_Tagout_Type_Id
string ls_Tagout_Number
string ls_Section_Number
string ls_Sql
string ls_Arguments
string ls_User_Id
string ls_Remote_Name
string ls_Remote_Description

RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Name", RegString!, ls_Remote_Name)
RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Desc", RegString!, ls_Remote_Description)

IF Empty(guo_user.id) THEN
	IF Empty(w_select_from_asa.uo_user_ml.ID) THEN
		SetNull(ls_User_Id)
	ELSE
		ls_User_Id = w_select_from_asa.uo_user_ml.ID
	END IF
ELSE
	ls_User_Id = guo_user.id
END IF

ls_Sql = 'STOP SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

DELETE FROM ml_ncs_request_for_dl USING SQLCA ;
DELETE FROM ml_ncs_exists_on_hh USING SQLCA ;

ls_Sql = 'START SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

long ll_Count
long ll_Num_Rows
integer li_Status
ll_Num_Rows = dw_section.RowCount()
FOR ll_Count = 1 TO ll_Num_Rows
	IF ( dw_section.Object.selected[ll_Count] = 1 ) THEN
		ls_Tagout_Type_Id = dw_section.Object.tagout_type_id[ll_Count]
		ls_Tagout_Number = dw_section.Object.act_tagout_number[ll_Count]
		ls_Section_Number = dw_section.Object.act_tagout_section_number[ll_Count]
		li_Status = dw_section.Object.status[ll_Count]
				
		INSERT INTO ml_ncs_request_for_dl 
				 ( serialnumber, 
					tagout_type_id, 
					act_tagout_number, 
					act_tagout_section_number, 
					user_id, 
					remote_name, 
					remote_description ) 
		VALUES ( :gs_SerialNumber, 
					:ls_Tagout_Type_Id, 
					:ls_Tagout_Number, 
					:ls_Section_Number, 
					:ls_User_Id, 
					:ls_Remote_Name, 
					:ls_Remote_Description ) 
			USING SQLCA ;

		INSERT INTO ml_ncs_exists_on_hh 
				 ( serialnumber, 
					tagout_type_id, 
					act_tagout_number, 
					act_tagout_section_number, 
					status )
		  SELECT DISTINCT 
					:gs_SerialNumber, 
					tagout_type_id, 
					act_tagout_number, 
					act_tagout_section_number, 
					:li_Status 
			 FROM act_tagout_sections 
			WHERE ( tagout_type_id = :ls_Tagout_Type_Id ) 
			  AND ( act_tagout_number = :ls_Tagout_Number ) 
			  AND ( act_tagout_section_number = :ls_Section_Number ) 
			USING SQLCA ;

	END IF
NEXT
	
COMMIT USING SQLCA ;

end subroutine

public subroutine wf_setup_nccs_for_synch ();string ls_Type_Id
string ls_Unit_Id
string ls_Procedure_Id
long ll_Revision
long ll_Procedure_Serial_Id
string ls_Step_Id
string ls_Sql
string ls_User_Id
string ls_Arguments
string ls_Remote_Name
string ls_Remote_Description
long ll_Num_Rows
long ll_Count

RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Name", RegString!, ls_Remote_Name)
RegistryGet("HKEY_LOCAL_MACHINE\Ident", "Desc", RegString!, ls_Remote_Description)

ls_Sql = 'STOP SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

DELETE FROM ml_nccs_request_for_dl USING SQLCA ;
DELETE FROM ml_nccs_exists_on_hh USING SQLCA ;

ls_Sql = 'START SYNCHRONIZATION DELETE'
EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

IF Empty(guo_user.id) THEN
	IF Empty(w_select_from_asa.uo_user_ml.ID) THEN
		SetNull(ls_User_Id)
	ELSE
		ls_User_Id = w_select_from_asa.uo_user_ml.ID
	END IF
ELSE
	ls_User_Id = guo_user.id
END IF
ll_Num_Rows = dw_step.RowCount()
// For now, ALL tours on handheld get synchronized
FOR ll_Count = 1 TO ll_Num_Rows
	IF ( dw_step.Object.selected[ll_Count] = 1 ) THEN
		ls_Type_Id = dw_step.Object.type_id[ll_Count]
		ls_Unit_Id = dw_step.Object.unit_id[ll_Count]
		ls_Procedure_Id = dw_step.Object.procedure_id[ll_Count]
		ll_Revision = dw_step.Object.revision[ll_Count]
		ll_Procedure_Serial_Id = dw_step.Object.procedure_serial_id[ll_Count]
		ls_Step_Id = dw_step.Object.step_id[ll_Count]
				
		INSERT INTO ml_nccs_request_for_dl 
				 ( serialnumber, 
					type_id, 
					unit_id, 
					procedure_id, 
					revision, 
					procedure_serial_id, 
					step_id, 
					user_id, 
					remote_name, 
					remote_description ) 
		VALUES ( :gs_SerialNumber, 
					:ls_Type_Id, 
					:ls_Unit_Id, 
					:ls_Procedure_Id, 
					:ll_Revision, 
					:ll_Procedure_Serial_Id, 
					:ls_Step_Id, 
					:ls_User_Id, 
					:ls_Remote_Name, 
					:ls_Remote_Description ) 
			USING SQLCA ;

		INSERT INTO ml_nccs_exists_on_hh 
				 ( serialnumber, 
					type_id, 
					unit_id, 
					procedure_id, 
					revision, 
					procedure_serial_id, 
					step_id ) 
		  SELECT DISTINCT 
					:gs_SerialNumber, 
					type_id, 
					unit_id, 
					procedure_id, 
					revision, 
					procedure_serial_id, 
					step_id 
			 FROM nccs_ps_p 
			WHERE ( type_id = :ls_Type_Id ) 
			  AND ( unit_id = :ls_Unit_Id ) 
			  AND ( procedure_id = :ls_Procedure_Id ) 
			  AND ( revision = :ll_Revision ) 
			  AND ( procedure_serial_id = :ll_Procedure_Serial_Id ) 
			  AND ( step_id = :ls_Step_Id ) 
			USING SQLCA ;

	END IF
NEXT

COMMIT USING SQLCA ;

end subroutine

public function boolean wf_retrieve_step_list ();string ls_Type_Id
string ls_Unit_Id
string ls_Procedure_Id
integer li_Revision
integer li_Procedure_Serial_Id
string ls_Step_Id
string ls_Filter
long ll_Count
long ll_Num_Rows
string ls_Find
integer li_Row
string ls_Download_Revised
boolean lb_Connected_Consol
integer li_Return
boolean lb_Return
integer li_Num_Rows
string ls_Sql
datetime ldt_end
datastore lds_temp

lds_temp = CREATE datastore
dw_step.SetRedraw(FALSE)
//lb_Connected_Consol = wf_Connect_To_Consolidated()
//IF lb_Connected_Consol THEN
//	uo_user_ml.db_Consolidated_Trans = db_Consolidated_Trans
//	IF Empty(guo_user.ID) AND Empty(uo_user_ml.ID) THEN
//		Open(w_login_ml)
//		IF Empty(uo_user_ml.Id) THEN
//			MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('USER_CANCELLED_VALIDATION.', 'User cancelled validation.'), Exclamation!)
//			lb_Return = FALSE
//			SetPointer(Arrow!)
//			RETURN lb_Return
//		END IF
//	ELSE
//		uo_user_ml.Init(guo_user.ID)
//	END IF
	SetPointer(HourGlass!)
//	ls_Sql = " &
//		SELECT UPPER(ISNULL(value_id, 'No')) &
//		  FROM soms_user_settings &
//		 WHERE ( module_id = '" + gs_Module_Id + "' ) &
//			AND ( user_id = 'Global' ) &
//			AND ( section_id = 'system_preferences' ) &
//			AND ( key_id = 'AllowRevisedTourDownload' ) "
//	li_Num_Rows = f_Datastore_From_Sql_With_Trans(ls_Sql, lds_temp, db_Consolidated_Trans)
//	IF ( li_Num_Rows > 0 ) THEN
//		ls_Download_Revised = lds_temp.GetItemString(1, 1)
//		IF ( ls_Download_Revised = 'YES' ) THEN
//			ls_Filter = ' &
//				( ( ( f_tour_is_granted( tour , 1) and rev_no = current_rev_no ) OR &
//				( f_tour_is_granted( tour , 18)  and tour_is_revision > 0 ) ) AND &
//				f_tour_is_granted( tour , 33) ) '
//		ELSE
//			ls_Filter = ' &
//				( ( ( f_tour_is_granted( tour , 1) and rev_no = current_rev_no ) OR &
//				( f_tour_is_granted( tour , 18)  and tour_is_revision > 0 ) ) AND &
//				f_tour_is_granted( tour , 33) ) AND ( current_rev_no = rev_no ) '
//		END IF
//	ELSE
		ls_Filter = ' f_config_type_is_granted( type_id , 1) '
//	END IF
	dw_step.SetFilter(ls_Filter)
// ********************************************
	li_Return = dw_step.SetTransObject(db_Consolidated_Trans)
	IF ( li_Return = 1 ) THEN
		li_Num_Rows = dw_step.Retrieve()
		lds_temp = CREATE datastore
		ls_Sql = " &
         SELECT type_id, unit_id, procedure_id, revision, procedure_serial_id, step_id &
           FROM nccs_ps_p &
          WHERE ( open_on_handheld = 1 ) "
		ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
		FOR ll_Count = 1 TO ll_Num_Rows
			ls_Find = " type_id = '" + String(lds_temp.GetItemString(ll_Count, 1)) + "' AND unit_id = '" + String(lds_temp.GetItemString(ll_Count, 2)) + "' AND procedure_id = '" + String(lds_temp.GetItemString(ll_Count, 3)) + "' AND revision = " + String(lds_temp.GetItemNumber(ll_Count, 4)) + " AND procedure_serial_id = " + String(lds_temp.GetItemNumber(ll_Count, 5)) + " AND step_id = '" + String(lds_temp.GetItemString(ll_Count, 6)) + "'"
			li_Row = dw_step.Find(ls_Find, 1, dw_step.RowCount() + 1)
			IF ( li_Row > 0 ) THEN
				dw_step.Object.open_on_handheld[li_Row] = 1
			END IF
		NEXT
// *****
		ls_Sql = " &
         SELECT a.type_id, a.unit_id, a.procedure_id, a.revision, a.procedure_serial_id, a.step_id &
			  FROM nccs_ps_p a, &
			  		 nccs_p_p b &
			 WHERE ( a.type_id = b.type_id ) &
			   AND ( a.unit_id = b.unit_id ) &
				AND ( a.procedure_id = b.procedure_id ) &
				AND ( a.revision = b.revision ) &
				AND ( a.procedure_Serial_id = b.procedure_serial_id ) "
		ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
		FOR ll_Count = ll_Num_Rows TO 1 STEP -1
			ls_Type_Id					= lds_temp.GetItemString(ll_Count, 1)
			ls_Unit_Id					= lds_temp.GetItemString(ll_Count, 2)
			ls_Procedure_Id			= lds_temp.GetItemString(ll_Count, 3)
			li_Revision					= lds_temp.GetItemNumber(ll_Count, 4)
			li_Procedure_Serial_Id	= lds_temp.GetItemNumber(ll_Count, 5)
			ls_Step_Id					= lds_temp.GetItemString(ll_Count, 6)
			ls_Find = " type_id = '" + ls_Type_Id + "' AND unit_id = '" + ls_Unit_Id + "' AND procedure_id = '" + ls_Procedure_Id + "' AND revision = " + String(li_Revision) + " AND procedure_serial_id = " + String(li_Procedure_Serial_Id) + " AND step_id = '" + ls_Step_Id + "'"
			li_Row = dw_step.Find(ls_Find, 1, dw_step.RowCount() + 1)
			IF ( li_Row > 0 ) THEN
				dw_step.Object.selected[li_Row] = 1
				dw_step.Object.allow_deselect[li_Row] = 0
//			ELSE
//				li_Row = dw_step.InsertRow(0)
//				dw_step.Object.type_id[li_Row] = ls_Type_Id
//				dw_step.Object.unit_id[li_Row] = ls_Unit_Id
//				dw_step.Object.procedure_id[li_Row] = ls_PRocedure_Id
//				dw_step.Object.revision[li_Row] = li_Revision
//				dw_step.Object.procedure_serial_id[li_Row] = li_Procedure_Serial_Id
//				dw_step.Object.step_id[li_Row] = ls_Step_Id
//				dw_step.Object.selected[li_Row] = 1
//				dw_step.Object.allow_deselect[li_Row] = 0
//				dw_step.Object.hidden[li_Row] = 1
			END IF
		NEXT
// *****
	END IF
	DESTROY lds_temp
	dw_step.SetRedraw(TRUE)
	SetPointer(Arrow!)
	lb_Return = TRUE
//ELSE
//	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE', 'Unable to connect to the consolidated database'), Exclamation!)
//	SetPointer(Arrow!)
//	lb_Return = FALSE
//END IF
ROLLBACK USING db_Consolidated_Trans ;
//wf_Disconnect_From_Consolidated()

RETURN lb_Return
end function

public function boolean wf_retrieve_tour_list ();string ls_Tour_Group_Name
string ls_Tour_Name
integer li_Tour
integer li_Rev_No
string ls_Filter
long ll_Count
long ll_Num_Rows
string ls_Find
integer li_Row
string ls_Download_Revised
boolean lb_Connected_Consol
integer li_Return
boolean lb_Return
integer li_Num_Rows
string ls_Sql
datetime ldt_end
datastore lds_temp
lds_temp = CREATE datastore

//f_debug('open')
dw_tour.SetRedraw(FALSE)
//lb_Connected_Consol = wf_Connect_To_Consolidated()
////f_debug(String(NOW()) + ' - ' + 'lb_Connected_Consol - ' + String(lb_Connected_Consol))
//IF lb_Connected_Consol THEN
//	uo_user_ml.db_Consolidated_Trans = db_Consolidated_Trans
//	IF Empty(guo_user.ID) AND Empty(uo_user_ml.ID) THEN
//		Open(w_login_ml)
//		IF Empty(uo_user_ml.Id) THEN
//			MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('USER_CANCELLED_VALIDATION.', 'User cancelled validation.'), Exclamation!)
//			lb_Return = FALSE
//			SetPointer(Arrow!)
//			RETURN lb_Return
//		END IF
//	ELSE
//		uo_user_ml.Init(guo_user.ID)
//	END IF
//f_debug(String(NOW()) + ' - after login - ' + '1')
	SetPointer(HourGlass!)
// ********************************************
// 2006-07-05 - Scott's code has a filter built into the dw_tours_to_download datawindow
// that checkes the security rights for 1, 18 & 33.  But his logic in the open
// event of the w_download_readings windows checks the preference allowing/disallowing
// revised tours to be downloaded, if FALSE then Scott is replacing the built-in filter
// with a simple check of current_rev_no = rev_no.  I asked him about this on 
// 2006-07-03 and his reply was he didn't know, he marked it to look into later but 
// he was doing nothing about it now.  So I used his security rights filter until I hear something else.

// Below is the replacement security rights SQL, but it took much longer to retrieve
// than using the filter withthe functions
//     AND ( ( ( tour.rev_no = current_tour_revision.tour ) AND EXISTS ( SELECT lnum FROM user_levels WHERE ( lnum = 1 ) AND ( user_id = :user_id ) AND ( appl = 'OR' + REPEAT('0', 3 - LENGTH(tour.tour)) + STRING(tour.tour) ) ) ) 
//      OR ( ( ( current_tour_revision.tour > 0 )           AND EXISTS ( SELECT lnum FROM user_levels WHERE ( lnum = 18 ) AND ( user_id = :user_id ) AND ( appl = 'OR' + REPEAT('0', 3 - LENGTH(tour.tour)) + STRING(tour.tour) ) ) ) ) )
//     AND EXISTS ( SELECT lnum FROM user_levels WHERE ( lnum = 33 ) AND ( user_id = :user_id ) AND ( appl = 'OR' + REPEAT('0', 3 - LENGTH(tour.tour)) + STRING(tour.tour) ) ) 

	ls_Sql = " &
		SELECT UPPER(ISNULL(value_id, 'No')) &
		  FROM soms_user_settings &
		 WHERE ( module_id = '" + gs_Module_Id + "' ) &
			AND ( user_id = 'Global' ) &
			AND ( section_id = 'system_preferences' ) &
			AND ( key_id = 'AllowRevisedTourDownload' ) "
	li_Num_Rows = f_Datastore_From_Sql_With_Trans(ls_Sql, lds_temp, db_Consolidated_Trans)
//f_debug(String(NOW()) + ' - ' + 'li_Num_Rows - soms_user_settings - ' + String(li_Num_Rows))
	IF ( li_Num_Rows > 0 ) THEN
		ls_Download_Revised = lds_temp.GetItemString(1, 1)
		IF ( ls_Download_Revised = 'YES' ) THEN
			ls_Filter = ' &
				( ( ( f_tour_is_granted( tour , 1) and rev_no = current_rev_no ) OR &
				( f_tour_is_granted( tour , 18)  and tour_is_revision > 0 ) ) AND &
				f_tour_is_granted( tour , 33) ) '
		ELSE
			ls_Filter = ' &
				( ( ( f_tour_is_granted( tour , 1) and rev_no = current_rev_no ) OR &
				( f_tour_is_granted( tour , 18)  and tour_is_revision > 0 ) ) AND &
				f_tour_is_granted( tour , 33) ) AND ( current_rev_no = rev_no ) '
		END IF
	ELSE
		ls_Filter = ' &
			( ( ( f_tour_is_granted( tour , 1) and rev_no = current_rev_no ) OR &
			( f_tour_is_granted( tour , 18)  and tour_is_revision > 0 ) ) AND &
			f_tour_is_granted( tour , 33) ) AND ( current_rev_no = rev_no ) '
	END IF
// ********************************************
	string ls_Date
	ls_Date = em_scheduled.text
	IF Empty(ls_Date) THEN
		string ls_Days
		string ls_Module_Id
		
		ls_Module_Id = gs_Module_Id
		
		SELECT ISNULL(value_id, '7') 
		  INTO :ls_Days 
		  FROM soms_user_settings 
		 WHERE ( user_id = :guo_user.id ) 
			AND ( module_id = :ls_module_id ) 
			AND ( section_id = 'system_preferences' ) 
			AND ( key_id = 'ScheduledTourCheck' ) 
		USING db_Consolidated_Trans ;
			
	//	ll_days = Long(f_ProfileString(user_id,gs_module_id,'system_preferences',"ScheduledTourCheck","7"))
		em_scheduled.SetMask(DateMask!, date_format)
		em_scheduled.text = String(RelativeDate(Today(), LONG(ls_Days)), date_format)
//f_debug(String(NOW()) + ' - ' + 'ls_Days - soms_user_settings - ' + String(ls_Days))
	END IF
	li_Return = dw_tour.SetTransObject(db_Consolidated_Trans)
//f_debug(String(NOW()) + ' - ' + 'li_Return - SetTransObject - ' + String(li_Return))
	IF ( li_Return = 1 ) THEN
		ls_Date = em_scheduled.Text
		ldt_end = DateTime(Date(ls_Date), Time('0'))
		li_Return = dw_tour.SetFilter('')
//f_debug(String(NOW()) + ' - ' + 'li_Return - SetFilter() - ' + String(li_Return))
		li_Num_Rows = dw_tour.Retrieve(ldt_end, '')//uo_user_ml.Id)
//f_debug(String(NOW()) + ' - ' + 'li_Num_Rows - Retrieve - ' + String(li_Num_Rows))
		li_Return = dw_tour.SetFilter(ls_Filter)
//f_debug(String(NOW()) + ' - ' + 'li_Return - SetFilter(' + ls_Filter + ') - ' + String(li_Return))
		li_Num_Rows = dw_tour.Filter()
//f_debug(String(NOW()) + ' - ' + 'li_Num_Rows - Filter - ' + String(li_Num_Rows))
		lds_temp = CREATE datastore
		ls_Sql = " &
         SELECT tour, rev_no &
           FROM tour &
          WHERE ( open_on_handheld = 1 ) "
		ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
//f_debug(String(NOW()) + ' - ' + 'll_Num_Rows - ' + ls_Sql + ' - ' + String(ll_Num_Rows))
		FOR ll_Count = 1 TO ll_Num_Rows
//f_debug(String(NOW()) + ' - ' + 'll_Count - Find open tours - ' + String(ll_Count))
			ls_Find = " tour = " + String(lds_temp.GetItemNumber(ll_Count, 1)) + " AND rev_no = " + String(lds_temp.GetItemNumber(ll_Count, 2))
			li_Row = dw_tour.Find(ls_Find, 1, dw_tour.RowCount() + 1)
			IF ( li_Row > 0 ) THEN
				dw_tour.Object.open_on_handheld[li_Row] = 1
			END IF
		NEXT
// *****
		ls_Sql = " &
         SELECT a.tour, &
					 a.rev_no, &
					 b.tour_group_name, &
					 a.tour_name &
			  FROM tour a, &
			  		 tour_group b &
			 WHERE ( a.tour_group = b.tour_group ) "
		ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
//f_debug(String(NOW()) + ' - ' + 'll_Num_Rows - ' + ls_Sql + ' - ' + String(ll_Num_Rows))
		FOR ll_Count = ll_Num_Rows TO 1 STEP -1
//f_debug(String(NOW()) + ' - ' + 'll_Count - Find existing tours on HH - ' + String(ll_Count))
			li_Tour = lds_temp.GetItemNumber(ll_Count, 1)
			li_Rev_No = lds_temp.GetItemNumber(ll_Count, 2)
			ls_Tour_Group_Name = lds_temp.GetItemString(ll_Count, 3)
			ls_Tour_Name = lds_temp.GetItemString(ll_Count, 4)
			ls_Find = " tour = " + String(li_Tour) + " AND rev_no = " + String(li_Rev_No)
			li_Row = dw_tour.Find(ls_Find, 1, dw_tour.RowCount() + 1)
			IF ( li_Row > 0 ) THEN
				dw_tour.Object.selected[li_Row] = 1
				dw_tour.Object.allow_deselect[li_Row] = 0
			ELSE
				li_Row = dw_tour.InsertRow(0)
				dw_tour.Object.tour_name[li_Row] = ls_Tour_Name
				dw_tour.Object.tour_group_name[li_Row] = ls_Tour_Group_Name
				dw_tour.Object.tour[li_Row] = li_Tour
				dw_tour.Object.rev_no[li_Row] = li_Rev_No
				dw_tour.Object.selected[li_Row] = 1
				dw_tour.Object.allow_deselect[li_Row] = 0
				dw_tour.Object.hidden[li_Row] = 1
			END IF
		NEXT
// *****
	END IF
	DESTROY lds_temp
	dw_tour.SetRedraw(TRUE)
	SetPointer(Arrow!)
	lb_Return = TRUE
//ELSE
//	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE', 'Unable to connect to the consolidated database'), Exclamation!)
//	SetPointer(Arrow!)
//	lb_Return = FALSE
//END IF
//f_debug(String(NOW()) + ' - ' + 'Done')
ROLLBACK USING db_Consolidated_Trans ;
//f_debug(String(NOW()) + ' - ' + 'ROLLBACK USING db_Consolidated_Trans ;')
//wf_Disconnect_From_Consolidated()
//f_debug(String(NOW()) + ' - ' + 'wf_Disconnect_From_Consolidated()')
//f_debug('close')
RETURN lb_Return
end function

public function boolean wf_retrieve_log_list ();long ll_Log_Id
string ls_Log_Temp
long ll_Count
long ll_Num_Rows
string ls_Find
integer li_Row
string ls_Download_Revised
boolean lb_Connected_Consol
integer li_Return
boolean lb_Return
integer li_Num_Rows
string ls_Sql
datastore lds_temp
lds_temp = CREATE datastore

dw_log.SetRedraw(FALSE)
string ls_Return
string ls_Values[]
integer li_Count
ls_Values[1] = f_DW_Language_Call_2('Do Not Download Entries')
ls_Values[2] = f_DW_Language_Call_2('Active And Current Only')
FOR li_Count = 1 TO UpperBound(ls_Values)
	ls_Values[li_Count] = StrTran(ls_Values[li_Count], "'", "~~'")
NEXT
ls_Return = "days_to_download.values='" + ls_Values[1] + "~t0/" + ls_Values[2] + "~t1/'"
ls_Return = dw_log.Modify(ls_Return)

//lb_Connected_Consol = wf_Connect_To_Consolidated()
//IF lb_Connected_Consol THEN
//	uo_user_ml.db_Consolidated_Trans = db_Consolidated_Trans
//	IF Empty(guo_user.ID) AND Empty(uo_user_ml.ID) THEN
//		Open(w_login_ml)
//		IF Empty(uo_user_ml.Id) THEN
//			MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('USER_CANCELLED_VALIDATION.', 'User cancelled validation.'), Exclamation!)
//			lb_Return = FALSE
//			SetPointer(Arrow!)
//			dw_log.SetRedraw(TRUE)
//			RETURN lb_Return
//		END IF
//	ELSE
//		uo_user_ml.Init(guo_user.ID)
//	END IF
	SetPointer(HourGlass!)
	li_Return = dw_log.SetTransObject(db_Consolidated_Trans)
	IF ( li_Return = 1 ) THEN
		lds_temp = CREATE datastore
		// determine if <= 99 log_ids OR > 99 log_ids and filter accordingly
		ls_Sql = " SELECT DISTINCT appl FROM user_levels WHERE ( appl LIKE 'LOG%' ) "
		ll_Num_Rows = f_datastore_From_Sql_With_Trans(ls_Sql, lds_temp, db_Consolidated_Trans)
//		IF ( ll_Num_Rows > 0 ) THEN
//			ls_Log_Temp = lds_temp.GetItemString(1, 1)
//			integer li_Length
//			li_Length = LEN(TRIM(ls_Log_Temp))
//			gb_Logs_Greater_Than_99_Mod_Consolidated = ( li_Length = 6 )
//		END IF
		ll_Num_Rows = dw_log.Retrieve()
		FOR ll_Count = ll_Num_Rows TO 1 STEP -1
			ll_Log_Id = dw_log.Object.log_id[ll_Count]
			IF NOT f_Log_Is_Granted_Consolidated(ll_Log_Id, 1) THEN
				dw_log.RowsDiscard(ll_Count, ll_Count, Primary!)
			END IF 
		NEXT
		IF ( dw_log.RowCount() > 0 ) THEN
			ls_Sql = " &
				SELECT DISTINCT log_id &
				  FROM shift_approval_list &
				 WHERE ( open_on_handheld = 1 ) "
			ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
			FOR ll_Count = 1 TO ll_Num_Rows
				ls_Find = " log_id = " + String(lds_temp.GetItemNumber(ll_Count, 1))
				li_Row = dw_log.Find(ls_Find, 1, dw_log.RowCount() + 1)
				IF ( li_Row > 0 ) THEN
					dw_log.Object.open_on_handheld[li_Row] = 1
				END IF
			NEXT
			lds_temp.Reset()
	// *****
			ls_Sql = " &
				SELECT a.log_id, &
						 a.log_title, &
						 b.shift_date, &
						 ( SELECT c.shift_descr &
							  FROM shift_list c &
							 WHERE ( b.log_id = c.log_id ) &
								AND ( b.shift_id = c.shift_id ) ) &
				  FROM log_list a, &
						 current_log_list b &
				 WHERE ( a.log_id = b.log_id ) &
					AND ( a.activation_dt IS NOT NULL ) &
					AND ( a.deactivation_dt IS NULL ) "
			ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
			integer li_Log_Id
			string ls_Log_Title
			datetime ldt_Shift_Date
			string ls_Shift_Desc
			FOR ll_Count = ll_Num_Rows TO 1 STEP -1
				li_Log_Id = lds_temp.GetItemNumber(ll_Count, 1)
				ls_Log_Title = lds_temp.GetItemString(ll_Count, 2)
				ldt_Shift_Date = lds_temp.GetItemDateTime(ll_Count, 3)
				ls_Shift_Desc = lds_temp.GetItemString(ll_Count, 4)
				ls_Find = " log_id = " + String(li_Log_Id)
				li_Row = dw_log.Find(ls_Find, 1, dw_log.RowCount() + 1)
				IF ( li_Row > 0 ) THEN
					dw_log.Object.selected[li_Row] = 1
					dw_log.Object.allow_deselect[li_Row] = 0
				ELSE
					li_Row = dw_log.InsertRow(0)
					dw_log.Object.log_id[li_Row] = li_Log_Id
					dw_log.Object.log_title[li_Row] = ls_Log_Title
					dw_log.Object.shift_date[li_Row] = ldt_Shift_Date
					dw_log.Object.shift_descr[li_Row] = ls_Shift_Desc
					dw_log.Object.selected[li_Row] = 1
					dw_log.Object.allow_deselect[li_Row] = 0
					dw_log.Object.hidden[li_Row] = 1
				END IF
			NEXT
		END IF
// *****
	END IF
	lds_temp.Reset()
	DESTROY lds_temp
	dw_log.SetRedraw(TRUE)
	SetPointer(Arrow!)
	lb_Return = TRUE
//ELSE
//	dw_log.SetRedraw(TRUE)
//	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE', 'Unable to connect to the consolidated database'), Exclamation!)
//	SetPointer(Arrow!)
//	lb_Return = FALSE
//END IF
ROLLBACK USING db_Consolidated_Trans ;
//wf_Disconnect_From_Consolidated()

RETURN lb_Return
end function

public function boolean wf_retrieve_section_list ();string ls_Type_Id
string ls_Unit_Id
string ls_Procedure_Id
integer li_Revision
integer li_Procedure_Serial_Id
string ls_Step_Id
string ls_Filter
long ll_Count
long ll_Num_Rows
string ls_Find
integer li_Row
string ls_Download_Revised
boolean lb_Connected_Consol
integer li_Return
boolean lb_Return
integer li_Num_Rows
string ls_Sql
datetime ldt_end
datastore lds_temp

lds_temp = CREATE datastore
dw_section.SetRedraw(FALSE)
//lb_Connected_Consol = wf_Connect_To_Consolidated()
//IF lb_Connected_Consol THEN
//	uo_user_ml.db_Consolidated_Trans = db_Consolidated_Trans
//	IF Empty(guo_user.ID) AND Empty(uo_user_ml.ID) THEN
//		Open(w_login_ml)
//		IF Empty(uo_user_ml.Id) THEN
//			MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('USER_CANCELLED_VALIDATION.', 'User cancelled validation.'), Exclamation!)
//			lb_Return = FALSE
//			SetPointer(Arrow!)
//			RETURN lb_Return
//		END IF
//	ELSE
//		uo_user_ml.Init(guo_user.ID)
//	END IF
	SetPointer(HourGlass!)
	ls_Filter = ' f_ml_type_is_granted( tagout_type_id , 1) '
	IF cbx_hang.Checked AND cbx_restore.Checked THEN
	ELSEIF cbx_hang.Checked THEN
		ls_Filter += ' AND ( status = 2 ) '
	ELSEIF cbx_restore.Checked THEN
		ls_Filter += ' AND ( status = 32 ) '
	END IF
	dw_section.SetFilter(ls_Filter)
// ********************************************
	li_Return = dw_section.SetTransObject(db_Consolidated_Trans)
	IF ( li_Return = 1 ) THEN
		li_Num_Rows = dw_section.Retrieve()
		lds_temp = CREATE datastore
		ls_Sql = " &
         SELECT tagout_type_id, act_tagout_number, act_tagout_section_number &
           FROM act_tagout_sections &
          WHERE ( open_on_handheld = 1 ) "
		ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
		FOR ll_Count = 1 TO ll_Num_Rows
			ls_Find = " tagout_type_id = '" + String(lds_temp.GetItemString(ll_Count, 1)) + "' AND act_tagout_number = '" + String(lds_temp.GetItemString(ll_Count, 2)) + "' AND act_tagout_section_number = '" + String(lds_temp.GetItemString(ll_Count, 3)) + "'"
			li_Row = dw_section.Find(ls_Find, 1, dw_section.RowCount() + 1)
			IF ( li_Row > 0 ) THEN
				dw_section.Object.open_on_handheld[li_Row] = 1
			END IF
		NEXT
// *****
		ls_Sql = " &
         SELECT tagout_type_id, act_tagout_number, act_tagout_section_number &
           FROM act_tagout_sections "
		ll_Num_Rows = f_datastore_From_Sql(ls_Sql, lds_temp)
		FOR ll_Count = ll_Num_Rows TO 1 STEP -1
			ls_Find = " tagout_type_id = '" + String(lds_temp.GetItemString(ll_Count, 1)) + "' AND act_tagout_number = '" + String(lds_temp.GetItemString(ll_Count, 2)) + "' AND act_tagout_section_number = '" + String(lds_temp.GetItemString(ll_Count, 3)) + "'"
			li_Row = dw_section.Find(ls_Find, 1, dw_section.RowCount() + 1)
			IF ( li_Row > 0 ) THEN
				dw_section.Object.selected[li_Row] = 1
				dw_section.Object.allow_deselect[li_Row] = 0
			END IF
		NEXT
// *****
	END IF
	DESTROY lds_temp
	dw_section.SetRedraw(TRUE)
	SetPointer(Arrow!)
	lb_Return = TRUE
//ELSE
//	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE', 'Unable to connect to the consolidated database'), Exclamation!)
//	SetPointer(Arrow!)
//	lb_Return = FALSE
//END IF
ROLLBACK USING db_Consolidated_Trans ;
//wf_Disconnect_From_Consolidated()

RETURN lb_Return
end function

on w_select_from_asa.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.dw_step=create dw_step
this.dw_log=create dw_log
this.pb_calendar=create pb_calendar
this.em_scheduled=create em_scheduled
this.st_scheduled=create st_scheduled
this.dw_tour=create dw_tour
this.cbx_hang=create cbx_hang
this.cbx_restore=create cbx_restore
this.cbx_verbosity=create cbx_verbosity
this.cbx_common=create cbx_common
this.st_rev_no=create st_rev_no
this.st_tour=create st_tour
this.st_label=create st_label
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cb_refresh=create cb_refresh
this.dw_section=create dw_section
this.cbx_select_all=create cbx_select_all
this.Control[]={this.dw_step,&
this.dw_log,&
this.pb_calendar,&
this.em_scheduled,&
this.st_scheduled,&
this.dw_tour,&
this.cbx_hang,&
this.cbx_restore,&
this.cbx_verbosity,&
this.cbx_common,&
this.st_rev_no,&
this.st_tour,&
this.st_label,&
this.cb_ok,&
this.cb_cancel,&
this.cb_refresh,&
this.dw_section,&
this.cbx_select_all}
end on

on w_select_from_asa.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_step)
destroy(this.dw_log)
destroy(this.pb_calendar)
destroy(this.em_scheduled)
destroy(this.st_scheduled)
destroy(this.dw_tour)
destroy(this.cbx_hang)
destroy(this.cbx_restore)
destroy(this.cbx_verbosity)
destroy(this.cbx_common)
destroy(this.st_rev_no)
destroy(this.st_tour)
destroy(this.st_label)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cb_refresh)
destroy(this.dw_section)
destroy(this.cbx_select_all)
end on

event open;guo_window.Post uf_ReSize(w_select_from_asa)

string ls_Find
integer li_Row
long ll_Count
string ls_Sql
datastore lds_temp
integer li_Count
integer li_Count_Open_NCS
integer li_Count_Open_NCCS
integer li_Count_Open_NLOGS
integer li_Count_Open_NPTS
long ll_Num_Rows
integer li_Return
integer li_Width
string ls_Parm

ls_Parm = Message.StringParm
Message.StringParm = ''

is_Action = ls_Parm

CHOOSE CASE gs_Module_Id
	CASE 'NCS'
		ib_NCS = TRUE
		is_Section_Label	= f_ProfileString('NCS', 'SectionTitle', f_DW_LanguagE_call_2('Section'))
		is_Tagout_Label	= f_ProfileString('NCS', 'TagoutTitle', f_DW_LanguagE_call_2('Tagout'))
	CASE 'NCCS'
		ib_NCCS = TRUE
	CASE 'NLOGS'
		ib_NLOGS = TRUE
	CASE 'NPTS'
		ib_NPTS = TRUE
END CHOOSE

cbx_hang.Visible			= ib_NCS
cbx_restore.Visible		= ib_NCS
dw_section.Visible		= ib_NCS

dw_step.Visible			= ib_NCCS

dw_log.Visible				= ib_NLOGS

em_scheduled.Visible		= ib_NPTS
st_scheduled.Visible		= ib_NPTS
pb_calendar.Visible		= ib_NPTS
dw_tour.Visible			= ib_NPTS

cbx_common.Visible = FALSE
f_Free_DB_Locks_All_Esoms_Applications()
is_Host_Name = wf_Get_Host_Name()
is_Engine_Name = wf_Get_Engine_Name()
IF Empty(is_Host_Name) OR Empty(is_Engine_Name) THEN
	Close	(This)
ELSE
	db_Consolidated_Trans = CREATE transaction

	cbx_verbosity.Text = f_DW_Language_call_2('Verbose Log?')
	cbx_common.Text = f_DW_Language_call_2('DL common?')
	cb_ok.Text = f_DW_Language_call_2('Ok')
	cb_cancel.Text = f_DW_Language_call_2('Cancel')
	cb_refresh.Text = f_DW_Language_call_2('Refresh')
	IF ib_NCS OR ib_NPTS THEN
		cbx_hang.Text = f_DW_Language_call_2('Hanging')
		cbx_restore.Text = f_DW_Language_call_2('Restoring')
		st_scheduled.Text = f_LanguageString('SCHEDULED', 'Scheduled') + '<='
		dw_section.Height = 752
		dw_tour.Height = 752
	ELSE
		dw_log.Height = 832
		dw_step.Height = 832
	END IF
	st_label.Text = f_LanguageString('SYNCHRONIZE', 'Synchronize')
//	li_Width = 100 + f_Get_TextBox_Width_From_String(st_label.Text, dw_section.Width, FALSE)
//	st_label.Width = li_Width
	This.Title = gs_Window_Title
	cbx_select_all.Visible = ( is_Action = 'DOWNLOAD' )
	IF ( is_Action = 'DOWNLOAD' ) THEN
boolean lb_Connected_Consol
lb_Connected_Consol = wf_Connect_To_Consolidated()
IF lb_Connected_Consol THEN
	uo_user_ml.db_Consolidated_Trans = db_Consolidated_Trans
	IF Empty(guo_user.ID) AND Empty(uo_user_ml.ID) THEN
		Open(w_login_ml)
		IF Empty(uo_user_ml.Id) THEN
			MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('USER_CANCELLED_VALIDATION.', 'User cancelled validation.'), Exclamation!)
			SetPointer(Arrow!)
			Post Close(This)
			RETURN
		END IF
	ELSE
		uo_user_ml.Init(guo_user.ID)
	END IF
	//		dw_section.Height = 752
			boolean lb_Retrieve_Return
			IF ib_NCS THEN
				lb_Retrieve_Return = wf_Retrieve_Section_List()
			ELSEIF ib_NCCS THEN
				lb_Retrieve_Return = wf_Retrieve_Step_List()
			ELSEIF ib_NLOGS THEN
				lb_Retrieve_Return = wf_Retrieve_Log_List()
			ELSEIF ib_NPTS THEN
				lb_Retrieve_Return = wf_Retrieve_Tour_List()
			END IF
ELSE
	dw_section.SetRedraw(TRUE)
	dw_step.SetRedraw(TRUE)
	dw_log.SetRedraw(TRUE)
	dw_tour.SetRedraw(TRUE)
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_CONNECT_TO_THE_CONSOLIDATED_DATABASE', 'Unable to connect to the consolidated database'), Exclamation!)
	SetPointer(Arrow!)
END IF
		IF NOT lb_Retrieve_Return THEN
			Post Close(This)
			RETURN
		END IF
	END IF
	
	SELECT COUNT(*) 
	  INTO :li_Count_Open_NCS
	  FROM act_tagout_sections 
	 WHERE ( open_on_handheld = 1 ) ;
	
	SELECT COUNT(*) 
	  INTO :li_Count_Open_NCCS
	  FROM nccs_ps_p 
	 WHERE ( open_on_handheld = 1 ) ;
	
	SELECT COUNT(*) 
	  INTO :li_Count_Open_NLOGS
	  FROM shift_approval_list 
	 WHERE ( open_on_handheld = 1 ) ;
	
	SELECT COUNT(*) 
	  INTO :li_Count_Open_NPTS
	  FROM tour 
	 WHERE ( open_on_handheld = 1 ) ;
	
	li_Count = li_Count_Open_NCS + li_Count_Open_NCCS + li_Count_Open_NLOGS + li_Count_Open_NPTS
	string ls_Message
	string CRLF = CHAR(13) + CHAR(10)
	ls_Message = CRLF
	IF ( li_Count_Open_NCS > 0 ) THEN
		ls_Message += CRLF + f_DW_Language_Call_2('Clearances')
	END IF
	IF ( li_Count_Open_NCCS > 0 ) THEN
		ls_Message += CRLF + f_DW_Language_Call_2('Configuration Control')
	END IF
	IF ( li_Count_Open_NLOGS > 0 ) THEN
		ls_Message += CRLF + f_DW_Language_Call_2('Narrative Logs')
	END IF
	IF ( li_Count_Open_NPTS > 0 ) THEN
		ls_Message += CRLF + f_DW_Language_Call_2('Operator Rounds')
	END IF
	IF ( li_Count > 0 ) THEN
		cb_ok.Enabled = FALSE
		cb_cancel.Enabled = TRUE
		Post MessageBox(f_LanguageString('OPEN_ITEMS', 'Open Items'), f_LanguageString('ALL_ITEMS_MUST_BE_CLOSED_IN_ORDER_TO_SYNCHRONIZE.', 'All items must be closed in order to synchronize.' + ls_Message), Exclamation!)
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

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

event activate;This.X = gl_X
This.Y = gl_Y

end event

type dw_step from datawindow within w_select_from_asa
integer x = 18
integer y = 64
integer width = 1042
integer height = 816
integer taborder = 80
string title = "none"
string dataobject = "d_steps_download"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;string ls_Column

ls_Column = dwo.Name
CHOOSE CASE ls_Column
	CASE 'selected'
//		IF ( This.Object.open_on_handheld[row] = 1 ) THEN
//			This.Object.selected[row] = 0
//		ELSE
			IF ( is_Action = 'DOWNLOAD' ) THEN
				IF ( This.Object.allow_deselect[row] = 1 ) AND ( This.Object.step_internal_level[row] = 2 ) THEN
					IF ( This.Object.selected[row] = 0 ) THEN
						This.Object.selected[row] = 1
					ELSE
						This.Object.selected[row] = 0
					END IF
				END IF
			END IF
//		END IF
END CHOOSE
end event

event rbuttondown;string ls_Message
string ls_Type_Id
string ls_Unit_Id
string ls_Procedure_Id
integer li_Revision
integer li_Procedure_Serial_Id
string ls_Step_Id
boolean lb_Connected_Consol

IF ( row > 0 ) THEN
	lb_Connected_Consol = wf_Connect_To_Consolidated()
	IF lb_Connected_Consol THEN
		ls_Type_Id = This.GetItemString(row, 'type_id')
		ls_Unit_Id = This.GetItemString(row, 'unit_id')
		ls_Procedure_Id = This.GetItemString(row, 'procedure_id')
		li_Revision = This.GetItemNumber(row, 'revision')
		li_Procedure_Serial_Id = This.GetItemNumber(row, 'procedure_serial_id')
		ls_Step_Id = This.GetItemString(row, 'step_id')
	
		ls_Message = 'Step Detail|'
		ls_Message += ls_Type_Id + '|'
		ls_Message += ls_Unit_Id + '|'
		ls_Message += ls_Procedure_Id + '|'
		ls_Message += String(li_Revision) + '|'
		ls_Message += String(li_Procedure_Serial_Id) + '|'
		ls_Message += ls_Step_Id + '|'
		ls_Message += 'FROM_ASA'
		OpenWithParm(w_detail, ls_Message)
	END IF
	wf_Disconnect_From_Consolidated()
END IF
end event

event rowfocuschanged;This.SetRedraw(TRUE)
end event

event rowfocuschanging;This.SetRedraw(FALSE)
end event

type dw_log from datawindow within w_select_from_asa
integer x = 18
integer y = 64
integer width = 1042
integer height = 816
integer taborder = 40
string title = "none"
string dataobject = "d_logs_download"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;string ls_Column

ls_Column = dwo.Name
CHOOSE CASE ls_Column
	CASE 'selected'
		IF ( is_Action = 'DOWNLOAD' ) THEN
			IF ( This.Object.allow_deselect[row] = 1 ) THEN
				IF ( This.Object.selected[row] = 0 ) THEN
					This.Object.selected[row] = 1
				ELSE
					This.Object.selected[row] = 0
				END IF
			END IF
		END IF
END CHOOSE
end event

type pb_calendar from picturebutton within w_select_from_asa
integer x = 951
integer y = 816
integer width = 110
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "bitmaps\Calendar.gif"
alignment htextalign = left!
end type

event clicked;string ls_Date

OpenwithParm(w_calendar, em_scheduled.Text)
ls_Date = Message.StringParm
Message.StringParm = ''
IF IsDate(ls_date) THEN
	em_scheduled.Text = String(Date(ls_Date), Date_Format)
END IF

end event

type em_scheduled from editmask within w_select_from_asa
integer x = 603
integer y = 816
integer width = 347
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
maskdatatype maskdatatype = datemask!
end type

event modified;wf_Retrieve_Tour_List()
end event

type st_scheduled from statictext within w_select_from_asa
integer x = 18
integer y = 816
integer width = 567
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Scheduled <=:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_tour from datawindow within w_select_from_asa
integer x = 18
integer y = 64
integer width = 1042
integer height = 736
integer taborder = 40
string title = "none"
string dataobject = "d_tours_download"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;string ls_Column

ls_Column = dwo.Name
CHOOSE CASE ls_Column
	CASE 'selected'
//		IF ( This.Object.open_on_handheld[row] = 1 ) THEN
//			This.Object.selected[row] = 0
//		ELSE
			IF ( is_Action = 'DOWNLOAD' ) THEN
				IF ( This.Object.allow_deselect[row] = 1 ) THEN
					IF ( This.Object.selected[row] = 0 ) THEN
						This.Object.selected[row] = 1
					ELSE
						This.Object.selected[row] = 0
					END IF
				END IF
			END IF
//		END IF
END CHOOSE
end event

event rbuttondown;//string ls_Message
//integer li_Tour
//integer li_Rev_No
//
//IF ( dwo.Name = 'tour_name' ) THEN
//	li_Tour = This.Object.tour[row]
//	li_Rev_No = This.Object.rev_no[row]
//	ls_Message = 'Tour Detail|' + String(li_Tour) + '|' + String(li_Rev_No)
//	OpenWithParm(w_detail, ls_Message)
//END IF
end event

type cbx_hang from checkbox within w_select_from_asa
integer x = 18
integer y = 816
integer width = 512
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Hanging"
boolean checked = true
end type

event clicked;// multimodulesynch good
dw_section.EVENT ue_Filter()
end event

type cbx_restore from checkbox within w_select_from_asa
integer x = 567
integer y = 816
integer width = 512
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Restoring"
boolean checked = true
end type

event clicked;// multimodulesynch good
dw_section.EVENT ue_Filter()
end event

type cbx_verbosity from checkbox within w_select_from_asa
integer x = 18
integer y = 896
integer width = 512
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Verbose Log?"
end type

type cbx_common from checkbox within w_select_from_asa
integer x = 567
integer y = 896
integer width = 512
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "DL common?"
boolean checked = true
end type

type st_rev_no from statictext within w_select_from_asa
boolean visible = false
integer x = 27
integer y = 416
integer width = 146
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
string text = "Rev"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_tour from statictext within w_select_from_asa
boolean visible = false
integer x = 165
integer y = 416
integer width = 905
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
string text = " Tour"
boolean border = true
boolean focusrectangle = false
end type

type st_label from statictext within w_select_from_asa
integer x = 18
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
string text = "Synchronize"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_select_from_asa
integer x = 18
integer y = 976
integer width = 329
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;// multimodulesynch good
integer li_Width
boolean lb_Close
integer li_Return
string ls_MB_String
string ls_MB_String_2
string ls_Parameters[]
string ls_Delimiters[]
string ls_Blank[]

li_Return = wf_Set_System_Time()
IF ( li_Return = 1 ) THEN
	lb_Close = wf_Synchronize()
	Sleep(1)
	IF lb_Close THEN
		IF ib_Related_Equipment AND NOT Empty(guo_user.ID) THEN
			Open(w_related_equipment_invalid)
		END IF
		wf_Display_Messages()
		IF Empty(guo_user.ID) THEN
			guo_user.Init(uo_user_ml.ID)
		ELSE
			guo_user.Init(guo_user.ID)
		END IF
		w_main.wf_Update_Menu(TRUE)
		w_main.wf_View_Login(FALSE)
		CLOSE(Parent)
	END IF
END IF

end event

type cb_cancel from commandbutton within w_select_from_asa
integer x = 384
integer y = 976
integer width = 329
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

event clicked;// multimodulesynch good
CLOSE(Parent)
end event

type cb_refresh from commandbutton within w_select_from_asa
integer x = 750
integer y = 976
integer width = 329
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Refresh"
boolean cancel = true
end type

event clicked;wf_retrieve_section_list()
end event

type dw_section from datawindow within w_select_from_asa
event ue_filter ( )
integer x = 18
integer y = 64
integer width = 1042
integer height = 752
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_section_download"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event ue_filter();// multimodulesynch good
string ls_Filter
integer li_Return

ls_Filter = ' f_ml_type_is_granted( tagout_type_id , 1) '
IF cbx_hang.Checked AND cbx_restore.Checked THEN
ELSEIF cbx_hang.Checked THEN
	ls_Filter += ' AND ( status = 2 ) '
ELSEIF cbx_restore.Checked THEN
	ls_Filter += ' AND ( status = 32 ) '
END IF
li_Return = This.SetFilter(ls_Filter)
li_Return = This.Filter()
li_Return = li_Return

end event

event rbuttondown;// multimodulesynch good
string ls_Message
string ls_MB_String
string ls_MB_String_2
string ls_Parameters[]
string ls_Delimiters[]
string ls_Blank[]
boolean lb_Connected_Consol
string ls_Tagout_Type_Id
string ls_Tagout_Number
string ls_Section_Number
string ls_Type_Id
string ls_Unit_Id
string ls_Procedure_Id
integer li_Revision
integer li_Procedure_Serial_Id
string ls_Step_Id

IF ( row > 0 ) THEN
	lb_Connected_Consol = wf_Connect_To_Consolidated()
	IF lb_Connected_Consol THEN
		This.SetRow(row)
		ls_Parameters[1] = is_Section_Label
		ls_Delimiters[1] = '###'
		ls_MB_String = '### Detail'
		ls_MB_String = guo_user_settings.uf_LanguageString_2('###_DETAIL', ls_MB_String, ls_Parameters, ls_Delimiters)
		ls_Parameters = ls_Blank
		ls_Delimiters = ls_Blank
//		ls_Message = MID(st_label.Text, 1, POS(st_label.Text, ' ')) + ls_MB_String + '|FROM_ASA'
		ls_Tagout_Type_Id = This.GetItemString(row, 'tagout_type_id')
		ls_Tagout_Number = This.GetItemString(row, 'act_tagout_number')
		ls_Section_Number = This.GetItemString(row, 'act_tagout_section_number')

		ls_Message = ls_MB_String + '|'
		ls_Message += ls_Tagout_Type_Id + '|'
		ls_Message += ls_Tagout_Number + '|'
		ls_Message += ls_Section_Number + '|'
		ls_Message += 'FROM_ASA'
		OpenWithParm(w_detail, ls_Message)
	END IF
	wf_Disconnect_From_Consolidated()
END IF

end event

event clicked;// multimodulesynch good
string ls_Column

ls_Column = dwo.Name
CHOOSE CASE ls_Column
	CASE 'selected'
//		IF ( This.Object.open_on_handheld[row] = 1 ) THEN
//			This.Object.selected[row] = 0
//		ELSE
			IF ( is_Action = 'DOWNLOAD' ) THEN
				IF ( This.Object.allow_deselect[row] = 1 ) THEN
					IF ( This.Object.selected[row] = 0 ) THEN
						This.Object.selected[row] = 1
					ELSE
						This.Object.selected[row] = 0
					END IF
				END IF
			END IF
//		END IF
END CHOOSE
end event

event rowfocuschanged;// multimodulesynch good
This.SetRedraw(TRUE)
end event

event rowfocuschanging;// multimodulesynch good
This.SetRedraw(FALSE)
end event

type cbx_select_all from checkbox within w_select_from_asa
integer x = 41
integer y = 68
integer width = 73
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
end type

event clicked;integer li_Count
integer li_Num_Rows
integer li_Selected

IF ( is_Action = 'DOWNLOAD' ) THEN
	IF This.Checked THEN
		li_Selected = 1
	ELSE
		li_Selected = 0
	END IF
	CHOOSE CASE gs_Module_Id
		CASE 'NCS'
			li_Num_Rows = dw_section.RowCount()
		CASE 'NCCS'
			li_Num_Rows = dw_step.RowCount()
		CASE 'NLOGS'
			li_Num_Rows = dw_log.RowCount()
		CASE 'NPTS'
			li_Num_Rows = dw_tour.RowCount()
	END CHOOSE
	FOR li_Count = 1 TO li_Num_Rows
		IF ib_NCS THEN
			IF ( dw_section.Object.allow_deselect[li_Count] = 1 ) THEN
				dw_section.Object.selected[li_Count] = li_Selected
			END IF
		END IF
		IF ib_NCCS THEN
			IF ( dw_step.Object.allow_deselect[li_Count] = 1 ) THEN
				dw_step.Object.selected[li_Count] = li_Selected
			END IF
		END IF
		IF ib_NLOGS THEN
			IF ( dw_log.Object.allow_deselect[li_Count] = 1 ) THEN
				dw_log.Object.selected[li_Count] = li_Selected
			END IF
		END IF
		IF ib_NPTS THEN
			IF ( dw_tour.Object.allow_deselect[li_Count] = 1 ) THEN
				dw_tour.Object.selected[li_Count] = li_Selected
			END IF
		END IF
	NEXT
END IF
end event

