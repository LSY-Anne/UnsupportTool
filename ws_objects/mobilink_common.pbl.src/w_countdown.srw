$PBExportHeader$w_countdown.srw
forward
global type w_countdown from window
end type
type st_countdown from statictext within w_countdown
end type
type mle_countdown from multilineedit within w_countdown
end type
end forward

global type w_countdown from window
integer width = 823
integer height = 488
windowtype windowtype = response!
long backcolor = 65535
string icon = "AppIcon!"
boolean center = true
event ue_count_down ( integer li_seconds )
st_countdown st_countdown
mle_countdown mle_countdown
end type
global w_countdown w_countdown

event ue_count_down(integer li_seconds);integer li_Count
FOR li_Count = li_Seconds TO 1 STEP -1
	st_countdown.Text = String(li_Count) + ' ...'
	Sleep(1)
NEXT
Close(This)
end event

event open;integer li_Seconds

mle_countdown.Text = f_LanguageString('DATA_IS_IN_USE', 'Some data is in use, please wait while the download is attempted again.')

li_Seconds = Message.DoubleParm
This.Post EVENT ue_Count_Down(li_Seconds)
end event

on w_countdown.create
this.st_countdown=create st_countdown
this.mle_countdown=create mle_countdown
this.Control[]={this.st_countdown,&
this.mle_countdown}
end on

on w_countdown.destroy
destroy(this.st_countdown)
destroy(this.mle_countdown)
end on

type st_countdown from statictext within w_countdown
integer x = 18
integer y = 320
integer width = 768
integer height = 112
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_countdown from multilineedit within w_countdown
integer x = 18
integer y = 16
integer width = 768
integer height = 272
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
string text = "Some data is in use, please wait while the download is attempted again."
alignment alignment = center!
boolean displayonly = true
end type

