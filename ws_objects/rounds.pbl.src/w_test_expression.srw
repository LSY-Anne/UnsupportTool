$PBExportHeader$w_test_expression.srw
forward
global type w_test_expression from window
end type
type cb_paste from commandbutton within w_test_expression
end type
type cb_close from commandbutton within w_test_expression
end type
type cb_ok from commandbutton within w_test_expression
end type
type st_title from statictext within w_test_expression
end type
type mle_expression from multilineedit within w_test_expression
end type
end forward

global type w_test_expression from window
string tag = "1280"
integer width = 1097
integer height = 1280
string menuname = "mnu_blank"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
boolean contexthelp = true
cb_paste cb_paste
cb_close cb_close
cb_ok cb_ok
st_title st_title
mle_expression mle_expression
end type
global w_test_expression w_test_expression

type variables

end variables

on w_test_expression.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.cb_paste=create cb_paste
this.cb_close=create cb_close
this.cb_ok=create cb_ok
this.st_title=create st_title
this.mle_expression=create mle_expression
this.Control[]={this.cb_paste,&
this.cb_close,&
this.cb_ok,&
this.st_title,&
this.mle_expression}
end on

on w_test_expression.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_paste)
destroy(this.cb_close)
destroy(this.cb_ok)
destroy(this.st_title)
destroy(this.mle_expression)
end on

event open;guo_window.Post uf_Resize(w_test_expression)
//guo_window.Post uf_Reposition(This)

string ls_Text

ls_Text = Message.StringParm
Message.StringPArm = ''

st_title.Text = f_LanguageString('TEST_EXPRESSION', 'Test Expression')
cb_paste.Text = f_LanguageString('PASTE', 'Paste')
cb_ok.Text = f_LanguageString('EVALUATE', 'Evaluate')
cb_close.Text = f_LanguageString('CLOSE', 'Close')

mle_expression.Text = ls_Text

This.Title = gs_Window_Title

end event

event close;gl_X = This.X
gl_Y = This.Y

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

event activate;This.X = gl_X
This.Y = gl_Y

end event

type cb_paste from commandbutton within w_test_expression
string tag = "960"
integer x = 27
integer y = 960
integer width = 293
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Paste"
end type

event clicked;mle_expression.Paste()
end event

type cb_close from commandbutton within w_test_expression
string tag = "960"
integer x = 777
integer y = 960
integer width = 293
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_test_expression
string tag = "960"
integer x = 398
integer y = 960
integer width = 293
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Evaluate"
end type

event clicked;string ls_Text
string ls_Selected_Text

ls_Text = mle_expression.Text
ls_Selected_Text = mle_expression.SelectedText()
IF NOT Empty(ls_Selected_Text) THEN
	MessageBox('Result', Compile_Test(ls_Selected_Text))
ELSE
	MessageBox('Result', Compile_Test(ls_Text))
END IF

end event

type st_title from statictext within w_test_expression
integer x = 18
integer width = 1061
integer height = 64
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Test Expression"
boolean focusrectangle = false
end type

type mle_expression from multilineedit within w_test_expression
string tag = "884"
integer x = 27
integer y = 64
integer width = 1042
integer height = 884
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
end type

event getfocus;
end event

event losefocus;
end event

