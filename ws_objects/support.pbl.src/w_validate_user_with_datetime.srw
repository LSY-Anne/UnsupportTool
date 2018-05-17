$PBExportHeader$w_validate_user_with_datetime.srw
forward
global type w_validate_user_with_datetime from window
end type
type pb_date from picturebutton within w_validate_user_with_datetime
end type
type st_datetime from statictext within w_validate_user_with_datetime
end type
type cb_cancel from commandbutton within w_validate_user_with_datetime
end type
type cb_ok from commandbutton within w_validate_user_with_datetime
end type
type st_password from statictext within w_validate_user_with_datetime
end type
type st_login from statictext within w_validate_user_with_datetime
end type
type sle_password from singlelineedit within w_validate_user_with_datetime
end type
type sle_login_id from singlelineedit within w_validate_user_with_datetime
end type
type gb_1 from groupbox within w_validate_user_with_datetime
end type
type em_turnover_dt from editmask within w_validate_user_with_datetime
end type
end forward

global type w_validate_user_with_datetime from window
integer y = 104
integer width = 1097
integer height = 748
boolean titlebar = true
string title = "User Validation"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean clientedge = true
pb_date pb_date
st_datetime st_datetime
cb_cancel cb_cancel
cb_ok cb_ok
st_password st_password
st_login st_login
sle_password sle_password
sle_login_id sle_login_id
gb_1 gb_1
em_turnover_dt em_turnover_dt
end type
global w_validate_user_with_datetime w_validate_user_with_datetime

on w_validate_user_with_datetime.create
this.pb_date=create pb_date
this.st_datetime=create st_datetime
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_password=create st_password
this.st_login=create st_login
this.sle_password=create sle_password
this.sle_login_id=create sle_login_id
this.gb_1=create gb_1
this.em_turnover_dt=create em_turnover_dt
this.Control[]={this.pb_date,&
this.st_datetime,&
this.cb_cancel,&
this.cb_ok,&
this.st_password,&
this.st_login,&
this.sle_password,&
this.sle_login_id,&
this.gb_1,&
this.em_turnover_dt}
end on

on w_validate_user_with_datetime.destroy
destroy(this.pb_date)
destroy(this.st_datetime)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_password)
destroy(this.st_login)
destroy(this.sle_password)
destroy(this.sle_login_id)
destroy(this.gb_1)
destroy(this.em_turnover_dt)
end on

event open;string ls_Date, ls_Time, ls_Parm, ls_Login_Id
integer li_Return

ls_Parm = Message.StringParm
Message.StringParm = ''

This.Title = f_DW_Language_Call_2('User Validation')
cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_datetime.Text = f_LanguageString('DATE/TIME:', 'Date/Time:')
st_login.Text = f_LanguageString('LOGIN_ID:', 'Login ID:')
st_password.Text = f_LanguageString('PASSWORD:', 'Password:')

string ls_return
ls_return = Upper(f_ProfileString('NOMUS','PasswordCaseSensitive', guo_user_settings.uf_LanguageString('NO', 'No')))
IF ( ls_return = Upper(guo_user_settings.uf_LanguageString('YES', 'Yes')) ) THEN
	sle_password.textcase	= AnyCase!
ELSE
	sle_password.textcase	= Upper!
END IF

ls_Date = Left(ls_Parm, POS(ls_Parm, '|') - 1)
ls_Parm = Mid(ls_Parm, POS(ls_Parm, '|') + 1)
ls_Time = ls_Parm

datetime ldt_Temp
ldt_Temp = DateTime(Date(ls_Date), Time(ls_Time))

string ls_Temp
ls_Temp = String(ldt_Temp, Date_Format + ' hh:mm:ss')
li_Return = em_turnover_dt.SetMask(DatetimeMask!, LOWER(Date_Format) + ' hh:mm:ss')
em_turnover_dt.Text = ls_Temp

//em_turnover_dt.Text = ls_Date + ' ' + ls_Time

SELECT login_id INTO :ls_login_id FROM userlog WHERE user_id = :guo_user.ID ;

sle_login_id.text = Trim(ls_login_id)
sle_password.SetFocus()
end event

event close;//SetSIPPreferredState(Handle(sle_password), SipForceDown!)
//SetSIPPreferredState(Handle(sle_login_id), SipForceDown!)
//SetSIPPreferredState(Handle(em_turnover_dt), SipForceDown!)
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

type pb_date from picturebutton within w_validate_user_with_datetime
integer x = 814
integer y = 244
integer width = 183
integer height = 160
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "bitmaps\calendar.png"
alignment htextalign = left!
end type

event clicked;string ls_Date

OpenwithParm(w_calendar, MID(em_turnover_dt.Text, 1, LEN(Date_Format)))
ls_Date = Message.StringParm
Message.StringParm = ''
IF IsDate(ls_date) THEN
	em_turnover_dt.Text = String(Date(ls_Date), Date_Format) + ' ' + String(Now(), 'hh:mm:ss')
END IF

end event

type st_datetime from statictext within w_validate_user_with_datetime
integer x = 128
integer y = 224
integer width = 805
integer height = 80
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Date/Time:"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_validate_user_with_datetime
integer x = 539
integer y = 456
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

event clicked;CloseWithReturn(Parent, "||")
end event

type cb_ok from commandbutton within w_validate_user_with_datetime
integer x = 128
integer y = 456
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
string ls_datetime
string ls_date
string ls_time

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
	ls_DateTime = String(em_turnover_dt.Text)
	ls_Date = LEFT(ls_DateTime, POS(ls_DateTime, ' ') - 1)
	ls_Time = MID(ls_DateTime, POS(ls_DateTime, ' ') + 1)
	ls_User_Id = guo_user.ID
	CloseWithReturn(Parent, ls_User_Id + '|' + ls_Date + '|' + ls_Time)
ELSE
	sle_password.Text = ''
	sle_login_id.SetFocus()
	RETURN
END IF
end event

type st_password from statictext within w_validate_user_with_datetime
integer x = 55
integer y = 144
integer width = 457
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

type st_login from statictext within w_validate_user_with_datetime
integer x = 55
integer y = 48
integer width = 457
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

type sle_password from singlelineedit within w_validate_user_with_datetime
integer x = 530
integer y = 132
integer width = 457
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean autohscroll = false
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

type sle_login_id from singlelineedit within w_validate_user_with_datetime
integer x = 530
integer y = 48
integer width = 457
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

type gb_1 from groupbox within w_validate_user_with_datetime
integer width = 1061
integer height = 444
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
end type

type em_turnover_dt from editmask within w_validate_user_with_datetime
integer x = 128
integer y = 288
integer width = 681
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "[date] [time]"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "1980/01/01 00:00:00~~2050/12/12 23:59:59"
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

