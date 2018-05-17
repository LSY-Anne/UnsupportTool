$PBExportHeader$w_tour_filter.srw
forward
global type w_tour_filter from window
end type
type rb_all from radiobutton within w_tour_filter
end type
type rb_unscanned from radiobutton within w_tour_filter
end type
type rb_required from radiobutton within w_tour_filter
end type
type rb_missed from radiobutton within w_tour_filter
end type
type rb_abnormal from radiobutton within w_tour_filter
end type
type mle_description from multilineedit within w_tour_filter
end type
type cb_cancel from commandbutton within w_tour_filter
end type
type cb_ok from commandbutton within w_tour_filter
end type
type st_missed from statictext within w_tour_filter
end type
end forward

global type w_tour_filter from window
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
rb_all rb_all
rb_unscanned rb_unscanned
rb_required rb_required
rb_missed rb_missed
rb_abnormal rb_abnormal
mle_description mle_description
cb_cancel cb_cancel
cb_ok cb_ok
st_missed st_missed
end type
global w_tour_filter w_tour_filter

type variables
string					is_Description
string					is_Filename
integer					ii_Document_Number
integer					ii_Document_Order
integer					ii_Document_Type
blob						ib_Document_Blob
	
boolean					ib_Edit_Doc
boolean					ib_New_Doc

integer					il_Row
string					is_FullName
end variables

event post_open();//IF gb_Auto_SIP THEN
//	Post SetSIPPreferredState(Handle(mle_description), SipDown!)
//END IF
//
end event

on w_tour_filter.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.rb_all=create rb_all
this.rb_unscanned=create rb_unscanned
this.rb_required=create rb_required
this.rb_missed=create rb_missed
this.rb_abnormal=create rb_abnormal
this.mle_description=create mle_description
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_missed=create st_missed
this.Control[]={this.rb_all,&
this.rb_unscanned,&
this.rb_required,&
this.rb_missed,&
this.rb_abnormal,&
this.mle_description,&
this.cb_cancel,&
this.cb_ok,&
this.st_missed}
end on

on w_tour_filter.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rb_all)
destroy(this.rb_unscanned)
destroy(this.rb_required)
destroy(this.rb_missed)
destroy(this.rb_abnormal)
destroy(this.mle_description)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_missed)
end on

event open;guo_window.Post uf_ReSize(w_tour_filter)

string ls_Text

ls_Text = f_DW_LanguagE_call_2('Select the data view you wish to apply and click the "OK" button. The "Cancel" button will leave the current data view intact.')
mle_description.Text = ls_Text
This.Title = gs_Window_Title
st_missed.Text = f_DW_LanguagE_call_2('Filter Readings')
cb_ok.Text = f_DW_LanguagE_call_2('Ok')
cb_cancel.Text = f_DW_LanguagE_call_2('Cancel')
rb_all.Text = f_DW_Language_call_2('All Readings')
rb_missed.Text = f_DW_Language_call_2('Missed Readings')
rb_unscanned.Text = f_DW_Language_call_2('Unscanned Readings')
rb_required.Text = f_DW_Language_call_2('Required Readings')
rb_abnormal.Text = f_DW_Language_call_2('Abnormal Readings')

CHOOSE CASE gsu_tour_parameters[gi_Current_Tour].Filter_Text
	CASE f_DW_Language_call_2('<All Equip>')
		rb_all.Checked = TRUE
	CASE f_DW_Language_call_2('Missed')
		rb_missed.Checked = TRUE
	CASE f_DW_Language_call_2('Abnormal')
		rb_abnormal.Checked = TRUE
	CASE f_DW_Language_call_2('Required')
		rb_required.Checked = TRUE
	CASE f_DW_Language_call_2('Unscanned')
		rb_unscanned.Checked = TRUE
END CHOOSE

This.Post Event Post_Open()

end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event close;gl_X = This.X
gl_Y = This.Y
//SetSIPPreferredState(Handle(mle_description), SIPForceDown!)
//w_step.tab_step.tabpage_documents.dw_perf_docs.EVENT ue_Retrieve()
w_tour.Postevent('Show')
end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

event activate;This.X = gl_X
This.Y = gl_Y

end event

type rb_all from radiobutton within w_tour_filter
integer x = 91
integer y = 384
integer width = 905
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "All Readings"
boolean checked = true
boolean lefttext = true
end type

type rb_unscanned from radiobutton within w_tour_filter
integer x = 91
integer y = 824
integer width = 905
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Unscanned Readings"
boolean lefttext = true
end type

type rb_required from radiobutton within w_tour_filter
integer x = 91
integer y = 736
integer width = 905
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Required Readings"
boolean lefttext = true
end type

type rb_missed from radiobutton within w_tour_filter
integer x = 91
integer y = 648
integer width = 905
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Missed Readings"
boolean lefttext = true
end type

type rb_abnormal from radiobutton within w_tour_filter
integer x = 91
integer y = 560
integer width = 905
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Abnormal Readings"
boolean lefttext = true
end type

type mle_description from multilineedit within w_tour_filter
integer x = 55
integer y = 112
integer width = 1006
integer height = 256
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Select the data view you wish to apply and click the ~"OK~" button. The ~"Cancel~" button will leave the current data view intact."
boolean border = false
integer limit = 250
boolean displayonly = true
boolean hideselection = false
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

type cb_cancel from commandbutton within w_tour_filter
integer x = 567
integer y = 960
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

event clicked;//w_step.wf_Open_Step_Lite()
Close(Parent)
end event

type cb_ok from commandbutton within w_tour_filter
integer x = 201
integer y = 960
integer width = 274
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;long currentrow
boolean lb_Modified
integer li_Return
integer oldindex

IF rb_all.Checked THEN
	// ***************************
	// The below code is duplicated among all submenu items
	// of Tools and Data on mnu_tour and is a segment of code
	// taken directly from w_tour.tab_tour.EVENT SelectionChanging()
	
	gsu_tour_parameters[gi_Current_Tour].Filter = ''
	li_Return = 0
	oldindex = w_tour.tab_tour.SelectedTab
	IF ( oldindex = 1 ) THEN
		currentrow = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
		// Don't go through this if the current station is calculated because
		// the user went through this navigating to the station
		IF Empty(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_erd[currentrow]) THEN
			li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.AcceptText()
			lb_Modified = f_Check_If_Reading_Changed(currentrow)
			IF lb_Modified THEN
				li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE, lb_Modified)
			ELSE
				li_Return = 0
			END IF
			IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
				Close(Parent)
				RETURN
			ELSE
				w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(currentrow)
				IF ( li_Return = 1 ) AND w_tour.ib_Auto_Display_Notes_On_OOS THEN
					w_tour.tab_tour.SelectedTab = 4
					Close(Parent)
					RETURN
	//			ELSEIF ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_spec[currentrow] = 1 ) OR ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_tol[currentrow] = 1 ) THEN
	//				MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
	//				RETURN
				END IF
			END IF
		END IF
	ELSEIF ( oldindex = 4 ) THEN
		w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Note()
	END IF
	// ***************************
	w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Retrieve_Current_Tour(FALSE)
	
	//w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Filter_Menus('ALL')
END IF
IF rb_abnormal.Checked THEN
	// ***************************
	// The below code is duplicated among all submenu items
	// of Tools and Data on mnu_tour and is a segment of code
	// taken directly from w_tour.tab_tour.EVENT SelectionChanging()
	
	li_Return = 0
	oldindex = w_tour.tab_tour.SelectedTab
	IF ( oldindex = 1 ) THEN
		currentrow = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
		// Don't go through this if the current station is calculated because
		// the user went through this navigating to the station
		IF Empty(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_erd[currentrow]) THEN
			li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.AcceptText()
			lb_Modified = f_Check_If_Reading_Changed(currentrow)
			IF lb_Modified THEN
				li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE, lb_Modified)
			ELSE
				li_Return = 0
			END IF
			IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
				Close(Parent)
				RETURN
			ELSE
				w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(currentrow)
				IF ( li_Return = 1 ) AND w_tour.ib_Auto_Display_Notes_On_OOS THEN
					w_tour.tab_tour.SelectedTab = 4
					Close(Parent)
					RETURN
	//			ELSEIF ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_spec[currentrow] = 1 ) OR ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_tol[currentrow] = 1 ) THEN
	//				MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
	//				RETURN
				END IF
			END IF
		END IF
	ELSEIF ( oldindex = 4 ) THEN
		w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Note()
	END IF
	// ***************************
	//This.Checked = TRUE
	w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Abnormal()
	
	//w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Filter_Menus('ABNORMAL')
END IF
IF rb_missed.Checked THEN
	// ***************************
	// The below code is duplicated among all submenu items
	// of Tools and Data on mnu_tour and is a segment of code
	// taken directly from w_tour.tab_tour.EVENT SelectionChanging()
	
	li_Return = 0
	oldindex = w_tour.tab_tour.SelectedTab
	IF ( oldindex = 1 ) THEN
		currentrow = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
		// Don't go through this if the current station is calculated because
		// the user went through this navigating to the station
		IF Empty(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_erd[currentrow]) THEN
			li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.AcceptText()
			lb_Modified = f_Check_If_Reading_Changed(currentrow)
			IF lb_Modified THEN
				li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE, lb_Modified)
			ELSE
				li_Return = 0
			END IF
			IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
				Close(Parent)
				RETURN
			ELSE
				w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(currentrow)
				IF ( li_Return = 1 ) AND w_tour.ib_Auto_Display_Notes_On_OOS THEN
					w_tour.tab_tour.SelectedTab = 4
					Close(Parent)
					RETURN
	//			ELSEIF ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_spec[currentrow] = 1 ) OR ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_tol[currentrow] = 1 ) THEN
	//				MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
	//				RETURN
				END IF
			END IF
		END IF
	ELSEIF ( oldindex = 4 ) THEN
		w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Note()
	END IF
	// ***************************
	//This.Checked = TRUE
	w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Missed()
	
	//w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Filter_Menus('MISSED')
END IF
IF rb_required.Checked THEN
	// ***************************
	// The below code is duplicated among all submenu items
	// of Tools and Data on mnu_tour and is a segment of code
	// taken directly from w_tour.tab_tour.EVENT SelectionChanging()
	
	li_Return = 0
	oldindex = w_tour.tab_tour.SelectedTab
	IF ( oldindex = 1 ) THEN
		currentrow = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
		// Don't go through this if the current station is calculated because
		// the user went through this navigating to the station
		IF Empty(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_erd[currentrow]) THEN
			li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.AcceptText()
			lb_Modified = f_Check_If_Reading_Changed(currentrow)
			IF lb_Modified THEN
				li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE, lb_Modified)
			ELSE
				li_Return = 0
			END IF
			IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
				Close(Parent)
				RETURN
			ELSE
				w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(currentrow)
				IF ( li_Return = 1 ) AND w_tour.ib_Auto_Display_Notes_On_OOS THEN
					w_tour.tab_tour.SelectedTab = 4
					Close(Parent)
					RETURN
	//			ELSEIF ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_spec[currentrow] = 1 ) OR ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_tol[currentrow] = 1 ) THEN
	//				MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
	//				RETURN
				END IF
			END IF
		END IF
	ELSEIF ( oldindex = 4 ) THEN
		w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Note()
	END IF
	// ***************************
	//This.Checked = TRUE
	w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Required()
	
	//w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Filter_Menus('REQUIRED')
END IF
IF rb_unscanned.Checked THEN
	// ***************************
	// The below code is duplicated among all submenu items
	// of Tools and Data on mnu_tour and is a segment of code
	// taken directly from w_tour.tab_tour.EVENT SelectionChanging()
	
	li_Return = 0
	oldindex = w_tour.tab_tour.SelectedTab
	IF ( oldindex = 1 ) THEN
		currentrow = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
		// Don't go through this if the current station is calculated because
		// the user went through this navigating to the station
		IF Empty(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_erd[currentrow]) THEN
			li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.AcceptText()
			lb_Modified = f_Check_If_Reading_Changed(currentrow)
			IF lb_Modified THEN
				li_Return = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE, lb_Modified)
			ELSE
				li_Return = 0
			END IF
			IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
				Close(Parent)
				RETURN
			ELSE
				w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(currentrow)
				IF ( li_Return = 1 ) AND w_tour.ib_Auto_Display_Notes_On_OOS THEN
					w_tour.tab_tour.SelectedTab = 4
					Close(Parent)
					RETURN
	//			ELSEIF ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_spec[currentrow] = 1 ) OR ( w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_tol[currentrow] = 1 ) THEN
	//				MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
	//				RETURN
				END IF
			END IF
		END IF
	ELSEIF ( oldindex = 4 ) THEN
		w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Note()
	END IF
	// ***************************
	//This.Checked = TRUE
	w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Unscanned()
	
	//w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Filter_Menus('UNSCANNED')
END IF

Close(Parent)

//long ll_Num_Rows
////ll_Num_Rows = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Missed(ls_Filter, ls_Filter_Text)
//
//IF ( ll_Num_Rows > 0 ) THEN
//	w_tour.wf_Open_tour_Lite()
//	Close(Parent)
//END IF
end event

type st_missed from statictext within w_tour_filter
integer x = 18
integer width = 1061
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
string text = "Filter Readings"
boolean focusrectangle = false
end type

