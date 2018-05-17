$PBExportHeader$w_delete_tour.srw
forward
global type w_delete_tour from window
end type
type dw_tour from datawindow within w_delete_tour
end type
type cb_cancel from commandbutton within w_delete_tour
end type
type cb_ok from commandbutton within w_delete_tour
end type
type st_label from statictext within w_delete_tour
end type
end forward

global type w_delete_tour from window
string tag = "1280"
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
boolean contexthelp = true
dw_tour dw_tour
cb_cancel cb_cancel
cb_ok cb_ok
st_label st_label
end type
global w_delete_tour w_delete_tour

on w_delete_tour.create
this.dw_tour=create dw_tour
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_label=create st_label
this.Control[]={this.dw_tour,&
this.cb_cancel,&
this.cb_ok,&
this.st_label}
end on

on w_delete_tour.destroy
destroy(this.dw_tour)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_label)
end on

event open;guo_window.Post uf_Resize(w_delete_tour)
//guo_window.Post uf_Reposition(This)

long ll_Num_Rows
integer li_Return

This.Title = gs_Window_Title

dw_tour.Object.rev_no_t.Text = f_LanguageString('REV', 'Rev')
dw_tour.Object.tour_group_name_t.Text = f_LanguageString('TOUR_GROUP', 'Tour Group')
dw_tour.Object.tour_name_t.Text = f_LanguageString('TOUR', 'Tour')

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_label.Text = f_LanguageString('DELETE_A_TOUR', 'Delete a Tour')

li_Return = dw_tour.SetTransObject(SQLCA)
ll_Num_Rows = dw_tour.Retrieve(guo_user.ID)
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

type dw_tour from datawindow within w_delete_tour
integer x = 27
integer y = 64
integer width = 1042
integer height = 992
integer taborder = 30
string title = "none"
string dataobject = "d_delete_tours"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event rbuttondown;string ls_Message
integer li_Tour
integer li_Rev_No

IF ( dwo.Name = 'tour_name' ) THEN
	li_Tour = This.Object.tour[row]
	li_Rev_No = This.Object.rev_no[row]
	ls_Message = 'Tour Detail|' + String(li_Tour) + '|' + String(li_Rev_No)
	OpenWithParm(w_detail, ls_Message)
END IF
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
string ls_Message
integer li_Tour
integer li_Rev_No

IF ( dwo.Name = 'tour_name' ) THEN
	li_Tour = This.Object.tour[row]
	li_Rev_No = This.Object.rev_no[row]
	ls_Message = 'Tour Detail|' + String(li_Tour) + '|' + String(li_Rev_No)
	OpenWithParm(w_detail, ls_Message)
END IF
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type cb_cancel from commandbutton within w_delete_tour
integer x = 567
integer y = 1072
integer width = 274
integer height = 80
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;w_main.Visible = TRUE
CLOSE(w_delete_tour)
end event

type cb_ok from commandbutton within w_delete_tour
integer x = 201
integer y = 1072
integer width = 274
integer height = 80
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;string ls_Sql
integer li_Count
integer li_Tour
//integer li_Rev_No
integer li_Return
pointer l_pointer

li_Return = MessageBox(f_LanguageString('WARNING_-_DELETING_ITEMS', 'Warning - Deleting Items'), f_LanguageString('ARE_YOU_SURE_YOU_WANT_TO_DELETE_THE_SELECTED_ITEM(S)?', 'Are you sure you want to delete the selected item(s)?'), Question!, YesNo!)
IF ( li_Return = 1 ) THEN
	l_pointer = SetPointer(HourGlass!)
	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
						
	FOR li_Count = 1 TO dw_tour.RowCount()
		IF ( dw_tour.Object.selected[li_Count] = 1 ) THEN
			li_Tour = dw_tour.Object.tour[li_Count]
//			li_Rev_No = dw_tour.Object.rev_no[li_Count]
			
			DELETE 
			  FROM user_levels 
			 WHERE ( appl = 'OR' + REPEAT('0', 3 - LENGTH(:li_tour)) + STRING(:li_tour) ) ;

			DELETE 
			  FROM tour 
			 WHERE ( tour = :li_Tour ) ;
//				AND ( rev_no = :li_Rev_No ) ;
			
			IF ( SQLCA.SQLCode > 0 ) THEN
				MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THERE_WAS_AN_ERROR_ATTEMPTING_TO_DELETE_A_TOUR.', 'There was an error attempting to delete a tour.'))
				ROLLBACK ;

				ls_Sql = 'START SYNCHRONIZATION DELETE'
				EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

				SetPointer(l_pointer)
				Close(w_delete_tour)
			END IF
		END IF
	NEXT
	
	ls_Sql = 'call esoms.Delete_Equipment()'
	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
	
	COMMIT ;
	
	ls_Sql = 'START SYNCHRONIZATION DELETE'
	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	guo_user.Init(guo_user.ID)
	
	SetPointer(l_pointer)
	Close(w_delete_tour)
END IF
end event

type st_label from statictext within w_delete_tour
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
string text = "Delete a Tour"
boolean focusrectangle = false
end type

