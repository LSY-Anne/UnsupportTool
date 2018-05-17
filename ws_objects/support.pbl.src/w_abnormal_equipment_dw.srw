$PBExportHeader$w_abnormal_equipment_dw.srw
forward
global type w_abnormal_equipment_dw from window
end type
type cb_ok from commandbutton within w_abnormal_equipment_dw
end type
type st_title from statictext within w_abnormal_equipment_dw
end type
type dw_abnormal_equipment from datawindow within w_abnormal_equipment_dw
end type
end forward

global type w_abnormal_equipment_dw from window
integer width = 1097
integer height = 1280
string menuname = "mnu_blank"
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
event post_open ( )
cb_ok cb_ok
st_title st_title
dw_abnormal_equipment dw_abnormal_equipment
end type
global w_abnormal_equipment_dw w_abnormal_equipment_dw

type variables
long			il_Multi_Row
long			il_Multi_Reading_Allowed
end variables

event post_open();guo_module_specific.f_Display_Module_Window(FALSE)
end event

on w_abnormal_equipment_dw.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.cb_ok=create cb_ok
this.st_title=create st_title
this.dw_abnormal_equipment=create dw_abnormal_equipment
this.Control[]={this.cb_ok,&
this.st_title,&
this.dw_abnormal_equipment}
end on

on w_abnormal_equipment_dw.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_ok)
destroy(this.st_title)
destroy(this.dw_abnormal_equipment)
end on

event open;guo_window.Post uf_Resize(w_abnormal_equipment_dw)
//guo_window.Post uf_Reposition(This)

This.Title = gs_Window_Title

dw_abnormal_equipment.Object.cdt_t.Text = f_LanguageString('DATE/TIME', 'Date/Time')
dw_abnormal_equipment.Object.compute_config_t.Text = f_LanguageString('CONFIG', 'Config')
dw_abnormal_equipment.Object.compute_equip_operator_id_t.Text = f_LanguageString('EQUIPMENT', 'Equipment')
dw_abnormal_equipment.Object.compute_notes_t.Text = f_LanguageString('NOTES', 'Notes')
dw_abnormal_equipment.Object.oos_t.Text = f_LanguageString('OOS', 'OOS')

cb_ok.Text = f_LanguageString('OK', 'Ok')
st_title.Text = f_LanguageString('ABNORMAL_EQUIPMENT', 'Abnormal Equipment')

dw_abnormal_equipment.EVENT ue_Retrieve()
This.PostEvent('Post_Open')
end event

event close;gl_X = This.X
gl_Y = This.Y

guo_module_specific.f_Open_Module_Window_Lite()
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

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type cb_ok from commandbutton within w_abnormal_equipment_dw
integer x = 416
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

event clicked;Close(Parent)
end event

type st_title from statictext within w_abnormal_equipment_dw
integer x = 18
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Abnormal Equipment"
boolean focusrectangle = false
end type

type dw_abnormal_equipment from datawindow within w_abnormal_equipment_dw
event pause ( )
event ue_retrieve ( )
event ue_delete_multi ( )
event ue_popup_menu ( )
event ue_add_multi ( )
event ue_sort_dw ( string ls_search,  integer li_column,  string as_current_order )
string tag = "804"
integer x = 27
integer y = 64
integer width = 1042
integer height = 880
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_abnormal_equipment"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event pause();Sleep(1)
end event

event ue_retrieve();long ll_Num_Rows
long ll_Count

This.SetRedraw(FALSE)
This.Enabled = TRUE
This.SetTransObject(SQLCA)
ll_Num_Rows = This.Retrieve()
IF ( ll_Num_Rows < 9 ) THEN
	FOR ll_Count = ll_Num_Rows TO 9
		This.InsertRow(0)
	NEXT
ELSE
	This.InsertRow(0)
END IF
This.SetRedraw(TRUE)

end event

event ue_delete_multi();long ll_Row
integer li_Return

ll_Row = This.GetRow()
li_Return = This.DeleteRow(ll_Row)
IF ( li_Return = 1 ) THEN
	li_Return = This.Update()
	IF ( li_Return = 1 ) THEN
		COMMIT ;
	ELSE
		ROLLBACK ;
		MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_ABNORMAL_EQUIPMENT_WAS_UNABLE_TO_BE_DELETED', 'The abnormal equipment was unable to be deleted'))
	END IF
ELSE
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_ABNORMAL_EQUIPMENT_WAS_UNABLE_TO_BE_DELETED', 'The abnormal equipment was unable to be deleted'))
END IF

This.EVENT ue_Retrieve()
end event

event ue_popup_menu();mnu_abnormal_equipment popmenu

popmenu = CREATE mnu_abnormal_equipment

popmenu.m_edit.Text = f_LanguageString('EDIT', "Edit")
popmenu.m_copy.Text = f_LanguageString('COPY', "Copy")
popmenu.m_delete.Text = f_LanguageString('DELETE', "Delete")

popmenu.PopMenu(Parent.PointerX(), Parent.PointerY())

DESTROY popmenu
end event

event ue_add_multi();/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//Appeon add
w_abnormal_equipment_dw.Visible = FALSE
/////////////////////////////////////////////////// Appeon End   ///////////////////////////////////////////////////

OpenWithParm(w_abnormal_equipment, 'NEW')

end event

event ue_sort_dw(string ls_search, integer li_column, string as_current_order);string ls_Current_Sort
string ls_Current_Order
string ls_Header_Text[]
string ls_Column_Name[]
string ls_New_Order
string ls_Order_Direction
string ls_New_Sort
string ls_Header_Column_Text
integer li_Count
integer li_Row
string ls_Error
string ls_Find
integer li_Return

ls_New_Order = ' A'
ls_Order_Direction = "ˆ"

ls_Header_Text[1] = ""
ls_Header_Text[2] = "Equipment"
ls_Header_Text[3] = "Config"
ls_Header_Text[4] = "OOS"
ls_Header_Text[5] = "Notes"
ls_Header_Text[6] = "Date/Time"
	
ls_Column_Name[1] = "row_t"
ls_Column_Name[2] = "compute_equip_operator_id_t"
ls_Column_Name[3] = "compute_config_t"
ls_Column_Name[4] = "oos_t"
ls_Column_Name[5] = "compute_notes_t"
ls_Column_Name[6] = "cdt_t"
	
// Check if previously sorted
ls_Current_Sort = This.Object.Datawindow.Table.Sort
IF ( POS(ls_Current_Sort, ls_Search) > 0 ) THEN
	// Get current ascending  or descending order
	IF Empty(ls_Current_Order) THEN
		ls_Current_Order = MID(ls_Current_Sort, POS(ls_Current_Sort, ls_Search) + LEN(ls_Search) + 1, 1)
	ELSE
		ls_Current_Order = "D"
	END IF
	IF ( ls_Current_Order = 'A' ) THEN
		ls_New_Order = ' D'
		ls_Order_Direction = "ˇ"
	ELSE
		ls_New_Order = ' A'
		ls_Order_Direction = "ˆ"
	END IF
END IF
ls_New_Sort = ls_Search + ls_New_Order
FOR li_Count = 1 TO 6
	ls_Header_Column_Text = ls_Column_Name[li_Count] + ".Text='" + ls_Header_Text[li_Count]
	IF ( li_Count = li_Column ) THEN
		ls_Header_Column_Text = ls_Header_Column_Text + " " + ls_Order_Direction
	END IF
	ls_Error = This.Modify(ls_Header_Column_Text + "'")
NEXT
datetime ldt_Temp
ldt_Temp = This.Object.cdt[This.GetRow()]
li_Return = This.SetSort(ls_New_Sort)
li_Return = This.Sort()
This.EVENT ue_Retrieve()
// RPR - Do not localize this since it's merely a filter on the DW
ls_Find = " String(cdt, 'mm/dd/yyyy hh:mm:ss') = '" + String(ldt_Temp, 'mm/dd/yyyy hh:mm:ss') + "'"
li_Row = This.Find(ls_Find, 1, This.RowCount() + 1)
IF ( li_Row > 0 ) THEN
	This.SetRow(li_Row)
	This.ScrollToRow(li_Row)
	This.SelectRow(0, FALSE)
	this.SelectRow(li_Row, TRUE)
ELSE
	This.SetRow(1)
	This.ScrollToRow(1)
	This.SelectRow(0, FALSE)
	this.SelectRow(1, TRUE)
END IF

end event

event rbuttondown;string ls_Equip_Operator_Id
string ls_Sub_Sort
string ls_Search
string ls_Column
integer li_Column

integer li_X
integer li_Column_Left
integer li_Column_Right
integer li_Scroll_Position

ls_Column = dwo.Name
IF ( Upper(Right(ls_Column, 2)) = '_T' ) THEN
	li_Scroll_Position = Integer(This.Object.DataWindow.HorizontalScrollPosition)
//	li_X = li_Scroll_Position + UnitsToPixels(This.PointerX(), XUnitsToPixels!)
	li_X = li_Scroll_Position + PixelsToUnits(xpos, XPixelsToUnits!)
	li_Column_Left = Integer(dwo.X)
	li_Column_Right = li_Column_Left + Integer(dwo.Width)
	IF ( li_X > li_Column_Left + 7 ) AND ( li_X < li_Column_Right - 7 ) THEN
	//	In between
	ELSE
	//	On the mark
		RETURN
	END IF
END IF
CHOOSE CASE ls_Column
	CASE 'datawindow'
	CASE ELSE
		IF ( row > 0 ) THEN
			IF ( dwo.Name = 'notes' ) THEN
				OpenWithParm(w_detail, 'Note Detail|' + String(This.Object.notes[row]))
//				MessageBox('Note', String(This.Object.notes[row]))
			ELSE
				This.SetRow(row)
				ls_Equip_Operator_Id = This.Object.equip_operator_id[row]
				IF NOT Empty(ls_Equip_Operator_Id) THEN
					il_Multi_Row = This.GetRow()
					This.PostEvent('ue_Popup_Menu')
				ELSE
					This.PostEvent('ue_Add_Multi')
				END IF
			END IF
		ELSE
			CHOOSE CASE ls_Column
				CASE 'compute_equip_operator_id_t'
					ls_Search = "equip_operator_id"
					li_Column = 2
				CASE 'compute_config_t'
					ls_Search = "config"
					li_Column = 3
				CASE 'oos_t'
					ls_Search = "oos"
					li_Column = 4
				CASE 'compute_notes_t'
					ls_Search = "notes"
					li_Column = 5
				CASE 'cdt_t'
					ls_Search = "cdt"
					li_Column = 6
			END CHOOSE
			
			IF NOT Empty(ls_Search) THEN
				This.EVENT ue_Sort_DW(ls_Search, li_Column, '')
			END IF
		END IF
END CHOOSE
end event

event rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
string ls_Equip_Operator_Id
string ls_Sub_Sort
string ls_Search
string ls_Column
integer li_Column

integer li_X
integer li_Column_Left
integer li_Column_Right
integer li_Scroll_Position

ls_Column = dwo.Name
IF ( Upper(Right(ls_Column, 2)) = '_T' ) THEN
	li_Scroll_Position = Integer(This.Object.DataWindow.HorizontalScrollPosition)
//	li_X = li_Scroll_Position + UnitsToPixels(This.PointerX(), XUnitsToPixels!)
	li_X = li_Scroll_Position + PixelsToUnits(xpos, XPixelsToUnits!)
	li_Column_Left = Integer(dwo.X)
	li_Column_Right = li_Column_Left + Integer(dwo.Width)
	IF ( li_X > li_Column_Left + 7 ) AND ( li_X < li_Column_Right - 7 ) THEN
	//	In between
	ELSE
	//	On the mark
		RETURN
	END IF
END IF
CHOOSE CASE ls_Column
	CASE 'datawindow'
	CASE ELSE
		IF ( row > 0 ) THEN
			IF ( dwo.Name = 'notes' ) THEN
				OpenWithParm(w_detail, 'Note Detail|' + String(This.Object.notes[row]))
//				MessageBox('Note', String(This.Object.notes[row]))
			ELSE
				This.SetRow(row)
				ls_Equip_Operator_Id = This.Object.equip_operator_id[row]
				IF NOT Empty(ls_Equip_Operator_Id) THEN
					il_Multi_Row = This.GetRow()
					This.PostEvent('ue_Popup_Menu')
				ELSE
					This.PostEvent('ue_Add_Multi')
				END IF
			END IF
		ELSE
			CHOOSE CASE ls_Column
				CASE 'compute_equip_operator_id_t'
					ls_Search = "equip_operator_id"
					li_Column = 2
				CASE 'compute_config_t'
					ls_Search = "config"
					li_Column = 3
				CASE 'oos_t'
					ls_Search = "oos"
					li_Column = 4
				CASE 'compute_notes_t'
					ls_Search = "notes"
					li_Column = 5
				CASE 'cdt_t'
					ls_Search = "cdt"
					li_Column = 6
			END CHOOSE
			
			IF NOT Empty(ls_Search) THEN
				This.EVENT ue_Sort_DW(ls_Search, li_Column, '')
			END IF
		END IF
END CHOOSE
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

