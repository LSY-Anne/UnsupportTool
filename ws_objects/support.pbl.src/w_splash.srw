$PBExportHeader$w_splash.srw
forward
global type w_splash from window
end type
type lb_1 from listbox within w_splash
end type
type st_loading from statictext within w_splash
end type
type p_logo from picture within w_splash
end type
type mle_about from multilineedit within w_splash
end type
type ddlb_temp from dropdownlistbox within w_splash
end type
type st_backbround from statictext within w_splash
end type
end forward

global type w_splash from window
integer width = 1490
integer height = 2104
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
event ue_connect_to_db ( )
event ue_create_user_object ( )
event ue_using_ml ( )
event ue_create_ml_publications ( )
lb_1 lb_1
st_loading st_loading
p_logo p_logo
mle_about mle_about
ddlb_temp ddlb_temp
st_backbround st_backbround
end type
global w_splash w_splash

event ue_connect_to_db();string ls_Folder
string ls_CAB_Filename

/*
ls_Folder = GetCurrentDirectory()
ls_CAB_Filename = ls_Folder + "\esoms_db.ARM.CAB"
IF FileExists(ls_CAB_Filename) THEN
	SetFileAttributes_CE(ls_CAB_Filename, 128)
	FileDelete(ls_CAB_Filename)
END IF

*/
	
f_Connect_To_DB_Main(TRUE)
f_Connect_To_DB(TRUE)

/*
IF ( f_Check_Versioning(TRUE) = -1 ) THEN
	HALT
END IF

*/
//This.EVENT ue_Using_ML()

//gs_Serialnumber = f_GetSerialNumber()

//This.EVENT ue_Create_ML_Publications()
end event

event ue_create_user_object();guo_user = CREATE u_user

IF NOT IsValid(guo_user) THEN
	MessageBox("Error", "Unable to create user object")
	HALT CLOSE
ELSE
	Open(w_main)
//	Close(This)
END IF




end event

event ue_using_ml();integer li_Count

SELECT COUNT(*) 
  INTO :li_Count 
  FROM mobilink_settings 
 WHERE ( key_id = 'ml_host' ) 
USING SQLCA ;

ROLLBACK USING SQLCA ;
gb_Using_ML = ( li_Count = 1 )

end event

event ue_create_ml_publications();// 2010-01-25 - Commented out the lines below
// If the gs_serialnumber has changed, possible to DROP synch subscription stuff for the old 
// serialnumber rather than using the old serialnumber
// Example:
//DROP SYNCHRONIZATION SUBSCRIPTION
//   TO common
//   FOR "ml_cc421beeb39b4195bad3103dba3bceef" ;
//
//DROP SYNCHRONIZATION SUBSCRIPTION
//   TO rounds
//   FOR "ml_cc421beeb39b4195bad3103dba3bceef" ;
//
//DROP SYNCHRONIZATION SUBSCRIPTION
//   TO rounds_common
//   FOR "ml_cc421beeb39b4195bad3103dba3bceef" ;
//
//DROP SYNCHRONIZATION SUBSCRIPTION
//   TO ml_rounds
//   FOR "ml_cc421beeb39b4195bad3103dba3bceef" ;
//
// logs, clearances, ...
//
//DROP SYNCHRONIZATION USER ml_cc421beeb39b4195bad3103dba3bceef ;

//string ls_Local_Serialnumber
//string ls_Previous_DB_Serialnumber

IF gb_Using_ML THEN
//	IF gb_Platform_Is_CE THEN
		gs_Serialnumber = f_GetSerialNumber()
		gs_Serialnumber = StrTran(gs_Serialnumber, "-", "_")
		gs_Serialnumber = StrTran(gs_Serialnumber, ">", "")
		IF ( MID(gs_Serialnumber, 1, 3) <> 'ml_' ) THEN
			gs_Serialnumber = 'ml_' + gs_Serialnumber
		END IF
//		ls_Local_Serialnumber = MID('ml_' + f_GetSerialNumber(), 1, 50)
//	ELSE
//		gs_Serialnumber = 'ml_TestSerial1234567890'
//////		ls_Local_Serialnumber = 'ml_network'
////		ls_Local_Serialnumber = 'ml_3A00080070436EA1A8000050BF7A60E2'
//	END IF
//	
//	SELECT site_name  
//	  INTO :ls_Previous_DB_Serialnumber 
//	  FROM syssync 
//	 WHERE ( sync_id = 1 ) 
//	   AND ( publication_id IS NULL ) ;
//
//	IF Empty(ls_Previous_DB_Serialnumber) THEN
//		gs_SerialNumber = ls_Local_Serialnumber
//	ELSE
//		IF ( ls_Previous_DB_Serialnumber <> ls_Local_Serialnumber ) THEN
//			gs_SerialNumber = ls_Previous_DB_Serialnumber
//		ELSE
//			gs_SerialNumber = ls_Local_Serialnumber
//		END IF
//	END IF
//	f_ML_Create_Subscriptions(gs_Serialnumber)
END IF

end event

on w_splash.create
this.lb_1=create lb_1
this.st_loading=create st_loading
this.p_logo=create p_logo
this.mle_about=create mle_about
this.ddlb_temp=create ddlb_temp
this.st_backbround=create st_backbround
this.Control[]={this.lb_1,&
this.st_loading,&
this.p_logo,&
this.mle_about,&
this.ddlb_temp,&
this.st_backbround}
end on

on w_splash.destroy
destroy(this.lb_1)
destroy(this.st_loading)
destroy(this.p_logo)
destroy(this.mle_about)
destroy(this.ddlb_temp)
destroy(this.st_backbround)
end on

event open;//guo_window.Post uf_Resize(w_splash)
//guo_window.Post uf_Reposition(This)

//guo_user_settings.uf_get_language_settings( )
//gs_Window_Title = f_DW_Language_Call_2(gs_Window_Title)
//gs_Module_Name = f_DW_Language_Call_2(gs_Module_Name)
//This.Title = gs_Window_Title
//st_loading.Text = f_DW_Language_Call_2('Loading ...')

gb_Using_ML = FALSE

/*

IF gb_Install_esoms_db_cab THEN
	string ls_Folder
	integer li_Num_Items
	integer li_Count
	boolean lb_Return
	string ls_FileName
	string ls_CAB_Filename

	ls_Folder = GetCurrentDirectory()
	ls_CAB_Filename = ls_Folder + "\esoms_db.ARM.CAB"
	f_Close_All_Esoms_Applications()
	lb_Return = ddlb_temp.DirList(ls_Folder + '\*.LOG', 39)
	IF lb_Return THEN
		li_Num_Items = ddlb_temp.TotalItems()
		FOR li_Count = 1 TO li_Num_Items
			ls_FileName = ls_Folder + "\" + ddlb_temp.Text(li_Count)
			SetFileAttributes_CE(ls_Filename, 128)
			FileDelete(ls_FileName)
		NEXT
		DESTROY ddlb_temp
		ls_Filename = ls_Folder + "\esoms.db"
		SetFileAttributes_CE(ls_Filename, 128)
		FileDelete(ls_FileName)
		f_Open_File(ls_CAB_Filename)
	ELSE
		Messagebox('error', '2')
	END IF
	HALT
ELSE
	*/
	This.Post EVENT ue_Connect_To_DB()
	This.Post EVENT ue_Create_User_Object()
	/*

END IF
*/
end event

event close;//gl_X = This.X
//gl_Y = This.Y

//This.EVENT ue_Using_ML()
//This.EVENT ue_Create_ML_Publications()
end event

event deactivate;//gl_X = This.X
//gl_Y = This.Y

end event

type lb_1 from listbox within w_splash
boolean visible = false
integer x = 503
integer y = 800
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_loading from statictext within w_splash
integer x = 55
integer y = 1068
integer width = 1381
integer height = 276
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Loading ..."
alignment alignment = center!
boolean focusrectangle = false
end type

type p_logo from picture within w_splash
integer x = 242
integer y = 308
integer width = 965
integer height = 392
string picturename = "bitmaps\LogoCE.gif"
boolean focusrectangle = false
end type

type mle_about from multilineedit within w_splash
integer y = 868
integer width = 1454
integer height = 472
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
alignment alignment = center!
boolean displayonly = true
end type

type ddlb_temp from dropdownlistbox within w_splash
integer x = 347
integer y = 332
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_backbround from statictext within w_splash
integer width = 2002
integer height = 2500
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
boolean focusrectangle = false
end type

