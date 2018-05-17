$PBExportHeader$w_scanning.srw
forward
global type w_scanning from window
end type
type sle_scancode from singlelineedit within w_scanning
end type
type st_equip_operator_id from statictext within w_scanning
end type
type st_location from statictext within w_scanning
end type
type st_station_description from statictext within w_scanning
end type
type st_multi_readings from statictext within w_scanning
end type
type st_instructions from statictext within w_scanning
end type
type mle_instructions from multilineedit within w_scanning
end type
type cb_cancel from commandbutton within w_scanning
end type
type cb_ok from commandbutton within w_scanning
end type
end forward

global type w_scanning from window
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
event post_open ( )
event ue_focus_on_scancode ( )
sle_scancode sle_scancode
st_equip_operator_id st_equip_operator_id
st_location st_location
st_station_description st_station_description
st_multi_readings st_multi_readings
st_instructions st_instructions
mle_instructions mle_instructions
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_scanning w_scanning

type variables
boolean		ib_Find_By_Scancode

date			ld_Shift_Date
integer		li_Tour
integer		li_Sta
integer		li_Rev_No
integer		li_Shift_No

datetime		ldt_DateTime
string		ls_Note
string		ls_Reading
integer		li_Reading_Id

string		ls_User
integer		li_Spec
integer		li_Tol

integer		li_OOS
integer		li_OOT

boolean		ib_Edit_Multi
boolean		ib_New_Multi

integer		il_Row
s_alert		iuo_alert[]
string		is_Prefix
string		is_Suffix
boolean		ib_Scan_Success
string		is_Scan_Code
string		is_Equip_Operator_Id
pointer		i_pointer
string		is_Scan_Code_Entered
integer		il_Been_Here

end variables

forward prototypes
public subroutine wf_scan_completed ()
end prototypes

event post_open();IF ( w_tour.tab_tour.tabpage_readings.dw_readings.RowCount() > 0 ) THEN
	is_Suffix = f_ProfileString(gs_Module_Id, 'SCANNING_SUFFIX', '')
	is_Prefix = f_ProfileString(gs_Module_Id, 'SCANNING_PREFIX', '')
	This.EVENT ue_Focus_On_Scancode()
ELSE
	SetPointer(i_pointer)
	Close(This)
END IF

end event

event ue_focus_on_scancode();sle_scancode.SetFocus()
sle_scancode.SelectText(1000, 0)
end event

public subroutine wf_scan_completed ();integer li_Prefix_Length
integer li_Suffix_Length
integer li_Text_Length
string ls_Scanned_Text

ls_Scanned_Text = sle_scancode.Text

li_Prefix_Length = LEN(is_Prefix)
li_Suffix_Length = LEN(is_Suffix)
li_Text_Length = LEN(ls_Scanned_Text)
//Look for the prefix character
IF ( li_Prefix_Length > 0 ) THEN
	IF ( POS(ls_Scanned_Text, is_Prefix, 1) > 0 ) THEN
		//Remove the prefix character
		ls_Scanned_Text = MID(ls_Scanned_Text, li_Prefix_Length + 1)
	END IF
END IF
li_Text_Length = LEN(ls_Scanned_Text)
//Look for the sufffix character
IF ( li_Suffix_Length > 0 ) THEN
	IF ( POS(ls_Scanned_Text, is_Suffix, 1) > 0 ) THEN
		//Remove the sufffix character
		ls_Scanned_Text = MID(ls_Scanned_Text, 1, li_Text_Length - li_Suffix_Length)
	END IF
END IF

//is_Scan_Code_Entered = ls_Scanned_Text
//w_tour.is_ScanCode = ls_Scanned_Text
//w_tour.is_Scan_Result = ''
//MessageBox('wf_Scan_Completed', ls_Scanned_Text)
w_tour.is_ScanCode = ls_Scanned_Text
CloseWithReturn(This, ls_Scanned_Text)

end subroutine

on w_scanning.create
this.sle_scancode=create sle_scancode
this.st_equip_operator_id=create st_equip_operator_id
this.st_location=create st_location
this.st_station_description=create st_station_description
this.st_multi_readings=create st_multi_readings
this.st_instructions=create st_instructions
this.mle_instructions=create mle_instructions
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.Control[]={this.sle_scancode,&
this.st_equip_operator_id,&
this.st_location,&
this.st_station_description,&
this.st_multi_readings,&
this.st_instructions,&
this.mle_instructions,&
this.cb_cancel,&
this.cb_ok}
end on

on w_scanning.destroy
destroy(this.sle_scancode)
destroy(this.st_equip_operator_id)
destroy(this.st_location)
destroy(this.st_station_description)
destroy(this.st_multi_readings)
destroy(this.st_instructions)
destroy(this.mle_instructions)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;guo_window.Post uf_Resize(w_scanning)
//guo_window.Post uf_Reposition(This)

string ls_Temp
boolean lb_Set_Skip_As_Default
integer li_Width
string ls_Message
long ll_Row
string ls_Instructions
string CRLF

ls_Message = Message.StringParm
Message.StringParm = ''
IF ( POS(ls_Message, '|') > 0 ) THEN
	ls_Temp = MID(ls_Message, 1, POS(ls_Message, '|') - 1)
	ib_Find_By_Scancode = ( ls_Temp = 'FIND' )
	ls_Temp = MID(ls_Message, POS(ls_Message, '|') + 1)
	il_Row = Long(ls_Temp)
ELSE
	ib_Find_By_Scancode = ( ls_Message = 'FIND' )
	il_Row = Long(ls_Message)
END IF

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('SKIP', 'Skip')
st_instructions.Text = f_LanguageString('INSTRUCTIONS:', 'Instructions:')
st_multi_readings.Text = f_LanguageString('SCANNING_VERIFICATION', 'Scanning Verification')

i_pointer = SetPointer(Arrow!)
CRLF = CHAR(13) + CHAR(10)

lb_Set_Skip_As_Default = ( Upper(ProfileString(gs_INI_File, gs_Window_Title, 'MakeScanSkipButtonDefault', f_LanguageString('NO', 'No'))) = UPPER(f_LanguageString('YES', 'Yes')) )
cb_ok.Default = lb_Set_Skip_As_Default

ls_Instructions = ''
IF ib_Find_By_Scancode THEN
	IF NOT gb_force_find_by_scan THEN
		ls_Instructions = f_LanguageString('SCAN_BARCODE_INSTRUCTION', 'You can find and navigate to a record in the tour by scanning its associated barcode:CRLFCRLF1.  Scan the barcode, orCRLF2.  Tap <Cancel> to return to previous record')
		ls_Instructions = StrTran(ls_Instructions, 'CRLF', CRLF)
	ELSE
		ls_Instructions = f_LanguageString('SCAN_BARCODE_INSTRUCTION_FORCE', 'This record requires that the associated barcode be scanned prior to entering or changing a reading.  You can proceed:CRLF1.  Scan barcode then enter reading, orCRLF2.  Tap <Skip> to bypass scanning, orCRLF3.  Tap <Cancel> to return to previous recordCRLFNOTE:  If you Skip scanning you can enter a reading, but it will be marked as not having been scanned.')
		ls_Instructions = StrTran(ls_Instructions, 'CRLF', CRLF)
	END IF

	IF ( il_row > 0 ) THEN
		st_station_description.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[il_Row], st_station_description.Width, TRUE)
		st_location.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_location[il_Row], st_location.Width, FALSE)
		st_equip_operator_id.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_equip_operator_id[il_Row], st_equip_operator_id.Width, FALSE)
	ELSE
		st_station_description.Hide()
		st_location.Hide()
		st_equip_operator_id.Hide()
	END IF

	IF NOT gb_force_find_by_scan THEN
		cb_cancel.X = (This.Width / 2) - (cb_cancel.Width / 2)
		cb_ok.Hide()
		st_multi_readings.Text = f_LanguageString('FIND_BY_SCAN_CODE', 'Find by Scan Code')
		st_instructions.Y = st_station_description.Y
		mle_instructions.Y = st_instructions.Y + st_instructions.Height + 10
		st_station_description.Hide()
		st_location.Hide()
		st_equip_operator_id.Hide()
	END IF
ELSE
	ls_Instructions = f_LanguageString('SCAN_BARCODE_INSTRUCTION_FORCE', 'This record requires that the associated barcode be scanned prior to entering or changing a reading.  You can proceed:CRLF1.  Scan barcode then enter reading, orCRLF2.  Tap <Skip> to bypass scanning, orCRLF3.  Tap <Cancel> to return to previous recordCRLFNOTE:  If you Skip scanning you can enter a reading, but it will be marked as not having been scanned.')
	ls_Instructions = StrTran(ls_Instructions, 'CRLF', CRLF)

	st_station_description.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[il_Row], st_station_description.Width, TRUE)
	st_location.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_location[il_Row], st_location.Width, FALSE)
	st_equip_operator_id.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_equip_operator_id[il_Row], st_equip_operator_id.Width, FALSE)
	
	is_Scan_Code = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_scan[il_Row]
	IF Empty(is_Scan_Code) THEN
		is_Scan_Code = ''
	END IF
	is_Equip_Operator_Id = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_equip_Operator_Id[il_Row]
	IF Empty(is_Equip_Operator_Id) THEN
		is_Equip_Operator_Id = ''
	END IF
END IF

//li_Width = 100 + f_Get_TextBox_Width_From_String(st_instructions.Text, mle_instructions.Width, FALSE)
//st_instructions.Width = li_Width

mle_instructions.Text = ls_Instructions

This.Post Event Post_Open()

end event

event close;gl_X = This.X
gl_Y = This.Y
//f_debug('close')
SetPointer(i_pointer)
end event

event activate;This.X = gl_X
This.Y = gl_Y
f_Release_Buttons()


end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type sle_scancode from singlelineedit within w_scanning
integer x = 1202
integer y = 700
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

event other;string ls_Text
string ls_Scanned_Suffix
//integer li_Prefix_Length
integer li_Suffix_Length
//integer li_Text_Length
//
CHOOSE CASE wparam
	CASE 32 TO 126
//		CHOOSE CASE wparam
//			CASE 32, 48 TO 57, 65 TO 90, 97 TO 122
//				IF NOT gb_No_Scan_Loop THEN
//					IF ( il_Been_Here = 1 ) THEN
//						f_debug('RETURN - ' + String(il_Been_Here) + ' - ' + f_Convert_To_Char(wparam))
//						il_Been_Here ++
//						RETURN
//					END IF
//					IF ( il_Been_Here = 2 ) THEN
//						f_debug('RETURN - ' + String(il_Been_Here) + ' - ' + f_Convert_To_Char(wparam))
//						il_Been_Here = 0
//						RETURN
//					END IF
//					il_Been_Here ++
//				END IF
////				f_debug('sle char - ' + String(il_Been_Here) + ' - ' + f_Convert_To_Char(wparam))
//				f_debug('sle char - ' + String(wparam) + ' - ' + f_Convert_To_Char(wparam))
//			CASE ELSE
//				f_debug('sle char ELSE - ' + String(wparam) + ' - ' + f_Convert_To_Char(wparam))
//		END CHOOSE
//		is_Scan_Code_Entered = is_Scan_Code_Entered + f_Convert_To_Char(wparam)
//		f_debug('is_Scan_Code_Entered - ' + is_Scan_Code_Entered)
//		ls_Text = is_Scan_Code_Entered
//		li_Prefix_Length = LEN(is_Prefix)
		li_Suffix_Length = LEN(is_Suffix)
//		li_Text_Length = LEN(ls_Text)
//		
//		//Look for the prefix character
//		IF ( li_Prefix_Length > 0 ) THEN
//			IF ( li_Text_Length = li_Prefix_Length ) THEN
//				IF ( ls_Text = is_Prefix ) THEN
//					//Remove the prefix character
//					is_Scan_Code_Entered = ''
//				END IF
//			END IF
//		END IF
//		
		ls_Text = sle_scancode.Text
//		ls_Text = is_Scan_Code_Entered
//		li_Text_Length = LEN(ls_Text)
		//Look for the suffix character
		IF ( li_Suffix_Length > 0 ) THEN
			ls_Scanned_Suffix = Right(ls_Text, li_Suffix_Length)
			IF ( ls_Scanned_Suffix = is_Suffix ) THEN
//				is_S	can_Code_Entered = MID(is_Scan_Code_Entered, 1, LEN(is_Scan_Code_Entered) - li_Suffix_Length)
//				IF ( is_Scan_Code_Entered = is_Scan_Code ) THEN
//					ib_Scan_Success = TRUE
//					//Remove the suffix character
//					is_Scan_Code_Entered = MID(ls_Text, 1, li_Text_Length - li_Suffix_Length)
//				END IF
				wf_Scan_Completed()
			END IF
		END IF
END CHOOSE

end event

event modified;wf_Scan_Completed()
end event

type st_equip_operator_id from statictext within w_scanning
integer x = 18
integer y = 208
integer width = 1042
integer height = 56
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
boolean disabledlook = true
end type

event rbuttondown;string ls_Equip_Operator_Id
string ls_Message

ls_Equip_Operator_Id = String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_equip_operator_id[il_Row])
MessageBox(f_LanguageString('EQUIPMENT', 'Equipment'), ls_Equip_Operator_Id)
//IF NOT Empty(ls_Equip_Operator_Id) THEN
//	ls_Message = 'Equipment Detail|' + f_Get_Equipment_Detail(ls_Equip_Operator_Id)
//	OpenWithParm(w_detail, ls_Message)
//END IF

end event

event getfocus;Parent.PostEvent('ue_Focus_On_Scancode')
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
string ls_Equip_Operator_Id
string ls_Message

ls_Equip_Operator_Id = String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_equip_operator_id[il_Row])
MessageBox(f_LanguageString('EQUIPMENT', 'Equipment'), ls_Equip_Operator_Id)
//IF NOT Empty(ls_Equip_Operator_Id) THEN
//	ls_Message = 'Equipment Detail|' + f_Get_Equipment_Detail(ls_Equip_Operator_Id)
//	OpenWithParm(w_detail, ls_Message)
//END IF
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////

end event

type st_location from statictext within w_scanning
integer x = 18
integer y = 136
integer width = 1042
integer height = 56
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
boolean disabledlook = true
end type

event rbuttondown;MessageBox(f_LanguageString('RECORD_LOCATION', "Record Location"), String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_location[il_Row]))

end event

event getfocus;Parent.PostEvent('ue_Focus_On_Scancode')
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
MessageBox(f_LanguageString('RECORD_LOCATION', "Record Location"), String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_location[il_Row]))
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type st_station_description from statictext within w_scanning
integer x = 18
integer y = 64
integer width = 1042
integer height = 56
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
boolean disabledlook = true
end type

event rbuttondown;MessageBox(f_LanguageString('RECORD_DESCRIPTION', "Record Description"), String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[il_Row]))

end event

event getfocus;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
Parent.PostEvent('ue_Focus_On_Scancode')
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

event clicked;MessageBox(f_LanguageString('RECORD_DESCRIPTION', "Record Description"), String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[il_Row]))

end event

type st_multi_readings from statictext within w_scanning
integer x = 18
integer width = 1042
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
boolean enabled = false
string text = "Scanning Verification"
boolean focusrectangle = false
end type

type st_instructions from statictext within w_scanning
integer x = 18
integer y = 272
integer width = 1024
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
boolean enabled = false
string text = "Instructions:"
boolean focusrectangle = false
end type

type mle_instructions from multilineedit within w_scanning
integer x = 18
integer y = 336
integer width = 1042
integer height = 736
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean displayonly = true
borderstyle borderstyle = StyleLowered!
end type

event getfocus;Parent.PostEvent('ue_Focus_On_Scancode')
end event

type cb_cancel from commandbutton within w_scanning
integer x = 567
integer y = 1056
integer width = 274
integer height = 80
integer taborder = 60
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

event clicked;//w_tour.is_Scan_Result = 'CANCEL'
//w_tour.is_ScanCode = 'CANCEL'
SetPointer(i_pointer)
w_tour.is_ScanCode = 'CANCEL'
CloseWithReturn(Parent, 'CANCEL')

end event

event getfocus;//Parent.PostEvent('ue_Focus_On_Scancode')
end event

type cb_ok from commandbutton within w_scanning
integer x = 201
integer y = 1056
integer width = 274
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Skip"
end type

event clicked;//IF Empty(is_Scan_Code_Entered) THEN
//	w_tour.is_ScanCode = ''
//	w_tour.is_Scan_Result = 'SKIP'
////ELSE
////	w_tour.is_ScanCode = is_Scan_Code_Entered
////	w_tour.is_Scan_Result = ''
//END IF
SetPointer(i_pointer)
w_tour.is_ScanCode = 'SKIP'
CloseWithReturn(Parent, 'SKIP')

//IF Empty(is_Scan_Code_Entered) THEN
//	w_tour.is_ScanCode = 'SKIP'
//ELSE
//	w_tour.is_ScanCode = is_Scan_Code_Entered
//END IF
//Close(Parent)
end event

event getfocus;//Parent.PostEvent('ue_Focus_On_Scancode')
end event

