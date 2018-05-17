$PBExportHeader$w_main_bk.srw
forward
global type w_main_bk from window
end type
type st_ellipsis from statictext within w_main_bk
end type
type ddlb_backup from dropdownlistbox within w_main_bk
end type
type p_logo from picture within w_main_bk
end type
type sle_password from singlelineedit within w_main_bk
end type
type sle_login_id from singlelineedit within w_main_bk
end type
type st_password from statictext within w_main_bk
end type
type st_login_id from statictext within w_main_bk
end type
type cb_cancel from commandbutton within w_main_bk
end type
type cb_ok from commandbutton within w_main_bk
end type
type st_backbround from statictext within w_main_bk
end type
type mle_about from multilineedit within w_main_bk
end type
end forward

global type w_main_bk from window
integer width = 1463
integer height = 1836
boolean titlebar = true
string title = "eSOMS Rounds x"
string menuname = "mnu_main"
boolean controlmenu = true
boolean minbox = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
boolean contexthelp = true
event ue_show_main ( )
event ue_message pbm_custom01
event ue_post_restore ( )
event ue_reset_open_on_handheld ( )
st_ellipsis st_ellipsis
ddlb_backup ddlb_backup
p_logo p_logo
sle_password sle_password
sle_login_id sle_login_id
st_password st_password
st_login_id st_login_id
cb_cancel cb_cancel
cb_ok cb_ok
st_backbround st_backbround
mle_about mle_about
end type
global w_main_bk w_main_bk

type variables

end variables

forward prototypes
public subroutine wf_check_item (integer li_index)
public subroutine wf_update_menu (boolean ab_enable)
public subroutine wf_uncheck_item ()
public function integer wf_count_open_items ()
public function integer wf_get_current_item ()
public subroutine wf_hide_menu ()
public subroutine wf_populate_menu (integer ai_index_passed, string as_menu_text)
public subroutine wf_release_menu (integer ai_menu_number)
public subroutine wf_view_login (boolean ab_show)
end prototypes

event ue_show_main();// This is only necessary because the menu stopped displaying
// upon initial load of the application and this 
// seemed to fix it.

// 10/14
This.ChangeMenu(mnu_main)

guo_module_specific.f_Update_Main_Menu_Text(mnu_main)

This.Hide()
This.Show()

Close(w_splash)
end event

event ue_message;CHOOSE CASE lparam
	CASE 1 // Close application
//		f_UnRegister_Main_Window(This)
		HALT
	CASE 2
		ROLLBACK USING SQLCA ;
	CASE ELSE
		MessageBox(gs_Window_Title + ' Message Number ' + String(lparam), 'This message number has not been implemented yet')
END CHOOSE
end event

event ue_post_restore();integer li_Count

FOR li_Count = 1 TO 7
	wf_Release_Menu(li_Count)
NEXT

This.EVENT ue_reset_open_on_handheld( )
end event

event ue_reset_open_on_handheld();guo_module_specific.f_reset_open_on_handheld()
end event

public subroutine wf_check_item (integer li_index);mnu_main.m_window.Item[li_index].Checked = true
end subroutine

public subroutine wf_update_menu (boolean ab_enable);guo_module_specific.uf_Menu_Security(mnu_main, ab_Enable)

end subroutine

public subroutine wf_uncheck_item ();integer li_index

FOR li_index = 1 TO 7
	mnu_main.m_window.Item[li_index].Checked = false
NEXT
end subroutine

public function integer wf_count_open_items ();integer li_Count
integer li_Num_Open_Items

li_Num_Open_Items	= 0
IF IsValid(mnu_main) THEN
	FOR li_Count = 1 TO 7
		IF mnu_main.m_window.Item[li_Count].Visible THEN
			li_Num_Open_Items = li_Num_Open_Items + 1
		END IF
	NEXT
END IF

RETURN li_Num_Open_Items
end function

public function integer wf_get_current_item ();integer li_Count

FOR li_Count = 1 TO 7
	IF mnu_main.m_window.Item[li_Count].Checked THEN
		RETURN li_count
	END IF
NEXT

RETURN -1
end function

public subroutine wf_hide_menu ();integer int_Count

FOR int_Count = 1 TO 7
	IF (mnu_main.m_window.Item[int_Count].Tag = STRING(int_Count) ) THEN
		mnu_main.m_window.Item[int_Count].Visible = FALSE
	END IF
NEXT
end subroutine

public subroutine wf_populate_menu (integer ai_index_passed, string as_menu_text);integer li_Count

mnu_main.m_window.Item[ai_Index_Passed].Text = as_Menu_Text
mnu_main.m_window.Item[ai_Index_Passed].Tag = String(ai_Index_Passed)
mnu_main.m_window.Item[ai_Index_Passed].Visible = TRUE

FOR li_Count = 1 TO 7
	mnu_main.m_window.Item[li_Count].Checked = FALSE
NEXT
mnu_main.m_window.Item[ai_Index_Passed].Checked = TRUE
end subroutine

public subroutine wf_release_menu (integer ai_menu_number);integer li_Count
boolean lb_Disable_Exit

IF IsValid(mnu_main) THEN
	mnu_main.m_window.Item[ai_Menu_Number].Text = ""
	mnu_main.m_window.Item[ai_Menu_Number].Tag = ""
	mnu_main.m_window.Item[ai_Menu_Number].Visible = FALSE

	FOR li_Count = 1 TO 7
		lb_Disable_Exit = lb_Disable_Exit OR mnu_main.m_window.Item[li_Count].Visible
	NEXT
	mnu_main.m_file.m_exit.Enabled = NOT lb_Disable_Exit
END IF

end subroutine

public subroutine wf_view_login (boolean ab_show);w_main.Visible = TRUE
string ls_return
ls_return = Upper(f_ProfileString('NOMUS','PasswordCaseSensitive', guo_user_settings.uf_LanguageString('NO', 'No')))
IF ( ls_return = Upper(guo_user_settings.uf_LanguageString('YES', 'Yes')) ) THEN
	sle_password.textcase	= AnyCase!
ELSE
	sle_password.textcase	= Upper!
END IF
sle_login_id.Visible = ab_Show
st_login_id.Visible = ab_Show
sle_password.Visible = ab_Show
st_password.Visible = ab_Show
sle_password.Text = ''
cb_ok.Visible = ab_Show
cb_cancel.Visible = ab_Show
IF ab_Show THEN
	sle_login_id.TabOrder = 1
	sle_password.TabOrder = 2
	cb_ok.TabOrder = 3
	cb_cancel.TabOrder = 4
	cb_ok.Default = TRUE
	cb_cancel.Default = FALSE
	sle_login_id.SetFocus()
ELSE
	sle_login_id.TabOrder = 0
	sle_password.TabOrder = 0
	cb_ok.TabOrder = 0
	cb_cancel.TabOrder = 0
	mle_about.SetFocus()
END IF
end subroutine

on w_main_bk.create
if this.MenuName = "mnu_main" then this.MenuID = create mnu_main
this.st_ellipsis=create st_ellipsis
this.ddlb_backup=create ddlb_backup
this.p_logo=create p_logo
this.sle_password=create sle_password
this.sle_login_id=create sle_login_id
this.st_password=create st_password
this.st_login_id=create st_login_id
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_backbround=create st_backbround
this.mle_about=create mle_about
this.Control[]={this.st_ellipsis,&
this.ddlb_backup,&
this.p_logo,&
this.sle_password,&
this.sle_login_id,&
this.st_password,&
this.st_login_id,&
this.cb_cancel,&
this.cb_ok,&
this.st_backbround,&
this.mle_about}
end on

on w_main_bk.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_ellipsis)
destroy(this.ddlb_backup)
destroy(this.p_logo)
destroy(this.sle_password)
destroy(this.sle_login_id)
destroy(this.st_password)
destroy(this.st_login_id)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_backbround)
destroy(this.mle_about)
end on

event open;guo_window.Post uf_Resize(w_main)
//guo_window.Post uf_Reposition(This)

This.Title = gs_Window_Title

f_Register_Main_Window(This)

gs_INI_File = GetCurrentDirectory() + "\eSOMS.ini"

IF Empty(guo_user.ID) THEN
	Timer(0, This)
ELSE
	Timer(gi_Automatic_Backup_Timing * 60, This)
END IF

gs_ScratchPad_Text = ""
f_Create_INI_File()
f_Update_User_Preferences()

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_login_id.Text = f_LanguageString('LOGIN_ID:', 'Login ID:')
st_password.Text = f_LanguageString('PASSWORD:', 'Password:')

string ls_return
ls_return = Upper(f_ProfileString('NOMUS','PasswordCaseSensitive', guo_user_settings.uf_LanguageString('NO', 'No')))
IF ( ls_return = Upper(guo_user_settings.uf_LanguageString('YES', 'Yes')) ) THEN
	sle_password.textcase	= AnyCase!
ELSE
	sle_password.textcase	= Upper!
END IF

mle_About.Text = f_Get_Main_Status()

This.EVENT ue_reset_open_on_handheld( )

/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//This.Post Event ue_Show_Main()

//Post wf_Update_Menu(FALSE)

//sle_login_id.Post SetFocus()

This.Event ue_Show_Main()
 wf_Update_Menu(FALSE)
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////

end event

event close;
guo_module_specific.f_Close_Module_Window()

IF IsValid(w_scratchpad) THEN
	CLOSE(w_scratchpad)
END IF
f_UnRegister_Main_Window(This)
f_Disconnect_From_DB()
f_Disconnect_From_DB_Main()
end event

event help;MessageBox('', 'Help for Main')
end event

event activate;integer li_Num_Open_Items

This.X = gl_X
This.Y = gl_Y

f_Release_Buttons()

li_Num_Open_Items = wf_Count_Open_Items()
mnu_main.m_file.m_exit.Enabled = ( li_Num_Open_Items = 0 )

p_logo.SetFocus( )
mle_about.SetFocus()

mnu_main.Visible = TRUE
guo_module_specific.f_Display_Module_Window(FALSE)
end event

event timer;//IF NOT IsValid(w_select_from_asa) THEN
//	f_Backup_Database()
////	wf_Update_Restore_Menu()
//END IF
end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type st_ellipsis from statictext within w_main_bk
boolean visible = false
integer x = 14
integer y = 924
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean focusrectangle = false
end type

type ddlb_backup from dropdownlistbox within w_main_bk
boolean visible = false
integer x = 142
integer y = 1144
integer width = 480
integer height = 400
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type p_logo from picture within w_main_bk
integer x = 247
integer y = 172
integer width = 965
integer height = 392
string picturename = "bitmaps\LogoCE.gif"
boolean focusrectangle = false
end type

event rbuttondown;Open(w_about)
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
Open(w_about)
/////////////////////////////////////////////////// Appeon End   ///////////////////////////////////////////////////
end event

type sle_password from singlelineedit within w_main_bk
integer x = 713
integer y = 832
integer width = 439
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), Sipdown!)
//END IF
end event

type sle_login_id from singlelineedit within w_main_bk
integer x = 713
integer y = 712
integer width = 439
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "CP276"
textcase textcase = upper!
integer limit = 12
borderstyle borderstyle = stylelowered!
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

type st_password from statictext within w_main_bk
integer x = 215
integer y = 840
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_login_id from statictext within w_main_bk
integer x = 215
integer y = 732
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Login ID:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_main_bk
integer x = 814
integer y = 996
integer width = 347
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;w_main.wf_View_Login(FALSE)

end event

type cb_ok from commandbutton within w_main_bk
integer x = 302
integer y = 996
integer width = 347
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;string ls_Login_Id
string ls_User_Id
string ls_Password
integer li_Return
boolean lb_Logged_In

ls_Login_Id	= sle_login_id.Text
ls_Password = sle_password.Text
sle_password.Text = ''

IF NOT IsValid(guo_user) THEN
	guo_user = CREATE u_user
END IF

////////////////////////////////Appeon Begin///////////////////////////
IF appeongetclienttype() = 'PB' THEN
	
	f_Connect_To_DB_Main(TRUE)
	f_Connect_To_DB(TRUE)
	
ELSE

	CONNECT USING SQLCA;
	
	IF SQLCA.SQLCode <> 0 THEN
		MessageBox('Error - Unable to start database', 'Error: ' + String(SQLCA.SQLCode) + '~n~r' + SQLCA.SQLErrText)
		SetPointer(Arrow!)
		HALT
	END IF
	
	
	CONNECT USING SQLMain;
	
	IF SQLMain.SQLCode <> 0 THEN
		MessageBox('Error - Unable to start database', 'Error: ' + String(SQLMain.SQLCode) + '~n~r' + SQLMain.SQLErrText)
		SetPointer(Arrow!)
		HALT
	END IF
	
END IF
////////////////////////////////Appeon End///////////////////////////

lb_Logged_In = ( guo_user.Login(ls_Login_Id, ls_Password) = 1 )
IF lb_Logged_In THEN
	Timer(0, w_main)
	wf_View_Login(FALSE)
	guo_module_specific.f_Open_Select_Window()
	Post wf_Update_Menu(lb_Logged_In)
	w_main.Visible = FALSE
END IF

end event

type st_backbround from statictext within w_main_bk
integer width = 1499
integer height = 1812
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_about from multilineedit within w_main_bk
integer x = 197
integer y = 1172
integer width = 1079
integer height = 448
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = false
alignment alignment = center!
boolean displayonly = true
end type

event getfocus;This.Text = f_Get_Main_Status()
//SetSIPPreferredState(Handle(Parent), SIPForceDown!)
end event

event rbuttondown;Open(w_about)
end event

