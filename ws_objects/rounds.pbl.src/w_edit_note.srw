$PBExportHeader$w_edit_note.srw
forward
global type w_edit_note from window
end type
type cb_ok from commandbutton within w_edit_note
end type
type st_note from statictext within w_edit_note
end type
type cb_cancel from commandbutton within w_edit_note
end type
type mle_note_edit from multilineedit within w_edit_note
end type
end forward

global type w_edit_note from window
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
event post_open ( )
cb_ok cb_ok
st_note st_note
cb_cancel cb_cancel
mle_note_edit mle_note_edit
end type
global w_edit_note w_edit_note

type variables
string	is_Window_Source
string	is_Replacement_Character_Left
string	is_Replacement_Character_Right
long		ll_Left_Char
long		ll_Right_Char
end variables

event post_open();//r_1.Height = Integer(r_1.Tag)
mle_note_edit.Height = Integer(mle_note_edit.Tag)
cb_ok.Y = mle_note_edit.Y + mle_note_edit.Height + 12
mle_note_edit.SetFocus()
cb_cancel.Y = cb_ok.Y
end event

on w_edit_note.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.cb_ok=create cb_ok
this.st_note=create st_note
this.cb_cancel=create cb_cancel
this.mle_note_edit=create mle_note_edit
this.Control[]={this.cb_ok,&
this.st_note,&
this.cb_cancel,&
this.mle_note_edit}
end on

on w_edit_note.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_ok)
destroy(this.st_note)
destroy(this.cb_cancel)
destroy(this.mle_note_edit)
end on

event open;guo_window.Post uf_Resize(w_edit_note)
//guo_window.Post uf_Reposition(This)

string ls_Note

ls_Note = Message.StringParm
Message.StringParm = ''
mle_note_edit.Text = ls_Note

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_note.Text = f_LanguageString('NOTE', 'Note')

This.Post Event Post_Open()

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

type cb_ok from commandbutton within w_edit_note
string tag = "960"
integer x = 270
integer y = 960
integer width = 274
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;string ls_Note

ls_Note = mle_note_edit.Text
w_tour.tab_tour.tabpage_notes.mle_note_1.Text = ls_Note
w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Note()

Close(Parent)
end event

type st_note from statictext within w_edit_note
integer x = 18
integer width = 1042
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
string text = "Note"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_edit_note
string tag = "960"
integer x = 581
integer y = 960
integer width = 274
integer height = 80
integer taborder = 40
boolean bringtotop = true
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

type mle_note_edit from multilineedit within w_edit_note
string tag = "884"
integer x = 27
integer y = 64
integer width = 1042
integer height = 896
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 250
boolean ignoredefaultbutton = true
end type

