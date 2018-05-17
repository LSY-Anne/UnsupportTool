$PBExportHeader$w_about.srw
forward
global type w_about from window
end type
type cb_ok from commandbutton within w_about
end type
type mle_detail from multilineedit within w_about
end type
type st_tour_detail from statictext within w_about
end type
end forward

global type w_about from window
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
cb_ok cb_ok
mle_detail mle_detail
st_tour_detail st_tour_detail
end type
global w_about w_about

type variables
string			is_Parent_Window

end variables

on w_about.create
this.cb_ok=create cb_ok
this.mle_detail=create mle_detail
this.st_tour_detail=create st_tour_detail
this.Control[]={this.cb_ok,&
this.mle_detail,&
this.st_tour_detail}
end on

on w_about.destroy
destroy(this.cb_ok)
destroy(this.mle_detail)
destroy(this.st_tour_detail)
end on

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event activate;This.X = gl_X
This.Y = gl_Y

f_Release_Buttons()

//SetSIPPreferredState(Handle(This), SIPForceDown!)
end event

event open;guo_window.Post uf_Resize(w_about)
//guo_window.Post uf_Reposition(This)

string ls_Device_SerialNumber
//string ls_Device_SerialNumber2
string ls_DB_Build
string ls_About
string ls_PK
string ls_Schema
string ls_ASA
string ls_App
string ls_CRLF
string ls_TAB

ls_CRLF = CHAR(13) + CHAR(10)
ls_Tab = CHAR(9)

cb_ok.Text = f_LanguageString('OK', 'Ok')
st_tour_detail.Text = f_LanguageString('ABOUT', 'About')

ls_PK = f_LanguageString('PK_RUNTIME_VERSION:', 'PK Runtime Version:')
ls_PK = ls_PK + ls_CRLF + ls_Tab + f_LanguageString('CURRENT:', 'Current:') + ' ' + gs_Current_PK_Version
ls_PK = ls_PK + ls_CRLF + ls_Tab + f_LanguageString('MIN_REQUIRED', 'Min Required:') + ' ' + gs_Required_PK_Version

ls_Schema = f_LanguageString('DATABASE_SCHEMA_VERSION', 'Database Schema Version:')
ls_Schema = ls_Schema + ls_CRLF + ls_Tab + f_LanguageString('CURRENT:', 'Current:') + ' ' + gs_Current_Schema_Version
ls_Schema = ls_Schema + ls_CRLF + ls_Tab + f_LanguageString('MIN_REQUIRED', 'Min Required:') + ' ' + gs_Required_Schema_Version

ls_DB_Build = f_LanguageString('DATABASE_BUILD_VERSION', 'Database Build Version:')
ls_DB_Build = ls_DB_Build + ls_CRLF + ls_Tab + gs_Current_DB_Version

ls_ASA = f_LanguageString('ASA_ENGINE_VERSION', 'ASA Engine Version:')
ls_ASA = ls_ASA + ls_CRLF + ls_Tab + f_LanguageString('CURRENT:', 'Current:') + ' ' + gs_Current_ASA_Version
IF gb_Using_ML THEN
	ls_ASA = ls_ASA + ls_CRLF + ls_Tab + f_LanguageString('MIN_REQUIRED', 'Min Required:') + ' ' + gs_Required_ML_ASA_Version
ELSE
	ls_ASA = ls_ASA + ls_CRLF + ls_Tab + f_LanguageString('MIN_REQUIRED', 'Min Required:') + ' ' + gs_Required_ASA_Version
END IF

string ls_Pointer
string ls_MB_String
string ls_MB_String_2
string ls_Parameters[]
string ls_Delimiters[]
string ls_Blank[]

ls_Parameters[1] = gs_Module_Name
ls_Delimiters[1] = '###'
ls_MB_String = 'Mobile eSOMS for ###'
ls_MB_String = guo_user_settings.uf_LanguageString_2('MOBILE_ESOMS_FOR_###', ls_MB_String, ls_Parameters, ls_Delimiters)
ls_Parameters = ls_Blank
ls_Delimiters = ls_Blank
ls_App = ls_MB_String + ':'
ls_App = ls_App + ls_CRLF + ls_Tab + gs_Current_Version + ' ' + gs_Compile_Date

ls_Device_SerialNumber = f_LanguageString('DEVICE_UNIQUE_ID', 'Device Unique ID:')
ls_Device_SerialNumber += ls_CRLF + ls_Tab + gs_Serialnumber //f_GetSerialNumber()

IF gb_Using_ML THEN
	string ls_ML_Info
	string ls_ML_Info_Value
	string ls_ML_Info_Description
	integer li_Num_Rows
	integer li_Count
	string ls_Sql
	datastore lds_temp
	
	lds_temp = CREATE datastore
	lds_temp.SetTransObject(SQLCA)
	ls_Sql = " &
		SELECT value_id, &
				 description &
		  FROM mobilink_settings &
		 WHERE ( key_id <> 'ml_host' ) &
		   AND ( description IS NOT NULL ) &
	 ORDER BY key_id "

	li_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
	ls_ML_Info = ''
	ls_ML_Info += f_LanguageString('MOBILINK_SETTINGS', 'Mobilink Settings')
	FOR li_Count = 1 TO li_Num_Rows
		ls_ML_Info_Value = lds_temp.GetItemString(li_Count, 1)
		ls_ML_Info_Description = lds_temp.GetItemString(li_Count, 2)
		ls_ML_Info += ls_CRLF + ls_Tab + ls_ML_Info_Description + ': ' + ls_ML_Info_Value
	NEXT
	lds_temp.Reset()
	DESTROY lds_temp
	ls_ML_Info += ls_CRLF + ls_CRLF
ELSE
	ls_ML_Info = ''
END IF

string ls_IP_Address
RegistryGet("HKEY_LOCAL_MACHINE\Software\TechAssist\Mobile eSOMS", "IPAddress", RegString!, ls_IP_Address)
IF Empty(ls_IP_Address) THEN
	ls_IP_Address = ''
ELSE
	ls_IP_Address = ls_CRLF + ls_CRLF + 'IP' + ls_CRLF + ls_Tab + ls_IP_Address
END IF

// vv 3.8EP14 For Multi-module synch ...
string ls_Syncrhonizing_Modules
lds_temp = CREATE datastore
lds_temp.SetTransObject(SQLCA)
ls_Sql = " &
	SELECT &
		 CASE publication_name &
			  WHEN 'clearances' THEN 'Clearances' &
			  WHEN 'logs' THEN 'Narrative Logs' &
			  WHEN 'rounds' THEN 'Operator Rounds' &
			  WHEN 'config' THEN 'Configuration Control' &
		 END CASE &
	  FROM SYS.SYSSYNCSUBSCRIPTIONS &
	 WHERE ( publication_name IN ( 'logs', 'clearances', 'rounds', 'config' ) ) &
	ORDER BY 1 "
li_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
ls_Syncrhonizing_Modules = ls_CRLF + ls_CRLF + f_LanguageString('SYNCHRONIZING_MODULES', 'Synchronizing Modules') + ':'
FOR li_Count = 1 TO li_Num_Rows
	ls_Syncrhonizing_Modules += ls_CRLF + ls_Tab + f_DW_Language_Call_2(lds_temp.GetItemString(li_Count, 1))
NEXT
lds_temp.Reset()
DESTROY lds_temp
// ^^ 3.8EP14 For Multi-module synch ...

ls_About = ls_App + ls_CRLF + ls_CRLF + ls_ML_Info + ls_Device_SerialNumber + ls_CRLF + ls_CRLF + ls_PK + ls_CRLF + ls_CRLF + ls_ASA + ls_CRLF + ls_CRLF + ls_DB_Build + ls_CRLF + ls_CRLF + ls_Schema + ls_IP_Address + ls_Syncrhonizing_Modules

mle_detail.Text = ls_About


end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

event close;gl_X = This.X
gl_Y = This.Y

end event

type cb_ok from commandbutton within w_about
integer x = 416
integer y = 1100
integer width = 274
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;Close(Parent)
end event

type mle_detail from multilineedit within w_about
integer x = 18
integer y = 64
integer width = 1042
integer height = 1008
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = StyleLowered!
end type

type st_tour_detail from statictext within w_about
integer x = 18
integer width = 1042
integer height = 64
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "About"
boolean focusrectangle = false
end type

