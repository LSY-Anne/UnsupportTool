$PBExportHeader$w_language.srw
forward
global type w_language from window
end type
type mle_1 from multilineedit within w_language
end type
type sle_1 from singlelineedit within w_language
end type
type cb_1 from commandbutton within w_language
end type
end forward

global type w_language from window
integer width = 1097
integer height = 1280
boolean titlebar = true
string title = "Untitled"
long backcolor = 16777215
string icon = "AppIcon!"
mle_1 mle_1
sle_1 sle_1
cb_1 cb_1
end type
global w_language w_language

on w_language.create
this.mle_1=create mle_1
this.sle_1=create sle_1
this.cb_1=create cb_1
this.Control[]={this.mle_1,&
this.sle_1,&
this.cb_1}
end on

on w_language.destroy
destroy(this.mle_1)
destroy(this.sle_1)
destroy(this.cb_1)
end on

event open;guo_window.Post uf_Resize(w_language)
//guo_window.Post uf_Reposition(This)
end event

event activate;This.X = gl_X
This.Y = gl_Y

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

event close;gl_X = This.X
gl_Y = This.Y

end event

type mle_1 from multilineedit within w_language
integer x = 73
integer y = 320
integer width = 951
integer height = 400
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
end type

type sle_1 from singlelineedit within w_language
integer x = 73
integer y = 112
integer width = 951
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type cb_1 from commandbutton within w_language
integer x = 347
integer y = 752
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Find"
end type

event clicked;string ls_Key
string ls_Value

ls_Key = sle_1.Text
ls_Value = f_LanguageString(ls_Key, ls_Key)
mle_1.Text = ls_Value
end event

