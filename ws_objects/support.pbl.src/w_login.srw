$PBExportHeader$w_login.srw
forward
global type w_login from window
end type
type sle_pass from singlelineedit within w_login
end type
type st_pass from statictext within w_login
end type
type st_id from statictext within w_login
end type
type cb_cancel from commandbutton within w_login
end type
type cb_ok from commandbutton within w_login
end type
type sle_login from singlelineedit within w_login
end type
type st_login from statictext within w_login
end type
end forward

global type w_login from window
integer width = 1097
integer height = 1280
string menuname = "mnu_blank"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
sle_pass sle_pass
st_pass st_pass
st_id st_id
cb_cancel cb_cancel
cb_ok cb_ok
sle_login sle_login
st_login st_login
end type
global w_login w_login

on w_login.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.sle_pass=create sle_pass
this.st_pass=create st_pass
this.st_id=create st_id
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_login=create sle_login
this.st_login=create st_login
this.Control[]={this.sle_pass,&
this.st_pass,&
this.st_id,&
this.cb_cancel,&
this.cb_ok,&
this.sle_login,&
this.st_login}
end on

on w_login.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_pass)
destroy(this.st_pass)
destroy(this.st_id)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_login)
destroy(this.st_login)
end on

event open;guo_window.Post uf_Resize(w_login)
//guo_window.Post uf_Reposition(This)

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_id.Text = f_LanguageString('LOGIN_ID:', 'Login ID:')
st_login.Text = f_LanguageString('LOGIN', 'Login')
st_pass.Text = f_LanguageString('PASSWORD:', 'Password:')

string ls_return
ls_return = Upper(f_ProfileString('NOMUS','PasswordCaseSensitive', guo_user_settings.uf_LanguageString('NO', 'No')))
IF ( ls_return = Upper(guo_user_settings.uf_LanguageString('YES', 'Yes')) ) THEN
	sle_pass.textcase	= AnyCase!
ELSE
	sle_pass.textcase	= Upper!
END IF

sle_login.Post SetFocus()
end event

event other;//// Respond to help from Start->Help menu of the device
//IF ( message.Number = 83 ) THEN
//	f_Display_Help()
//END IF
end event

event close;gl_X = This.X
gl_Y = This.Y

end event

event activate;This.X = gl_X
This.Y = gl_Y
f_Release_Buttons()


end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type sle_pass from singlelineedit within w_login
integer x = 512
integer y = 192
integer width = 567
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
textcase textcase = upper!
integer limit = 30
end type

event getfocus;
end event

event losefocus;
end event

type st_pass from statictext within w_login
integer x = 18
integer y = 192
integer width = 475
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_id from statictext within w_login
integer x = 18
integer y = 80
integer width = 475
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Login ID:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_login
integer x = 567
integer y = 320
integer width = 274
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_login
integer x = 201
integer y = 320
integer width = 274
integer height = 80
integer taborder = 40
integer textsize = -9
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

ls_Login_Id	= sle_login.Text
ls_Password = sle_pass.Text
sle_pass.Text = ''

IF NOT IsValid(guo_user) THEN
	guo_user = CREATE u_user
END IF
lb_Logged_In = ( guo_user.Login(ls_Login_Id, ls_Password) = 1 )
IF lb_Logged_In THEN
	Close(Parent)
ELSE
	sle_login.Text = ""
	sle_pass.Text = ""
END IF

end event

type sle_login from singlelineedit within w_login
integer x = 512
integer y = 80
integer width = 567
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 12
end type

event getfocus;
end event

event losefocus;
end event

type st_login from statictext within w_login
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
string text = "Login"
boolean focusrectangle = false
end type

