$PBExportHeader$w_rfid.srw
forward
global type w_rfid from window
end type
type dw_rfid from datawindow within w_rfid
end type
type cb_ok from commandbutton within w_rfid
end type
type cb_cancel from commandbutton within w_rfid
end type
type st_rfid from statictext within w_rfid
end type
end forward

global type w_rfid from window
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
dw_rfid dw_rfid
cb_ok cb_ok
cb_cancel cb_cancel
st_rfid st_rfid
end type
global w_rfid w_rfid

type variables

end variables

on w_rfid.create
this.dw_rfid=create dw_rfid
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_rfid=create st_rfid
this.Control[]={this.dw_rfid,&
this.cb_ok,&
this.cb_cancel,&
this.st_rfid}
end on

on w_rfid.destroy
destroy(this.dw_rfid)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_rfid)
end on

event open;guo_window.Post uf_Resize(w_rfid)
//guo_window.Post uf_Reposition(This)

integer li_Return
integer li_Num_Rows

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_rfid.Text = f_LanguageString('RFID_TAGS_SCANNED', 'RFID Tags Scanned')

li_Return = dw_rfid.SetTransObject(SQLCA)
li_Num_Rows = dw_rfid.Retrieve()
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

type dw_rfid from datawindow within w_rfid
integer x = 18
integer y = 80
integer width = 1061
integer height = 976
integer taborder = 20
string title = "none"
string dataobject = "d_rfid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event rowfocuschanged;long ll_Num_Rows
long ll_Row
integer li_Error
string ls_Error
string ls_Preference_List_Temp
string ls_Preference_List
integer li_Preference_Type
datawindowchild ldwc_value

ll_Num_Rows = 0
IF ( This.GetRow() > 0 ) THEN
	li_Error = This.GetChild('value_id', ldwc_value)
	IF ( li_Error = 1 ) THEN
		li_Error = ldwc_value.Reset()
		ls_Preference_List = This.Object.preference_list[CurrentRow]
		li_Preference_Type = 0//This.Object.preference_type[CurrentRow]
//		IF NOT Empty(ls_Preference_List) THEN
//			IF ( li_Preference_Type = 0 ) THEN // text, no editing, pick from list
				DO WHILE NOT Empty(ls_Preference_List)
					IF ( POS(ls_Preference_List, '|') > 0 ) THEN
						ls_Preference_List_Temp = LEFT(ls_Preference_List, POS(ls_Preference_List, '|') - 1)
						ls_Preference_List = MID(ls_Preference_List, POS(ls_Preference_List, '|') + 1)
						ll_Row = ldwc_value.InsertRow(0)
						li_Error = ldwc_value.SetItem(ll_Row, 'value_id', ls_Preference_List_Temp)
					ELSE
						ll_Row = ldwc_value.InsertRow(0)
						li_Error = ldwc_value.SetItem(ll_Row, 'value_id', ls_Preference_List)
						ls_Preference_List = ''
					END IF
					ll_Num_Rows ++
				LOOP
				This.Object.value_id.dddw.AllowEdit = 'No'
				IF ( ll_Num_Rows > 5 ) THEN
					ll_Num_Rows = 5
				END IF
				ls_Error = This.Modify("value_id.dddw.Lines = " + String(ll_Num_Rows))
//			ELSEIF ( li_Preference_Type = 6 ) THEN // validate characters entered against preference_list
//				This.Object.value_id.dddw.AllowEdit = 'Yes'
//			ELSEIF ( li_Preference_Type = 7 ) THEN // validate characters entered against preference_list
//				This.Object.value_id.dddw.AllowEdit = 'Yes'
//			END IF
//		ELSE
//			IF ( li_Preference_Type = 1 ) THEN // color picker, no editing
//				This.Object.value_id.dddw.AllowEdit = 'No'
//			ELSEIF ( li_Preference_Type = 2 ) THEN // file browser, allow editing - to allow UNC folders
//				This.Object.value_id.dddw.AllowEdit = 'Yes'
//			ELSEIF ( li_Preference_Type = 4 ) THEN // text, allow editing
//				This.Object.value_id.dddw.AllowEdit = 'Yes'
//			ELSEIF ( li_Preference_Type = 5 ) THEN // folder browser, allow editing - to allow UNC folders
//				This.Object.value_id.dddw.AllowEdit = 'Yes'
//			ELSEIF ( li_Preference_Type = 8 ) THEN // only allow numbers
//				This.Object.value_id.dddw.AllowEdit = 'Yes'
//			END IF
//		END IF
	END IF
END IF


end event

event clicked;This.SelectRow(0, FALSE)
This.SelectRow(row, TRUE)
end event

type cb_ok from commandbutton within w_rfid
integer x = 201
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
string text = "Ok"
boolean default = true
end type

event clicked;Close(Parent)
end event

type cb_cancel from commandbutton within w_rfid
integer x = 567
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

type st_rfid from statictext within w_rfid
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
string text = "RFID Tags Scanned"
boolean focusrectangle = false
end type

