$PBExportHeader$w_messages.srw
forward
global type w_messages from window
end type
type dw_messages from datawindow within w_messages
end type
type cb_2 from commandbutton within w_messages
end type
type cb_1 from commandbutton within w_messages
end type
type st_messages from statictext within w_messages
end type
end forward

global type w_messages from window
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
dw_messages dw_messages
cb_2 cb_2
cb_1 cb_1
st_messages st_messages
end type
global w_messages w_messages

type variables

end variables

forward prototypes
public subroutine wf_delete_messages ()
end prototypes

public subroutine wf_delete_messages ();string ls_Module_Id

ls_Module_Id = gs_Module_Id

DELETE FROM ml_sync_messages 
 WHERE ( module_id = :ls_Module_Id ) 
 USING SQLCA ;

COMMIT USING SQLCA ;
end subroutine

on w_messages.create
this.dw_messages=create dw_messages
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_messages=create st_messages
this.Control[]={this.dw_messages,&
this.cb_2,&
this.cb_1,&
this.st_messages}
end on

on w_messages.destroy
destroy(this.dw_messages)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_messages)
end on

event open;guo_window.Post uf_Resize(w_messages)
//guo_window.Post uf_Reposition(This)

integer li_Return
integer li_Num_Rows

This.Title = gs_Window_Title

dw_messages.Object.dt_t.Text = f_LanguageString('UPLOAD', 'Upload')
dw_messages.Object.id_t.Text = f_LanguageString('ID', 'ID')
dw_messages.Object.text_t.Text = f_LanguageString('MESSAGE', 'Message')

cb_1.Text = f_LanguageString('CANCEL', 'Cancel')
cb_2.Text = f_LanguageString('ACKNOWLEDGE', 'Acknowledge')
st_messages.Text = f_LanguageString('MESSAGES', 'Messages')

li_Return = dw_messages.SetTransObject(SQLCA)
li_Num_Rows = dw_messages.Retrieve(gs_Module_Id)

end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event activate;This.X = gl_X
This.Y = gl_Y
f_Release_Buttons()


end event

event close;gl_X = This.X
gl_Y = This.Y

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type dw_messages from datawindow within w_messages
integer x = 18
integer y = 80
integer width = 1061
integer height = 976
integer taborder = 20
string title = "none"
string dataobject = "d_messages"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type cb_2 from commandbutton within w_messages
integer x = 183
integer y = 1072
integer width = 430
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Acknowledge"
boolean default = true
end type

event clicked;wf_Delete_Messages()
Close(Parent)
end event

type cb_1 from commandbutton within w_messages
integer x = 658
integer y = 1072
integer width = 274
integer height = 80
integer taborder = 30
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

type st_messages from statictext within w_messages
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
string text = "Messages"
boolean focusrectangle = false
end type

