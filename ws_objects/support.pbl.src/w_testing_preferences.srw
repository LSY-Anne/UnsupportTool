$PBExportHeader$w_testing_preferences.srw
forward
global type w_testing_preferences from window
end type
type ddlb_1 from dropdownlistbox within w_testing_preferences
end type
type st_module from statictext within w_testing_preferences
end type
type st_preferences from statictext within w_testing_preferences
end type
type cb_cancel from commandbutton within w_testing_preferences
end type
type dw_preferences from datawindow within w_testing_preferences
end type
type cb_ok from commandbutton within w_testing_preferences
end type
type st_title from statictext within w_testing_preferences
end type
end forward

global type w_testing_preferences from window
string tag = "1280"
integer width = 1097
integer height = 1280
string menuname = "mnu_blank"
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
ddlb_1 ddlb_1
st_module st_module
st_preferences st_preferences
cb_cancel cb_cancel
dw_preferences dw_preferences
cb_ok cb_ok
st_title st_title
end type
global w_testing_preferences w_testing_preferences

type variables

end variables

forward prototypes
public subroutine wf_reset_all_preferences_to_default ()
public subroutine wf_reset_current_preference_to_default ()
end prototypes

public subroutine wf_reset_all_preferences_to_default ();string ls_Default
long ll_Row
long ll_Num_Rows

ll_Num_Rows = dw_preferences.RowCount()
FOR ll_Row = 1 TO ll_Num_Rows
	ls_Default = dw_preferences.Object.default_value[ll_Row]
	dw_preferences.Object.value_id[ll_Row] = ls_Default
	dw_preferences.SetItem(ll_Row, 'value_id', ls_Default)
NEXT

end subroutine

public subroutine wf_reset_current_preference_to_default ();string ls_Default
long ll_Row

ll_Row = dw_preferences.GetRow()
IF ( ll_Row > 0 ) THEN
	ls_Default = dw_preferences.Object.default_value[ll_Row]
	dw_preferences.Object.value_id[ll_Row] = ls_Default
	dw_preferences.SetItem(ll_Row, 'value_id', ls_Default)
END IF

end subroutine

on w_testing_preferences.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.ddlb_1=create ddlb_1
this.st_module=create st_module
this.st_preferences=create st_preferences
this.cb_cancel=create cb_cancel
this.dw_preferences=create dw_preferences
this.cb_ok=create cb_ok
this.st_title=create st_title
this.Control[]={this.ddlb_1,&
this.st_module,&
this.st_preferences,&
this.cb_cancel,&
this.dw_preferences,&
this.cb_ok,&
this.st_title}
end on

on w_testing_preferences.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.ddlb_1)
destroy(this.st_module)
destroy(this.st_preferences)
destroy(this.cb_cancel)
destroy(this.dw_preferences)
destroy(this.cb_ok)
destroy(this.st_title)
end on

event open;guo_window.Post uf_Resize(w_testing_preferences)
//guo_window.Post uf_Reposition(This)

This.Title = gs_Window_Title
dw_preferences.Reset()
gb_Testing_Preferences_Opened = TRUE

end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event close;gb_Testing_Preferences_Opened = FALSE
end event

event activate;f_Release_Buttons()


end event

type ddlb_1 from dropdownlistbox within w_testing_preferences
integer x = 18
integer y = 128
integer width = 1042
integer height = 832
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean sorted = false
string item[] = {"NEDBS","NLOGS","NPTS","NCCS","NCS"}
end type

event selectionchanged;string ls_Module_Id

ls_Module_Id = This.Text(index)
dw_preferences.EVENT ue_Retrieve(ls_Module_Id)
end event

type st_module from statictext within w_testing_preferences
integer x = 18
integer y = 64
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Module:"
boolean focusrectangle = false
end type

type st_preferences from statictext within w_testing_preferences
integer x = 18
integer y = 232
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Preferences:"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_testing_preferences
integer x = 599
integer y = 1072
integer width = 274
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type dw_preferences from datawindow within w_testing_preferences
event ue_retrieve ( string as_module_id )
event ue_sort_dw ( string ls_search,  integer li_column,  string as_current_order )
event type integer save ( )
string tag = "884"
integer x = 18
integer y = 304
integer width = 1042
integer height = 752
integer taborder = 10
string title = "none"
string dataobject = "d_testing_preferences"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event ue_retrieve(string as_module_id);integer li_Return
long ll_Num_Rows
string ls_Error
string ls_Sql
string ls_Preference_List

This.EVENT Save()

CHOOSE CASE as_Module_Id
	CASE 'NLOGS'
		ls_Preference_List = " ( &
			'Approved_Log_Background->Color', &
			'Turned_Over_Log_Background->Color', &
			'Active_Log_Background->Color', &
			'Active_And_Current_Log_Background->Color', &
			'AutomaticLogEntry', &
			'ShiftRosterTabText', &
			'PlantParamsTabText', &
			'LogAllowTextEdit', &
			'LogAllowDeletes', &
			'AllowModifyingFontBeforeStatus', &
			'Authentication', &
			'DisplayTurnoverEventsNLOGS01', &
			'DisplayTurnoverEventsNLOGS02', &
			'DisplayTurnoverEventsNLOGS03', &
			'Replacement_Parameter_Left', &
			'Replacement_Parameter_Right', &
			'Annotations_Text->Color', &
			'Open_Items_Text->Color', &
			'Maintenance_Rule_Text->Color', &
			'Standing_Order_Text->Color', &
			'Annotations_Text->Color', &
			'Open_Items_Text->Color', &
			'Maintenance_Rule_Text->Color', &
			'Standing_Order_Text->Color', &
			'Annotations_Text->Color', &
			'Open_Items_Text->Color', &
			'Maintenance_Rule_Text->Color', &
			'Standing_Order_Text->Color', &
			'Copy_Equipment', &
			'Copy_Documents', &
			'WhiteHandRelogin', &
			'GreenHandRelogin' ) "
	CASE 'NEDBS'
		ls_Preference_List = " ( &
			'EquipmentOperatorIDMask', &
			'EquipmentOperatorID', &
			'EquipmentDescription', &
			'EquipmentLocation', &
			'Unit', &
			'Plant', &
			'System', &
			'Type', &
			'Component', &
			'Building', &
			'FreeformID', &
			'AlternateID', &
			'Room', &
			'FreeformLocation', &
			'Elevation', &
			'Train', &
			'Column', &
			'UnitLocation', &
			'Fuse', &
			'TagSize', &
			'VerificationRequirements', &
			'Configuration', &
			'TaggedConfiguration', &
			'NormalConfiguration', &
			'EquipmentAttribute01', &
			'EquipmentAttribute02', &
			'EquipmentAttribute03', &
			'EquipmentAttribute04', &
			'EquipmentAttribute05', &
			'EquipmentAttribute06', &
			'EquipmentAttribute07', &
			'EquipmentAttribute08', &
			'EquipmentAttribute09', &
			'EquipmentAttribute10', &
			'AppendixR', &
			'ContainmentPenetration', &
			'MaintenanceRule', &
			'VerificationRequirementsRestore' ) "
CASE 'NPTS'
		ls_Preference_List = " ( &
			'TourClosePromptForTourDelete', &
			'StationLabel', &
			'SCANNING_SUFFIX', &
			'SCANNING_PREFIX', &
			'CHECKREQUIREDREADINGS', &
			'AUTO_DISPLAY_NOTES_ON_OOS', &
			'AbnormalReadingsRequireNote', &
			'StationAbbr' ) "
	CASE 'NCCS'
		ls_Preference_List = " ( &
			'EquipmentRequireRelogin', &
			'SCANNING_SUFFIX', &
			'SCANNING_PREFIX', &
			'FORCE_SCAN_ON_FIRST_VERIF', &
			'FORCE_SCAN_ON_SECOND_VERIF' ) "
	CASE 'NCS'
		ls_Preference_List = " ( &
			'RequireRelogin', &
			'SCANNING_SUFFIX', &
			'SCANNING_PREFIX', &
			'FORCE_SCAN_ON_FIRST_VERIF', &
			'FORCE_SCAN_ON_SECOND_VERIF' ) "
END CHOOSE

ls_Sql = " &
  SELECT module_id, &
         key_id, &
         value_id, &
         description, &
			preference_list, &
			preference_type, &
			default_value &
    FROM soms_user_settings &
	WHERE ( module_id = '" + as_Module_Id + "' ) &
	  AND ( key_id IN " + ls_Preference_List + " ) &
ORDER BY description "

li_Return	= This.SetTransObject(SQLCA)
ls_Error		= This.Modify('Datawindow.Table.Select = "' + ls_Sql + '"')
ll_Num_Rows	= This.Retrieve()


end event

event ue_sort_dw(string ls_search, integer li_column, string as_current_order);string ls_Module_Id
string ls_Current_Sort
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

ls_Header_Text[1] = "Selected"
ls_Header_Text[2] = "Right"
	
ls_Column_Name[1] = "selected_t"
ls_Column_Name[2] = "lnum_t"
	
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
ls_New_Sort = ls_Search + ls_New_Order + ', lnum A'
FOR li_Count = 1 TO 2
	ls_Header_Column_Text = ls_Column_Name[li_Count] + ".Text='" + ls_Header_Text[li_Count]
	IF ( li_Count = li_Column ) THEN
		ls_Header_Column_Text = ls_Header_Column_Text + " " + ls_Order_Direction
	END IF
	ls_Error = This.Modify(ls_Header_Column_Text + "'")
NEXT
li_Return = This.SetSort(ls_New_Sort)
li_Return = This.Sort()
integer li_LNum
IF ( This.RowCount() > 0 ) THEN
	li_LNum = This.Object.lnum[This.GetRow()]
	ls_Module_Id = ddlb_1.Text
	This.EVENT ue_Retrieve(ls_Module_Id)
	ls_Find = " lnum = " + String(li_LNum)
	li_Row = This.Find(ls_Find, 1, This.RowCount() + 1)
	IF ( li_Row > 0 ) THEN
		This.SetRow(li_Row)
		This.ScrollToRow(li_Row)
	//	This.SelectRow(0, FALSE)
	//	this.SelectRow(li_Row, TRUE)
	ELSE
		This.SetRow(1)
		This.ScrollToRow(1)
	//	This.SelectRow(0, FALSE)
	//	this.SelectRow(1, TRUE)
	END IF
END IF

end event

event type integer save();long I
string ls_single_quote = "'"
string ls_double_quote = '"'
this.SetTransObject(SQLCA)

FOR I = 1 TO this.RowCount()
	IF Pos(this.object.value_id[I],ls_single_quote) > 0 THEN
		this.object.value_id[I] = StrTran(this.object.value_id[I],ls_single_quote,'`')
	END IF
	IF Pos(this.object.value_id[I],ls_double_quote) > 0 THEN
		this.object.value_id[I] = StrTran(this.object.value_id[I],ls_double_quote,'`')
	END IF
NEXT

this.SetTransObject(SQLCA)
RETURN this.Update()
end event

event rbuttondown;string ls_Sub_Sort
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
//			string ls_path
//			string ls_Folder, ls_File
			string ls_text
//			integer li_Return
			integer li_Preference_Type
//			string ls_CurrentDir
			boolean lb_Ok
			long ll_Color
			m_preferences_popup m_popup

			m_popup.m_file.m_resetpreference.Text = f_LanguageString('RESET_PREFERENCE_TO_DEFAULT', 'Reset preference to default')
			m_popup.m_file.m_resetallpreferencestodefault.Text = f_LanguageString('RESET_ALL_PREFERENCE_TO_DEFAULT', 'Reset ALL preferences to default')

			IF ( Row > 0 ) THEN
				ls_Column = dwo.Name
				This.SetRow(Row)
				IF ( ls_Column <> 'datawindow' ) THEN
					This.SetColumn(ls_Column)
				END IF
				IF ( ls_Column = 'description' ) THEN
					m_PopUp = CREATE m_preferences_popup
					This.EVENT Clicked(xpos, ypos, row, dwo)
					// Display popup menu
					m_PopUp.m_file.PopMenu(w_testing_preferences.PointerX(), w_testing_preferences.PointerY())
					DESTROY m_PopUp
				ELSEIF ( ls_Column = 'value_id' ) THEN
					li_Preference_Type = This.Object.preference_type[Row]
					CHOOSE CASE li_Preference_Type
						CASE 0 // Text
					//		Do nothing
						CASE 1 // Color
							ll_Color = Long(This.GetText())
					// 	Pass current color to choosecolor API
							lb_Ok = ChooseColor(ll_Color) = 1
							IF lb_Ok THEN
								This.SetText(String(ll_Color))
							END IF
//						CASE 2 // File
//							ls_CurrentDir = GetCurrentDirectory()
//							li_Return = GetFileOpenName(This.GetText(), ls_Folder, ls_File)
//							IF ( li_Return = 1 ) THEN
//								This.SetText(ls_Folder)
//							END IF
//							ChangeDirectory(ls_CurrentDir)
						CASE 4 // Text to edit
							OpenWithParm(w_preferences_edit, This.GetText())
							ls_text = Message.StringParm
							Message.StringParm = ''
							This.SetText(ls_text)
//						CASE 5 // folder browser
//							ls_CurrentDir = GetCurrentDirectory()
//							ls_path	= this.object.value_id[row]
//							IF Empty(ls_path) THEN
//								ls_path = 'c:\'
//							END IF
//							IF GetFolder('Select Folder',ls_path) = 1 THEN
//								This.SetText(ls_Path)
//							END IF
//							ChangeDirectory(ls_CurrentDir)
						CASE ELSE // Currently undefined
					//		Do nothing
					END CHOOSE
					This.AcceptText()
				END IF
			END IF
		ELSE
			CHOOSE CASE ls_Column
				CASE 'selected_t'
					ls_Search = "selected"
					li_Column = 1
				CASE 'lnum_t'
					ls_Search = "lnum"
					li_Column = 2
			END CHOOSE
			
			IF NOT Empty(ls_Search) THEN
				This.EVENT ue_Sort_DW(ls_Search, li_Column, '')
			END IF
		END IF
END CHOOSE
end event

event rowfocuschanged;long ll_Row
integer li_Error
string ls_Error
string ls_Preference_List_Temp
string ls_Preference_List
integer li_Preference_Type
datawindowchild ldwc_value

IF ( This.GetRow() > 0 ) THEN
	li_Error = This.GetChild('value_id', ldwc_value)
	IF ( li_Error = 1 ) THEN
		li_Error = ldwc_value.Reset()
		ls_Preference_List = This.Object.preference_list[CurrentRow]
		li_Preference_Type = This.Object.preference_type[CurrentRow]
		IF NOT Empty(ls_Preference_List) THEN
			IF ( li_Preference_Type = 0 ) THEN // text, no editing, pick from list
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
				LOOP
				This.Object.value_id.dddw.AllowEdit = 'No'
			ELSEIF ( li_Preference_Type = 6 ) THEN // validate characters entered against preference_list
				This.Object.value_id.dddw.AllowEdit = 'Yes'
			ELSEIF ( li_Preference_Type = 7 ) THEN // validate characters entered against preference_list
				This.Object.value_id.dddw.AllowEdit = 'Yes'
			END IF
		ELSE
			IF ( li_Preference_Type = 1 ) THEN // color picker, no editing
				This.Object.value_id.dddw.AllowEdit = 'No'
			ELSEIF ( li_Preference_Type = 2 ) THEN // file browser, allow editing - to allow UNC folders
				This.Object.value_id.dddw.AllowEdit = 'Yes'
			ELSEIF ( li_Preference_Type = 4 ) THEN // text, allow editing
				This.Object.value_id.dddw.AllowEdit = 'Yes'
			ELSEIF ( li_Preference_Type = 5 ) THEN // folder browser, allow editing - to allow UNC folders
				This.Object.value_id.dddw.AllowEdit = 'Yes'
			ELSEIF ( li_Preference_Type = 8 ) THEN // only allow numbers
				This.Object.value_id.dddw.AllowEdit = 'Yes'
			END IF
		END IF
	END IF
END IF
This.SetRedraw(TRUE)

end event

event rowfocuschanging;This.SetRedraw(FALSE)

end event

event editchanged;string ls_Preference_List
integer li_Count, li_Preference_Type, li_First, li_Last

ls_Preference_List = This.Object.preference_list[Row]
li_Preference_Type = This.Object.preference_type[Row]

IF ( li_Preference_Type = 6 ) THEN // validate each character against preference_list
	data = UPPER(data)
	FOR li_Count = 1 TO LEN(data)
		IF NOT MATCH(ls_Preference_List , MID(data, li_Count, 1)) THEN
			data = MID(data, 1, li_Count - 1) + MID(data, li_Count + 1)
			li_Count = li_Count - 1
		END IF
	NEXT
	This.Object.value_id[Row] = data
	This.SelectText(LEN(data) + 1, 1)
ELSEIF ( li_Preference_Type = 7 ) THEN // validate each character against preference_list, no duplicates
	data = UPPER(data)
	FOR li_Count = 1 TO LEN(data)
		IF NOT MATCH(ls_Preference_List , MID(data, li_Count, 1)) THEN
			data = MID(data, 1, li_Count - 1) + MID(data, li_Count + 1)
			li_Count = li_Count - 1
		ELSE
			li_First = POS(data, MID(data, li_Count, 1))
			li_Last = LASTPOS(data, MID(data, li_Count, 1))
			IF ( li_First <> li_Last ) THEN
				data = MID(data, 1, li_Count - 1) + MID(data, li_Count + 1)
				li_Count = li_Count - 1
			END IF
		END IF
	NEXT
	This.Object.value_id[Row] = data
	This.SelectText(LEN(data) + 1, 1)
ELSEIF ( li_Preference_Type = 8 ) THEN // numeric only, allow decimal and negative numbers
	FOR li_Count = 1 TO LEN(data)
		IF NOT IsNumber(MID(data, li_Count, 1)) AND ( MID(data, li_Count, 1) <> '.' ) AND ( MID(data, li_Count, 1) <> '-' ) THEN
			data = MID(data, 1, li_Count - 1) + MID(data, li_Count + 1)
			li_Count = li_Count - 1
		END IF
	NEXT
	This.Object.value_id[Row] = data
	This.SelectText(LEN(data) + 1, 1)
END IF
end event

event clicked;IF dwo.name = 'value_id' AND row > 0 THEN
	this.SetRow( row )
	this.ScrollToRow( row )
	this.EVENT Rowfocuschanged( row )
END IF

/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
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
//			string ls_path
//			string ls_Folder, ls_File
			string ls_text
//			integer li_Return
			integer li_Preference_Type
//			string ls_CurrentDir
			boolean lb_Ok
			long ll_Color
			m_preferences_popup m_popup

			m_popup.m_file.m_resetpreference.Text = f_LanguageString('RESET_PREFERENCE_TO_DEFAULT', 'Reset preference to default')
			m_popup.m_file.m_resetallpreferencestodefault.Text = f_LanguageString('RESET_ALL_PREFERENCE_TO_DEFAULT', 'Reset ALL preferences to default')

			IF ( Row > 0 ) THEN
				ls_Column = dwo.Name
				This.SetRow(Row)
				IF ( ls_Column <> 'datawindow' ) THEN
					This.SetColumn(ls_Column)
				END IF
				IF ( ls_Column = 'description' ) THEN
					m_PopUp = CREATE m_preferences_popup
					This.EVENT Clicked(xpos, ypos, row, dwo)
					// Display popup menu
					m_PopUp.m_file.PopMenu(w_testing_preferences.PointerX(), w_testing_preferences.PointerY())
					DESTROY m_PopUp
				ELSEIF ( ls_Column = 'value_id' ) THEN
					li_Preference_Type = This.Object.preference_type[Row]
					CHOOSE CASE li_Preference_Type
						CASE 0 // Text
					//		Do nothing
						CASE 1 // Color
							ll_Color = Long(This.GetText())
					// 	Pass current color to choosecolor API
							lb_Ok = ChooseColor(ll_Color) = 1
							IF lb_Ok THEN
								This.SetText(String(ll_Color))
							END IF
//						CASE 2 // File
//							ls_CurrentDir = GetCurrentDirectory()
//							li_Return = GetFileOpenName(This.GetText(), ls_Folder, ls_File)
//							IF ( li_Return = 1 ) THEN
//								This.SetText(ls_Folder)
//							END IF
//							ChangeDirectory(ls_CurrentDir)
						CASE 4 // Text to edit
							OpenWithParm(w_preferences_edit, This.GetText())
							ls_text = Message.StringParm
							Message.StringParm = ''
							This.SetText(ls_text)
//						CASE 5 // folder browser
//							ls_CurrentDir = GetCurrentDirectory()
//							ls_path	= this.object.value_id[row]
//							IF Empty(ls_path) THEN
//								ls_path = 'c:\'
//							END IF
//							IF GetFolder('Select Folder',ls_path) = 1 THEN
//								This.SetText(ls_Path)
//							END IF
//							ChangeDirectory(ls_CurrentDir)
						CASE ELSE // Currently undefined
					//		Do nothing
					END CHOOSE
					This.AcceptText()
				END IF
			END IF
		ELSE
			CHOOSE CASE ls_Column
				CASE 'selected_t'
					ls_Search = "selected"
					li_Column = 1
				CASE 'lnum_t'
					ls_Search = "lnum"
					li_Column = 2
			END CHOOSE
			
			IF NOT Empty(ls_Search) THEN
				This.EVENT ue_Sort_DW(ls_Search, li_Column, '')
			END IF
		END IF
END CHOOSE
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

type cb_ok from commandbutton within w_testing_preferences
integer x = 233
integer y = 1072
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

event clicked;integer li_Return

li_Return = dw_preferences.Update()
IF ( li_Return = 1 ) THEN
	f_Update_User_Preferences()
END IF

Close(Parent)
end event

type st_title from statictext within w_testing_preferences
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
string text = "Modify Preferences:"
boolean focusrectangle = false
end type

