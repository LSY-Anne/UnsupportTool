$PBExportHeader$w_find.srw
forward
global type w_find from window
end type
type cb_cancel from commandbutton within w_find
end type
type cb_ok from commandbutton within w_find
end type
type sle_scan from singlelineedit within w_find
end type
type st_find from statictext within w_find
end type
end forward

global type w_find from window
integer width = 1097
integer height = 800
boolean titlebar = true
string title = "eSOMS Rounds"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
cb_cancel cb_cancel
cb_ok cb_ok
sle_scan sle_scan
st_find st_find
end type
global w_find w_find

type variables
string		is_Prefix
string		is_Suffix
boolean		ib_Scan_Success
end variables

on w_find.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_scan=create sle_scan
this.st_find=create st_find
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.sle_scan,&
this.st_find}
end on

on w_find.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_scan)
destroy(this.st_find)
end on

event open;IF ( w_tour.tab_tour.tabpage_readings.dw_readings.RowCount() > 0 ) THEN
	cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
	cb_ok.Text = f_LanguageString('ACCEPT', 'Accept')
	st_find.Text = f_LanguageString('FIND_EQUIPMENT', 'Find Equipment')
	is_Suffix = f_ProfileString(gs_Module_Id, 'SCANNING_SUFFIX', '')
	is_Prefix = f_ProfileString(gs_Module_Id, 'SCANNING_PREFIX', '')
	sle_scan.SetFocus()
ELSE
	Close(This)
END IF
end event

event activate;This.X = gl_X + (w_main.Width - This.Width) / 2
This.Y = gl_Y + 104
f_Release_Buttons()
end event

type cb_cancel from commandbutton within w_find
integer x = 567
integer y = 320
integer width = 274
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;w_tour.wf_Open_Tour_Lite()
Close(Parent)
end event

type cb_ok from commandbutton within w_find
integer x = 201
integer y = 320
integer width = 274
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Accept"
boolean default = true
end type

event clicked;string ls_Equip_Operator_Id
string ls_Find
long ll_Row

ls_Equip_Operator_Id = sle_scan.Text

IF NOT Empty(ls_Equip_Operator_Id) THEN
	IF ( MID(ls_Equip_Operator_Id, 1, 1) = '%' ) THEN
		ls_Find = " POS(station_equip_operator_id, '" + MID(ls_Equip_Operator_Id, 2) + "') > 0 "
	ELSE
		ls_Find = " MID(station_equip_operator_id, 1, " + String(LEN(ls_Equip_Operator_Id)) + ") = '" + ls_Equip_Operator_Id + "' "
	END IF
	ll_Row = w_tour.tab_tour.tabpage_readings.dw_readings.Find(ls_Find, 1, w_tour.tab_tour.tabpage_readings.dw_readings.RowCount() + 1)
	IF ( ll_Row > 0 ) THEN
		// Jump to the equipment
		w_tour.il_Row_For_Navigate_To_Row_PostEvent = ll_Row
		w_tour.tab_tour.tabpage_readings.dw_readings.PostEvent("ue_navigate_to_row", 0, ll_Row)
		w_tour.wf_Open_Tour_Lite()
		Close(Parent)
	ELSE
//		MessageBox("Equipment not found", "There are no stations for this equipment ID.", Exclamation!)
		MessageBox(f_LanguageString('EQUIPMENT_NOT_FOUND', "Equipment not found"), f_LanguageString('THERE_ARE_NO_STATIONS_FOR_THIS_EQUIPMENT_ID.', "There are no stations for this equipment ID."), Exclamation!)
	END IF
ELSE
//	MessageBox("Invalid equipment", "Equipment ID cannot be blank.", Exclamation!)
	MessageBox(f_LanguageString('INVALID_EQUIPMENT', "Invalid equipment"), f_LanguageString('EQUIPMENT_ID_CANNOT_BE_BLANK.', "Equipment ID cannot be blank."), Exclamation!)
END IF
end event

type sle_scan from singlelineedit within w_find
integer x = 27
integer y = 224
integer width = 1042
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
end type

event other;string ls_Text
string ls_Scan_Code
string ls_Scanned_Suffix
integer li_Prefix_Length
integer li_Suffix_Length
integer li_Text_Length

ls_Text = This.Text
ls_Scan_Code = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_scan[w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()]
li_Prefix_Length = LEN(is_Prefix)
li_Suffix_Length = LEN(is_Suffix)
li_Text_Length = LEN(ls_Text)

//Look for the prefix character
IF ( li_Prefix_Length > 0 ) THEN
	IF ( li_Text_Length = li_Prefix_Length ) THEN
		IF ( ls_Text = is_Prefix ) THEN
			//Remove the prefix character
			This.Text = ''
		END IF
	END IF
END IF

ls_Text = This.Text
li_Text_Length = LEN(ls_Text)
//Look for the suffix character
IF ( li_Suffix_Length > 0 ) THEN
	ls_Scanned_Suffix = Right(ls_Text, li_Suffix_Length)
	IF ( ls_Scanned_Suffix = is_Suffix ) THEN
		ib_Scan_Success = TRUE
		//Remove the suffix character
		This.Text = MID(ls_Text, 1, li_Text_Length - li_Suffix_Length)
		cb_ok.EVENT Clicked()
	END IF
END IF
end event

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

type st_find from statictext within w_find
integer x = 18
integer width = 1061
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Find Equipment"
boolean focusrectangle = false
end type

