$PBExportHeader$w_not_used_scan.srw
forward
global type w_not_used_scan from window
end type
type cb_2 from commandbutton within w_not_used_scan
end type
type cb_ok from commandbutton within w_not_used_scan
end type
type sle_scan from singlelineedit within w_not_used_scan
end type
type st_scan from statictext within w_not_used_scan
end type
end forward

global type w_not_used_scan from window
integer width = 1097
integer height = 800
boolean titlebar = true
string title = "eSOMS Rounds"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
cb_2 cb_2
cb_ok cb_ok
sle_scan sle_scan
st_scan st_scan
end type
global w_not_used_scan w_not_used_scan

type variables
string		is_Prefix
string		is_Suffix
boolean		ib_Scan_Success
end variables

on w_not_used_scan.create
this.cb_2=create cb_2
this.cb_ok=create cb_ok
this.sle_scan=create sle_scan
this.st_scan=create st_scan
this.Control[]={this.cb_2,&
this.cb_ok,&
this.sle_scan,&
this.st_scan}
end on

on w_not_used_scan.destroy
destroy(this.cb_2)
destroy(this.cb_ok)
destroy(this.sle_scan)
destroy(this.st_scan)
end on

event open;IF ( w_tour.tab_tour.tabpage_readings.dw_readings.RowCount() > 0 ) THEN
	is_Suffix = f_ProfileString(gs_Module_Id, 'SCANNING_SUFFIX', '')
	is_Prefix = f_ProfileString(gs_Module_Id, 'SCANNING_PREFIX', '')
	sle_scan.SetFocus()
ELSE
	Close(This)
END IF
end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

type cb_2 from commandbutton within w_not_used_scan
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
CloseWithReturn(Parent, '--CANCEL--')
end event

type cb_ok from commandbutton within w_not_used_scan
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

event clicked;//string ls_Scan
//
//ls_Scan = sle_scan.Text
//
//IF Empty(ls_Scan) THEN
//	ls_Scan = '--BLANK--'
//END IF
//gsu_tour_parameters[gi_Current_tour].scanned_code = ls_Scan
//IF w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Does_Scancode_Exist(ls_Scan) THEN
//	w_tour.wf_Open_Tour()
//	CloseWithReturn(Parent, ls_Scan)
//ELSE
//	MessageBox("Scan code not found", "There are no stations for this scan access code.", Exclamation!)
//END IF
//
end event

type sle_scan from singlelineedit within w_not_used_scan
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
integer limit = 150
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

type st_scan from statictext within w_not_used_scan
integer width = 1079
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Enter Scan Code"
boolean focusrectangle = false
end type

