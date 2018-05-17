$PBExportHeader$w_calendar.srw
$PBExportComments$Appeon create to work around unsupported feature
forward
global type w_calendar from window
end type
type cb_ok from commandbutton within w_calendar
end type
type cb_cancel from commandbutton within w_calendar
end type
type mc_1 from monthcalendar within w_calendar
end type
end forward

global type w_calendar from window
integer width = 1184
integer height = 932
windowtype windowtype = response!
long backcolor = 32567268
string icon = "AppIcon!"
boolean center = true
cb_ok cb_ok
cb_cancel cb_cancel
mc_1 mc_1
end type
global w_calendar w_calendar

on w_calendar.create
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.mc_1=create mc_1
this.Control[]={this.cb_ok,&
this.cb_cancel,&
this.mc_1}
end on

on w_calendar.destroy
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.mc_1)
end on

event open;
string ls_date
date ld_date

ls_date = message.stringparm
ld_date = date(ls_date)
mc_1.SetSelectedDate (ld_date )
ls_date =string(ld_date)
end event

type cb_ok from commandbutton within w_calendar
string tag = "960"
integer x = 210
integer y = 780
integer width = 329
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
end type

event clicked;
string ls_date
date ld_date

mc_1.GetSelectedDate (ld_date )
ls_date =string(ld_date)

Closewithreturn(Parent, ls_date)
end event

type cb_cancel from commandbutton within w_calendar
string tag = "960"
integer x = 585
integer y = 780
integer width = 329
integer height = 112
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;
Close(Parent)
end event

type mc_1 from monthcalendar within w_calendar
integer x = 27
integer y = 36
integer width = 1120
integer height = 720
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaysection = true
boolean todaycircle = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

