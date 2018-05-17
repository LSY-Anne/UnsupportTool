$PBExportHeader$w_validate_user.srw
forward
global type w_validate_user from window
end type
type cb_cancel from commandbutton within w_validate_user
end type
type cb_ok from commandbutton within w_validate_user
end type
type st_password from statictext within w_validate_user
end type
type st_login from statictext within w_validate_user
end type
type sle_password from singlelineedit within w_validate_user
end type
type sle_login_id from singlelineedit within w_validate_user
end type
type gb_1 from groupbox within w_validate_user
end type
end forward

global type w_validate_user from window
integer y = 104
integer width = 1097
integer height = 748
boolean titlebar = true
string title = "User Validation"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean clientedge = true
cb_cancel cb_cancel
cb_ok cb_ok
st_password st_password
st_login st_login
sle_password sle_password
sle_login_id sle_login_id
gb_1 gb_1
end type
global w_validate_user w_validate_user

on w_validate_user.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_password=create st_password
this.st_login=create st_login
this.sle_password=create sle_password
this.sle_login_id=create sle_login_id
this.gb_1=create gb_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.st_password,&
this.st_login,&
this.sle_password,&
this.sle_login_id,&
this.gb_1}
end on

on w_validate_user.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_password)
destroy(this.st_login)
destroy(this.sle_password)
destroy(this.sle_login_id)
destroy(this.gb_1)
end on

event open;string ls_Login_Id
integer li_Return

This.Title = f_DW_Language_Call_2('User Validation')
cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_login.Text = f_LanguageString('LOGIN_ID:', 'Login ID:')
st_password.Text = f_LanguageString('PASSWORD:', 'Password:')

string ls_return
ls_return = Upper(f_ProfileString('NOMUS','PasswordCaseSensitive', guo_user_settings.uf_LanguageString('NO', 'No')))
IF ( ls_return = Upper(guo_user_settings.uf_LanguageString('YES', 'Yes')) ) THEN
	sle_password.textcase	= AnyCase!
ELSE
	sle_password.textcase	= Upper!
END IF

SELECT login_id INTO :ls_login_id FROM userlog WHERE user_id = :guo_user.ID ;

sle_login_id.text = Trim(ls_login_id)
sle_password.SetFocus()
end event

event close;//SetSIPPreferredState(Handle(sle_password), SipForceDown!)
//SetSIPPreferredState(Handle(sle_login_id), SipForceDown!)
//SetSIPPreferredState(Handle(This), SipForceDown!)
//
end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event activate;This.X = gl_X + (w_main.Width - This.Width) / 2
This.Y = gl_Y + 104
f_Release_Buttons()


end event

type cb_cancel from commandbutton within w_validate_user
integer x = 539
integer y = 404
integer width = 347
integer height = 92
integer taborder = 60
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, "")
end event

type cb_ok from commandbutton within w_validate_user
integer x = 128
integer y = 404
integer width = 347
integer height = 92
integer taborder = 50
integer textsize = -9
integer weight = 700
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

//SetSIPPreferredState(Handle(sle_login_id), SIPForceDown!)
//SetSIPPreferredState(Handle(sle_password), SIPForceDown!)

ls_Login_Id	= sle_login_id.Text
ls_Password = sle_password.Text

IF NOT IsValid(guo_user) THEN
	guo_user = CREATE u_user
END IF
lb_Logged_In = ( guo_user.Login(ls_Login_Id, ls_Password) = 1 )
IF lb_Logged_In THEN
	w_main.Post wf_Update_Menu(TRUE)
	ls_User_Id = guo_user.ID
	CloseWithReturn(Parent, ls_User_Id)
ELSE
	sle_password.Text = ''
	sle_login_id.SetFocus()
END IF
end event

type st_password from statictext within w_validate_user
integer x = 18
integer y = 208
integer width = 439
integer height = 80
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_login from statictext within w_validate_user
integer x = 18
integer y = 112
integer width = 439
integer height = 80
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Login ID:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_validate_user
integer x = 475
integer y = 208
integer width = 512
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean password = true
textcase textcase = upper!
integer accelerator = 112
borderstyle borderstyle = stylelowered!
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
This.SelectText( 1, Len( This.Text ) )
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

type sle_login_id from singlelineedit within w_validate_user
integer x = 475
integer y = 112
integer width = 512
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 12
integer accelerator = 105
borderstyle borderstyle = stylelowered!
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
This.SelectText( 1, Len( This.Text ) )
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

type gb_1 from groupbox within w_validate_user
integer width = 1061
integer height = 400
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

