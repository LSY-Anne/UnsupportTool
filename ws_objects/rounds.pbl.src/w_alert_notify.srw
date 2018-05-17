$PBExportHeader$w_alert_notify.srw
forward
global type w_alert_notify from window
end type
type p_1 from picture within w_alert_notify
end type
type st_reading from statictext within w_alert_notify
end type
type st_accept from statictext within w_alert_notify
end type
type mle_alert_description from multilineedit within w_alert_notify
end type
type mle_alert_text from multilineedit within w_alert_notify
end type
type cb_cancel from commandbutton within w_alert_notify
end type
type cb_ok from commandbutton within w_alert_notify
end type
end forward

global type w_alert_notify from window
integer width = 1019
integer height = 864
boolean titlebar = true
string title = "Alert!"
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
p_1 p_1
st_reading st_reading
st_accept st_accept
mle_alert_description mle_alert_description
mle_alert_text mle_alert_text
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_alert_notify w_alert_notify

type variables
integer			ii_Return
pointer			i_pointer
end variables

on w_alert_notify.create
this.p_1=create p_1
this.st_reading=create st_reading
this.st_accept=create st_accept
this.mle_alert_description=create mle_alert_description
this.mle_alert_text=create mle_alert_text
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.Control[]={this.p_1,&
this.st_reading,&
this.st_accept,&
this.mle_alert_description,&
this.mle_alert_text,&
this.cb_cancel,&
this.cb_ok}
end on

on w_alert_notify.destroy
destroy(this.p_1)
destroy(this.st_reading)
destroy(this.st_accept)
destroy(this.mle_alert_description)
destroy(this.mle_alert_text)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;long ll_Row
integer li_Alert
string ls_Parm
string ls_Reading
string ls_Alert_Text
string ls_Alert_Description
integer li_Tour
integer li_Rev_No
integer li_Station
string ls_Priority

ls_Parm = Message.StringParm
Message.StringParm = ''

i_pointer = SetPointer(Arrow!)

Beep(1)

li_Alert = Integer(MID(ls_Parm, 1, POS(ls_Parm, '|') - 1))
ls_Parm = MID(ls_Parm, POS(ls_Parm, '|') + 1)
ls_Reading = MID(ls_Parm, 1, POS(ls_Parm, '|') - 1)
ls_Parm = MID(ls_Parm, POS(ls_Parm, '|') + 1)
ls_Priority = ls_Parm

li_Tour		= gsu_tour_parameters[gi_Current_tour].Tour_Number
li_Rev_No	= gsu_tour_parameters[gi_Current_tour].Rev_No
li_Station	= gsu_tour_parameters[gi_Current_tour].Station

// 2012-05-01 The ISNULL() was causing both the description and text to be truncated to 19 characters - odd
//SELECT ISNULL(alert_description, ''), 
//       ISNULL(alert_text, '') 
SELECT alert_description, 
       alert_text 
  INTO :ls_Alert_Description, 
       :ls_Alert_Text 
  FROM alerts 
 WHERE ( tour = :li_Tour ) 
   AND ( rev_no = :li_Rev_No ) 
	AND ( sta = :li_Station ) 
	AND ( alert_id = :li_Alert ) ;

mle_alert_text.Text = ls_Alert_Text
mle_alert_description.Text = ls_Alert_Description

cb_cancel.Text = f_LanguageString('NO', 'No')
cb_ok.Text = f_LanguageString('YES', 'Yes')
st_reading.Text = f_LanguageString('RD', 'Rd') + ": " + ls_Reading
This.Title = f_LanguageString('ALERT!', 'Alert!')

IF ( ls_Priority = 'Info' ) THEN
	st_accept.Text = f_LanguageString('CALCULATED_READING', "Calculated Reading") + "."
	cb_cancel.Visible = FALSE
	p_1.Visible = FALSE
	cb_ok.X = This.Width / 2 - cb_ok.Width / 2
ELSE
	st_accept.Text = f_LanguageString('ACCEPT_THIS_READING?', 'Accept this reading?')
END IF
cb_ok.SetFocus()
end event

event close;IF IsValid(w_multi_reading) THEN
	w_multi_reading.ii_Alert_Notify = ii_Return
ELSE
	w_tour.ii_Alert_Notify = ii_Return
END IF
SetPointer(i_Pointer)

end event

event activate;This.X = gl_X + (w_main.Width - This.Width) / 2
This.Y = gl_Y + 104
f_Release_Buttons()


end event

type p_1 from picture within w_alert_notify
integer x = 18
integer y = 16
integer width = 128
integer height = 112
string picturename = "bitmaps\alert.bmp"
boolean focusrectangle = false
end type

type st_reading from statictext within w_alert_notify
integer x = 18
integer y = 496
integer width = 1061
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Rd: "
boolean focusrectangle = false
end type

type st_accept from statictext within w_alert_notify
integer x = 18
integer y = 432
integer width = 1061
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Accept this reading?"
boolean focusrectangle = false
end type

type mle_alert_description from multilineedit within w_alert_notify
integer x = 165
integer y = 16
integer width = 823
integer height = 128
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
boolean border = false
boolean vscrollbar = true
boolean displayonly = true
end type

type mle_alert_text from multilineedit within w_alert_notify
integer x = 165
integer y = 144
integer width = 823
integer height = 288
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean vscrollbar = true
boolean displayonly = true
end type

type cb_cancel from commandbutton within w_alert_notify
integer x = 567
integer y = 560
integer width = 274
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "No"
boolean cancel = true
end type

event clicked;ii_Return = 2
Close(Parent)
end event

type cb_ok from commandbutton within w_alert_notify
integer x = 165
integer y = 560
integer width = 274
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Yes"
boolean default = true
end type

event clicked;ii_Return = 1
Close(Parent)
end event

