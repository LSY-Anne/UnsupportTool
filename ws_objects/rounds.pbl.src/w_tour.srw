$PBExportHeader$w_tour.srw
forward
global type w_tour from window
end type
type tab_tour from tab within w_tour
end type
type tabpage_readings from userobject within tab_tour
end type
type r_1 from rectangle within tabpage_readings
end type
type em_2 from editmask within tabpage_readings
end type
type hpb_1 from hprogressbar within tabpage_readings
end type
type em_1 from editmask within tabpage_readings
end type
type dw_readings from datawindow within tabpage_readings
end type
type p_2 from picture within tabpage_readings
end type
type p_3 from picture within tabpage_readings
end type
type p_4 from picture within tabpage_readings
end type
type p_5 from picture within tabpage_readings
end type
type tabpage_readings from userobject within tab_tour
r_1 r_1
em_2 em_2
hpb_1 hpb_1
em_1 em_1
dw_readings dw_readings
p_2 p_2
p_3 p_3
p_4 p_4
p_5 p_5
end type
type tabpage_stations from userobject within tab_tour
end type
type st_station_description_list from statictext within tabpage_stations
end type
type st_list from statictext within tabpage_stations
end type
type dw_stations from datawindow within tabpage_stations
end type
type p_1 from picture within tabpage_stations
end type
type tabpage_stations from userobject within tab_tour
st_station_description_list st_station_description_list
st_list st_list
dw_stations dw_stations
p_1 p_1
end type
type tabpage_instructions from userobject within tab_tour
end type
type dw_alerts from datawindow within tabpage_instructions
end type
type st_station_description_instructions from statictext within tabpage_instructions
end type
type st_instructions from statictext within tabpage_instructions
end type
type tabpage_instructions from userobject within tab_tour
dw_alerts dw_alerts
st_station_description_instructions st_station_description_instructions
st_instructions st_instructions
end type
type tabpage_notes from userobject within tab_tour
end type
type st_previous_note_1 from statictext within tabpage_notes
end type
type st_current_note from statictext within tabpage_notes
end type
type mle_note_2 from multilineedit within tabpage_notes
end type
type mle_note_1 from multilineedit within tabpage_notes
end type
type st_notes from statictext within tabpage_notes
end type
type st_station_description_notes from statictext within tabpage_notes
end type
type ddlb_quick_note from dropdownlistbox within tabpage_notes
end type
type tabpage_notes from userobject within tab_tour
st_previous_note_1 st_previous_note_1
st_current_note st_current_note
mle_note_2 mle_note_2
mle_note_1 mle_note_1
st_notes st_notes
st_station_description_notes st_station_description_notes
ddlb_quick_note ddlb_quick_note
end type
type tabpage_history from userobject within tab_tour
end type
type pb_history_display from picture within tabpage_history
end type
type pb_graphics_display from picture within tabpage_history
end type
type st_history from statictext within tabpage_history
end type
type st_station_description_history from statictext within tabpage_history
end type
type st_minimum from statictext within tabpage_history
end type
type st_maximum from statictext within tabpage_history
end type
type gr_history from graph within tabpage_history
end type
type dw_history from datawindow within tabpage_history
end type
type tabpage_history from userobject within tab_tour
pb_history_display pb_history_display
pb_graphics_display pb_graphics_display
st_history st_history
st_station_description_history st_station_description_history
st_minimum st_minimum
st_maximum st_maximum
gr_history gr_history
dw_history dw_history
end type
type tabpage_multi from userobject within tab_tour
end type
type dw_multi from datawindow within tabpage_multi
end type
type st_station_description_multi from statictext within tabpage_multi
end type
type st_multi from statictext within tabpage_multi
end type
type tabpage_multi from userobject within tab_tour
dw_multi dw_multi
st_station_description_multi st_station_description_multi
st_multi st_multi
end type
type tabpage_documents from userobject within tab_tour
end type
type ddlb_temp_files from dropdownlistbox within tabpage_documents
end type
type dw_perf_docs from datawindow within tabpage_documents
end type
type st_station_description_docs from statictext within tabpage_documents
end type
type st_ref_docs from statictext within tabpage_documents
end type
type st_perf_docs from statictext within tabpage_documents
end type
type dw_ref_docs from datawindow within tabpage_documents
end type
type tabpage_documents from userobject within tab_tour
ddlb_temp_files ddlb_temp_files
dw_perf_docs dw_perf_docs
st_station_description_docs st_station_description_docs
st_ref_docs st_ref_docs
st_perf_docs st_perf_docs
dw_ref_docs dw_ref_docs
end type
type tab_tour from tab within w_tour
tabpage_readings tabpage_readings
tabpage_stations tabpage_stations
tabpage_instructions tabpage_instructions
tabpage_notes tabpage_notes
tabpage_history tabpage_history
tabpage_multi tabpage_multi
tabpage_documents tabpage_documents
end type
end forward

global type w_tour from window
string tag = "1280"
integer width = 1490
integer height = 1872
boolean titlebar = true
string title = "eSOMS Rounds1"
string menuname = "mnu_tour"
boolean controlmenu = true
boolean resizable = true
long backcolor = 32567268
string icon = "AppIcon!"
integer unitsperline = 54
integer linesperpage = 32
event ue_close_tour ( )
event ue_show_tour ( )
event ue_close_tour_pre_process ( )
event post_open ( )
tab_tour tab_tour
end type
global w_tour w_tour

type variables
//u_pyrometer				uo_pyrometer
datastore				ids_Evaluate
integer					ii_Tour_Menu_Number
string					is_Reading_Typed_In_Dropdown
string					is_History_Sort
boolean					ib_History_Graph_Visible
boolean					ib_Check_Required_Readings
boolean					ib_Enter_Key
long						il_Current_Row_For_Update_TabPages
long						il_Row_For_Navigate_To_Row_PostEvent
n_dwautowidth			in_dwaw
boolean					ib_Been_Here
boolean					ib_Changed_Tabs
boolean					ib_Auto_Display_Notes_On_OOS
boolean					ib_AbnormalReadingsRequireNote
boolean					ib_Blank_Note
string					is_Scan_filter
boolean					ib_Filtering
boolean					ib_Filter_During_Close
boolean					ib_Been_Here_RowFocusChanging
integer					il_Multi_Reading_Allowed
integer					il_Multi_Row
integer					il_Document_Row
boolean					ib_Edit_Mask
integer					il_FirstRowOnPage
integer					il_LastRowOnPage
boolean					ib_Calculated_Reading_Modified
integer					ii_Alert_Notify
string					is_ScanCode
string					is_Scan_Result
integer					ii_Scanned
boolean					ib_Hide_Scan_Screen
integer					ii_Previous_Station
boolean					ib_Initial_Open_Of_Tour
long						il_Last_Row_Scanned
string					is_Last_Record_Scan_Code
integer					ii_Last_Navigate_To_Row
datawindowchild		idwchild
end variables

forward prototypes
public subroutine wf_load_alerts ()
public subroutine wf_refresh_evaluate_ds_with_values (integer ai_reading_id)
public subroutine wf_refresh_evaluate_ds ()
public subroutine wf_open_tour_lite ()
public subroutine wf_update_counts (string as_count, string ai_count, long al_row)
public subroutine wf_open_tour ()
public subroutine wf_set_preferences ()
end prototypes

event ue_close_tour();string ls_MB_String
boolean lb_Continue
integer li_Return
integer li_Count
string ls_Sql
integer li_Num_Rows

string ls_Tour
string ls_Rev_No
string ls_Shift_Date
string ls_Shift_No

string ls_Stations
datastore lds_temp

SetPointer(HourGlass!)
li_Return = f_Prompt_To_Save_Tour()
// No readings taken - delete the tour - li_Return = 1
// Wants to save - close the tour - li_Return = 2
// Does not want to save, does not want to delete - return to the tour - li_Return = 3
// Does not want to save, wants to delete - delete the tour - li_Return = 4
CHOOSE CASE li_Return
	CASE 1, 4
		gsu_tour_parameters[gi_current_tour].tour_number = -1
		gsu_tour_parameters[gi_current_tour].filter = ''
		gsu_tour_parameters[gi_current_tour].last_location = ''
		gsu_tour_parameters[gi_current_tour].scanned_code = ''
		gsu_tour_parameters[gi_current_tour].sort_order = ''
		gsu_tour_parameters[gi_current_tour].tour_filename = ''
		gsu_tour_parameters[gi_current_tour].tour_type_id = ''
		lb_Continue = FALSE
		SetPointer(Arrow!)
		Post CLOSE(w_tour)
	CASE 2 
		lb_Continue = TRUE
	CASE 3
		lb_Continue = FALSE
END CHOOSE
IF lb_Continue THEN
	lds_temp = CREATE datastore
	
	ls_Tour = String(gsu_tour_parameters[gi_Current_Tour].Tour_Number)
	ls_Rev_No = String(gsu_tour_parameters[gi_Current_Tour].Rev_No)
	ls_Shift_Date = String(gsu_tour_parameters[gi_Current_Tour].Tour_Date, 'yyyy-mm-dd')
	ls_Shift_No = String(gsu_tour_parameters[gi_Current_Tour].Shift_No)
	
	ls_Sql = " &
	SELECT DISTINCT a.sta &
	  FROM tour_documents a, &
			 history b &
	 WHERE ( a.tour = b.tour ) &
		AND ( a.rev_no = b.rev_no ) &
		AND ( a.dt = b.dt ) &
		AND ( a.shift_no = b.shift_no ) &
		AND ( a.sta = b.sta ) &
		AND ( b.rd IS NULL ) &
		AND ( document_type = 1 ) &
		AND ( b.reading_id = 0 ) &
		AND ( a.tour = " + ls_Tour + " ) &
		AND ( a.rev_no = " + ls_Rev_No + " ) &
		AND ( a.dt = '" + ls_Shift_Date + "' ) &
		AND ( a.shift_no = " + ls_Shift_No + " ) "
	
	li_Num_Rows = f_Datastore_From_SQL(ls_Sql, lds_temp)
	FOR li_Count = 1 TO li_Num_Rows
		IF NOT Empty(ls_Stations) THEN
			ls_Stations = ls_Stations + ', '
		END IF
		ls_Stations = ls_Stations + String(lds_temp.GetItemNumber(li_Count, 1))
	NEXT
	
	DESTROY lds_temp
	
	IF NOT Empty(ls_Stations) THEN
		ls_MB_String = f_LanguageString('BLANK_READINGS_CONTINUE', "Stations '###' have blank readings and attached performance documents.  Continue?")
		ls_MB_String = StrTran(ls_MB_String, '###', ls_Stations)
		li_Return = MessageBox(f_LanguageString('WARNING', 'Warning'), ls_MB_String, Question!, YesNo!)
	ELSE
		li_Return = 1
	END IF
	
	IF ( li_Return = 1 ) THEN
		tab_tour.tabpage_readings.dw_readings.EVENT ue_close_tour()
	END IF
END IF
Post SetPointer(Arrow!)

end event

event ue_show_tour();// This is only necessary because the menu stopped displaying
// upon initial load of the application and this 
// seemed to fix it.

IF ( gsu_tour_parameters[gi_Current_Tour].SelectedTab > 0 ) THEN
	tab_tour.SelectedTab = gsu_tour_parameters[gi_Current_Tour].SelectedTab
END IF
ib_Initial_Open_Of_Tour = FALSE

mnu_tour.m_file.m_testexpression.Visible = NOT gb_Platform_Is_CE

// 10/14
This.ChangeMenu(mnu_tour)
//guo_module_specific.f_Update_Tour_Menu_Text(mnu_tour)

/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//f_Loading_Window('OPEN')
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////

//Open(w_loading)
//guo_window.uf_resize(w_loading)

//mnu_tour.m_data.m_abnormalequipment.Text = f_LanguageString('ABNORMAL_EQUIPMENT', 'Abnormal Equipment')
//mnu_tour.m_data.m_abnormalreadings.Text = f_LanguageString('VIEW_ABNORMAL_READINGS', 'View Abnormal Readings')
//mnu_tour.m_data.m_allreadings.Text = f_LanguageString('VIEW_ALL_READINGS', 'View All Readings')
//mnu_tour.m_file.m_close.Text = f_LanguageString('CLOSE', 'Close')
//mnu_tour.m_data.Text = f_LanguageString('DATA', 'Data')
//mnu_tour.m_file.Text = f_LanguageString('TOOLS', 'Tools')
//mnu_tour.m_data.m_gotofirst.Text = f_LanguageString('GO_TO_FIRST', 'Go To First')
//mnu_tour.m_data.m_gotolast.Text = f_LanguageString('GO_TO_LAST', 'Go To Last')
//mnu_tour.m_file.m_help.Text = f_LanguageString('HELP', 'Help')
//mnu_tour.m_file.m_main1.Text = f_LanguageString('MAIN', 'Main')
//mnu_tour.m_data.m_missedreadings.Text = f_LanguageString('VIEW_MISSED_READINGS', 'View Missed Readings')
//mnu_tour.m_file.m_preferences.Text = f_LanguageString('PREFERENCES', 'Preferences')
//mnu_tour.m_data.m_requiredreadings.Text = f_LanguageString('VIEW_REQUIRED_READINGS', 'View Required Readings')
//mnu_tour.m_data.m_scancode.Text = f_LanguageString('FIND_BY_SCAN_CODE', 'Find by Scan Code')
//mnu_tour.m_file.m_scratchpad.Text = f_LanguageString('SCRATCH_PAD', 'Scratch Pad')
//mnu_tour.m_file.m_testexpression.Text = f_LanguageString('TEST_EXPRESSION', 'Test Expression')
//mnu_tour.m_data.m_tourparameters.Text = f_LanguageString('TOUR_PARAMETERS', 'Tour Parameters')
//mnu_tour.m_data.m_unscannedreadings.Text = f_LanguageString('VIEW_UNSCANNED_READINGS', 'View Unscanned Readings')
//mnu_tour.m_file.m_testexpression.Visible = NOT gb_Platform_Is_CE

// 10/14
//IF IsValid(w_loading) THEN
//	Post Close(w_loading)
//END IF

/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//f_Loading_Window('CLOSE')
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////

SetPointer(Arrow!)
end event

event ue_close_tour_pre_process();IF IsValid(w_main) THEN
	gb_Final_Close = FALSE
	w_main.wf_Release_Menu(gsu_tour_parameters[gi_Current_Tour].menu_number)
	f_Update_Tour_Open(gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].rev_no, 0)
	gsu_tour_parameters[gi_current_tour].tour_number = -1
	w_main.Visible = TRUE
END IF

end event

event post_open();//int rc
//long left = 0, top = 0, right = 0, bottom = 0
//
//rc = GetDeskRect(left, top, right, bottom)
//top = PixelsToUnits(top, YPixelsToUnits!)
//This.Y = top
//
end event

public subroutine wf_load_alerts ();
end subroutine

public subroutine wf_refresh_evaluate_ds_with_values (integer ai_reading_id);IF NOT IsValid(ids_evaluate) THEN
	ids_evaluate = CREATE datastore
	ids_evaluate.DataObject = 'ds_evaluate'
	ids_evaluate.SetTransObject(SQLCA)
ELSE
	ids_evaluate.Reset()
END IF
ids_evaluate.InsertRow(0)

ids_evaluate.object.dt[1] 				= gsu_tour_parameters[gi_Current_Tour].Tour_Date
ids_evaluate.object.tour[1]			= gsu_tour_parameters[gi_Current_Tour].Tour_Number
ids_evaluate.object.rev_no[1]			= gsu_tour_parameters[gi_Current_Tour].Rev_No
ids_evaluate.object.sta[1]				= gsu_tour_parameters[gi_Current_Tour].Station
ids_evaluate.object.shift_no[1]		= gsu_tour_parameters[gi_Current_Tour].Shift_No
ids_evaluate.object.reading_id[1]	= ai_Reading_Id//gsu_tour_parameters[gi_Current_Tour].Reading_Id
ids_evaluate.object.user_id[1]		= guo_user.id
ids_evaluate.object.rd[1]				= ''
ids_evaluate.object.notes[1]			= ''
ids_evaluate.object.cdt[1]				= DateTime(Today(),Now())
ids_evaluate.object.spec[1]			= 0
ids_evaluate.object.tol[1]				= 0
ids_evaluate.object.scan[1]			= 0

end subroutine

public subroutine wf_refresh_evaluate_ds ();IF NOT IsValid(ids_evaluate) THEN
	ids_evaluate = CREATE datastore
ELSE
	ids_evaluate.Reset()
END IF
//ids_evaluate.DataObject = 'dddw_quick'
ids_evaluate.DataObject = 'ds_evaluate'
ids_evaluate.SetTransObject(SQLCA)
ids_evaluate.InsertRow(0)

ids_evaluate.object.dt[1] 				= gsu_tour_parameters[gi_Current_Tour].Tour_Date
ids_evaluate.object.tour[1]			= gsu_tour_parameters[gi_Current_Tour].Tour_Number
ids_evaluate.object.rev_no[1]			= gsu_tour_parameters[gi_Current_Tour].Rev_No
ids_evaluate.object.sta[1]				= gsu_tour_parameters[gi_Current_Tour].Station
ids_evaluate.object.shift_no[1]		= gsu_tour_parameters[gi_Current_Tour].Shift_No
//ids_evaluate.object.reading_id[1]	= ai_Reading_Id//gsu_tour_parameters[gi_Current_Tour].Reading_Id
ids_evaluate.object.user_id[1]		= guo_user.id
ids_evaluate.object.rd[1]				= ''
ids_evaluate.object.notes[1]			= ''
ids_evaluate.object.cdt[1]				= DateTime(Today(),Now())
ids_evaluate.object.spec[1]			= 0
ids_evaluate.object.tol[1]				= 0
ids_evaluate.object.scan[1]			= 0

end subroutine

public subroutine wf_open_tour_lite ();integer li_Return

li_Return = tab_tour.tabpage_readings.dw_readings.SetTransObject(SQLCA)
ib_Check_Required_Readings = ( Upper(f_ProfileString(gs_Module_Id, 'CHECKREQUIREDREADINGS', 'Yes')) = 'YES' )
ib_Auto_Display_Notes_On_OOS = ( Upper(f_ProfileString(gs_Module_Id, 'AUTO_DISPLAY_NOTES_ON_OOS', 'No')) = 'YES' )
ib_AbnormalReadingsRequireNote = ( Upper(f_ProfileString(gs_Module_Id, 'AbnormalReadingsRequireNote', 'No')) = 'YES' )
IF ( gsu_tour_parameters[gi_Current_Tour].SelectedTab > 0 ) THEN
	tab_tour.SelectedTab = gsu_tour_parameters[gi_Current_Tour].SelectedTab
END IF
w_tour.Visible = TRUE
w_main.Visible = FALSE
end subroutine

public subroutine wf_update_counts (string as_count, string ai_count, long al_row);integer li_Count

// ai_Count will be in the form of +1 or -1 in order to increment the count or decrement for as_Count.
// This function merely does the addition in the datawindow for the given row and is called
// anywhere the three are added or deleted.

IF ( al_Row > 0 ) THEN
	CHOOSE CASE as_Count
		CASE 'DOC'
			IF ( ai_Count = '+1' ) OR ( ai_Count = '-1' ) THEN
				li_Count = tab_tour.tabpage_readings.dw_readings.GetItemNumber(al_Row, 'history_perf_doc_count')
				tab_tour.tabpage_readings.dw_readings.Object.history_perf_doc_count[al_Row] = li_Count + Integer(ai_Count)
			ELSE
				tab_tour.tabpage_readings.dw_readings.Object.history_perf_doc_count[al_Row] = Integer(ai_Count)
			END IF
		CASE 'MULTI'
			IF ( ai_Count = '+1' ) OR ( ai_Count = '-1' ) THEN
				li_Count = tab_tour.tabpage_readings.dw_readings.GetItemNumber(al_Row, 'history_multi_count')
				tab_tour.tabpage_readings.dw_readings.Object.history_multi_count[al_Row] = li_Count + Integer(ai_Count)
			ELSE
				tab_tour.tabpage_readings.dw_readings.Object.history_multi_count[al_Row] = Integer(ai_Count)
			END IF
		CASE 'ALERT'
			IF ( ai_Count = '+1' ) OR ( ai_Count = '-1' ) THEN
				li_Count = tab_tour.tabpage_readings.dw_readings.GetItemNumber(al_Row, 'history_alert_count')
				tab_tour.tabpage_readings.dw_readings.Object.history_alert_count[al_Row] = li_Count + Integer(ai_Count)
			ELSE
				tab_tour.tabpage_readings.dw_readings.Object.history_alert_count[al_Row] = Integer(ai_Count)
			END IF
	END CHOOSE
END IF
end subroutine

public subroutine wf_open_tour ();integer li_Tour
integer li_Rev_No
integer li_Tour_Exists
integer li_Shift_No
date ld_Tour_Date
long ll_Num_Rows
integer li_Station
long ll_Row

SetPointer(HourGlass!)

wf_Refresh_Evaluate_DS()
ib_Check_Required_Readings = ( Upper(f_ProfileString(gs_Module_Id, 'CHECKREQUIREDREADINGS', 'Yes')) = 'YES' )
ib_Auto_Display_Notes_On_OOS = ( Upper(f_ProfileString(gs_Module_Id, 'AUTO_DISPLAY_NOTES_ON_OOS', 'No')) = 'YES' )
ib_AbnormalReadingsRequireNote = ( Upper(f_ProfileString(gs_Module_Id, 'AbnormalReadingsRequireNote', 'No')) = 'YES' )
//ls_Tour_Filename = gsu_tour_parameters[gi_Current_Tour].tour_filename
li_Tour = gsu_tour_parameters[gi_Current_Tour].tour_number
li_Rev_No = gsu_tour_parameters[gi_Current_Tour].rev_no

SELECT COUNT(*) 
  INTO :li_Tour_Exists 
  FROM tour 
 WHERE ( tour = :li_Tour ) 
   AND ( rev_no = :li_rev_no ) ;

IF ( li_Tour_Exists > 0 ) THEN
	ld_Tour_Date = gsu_tour_parameters[gi_Current_Tour].tour_date
	li_Shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no
	li_Station = gsu_tour_parameters[gi_Current_Tour].station
	ii_Tour_Menu_Number = gsu_tour_parameters[gi_Current_Tour].menu_number

	f_Update_Tour_Open(li_Tour, li_Rev_No, 1)

	tab_tour.tabpage_readings.dw_readings.EVENT ue_Insert_New_Shift(li_Tour, li_Rev_No, li_Shift_No, ld_Tour_Date)
	IF NOT IsNumber(String(li_Station)) THEN
		ib_Initial_Open_Of_Tour = TRUE
	ELSE
		ib_Initial_Open_Of_Tour = FALSE
	END IF
	ll_Num_Rows = tab_tour.tabpage_readings.dw_readings.EVENT ue_Retrieve()

	IF NOT Empty(gsu_tour_parameters[gi_Current_Tour].Filter) THEN
		CHOOSE CASE gsu_tour_parameters[gi_Current_Tour].Filter
			CASE 'REQUIRED'
				tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Required()
			CASE 'ABNORMAL'
				tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Abnormal()
			CASE 'MISSED'
				tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Missed()
		END CHOOSE
	END IF
	
	ll_Row = tab_tour.tabpage_readings.dw_readings.Find(' station_sta = ' + String(li_Station), 1, tab_tour.tabpage_readings.dw_readings.RowCount() + 1)
	IF ( ll_Row > 0 ) THEN
		il_Current_Row_For_Update_TabPages = ll_Row
		il_Row_For_Navigate_To_Row_PostEvent = ll_Row
		tab_tour.tabpage_readings.dw_readings.PostEvent("ue_navigate_to_row", 0, ll_Row)
	END IF
	IF ( gsu_tour_parameters[gi_Current_Tour].SelectedTab > 0 ) THEN
		tab_tour.SelectedTab = gsu_tour_parameters[gi_Current_Tour].SelectedTab
	END IF
	ib_Initial_Open_Of_Tour = FALSE
	w_tour.Visible = TRUE
	w_main.Visible = FALSE
ELSE
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_TOUR_DOES_NOT_EXIST_IN_THE_CURRENT_DATABASE.', 'The tour does not exist in the current database.'), Exclamation!)
	w_main.Visible = TRUE
	w_tour.Visible = FALSE
END IF
SetPointer(Arrow!)

end subroutine

public subroutine wf_set_preferences ();tab_tour.tabpage_readings.dw_readings.Modify("station_minimum_t.color='0~tIf(history_spec=1,RGB(255, 0, 0),0)'")
tab_tour.tabpage_readings.dw_readings.Modify("station_maximum_t.color='0~tIf(history_spec=1,RGB(255, 0, 0),0)'")
tab_tour.tabpage_readings.dw_readings.Modify("station_tolerance_t.color='0~tIf(history_tol=1,RGB(255, 0, 0),0)'")
tab_tour.tabpage_readings.dw_readings.Modify("history_rd_t.color='0~tIf((history_spec=1) OR (history_tol=1),RGB(255, 0, 0),0)'")

// vvv IUSCQ00199838 2010-10-25 RPR
tab_tour.tabpage_readings.dw_readings.Modify("history_rd.color='0~tIf((history_spec=1) OR (history_tol=1),RGB(255, 0, 0),0)'")
tab_tour.tabpage_readings.dw_readings.Modify("history_rd.color='0~tIf((history_spec=1) OR (history_tol=1),RGB(255, 0, 0),0)'")
// ^^ IUSCQ00199838 2010-10-25 RPR

//tab_tour.tabpage_readings.dw_readings.Modify("station_minimum_t.font.weight='0~tIf(history_spec=1,700,400)'")
//tab_tour.tabpage_readings.dw_readings.Modify("station_maximum_t.font.weight='0~tIf(history_spec=1,700,400)'")
//tab_tour.tabpage_readings.dw_readings.Modify("station_tolerance_t.font.weight='0~tIf(history_tol=1,700,400)'")
//tab_tour.tabpage_readings.dw_readings.Modify("history_rd_t.font.weight='0~tIf((history_spec=1) OR (history_tol=1),700,400)'")

//string ls_oos_color,ls_oot_color,ls_note_color,ls_both_color,ls_rd_color
//string ls_oos_bold,ls_oot_bold,ls_both_bold
//string ls_oos_underline,ls_oot_underline,ls_both_underline,ls_underline_string
//string ls_oos_italic,ls_oot_italic,ls_both_italic,ls_italic_string
//
//ls_oos_color		= f_ProfileString(gs_Module_Id, 'AbnormalReadingsOOSColor','255')
//ls_oot_color		= f_ProfileString(gs_Module_Id, "AbnormalReadingsOOTColor","255")
//ls_note_color		= f_ProfileString(gs_Module_Id, "AbnormalReadingsNoteColor","255")
//ls_both_color		= f_ProfileString(gs_Module_Id, "AbnormalReadingsBOTHColor","255")
//
//ls_oos_underline	= f_ProfileString(gs_Module_Id, "AbnormalReadingsOOSUnderline","Yes")
//ls_oot_underline	= f_ProfileString(gs_Module_Id, "AbnormalReadingsOOTUnderline","No")
//ls_both_underline	= f_ProfileString(gs_Module_Id, "AbnormalReadingsBOTHUnderline","Yes")
//
//ls_oos_italic		= f_ProfileString(gs_Module_Id, "AbnormalReadingsOOSItalic","No")
//ls_oot_italic		= f_ProfileString(gs_Module_Id, "AbnormalReadingsOOTItalic","Yes")
//ls_both_italic		= f_ProfileString(gs_Module_Id, "AbnormalReadingsBOTHItalic","Yes")
//
//IF Upper(ls_oos_underline) = 'YES' THEN
//	ls_oos_underline	= '1'
//ELSE
//	ls_oos_underline	= '0'
//END IF
//
//IF Upper(ls_oot_underline) = 'YES' THEN
//	ls_oot_underline	= '1'
//ELSE
//	ls_oot_underline	= '0'
//END IF
//
//IF Upper(ls_both_underline) = 'YES' THEN
//	ls_both_underline	= '1'
//ELSE
//	ls_both_underline	= '0'
//END IF
//
//IF Upper(ls_oos_italic) = 'YES' THEN
//	ls_oos_italic	= '1'
//ELSE
//	ls_oos_italic	= '0'
//END IF
//
//IF Upper(ls_oot_italic) = 'YES' THEN
//	ls_oot_italic	= '1'
//ELSE
//	ls_oot_italic	= '0'
//END IF
//
//IF Upper(ls_both_italic) = 'YES' THEN
//	ls_both_italic	= '1'
//ELSE
//	ls_both_italic	= '0'
//END IF
//
//ls_rd_color		= "'if(history_spec=1,if(history_tol=1,"+ls_both_color+","+ls_oot_color+"),"+ls_oos_color+")'"
//
////tab_tour.tabpage_readings.dw_readings.object.notes.color	= f_ProfileString(gs_Module_Id, "AbnormalReadingsNoteColor","16711680")
//tab_tour.tabpage_readings.dw_readings.object.station_minimum_t.color	= ls_oos_color
//tab_tour.tabpage_readings.dw_readings.object.station_maximum_t.color	= ls_oos_color
////tab_tour.tabpage_readings.dw_readings.object.st_and.color	= ls_both_color
//tab_tour.tabpage_readings.dw_readings.object.station_tolerance_t.color	= ls_oot_color
//tab_tour.tabpage_readings.dw_readings.Modify("history_rd.color='0~tIf(history_spec=1,if(history_tol=1,"+ls_both_color+","+ls_oos_color+"),if(history_tol=1,"+ls_oot_color+",0))'")
//tab_tour.tabpage_readings.dw_readings.Modify("compute_rd.color='0~tIf(history_spec=1,if(history_tol=1,"+ls_both_color+","+ls_oos_color+"),if(history_tol=1,"+ls_oot_color+",0))'")
//
//tab_tour.tabpage_readings.dw_readings.object.station_minimum_t.font.Italic	= Integer(ls_oos_italic)
//tab_tour.tabpage_readings.dw_readings.object.station_maximum_t.font.Italic	= Integer(ls_oos_italic)
////tab_tour.tabpage_readings.dw_readings.object.st_and.font.Italic	= Integer(ls_both_italic)
//tab_tour.tabpage_readings.dw_readings.object.station_tolerance_t.font.Italic	= Integer(ls_oot_italic)
//tab_tour.tabpage_readings.dw_readings.Modify("history_rd.font.italic='0~tIf(history_spec=1,if(history_tol=1,"+ls_both_italic+","+ls_oos_italic+"),if(history_tol=1,"+ls_oot_italic+",0))'")
//tab_tour.tabpage_readings.dw_readings.Modify("compute_rd.font.italic='0~tIf(history_spec=1,if(history_tol=1,"+ls_both_italic+","+ls_oos_italic+"),if(history_tol=1,"+ls_oot_italic+",0))'")
//
//tab_tour.tabpage_readings.dw_readings.object.station_minimum_t.font.Underline	= Integer(ls_oos_underline)
//tab_tour.tabpage_readings.dw_readings.object.station_maximum_t.font.Underline	= Integer(ls_oos_underline)
////tab_tour.tabpage_readings.dw_readings.object.st_and.font.Underline	= Integer(ls_both_underline)
//tab_tour.tabpage_readings.dw_readings.object.station_tolerance_t.font.Underline	= Integer(ls_oot_underline)
//tab_tour.tabpage_readings.dw_readings.Modify("history_rd.font.underline='0~tIf(history_spec=1,if(history_tol=1,"+ls_both_underline+","+ls_oos_underline+"),if(history_tol=1,"+ls_oot_underline+",0))'")
//tab_tour.tabpage_readings.dw_readings.Modify("compute_rd.font.underline='0~tIf(history_spec=1,if(history_tol=1,"+ls_both_underline+","+ls_oos_underline+"),if(history_tol=1,"+ls_oot_underline+",0))'")
//
//IF Upper(f_ProfileString(gs_Module_Id, "AbnormalReadingsOOSBold","YES")) = "YES" THEN
//	tab_tour.tabpage_readings.dw_readings.object.station_minimum_t.font.weight	= 700
//	tab_tour.tabpage_readings.dw_readings.object.station_maximum_t.font.weight	= 700
//ELSE
//	tab_tour.tabpage_readings.dw_readings.object.station_minimum_t.font.weight	= 400
//	tab_tour.tabpage_readings.dw_readings.object.station_maximum_t.font.weight	= 400
//END IF
//ls_oos_bold	= String(tab_tour.tabpage_readings.dw_readings.object.station_minimum_t.font.weight)
//
//IF Upper(f_ProfileString(gs_Module_Id, "AbnormalReadingsOOTBold","YES")) = "YES" THEN
//	tab_tour.tabpage_readings.dw_readings.object.station_tolerance_t.font.weight	= 700
//ELSE
//	tab_tour.tabpage_readings.dw_readings.object.station_tolerance_t.font.weight	= 400
//END IF
//ls_oot_bold = String(tab_tour.tabpage_readings.dw_readings.object.station_tolerance_t.font.weight)
//
//IF Upper(f_ProfileString(gs_Module_Id, "AbnormalReadingsBOTHBold","YES")) = "YES" THEN
////	tab_tour.tabpage_readings.dw_readings.object.st_and.font.weight	= 700
//	ls_both_bold = '700'
//ELSE
////	tab_tour.tabpage_readings.dw_readings.object.st_and.font.weight	= 400
//	ls_both_bold = '400'
//END IF
////ls_both_bold = String(tab_tour.tabpage_readings.dw_readings.object.st_and.font.weight)
//
//tab_tour.tabpage_readings.dw_readings.Modify("history_rd.font.weight='400~tIf(history_spec=1,if(history_tol=1,"+ls_both_bold+","+ls_oos_bold+"),if(history_tol=1,"+ls_oot_bold+",400))'")
//tab_tour.tabpage_readings.dw_readings.Modify("compute_rd.font.weight='400~tIf(history_spec=1,if(history_tol=1,"+ls_both_bold+","+ls_oos_bold+"),if(history_tol=1,"+ls_oot_bold+",400))'")
end subroutine

on w_tour.create
if this.MenuName = "mnu_tour" then this.MenuID = create mnu_tour
this.tab_tour=create tab_tour
this.Control[]={this.tab_tour}
end on

on w_tour.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.tab_tour)
end on

event open;
string ls = ''
ls =  ls+ '~r~n' + '1 - ' + string(cpu())

guo_window.Post uf_Resize(w_tour)
//guo_window.Post uf_Reposition(This)

ls =  ls+ '~r~n' + '2 - ' + string(cpu())

string ls_Message
integer li_Tour
integer li_Rev_No
string ls_Tour_Type_Id
date ld_Tour_Date
integer li_Shift_No
integer li_Num_Rows
integer li_Count
long ll_Num_Rows

This.Title = gs_Window_Title
SetPointer(HourGlass!)

// 10/14
/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//f_Loading_Window('OPEN')
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
	
//Open(w_loading)
//guo_window.uf_resize(w_loading)
ls =  ls+ '~r~n' + '3 - ' + string(cpu())

li_Tour = gsu_tour_parameters[gi_Current_Tour].tour_number
li_Rev_No = gsu_tour_parameters[gi_Current_Tour].rev_no
ls_Tour_Type_Id = gsu_tour_parameters[gi_Current_Tour].tour_type_id
ld_Tour_Date = gsu_tour_parameters[gi_Current_Tour].tour_date
li_Shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no
ii_Tour_Menu_Number = gsu_tour_parameters[gi_Current_Tour].menu_number

//uo_pyrometer.uf_Set_Interface(li_tour, li_Rev_No)
ls =  ls+ '~r~n' + '4 - ' + string(cpu())
//messagebox('', 1)
//This.SetRedraw(FALSE)

//This.Event ue_show_tour()

is_History_Sort = Upper(ProfileString(gs_INI_File, gs_Window_Title, 'HISTORY_GRAPH_ORDER', Upper(f_LanguageString('ASC', 'Asc'))))
ib_Check_Required_Readings = ( Upper(f_ProfileString(gs_Module_Id, 'CHECKREQUIREDREADINGS', 'Yes')) = 'YES' )
ib_Auto_Display_Notes_On_OOS = ( Upper(f_ProfileString(gs_Module_Id, 'AUTO_DISPLAY_NOTES_ON_OOS', 'No')) = 'YES' )
ib_AbnormalReadingsRequireNote = ( Upper(f_ProfileString(gs_Module_Id, 'AbnormalReadingsRequireNote', 'No')) = 'YES' )
ls =  ls+ '~r~n' + '5 - ' + string(cpu())
//messagebox('', 2)
//[NPTS]
//tab_tour.tabpage_readings.pb_landcyclops.Visible = FALSE
tab_tour.tabpage_readings.p_2.PictureName= 'bitmaps\calculator.jpg'

ib_History_Graph_Visible = FALSE

wf_Refresh_Evaluate_DS()
ls =  ls+ '~r~n' + '6 - ' + string(cpu())
//messagebox('', 3)

tab_tour.tabpage_readings.dw_readings.EVENT ue_Insert_New_Shift(li_Tour, li_Rev_No, li_Shift_No, ld_Tour_Date)

f_Update_Tour_Open(li_Tour, li_Rev_No, 1)
ls =  ls+ '~r~n' + '7 - ' + string(cpu())
//messagebox('', 4)

wf_Set_Preferences()
ls =  ls+ '~r~n' + '8 - ' + string(cpu())
//messagebox('', 5)

ib_Initial_Open_Of_Tour = TRUE
ll_Num_Rows = tab_tour.tabpage_readings.dw_readings.EVENT ue_Retrieve()
//MessageBox('1.1', String(tab_tour.tabpage_readings.dw_readings.Object.history_rd[1]))
ls =  ls+ '~r~n' + '81 - ' + string(cpu())
// 2005-11-07 This is in place because if the first station
// required scanning, then the keyboard would display
// on top of w_scanning and w_scanning appears before
// the completion of w_tour's open event.  See the same
// comment at the top of this event.
f_Update_User_Preferences()
ls =  ls+ '~r~n' + '9 - ' + string(cpu())
//messagebox('', 6)

IF NOT Empty(gsu_tour_parameters[gi_Current_Tour].Filter) THEN
	CHOOSE CASE gsu_tour_parameters[gi_Current_Tour].Filter
		CASE 'REQUIRED'
			tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Required()
		CASE 'ABNORMAL'
			tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Abnormal()
		CASE 'MISSED'
			tab_tour.tabpage_readings.dw_readings.EVENT ue_Filter_For_Missed()
	END CHOOSE
END IF
ls =  ls+ '~r~n' + '10 - ' + string(cpu())
//messagebox('', 7)

tab_tour.tabpage_instructions.dw_alerts.Object.alert_description_t.Text = f_LanguageString('DESCRIPTION', 'Description')
tab_tour.tabpage_instructions.dw_alerts.Object.alert_expression_t.Text = f_LanguageString('EXPRESSION', 'Expression')
tab_tour.tabpage_instructions.dw_alerts.Object.alert_text_t.Text = f_LanguageString('TEXT', 'Text')

string ls_Error
ls_Error = tab_tour.tabpage_readings.dw_readings.Modify("compute_1.Expression = 'If( station_reading_required = 1, ~"" + f_LanguageString('REQUIRED', 'Required') + "~" , ~"~")'")
tab_tour.tabpage_readings.dw_readings.Object.filter_t.Text = f_LanguageString('<ALL_READINGS>', '<All Readings>')
tab_tour.tabpage_readings.dw_readings.Object.history_rd_t.Text = f_LanguageString('CURRENT_READING', 'Current Reading')
tab_tour.tabpage_readings.dw_readings.Object.prev_t.Text = f_LanguageString('PREVIOUS_READING', 'Previous Reading')
tab_tour.tabpage_readings.dw_readings.Object.station_maximum_t.Text = f_LanguageString('MAX', 'Max')
tab_tour.tabpage_readings.dw_readings.Object.station_minimum_t.Text = f_LanguageString('MIN', 'Min')
tab_tour.tabpage_readings.dw_readings.Object.station_tolerance_t.Text = f_LanguageString('TOL', 'Tol')
tab_tour.tabpage_readings.dw_readings.Object.station_units_t.Text = f_LanguageString('UNITS', 'Units')

tab_tour.tabpage_multi.dw_multi.Object.history_cdt_t.Text = f_LanguageString('DATE/TIME', 'Date/Time')
tab_tour.tabpage_multi.dw_multi.Object.history_notes_t.Text = f_LanguageString('NOTES', 'Notes')
tab_tour.tabpage_multi.dw_multi.Object.history_rd_t.Text = f_LanguageString('READING', 'Reading')
tab_tour.tabpage_multi.dw_multi.Object.history_spec_t.Text = f_LanguageString('OOS', 'OOS')
tab_tour.tabpage_multi.dw_multi.Object.history_tol_t.Text = f_LanguageString('OOT', 'OOT')

tab_tour.tabpage_documents.dw_perf_docs.Object.document_description_t.Text = f_LanguageString('DESCRIPTION', 'Description')
tab_tour.tabpage_documents.dw_perf_docs.Object.document_filename_t.Text = f_LanguageString('FILENAME', 'Filename')
tab_tour.tabpage_documents.dw_ref_docs.Object.document_description_t.Text = f_LanguageString('DESCRIPTION', 'Description')
tab_tour.tabpage_documents.dw_ref_docs.Object.document_filename_t.Text = f_LanguageString('FILENAME', 'Filename')

tab_tour.tabpage_history.dw_history.Object.dt_t.Text = f_LanguageString('DATE', 'Date')
tab_tour.tabpage_history.dw_history.Object.rd_t.Text = f_LanguageString('READING', 'Reading')
tab_tour.tabpage_history.dw_history.Object.shift_no_t.Text = f_LanguageString('SHIFT', 'Shift')
tab_tour.tabpage_history.st_minimum.Text = f_LanguageString('MINIMUM', 'Minimum')
tab_tour.tabpage_history.st_maximum.Text = f_LanguageString('MAXIMUM', 'Maximum')

tab_tour.tabpage_readings.Text = f_LanguageString('TABPAGE_READ', ' Read ')
tab_tour.tabpage_stations.Text = f_LanguageString('TABPAGE_STATIONS', ' List ')
tab_tour.tabpage_instructions.Text = f_LanguageString('TABPAGE_INSTRUCTIONS', 'Alert')
tab_tour.tabpage_notes.Text = f_LanguageString('TABPAGE_NOTES', 'Note')
tab_tour.tabpage_history.Text = f_LanguageString('TABPAGE_HISTORY', ' Hist ')
tab_tour.tabpage_multi.Text = f_LanguageString('TABPAGE_MULTI', 'Multi')
tab_tour.tabpage_documents.Text = f_LanguageString('TABPAGE_DOCUMENTS', ' Docs ')

tab_tour.tabpage_documents.st_perf_docs.Text = f_LanguageString('TAB_DOCS_PERFORMANCE_DOCS:', 'Performance Docs:')
tab_tour.tabpage_documents.st_ref_docs.Text = f_LanguageString('TAB_DOCS_REFERENCE_DOCS:', 'Reference Docs:')
tab_tour.tabpage_multi.st_multi.Text = f_LanguageString('TAB_MULTI_TOP', 'Multi-Reading')
tab_tour.tabpage_history.st_history.Text = f_LanguageString('TAB_HISTORY_TOP', 'History')
tab_tour.tabpage_notes.st_notes.Text = f_LanguageString('TAB_NOTES_TOP', 'Notes')
tab_tour.tabpage_instructions.st_instructions.Text = f_LanguageString('TAB_INSTRUCTIONS_TOP', 'Alerts')
tab_tour.tabpage_stations.st_list.Text = f_LanguageString('TAB_STATIONS_TOP', 'List View')

tab_tour.tabpage_notes.st_current_note.Text = f_LanguageString('CURRENT_NOTE:', 'Current Note:')
tab_tour.tabpage_notes.st_previous_note_1.Text = f_LanguageString('PREVIOUS_NOTE:', 'Previous Note:')

//messagebox('', 8)
ls =  ls+ '~r~n' + '11 - ' + string(cpu())
SetPointer(Arrow!)

This.Event ue_show_tour()
ls =  ls+ '~r~n' + '12 - ' + string(cpu())
// 10/14
//Sleep(1)
//IF IsValid(w_loading) THEN
//	Post Close(w_loading)
//END IF
/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//f_Loading_Window('CLOSE')
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
	
ls =  ls+ '~r~n' + '13 - ' + string(cpu())
//messagebox('', ls)
//messagebox('', 9)

//This.SetRedraw(TRUE)

//This.Post EVENT Post_Open()



end event

event close;gl_X = This.X
gl_Y = This.Y
f_Release_Buttons()
This.EVENT ue_Close_Tour_Pre_Process()

DESTROY ids_evaluate

//uo_pyrometer.uf_Close_LANDCyclops()

end event

event key;ulong lul_wparam

IF gb_Use_Navigation_Arrows THEN
	lul_wparam = Integer(Message.WordParm)
	SetNull(Message.WordParm)
	CHOOSE CASE lul_wparam
		CASE 37 // Left arrow
			ib_Changed_Tabs = TRUE
			IF ( tab_tour.SelectedTab > 1 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab - 1
			END IF
		CASE 38 // Up arrow
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(-1, 'w_tour key 38')
			tab_tour.tabpage_readings.dw_readings.Post EVENT ue_Navigate_To_Row(-1, 'w_tour key 38')
		CASE 39 // Right arrow
			ib_Changed_Tabs = TRUE
			IF ( tab_tour.SelectedTab < 7 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab + 1
			END IF
		CASE 40 // Down arrow
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(1, 'w_tour key 40')
			tab_tour.tabpage_readings.dw_readings.Post EVENT ue_Navigate_To_Row(1, 'w_tour key 40')
		CASE 13//, 197//, 134 // Enter button or Action button on Intermec
			tab_tour.tabpage_readings.dw_readings.EVENT ue_Enter_Button()
		CASE gi_Hardware_Button
// Standard PocketPC devices' hardware buttons respond to this key event
// Symbol MC9060 devices' red/green buttons respond to the "other" event
			CHOOSE CASE gs_Hardware_Button_Action
				CASE 'ENTER'
					tab_tour.tabpage_readings.dw_readings.EVENT ue_Enter_Button()
				CASE 'FIND BY SCAN'
					mnu_tour m_temp
					
					m_temp = This.menuid
					m_temp.m_data.m_scancode.EVENT Clicked()
			END CHOOSE
		CASE gi_Hardware_Button_2 //2009-05-19 Adding support for 2nd hardware button
			CHOOSE CASE gs_Hardware_Button_2_Action
				CASE 'ENTER'
					tab_tour.tabpage_readings.dw_readings.EVENT ue_Enter_Button()
				CASE 'FIND BY SCAN'
					mnu_tour m_temp2
					
					m_temp2 = This.menuid
					m_temp2.m_data.m_scancode.EVENT Clicked()
			END CHOOSE
	END CHOOSE
END IF
end event

event activate;This.X = gl_X
This.Y = gl_Y

end event

event show;
end event

event timer;//tab_tour.tabpage_stations.dw_stations.Event ue_Evaluate()
tab_tour.tabpage_stations.dw_stations.PostEvent('ue_Evaluate')
end event

event other;//[NPTS]
// Respond to help from Start->Help menu of the device
IF ( Message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
//ELSEIF ( Message.Number = uo_pyrometer.WM_COPYDATA ) THEN
//	// Only allow pyrometer input when readings tab has focus
//	integer li_Row
//	string ls_ScanCode
//	string ls_Reading
//	long ll_NTR_Row
//	li_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
//	ls_ScanCode = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, "station_scan")
//	IF ( tab_tour.SelectedTab = 1 ) AND ( TRIM(UPPER(ls_Scancode)) = 'LANDCYCLOPS' ) THEN
////		ll_NTR_Row = ii_Last_Navigate_To_Row
//		ls_Reading = uo_pyrometer.uf_Process_Pyrometer()
//		IF NOT Empty(ls_Reading) THEN
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Reading(li_Row, ls_Reading, Datetime(Today(), Now()), guo_user.ID)
////			IF ( ll_NTR_Row = 0 ) THEN
//				ll_NTR_Row = 1
////			END IF
//
//			tab_tour.tabpage_readings.dw_readings.Post EVENT ue_Navigate_To_Row(ll_NTR_Row, 'ue_enter_button')
//		END IF
//	ELSEIF ( tab_tour.SelectedTab = 1 ) AND ( MID(TRIM(UPPER(ls_Scancode)), 1, 7) = 'IQMETER' ) THEN
////		ll_NTR_Row = ii_Last_Navigate_To_Row
//		ls_Reading = uo_pyrometer.uf_Process_IQMeter()
//		IF NOT Empty(ls_Reading) THEN
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Reading(li_Row, ls_Reading, Datetime(Today(), Now()), guo_user.ID)
////			IF ( ll_NTR_Row = 0 ) THEN
//				ll_NTR_Row = 1
////			END IF
//			tab_tour.tabpage_readings.dw_readings.Post EVENT ue_Navigate_To_Row(ll_NTR_Row, 'ue_enter_button')
//		END IF
//	END IF
ELSEIF ( Message.WordParm = gi_Hardware_Button ) THEN
	CHOOSE CASE gs_Hardware_Button_Action
		CASE 'ENTER'
			// 2006-12-07 - Commented out until further notice
			// On the Symbol MC9060 from CPC, the first ue_Enter_Button is performed
			// followed immediately by what appears to be another call to it but
			// placing messageboxes in the related events does NOT trigger the
			// messageboxes to be fired - odd
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Enter_Button()
		CASE 'FIND BY SCAN'
			f_Scancode(0)
	END CHOOSE
ELSEIF ( Message.WordParm = gi_Hardware_Button_2 ) THEN //2009-05-19
	CHOOSE CASE gs_Hardware_Button_2_Action
		CASE 'ENTER'
			// 2006-12-07 - Commented out until further notice
			// On the Symbol MC9060 from CPC, the first ue_Enter_Button is performed
			// followed immediately by what appears to be another call to it but
			// placing messageboxes in the related events does NOT trigger the
			// messageboxes to be fired - odd
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Enter_Button()
		CASE 'FIND BY SCAN'
			f_Scancode(0)
	END CHOOSE
END IF

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type tab_tour from tab within w_tour
event ue_history_display ( )
event ue_hide_scrollbar ( )
event ue_show_scrollbar ( )
event ue_update_notes_tab ( long al_current_row )
event type integer ue_update_reading_or_note ( integer oldindex )
string tag = "1072"
integer width = 1467
integer height = 1700
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 32567268
boolean fixedwidth = true
boolean raggedright = true
boolean showpicture = false
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_readings tabpage_readings
tabpage_stations tabpage_stations
tabpage_instructions tabpage_instructions
tabpage_notes tabpage_notes
tabpage_history tabpage_history
tabpage_multi tabpage_multi
tabpage_documents tabpage_documents
end type

event ue_history_display();long ll_Row

tabpage_history.dw_history.Visible = NOT ib_History_Graph_Visible
tabpage_history.gr_history.Visible = ib_History_Graph_Visible
tabpage_history.st_minimum.Visible = ib_History_Graph_Visible
tabpage_history.st_maximum.Visible = ib_History_Graph_Visible
IF ib_History_Graph_Visible THEN
	tabpage_history.gr_history.BringToTop = FALSE
////	tabpage_history.gr_history.PostEvent('Focus')
//	tabpage_history.pb_history_display.PictureName = GetCurrentDirectory() + "\Bitmaps\Table.bmp"
//ELSE
////	tabpage_history.dw_history.PostEvent('Focus')
//	tabpage_history.pb_history_display.PictureName = GetCurrentDirectory() + "\Bitmaps\Graph.bmp"
END IF

ll_Row = tabpage_readings.dw_readings.GetRow()
IF ( ll_Row > 0 ) THEN
	tabpage_history.st_station_description_history.Text = f_Ellipsis(tabpage_readings.dw_readings.Object.station_description[ll_Row], tabpage_history.st_station_description_history.Width, TRUE)
//	tabpage_history.st_station_description_history.Text = f_Ellipsis(tabpage_readings.dw_readings.Object.station_description[ll_Row], UnitsToPixels(tabpage_history.st_station_description_history.Width, XUnitsToPixels!), TRUE)
ELSE
	tabpage_history.st_station_description_history.Text = ''
END IF

end event

event ue_hide_scrollbar();//w_tour.VScrollBar = FALSE

end event

event ue_show_scrollbar();//w_tour.VScrollBar = TRUE

end event

event ue_update_notes_tab(long al_current_row);string ls_Sql
long ll_Num_Rows
long ll_Count
string ls_Note_Desc
string ls_Note
string ls_Shift
string ls_Previous_Notes
string ls_date
string ls_CRLF
integer li_Shift_No
boolean lb_Been_Here
datastore lds_temp, lds_temp_2, lds_temp_3

ls_CRLF = CHAR(13) + CHAR(10)
lds_temp = CREATE datastore
lds_temp_2 = CREATE datastore
lds_temp_3 = CREATE datastore

// Load quick notes
ls_Sql = " &
SELECT note_desc &
  FROM quick_notes &
 WHERE ( tour = " + string(gsu_tour_parameters[gi_Current_Tour].tour_number) + " ) &
	AND ( rev_no = " + string(gsu_tour_parameters[gi_Current_Tour].rev_no) + " ) &
	AND ( sta = " + string(gsu_tour_parameters[gi_Current_Tour].station) + " ) &
ORDER BY note_desc "
		
tabpage_notes.ddlb_quick_note.Reset()
ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
FOR ll_Count = 1 TO ll_Num_Rows
	ls_Note_Desc = lds_temp.GetItemString(ll_Count, 1)
	tabpage_notes.ddlb_quick_note.AddItem(ls_Note_Desc)
NEXT
		
lds_temp.Reset()
DESTROY lds_temp

// Load current note
ls_Sql = " &
	SELECT notes &
	  FROM history &
     WHERE ( tour = " + string(gsu_tour_parameters[gi_Current_Tour].tour_number) + " ) &
/*		AND ( rev_no = " + string(gsu_tour_parameters[gi_Current_Tour].rev_no) + " ) */&
		AND ( sta = " + string(gsu_tour_parameters[gi_Current_Tour].station) + " ) &
		AND ( dt = '" + string(gsu_tour_parameters[gi_Current_Tour].tour_date, 'yyyy-mm-dd') + "' ) &
		AND ( shift_no = " + string(gsu_tour_parameters[gi_Current_Tour].shift_no) + " ) &
		AND ( reading_id = 0 ) "

ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp_2)
IF ( ll_Num_Rows = 1 ) THEN
	ls_Note = lds_temp_2.GetItemString(1, 1)
	IF Empty(ls_Note) THEN
		ls_Note = ''
	END IF
ELSE
	ls_Note = ''
END IF
tabpage_notes.mle_note_1.Text = ls_Note
		
lds_temp_2.Reset()
DESTROY lds_temp_2

// Load previous notes
ls_Sql = " &
	SELECT a.dt, &
          a.shift_no, &
          b.shift_desc, &
          a.notes &
	  FROM history a, &
          shift_time b &
    WHERE ( a.shift_no = b.shift_no ) &
      AND ( a.tour = b.tour ) &
      AND ( a.rev_no = b.rev_no ) &
	   AND ( a.tour = " + string(gsu_tour_parameters[gi_Current_Tour].tour_number) + " ) &
/*		AND ( a.rev_no = " + string(gsu_tour_parameters[gi_Current_Tour].rev_no) + " ) */&
		AND ( a.sta = " + string(gsu_tour_parameters[gi_Current_Tour].station) + " ) &
		AND ( a.dt <= '" + string(gsu_tour_parameters[gi_Current_Tour].tour_date, 'yyyy-mm-dd') + "' ) &
		AND ( a.rd IS NOT NULL ) &
		AND ( a.reading_id = 0 ) &
 ORDER BY 1 DESC, 2 DESC "
		
tabpage_notes.mle_note_2.Text = ''
ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp_3)
// Discard any shift after the desired shift
FOR ll_Count = 1 TO ll_Num_Rows
	li_Shift_No = lds_temp_3.GetItemNumber(ll_Count, 2)
	IF ( li_shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no ) THEN
		lb_Been_Here = TRUE
		EXIT
	END IF
NEXT
IF lb_Been_Here THEN
	lds_temp_3.RowsDiscard(1, ll_Count, Primary!)
END IF
ls_Previous_Notes = ''
		
FOR ll_Count = 1 TO lds_temp_3.RowCount()
	ls_Note = TRIM(lds_temp_3.GetItemString(ll_Count, 4))
	ls_Date = String(lds_temp_3.GetItemDateTime(ll_Count, 1), Date_Format)
	ls_Shift = TRIM(lds_temp_3.GetItemString(ll_Count, 3))
	IF Empty(ls_Note) THEN
		ls_Previous_Notes = ls_Previous_Notes + ls_Date + ' ' + ls_Shift + ls_CRLF + "" + ls_CRLF + ls_CRLF
	ELSE
		ls_Previous_Notes = ls_Previous_Notes + ls_Date + ' ' + ls_Shift + ls_CRLF + ls_Note + ls_CRLF + ls_CRLF
	END IF
NEXT
tabpage_notes.mle_note_2.Text = ls_Previous_Notes
IF ( al_Current_Row > 0 ) THEN
	tabpage_notes.st_station_description_notes.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[al_Current_Row], tabpage_notes.st_station_description_notes.Width, TRUE)
//	tabpage_notes.st_station_description_notes.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[al_Current_Row], UnitsToPixels(tabpage_notes.st_station_description_notes.Width, XUnitsToPixels!), TRUE)
ELSE
	tabpage_notes.st_station_description_notes.Text = ""
END IF

lds_temp_3.Reset()
DESTROY lds_temp_3
end event

event type integer ue_update_reading_or_note(integer oldindex);long currentrow
boolean lb_Modified
integer li_Return

// ***********************
// This segment of code is duplicated (and slightly modified) 
// in mnu_tour's submenu items
li_Return = 0
IF ( oldindex = 1 ) THEN
	currentrow = tab_tour.tabpage_readings.dw_readings.GetRow()
	// Don't go through this if the current station is calculated because
	// the user went through this navigating to the station
	IF Empty(tab_tour.tabpage_readings.dw_readings.Object.station_erd[currentrow]) THEN
//		IF tab_tour.tabpage_readings.dw_readings.EVENT ue_Evaluate_Reading(currentrow, TRUE, FALSE) THEN
//			tab_tour.tabpage_readings.dw_readings.Object.history_rd_t.Text = 'Calculated Reading'
//		ELSE
//			tab_tour.tabpage_readings.dw_readings.Object.history_rd_t.Text = 'Current Reading'
//		END IF
		li_Return = tab_tour.tabpage_readings.dw_readings.AcceptText()
		lb_Modified = f_Check_If_Reading_Changed(currentrow)
		IF lb_Modified THEN
			li_Return = tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE, lb_Modified)
		ELSE
			li_Return = 0
		END IF
		IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
			RETURN 1
		ELSE
			tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(currentrow)
			IF ( li_Return = 1 ) AND ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			END IF
		END IF
	END IF
ELSEIF ( oldindex = 4 ) THEN
	tabpage_readings.dw_readings.EVENT ue_Update_Note()
END IF
// ***********************

RETURN li_Return
end event

on tab_tour.create
this.tabpage_readings=create tabpage_readings
this.tabpage_stations=create tabpage_stations
this.tabpage_instructions=create tabpage_instructions
this.tabpage_notes=create tabpage_notes
this.tabpage_history=create tabpage_history
this.tabpage_multi=create tabpage_multi
this.tabpage_documents=create tabpage_documents
this.Control[]={this.tabpage_readings,&
this.tabpage_stations,&
this.tabpage_instructions,&
this.tabpage_notes,&
this.tabpage_history,&
this.tabpage_multi,&
this.tabpage_documents}
end on

on tab_tour.destroy
destroy(this.tabpage_readings)
destroy(this.tabpage_stations)
destroy(this.tabpage_instructions)
destroy(this.tabpage_notes)
destroy(this.tabpage_history)
destroy(this.tabpage_multi)
destroy(this.tabpage_documents)
end on

event selectionchanged;long ll_Current_Row
integer li_Return

IF ib_Initial_Open_Of_Tour THEN
//	IF ( gsu_tour_parameters[gi_Current_Tour].SelectedTab <> 1 ) THEN
//		gsu_tour_parameters[gi_Current_Tour].SelectedTab = newindex
//	ELSE
//		gsu_tour_parameters[gi_Current_Tour].SelectedTab = newindex
//	END IF
ELSE
	gsu_tour_parameters[gi_Current_Tour].SelectedTab = newindex
END IF
ll_Current_Row = tabpage_readings.dw_readings.GetRow()
w_tour.SetRedraw(FALSE)
//Timer(0, w_tour)
CHOOSE CASE newindex
	CASE 1
		IF ( il_Last_Row_Scanned <> ll_Current_Row ) AND NOT ib_Initial_Open_Of_Tour THEN
//			IF ( tabpage_readings.dw_readings.Event ue_LANDCyclops(ll_Current_Row) = 0 ) THEN
//				integer li_Scanned
//				li_Scanned = ii_Scanned
//				li_Return = tabpage_readings.dw_readings.Event Scan(ll_Current_Row)
//				IF ( li_Return = -1 ) THEN
//					il_Row_For_Navigate_To_Row_PostEvent = il_Last_Row_Scanned
//					ii_Scanned = li_Scanned
//					This.SelectedTab = oldindex
//	//				tabpage_readings.dw_readings.Object.history_scan[il_Last_Row_Scanned] = li_Scanned
//	//				tabpage_readings.dw_readings.SetItem(il_Last_Row_Scanned, 'history_scan', li_Scanned)
//					//IF ( il_Last_Row_Scanned = 0 ) THEN
//					//	il_Last_Row_Scanned = ll_Current_Row
//					//END IF
//					il_Row_For_Navigate_To_Row_PostEvent = ll_Current_Row
//					IF NOT gb_Final_Close THEN
//						tabpage_readings.dw_readings.PostEvent("ue_Navigate_To_Row", 0, ll_Current_Row)
//					END IF
//				END IF
//			END IF
		END IF
		IF NOT gb_Final_Close THEN
			tabpage_readings.dw_readings.PostEvent('Focus')
		END IF
	CASE 2
//		IF ( Upper(ProfileString(gs_INI_File, gs_Window_Title, 'RECALC_ON_LIST_TAB', 'No')) = 'YES' ) THEN
//			il_FirstRowOnPage = 0
//			il_LastRowOnPage = 0
//			tabpage_stations.dw_stations.PostEvent('ue_Evaluate')
//			Timer(5, w_tour)
//		END IF
		IF ( ll_Current_Row > 0 ) THEN
			TRY
				tabpage_stations.st_station_description_list.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], tabpage_stations.st_station_description_list.Width, TRUE)
//				tabpage_stations.st_station_description_list.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], UnitsToPixels(tabpage_stations.st_station_description_list.Width, XUnitsToPixels!), TRUE)
			CATCH (runtimeerror er)
			END TRY
		ELSE
			tabpage_stations.st_station_description_list.Text = ""
		END IF
		tabpage_stations.st_station_description_list.SetFocus()
	CASE 3 // Alerts
		IF ( ll_Current_Row > 0 ) THEN
			tabpage_instructions.dw_alerts.EVENT ue_Retrieve(tabpage_readings.dw_readings.Object.station_sta[ll_Current_Row])
			tabpage_instructions.st_station_description_instructions.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], tabpage_instructions.st_station_description_instructions.Width, TRUE)
//			tabpage_instructions.st_station_description_instructions.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], UnitsToPixels(tabpage_instructions.st_station_description_instructions.Width, XUnitsToPixels!), TRUE)
		ELSE
			tabpage_instructions.dw_alerts.Reset()
			tabpage_instructions.st_station_description_instructions.Text = ""
		END IF
		tabpage_instructions.st_station_description_instructions.SetFocus()
	CASE 4 // Notes
		tabpage_notes.mle_note_1.PostEvent('Focus')
		This.EVENT ue_Update_Notes_Tab(ll_Current_Row)
	CASE 5 // History
		IF ( ll_Current_Row > 0 ) THEN
			tabpage_history.dw_history.EVENT ue_Retrieve()
		ELSE
			li_Return = tabpage_history.dw_history.Reset()
		END IF
		This.EVENT ue_History_Display()
		tabpage_history.st_station_description_history.SetFocus()
	CASE 6 // Multi-Readings
		IF ( ll_Current_Row > 0 ) THEN
			tabpage_multi.dw_multi.EVENT ue_Retrieve()
			tabpage_multi.st_station_description_multi.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], tabpage_instructions.st_station_description_instructions.Width, TRUE)
//			tabpage_multi.st_station_description_multi.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], UnitsToPixels(tabpage_instructions.st_station_description_instructions.Width, XUnitsToPixels!), TRUE)
		ELSE
			li_Return = tabpage_multi.dw_multi.Reset()
			tabpage_multi.st_station_description_multi.Text = ""
		END IF
		tabpage_multi.st_station_description_multi.SetFocus()
	CASE 7 // Documents
		IF ( ll_Current_Row > 0 ) THEN
			tabpage_documents.dw_perf_docs.EVENT ue_Retrieve()
			tabpage_documents.dw_ref_docs.EVENT ue_Retrieve()
			tabpage_documents.st_station_description_docs.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], tabpage_instructions.st_station_description_instructions.Width, TRUE)
//			tabpage_documents.st_station_description_docs.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], UnitsToPixels(tabpage_instructions.st_station_description_instructions.Width, XUnitsToPixels!), TRUE)
		ELSE
			tabpage_documents.dw_perf_docs.Reset()
			tabpage_documents.dw_ref_docs.Reset()
			tabpage_documents.st_station_description_docs.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], tabpage_instructions.st_station_description_instructions.Width, TRUE)
//			tabpage_documents.st_station_description_docs.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Current_Row], UnitsToPixels(tabpage_instructions.st_station_description_instructions.Width, XUnitsToPixels!), TRUE)
		END IF
		tabpage_documents.st_station_description_docs.SetFocus()
END CHOOSE
w_tour.SetRedraw(TRUE)
end event

event selectionchanging;integer li_SIP_Height
integer li_Count
integer li_Return
integer currentrow
boolean lb_Modified
//SIPIMType sType 
long ll_Current_Row

ll_Current_Row = tabpage_readings.dw_readings.GetRow()

//sType = GetSIPType()
//CHOOSE CASE sType    
//	CASE SIPKeyboard!
//		li_SIP_Height = 320
//	CASE SIPJot!
//		li_SIP_Height = 320
//	CASE SIPBlock!
//		li_SIP_Height = 320
//	CASE SIPWordLogic! // What's this?
//		li_SIP_Height = 320
//	CASE SIPTranscriber!
//		li_SIP_Height = 96
//	CASE ELSE
//END CHOOSE

//w_tour.SetRedraw(FALSE)
IF ( oldindex = 1 ) THEN
	currentrow = tab_tour.tabpage_readings.dw_readings.GetRow()
	// Don't go through this if the current station is calculated because
	// the user went through this navigating to the station
	IF Empty(tab_tour.tabpage_readings.dw_readings.Object.station_erd[currentrow]) THEN
//		IF tab_tour.tabpage_readings.dw_readings.EVENT ue_Evaluate_Reading(currentrow, TRUE, FALSE) THEN
//			tab_tour.tabpage_readings.dw_readings.Object.history_rd_t.Text = 'Calculated Reading'
//		ELSE
//			tab_tour.tabpage_readings.dw_readings.Object.history_rd_t.Text = 'Current Reading'
//		END IF
		li_Return = tab_tour.tabpage_readings.dw_readings.AcceptText()
		lb_Modified = f_Check_If_Reading_Changed(currentrow)
		IF lb_Modified THEN
			li_Return = tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE, lb_Modified)
		ELSE
			li_Return = 0
		END IF
		IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
			RETURN 1
		ELSE
			tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(currentrow)
			IF ( li_Return = 1 ) AND ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			END IF
		END IF
	END IF
ELSEIF ( oldindex = 4 ) THEN
	tabpage_readings.dw_readings.EVENT ue_Update_Note()
END IF

Send(Handle(w_tour), 277, 6, 0)

//CHOOSE CASE newindex
//	CASE 1
//		tab_tour.Height = Long(tab_tour.Tag)
////		// scroll the window to the top
////		Send(Handle(w_tour), 277, 6, 0)
////		IF IsSIPVisible() THEN
////			// scroll the window to the top
////			Send(Handle(w_tour), 277, 6, 0)
////			CHOOSE CASE GetSIPType()
////				CASE SIPTranscriber!
////					FOR li_Count = 1 TO 2
////						Send(Handle(w_tour), 277, 1, 0)
////					NEXT
////				CASE ELSE
////					FOR li_Count = 1 TO 4
////						Send(Handle(w_tour), 277, 1, 0)
////					NEXT
////			END CHOOSE
////		END IF
////		This.PostEvent('ue_Show_Scrollbar')
//	CASE 2, 3, 4, 6
////		This.PostEvent('ue_Hide_Scrollbar')
////		// scroll the window to the top
////		Send(Handle(w_tour), 277, 6, 0)
//		CHOOSE CASE newindex
//			CASE 2
//				tab_tour.tabpage_stations.dw_stations.Height = Long(tab_tour.tabpage_stations.dw_stations.Tag)
//				tab_tour.Height = Long(tab_tour.Tag)
//			CASE 3
//				tab_tour.tabpage_instructions.dw_alerts.Height = Long(tab_tour.tabpage_instructions.dw_alerts.Tag)
//				tab_tour.Height = Long(tab_tour.Tag)
//			CASE 4
//				tab_tour.tabpage_notes.mle_note_2.Height = Long(tab_tour.tabpage_notes.mle_note_2.Tag)
//				tab_tour.Height = Long(tab_tour.Tag)
//			CASE 6
//				tab_tour.tabpage_multi.dw_multi.Height = Long(tab_tour.tabpage_multi.dw_multi.Tag)
//				tab_tour.Height = Long(tab_tour.Tag)
//		END CHOOSE
//	CASE 5, 7
//		tab_tour.Height = Long(tab_tour.Tag)
////		This.PostEvent('ue_Hide_Scrollbar')
//END CHOOSE
////w_tour.SetRedraw(TRUE)

end event

type tabpage_readings from userobject within tab_tour
event create ( )
event destroy ( )
event temp pbm_keyup
integer x = 18
integer y = 104
integer width = 1431
integer height = 1580
long backcolor = 32567268
string text = "Read"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
r_1 r_1
em_2 em_2
hpb_1 hpb_1
em_1 em_1
dw_readings dw_readings
p_2 p_2
p_3 p_3
p_4 p_4
p_5 p_5
end type

on tabpage_readings.create
this.r_1=create r_1
this.em_2=create em_2
this.hpb_1=create hpb_1
this.em_1=create em_1
this.dw_readings=create dw_readings
this.p_2=create p_2
this.p_3=create p_3
this.p_4=create p_4
this.p_5=create p_5
this.Control[]={this.r_1,&
this.em_2,&
this.hpb_1,&
this.em_1,&
this.dw_readings,&
this.p_2,&
this.p_3,&
this.p_4,&
this.p_5}
end on

on tabpage_readings.destroy
destroy(this.r_1)
destroy(this.em_2)
destroy(this.hpb_1)
destroy(this.em_1)
destroy(this.dw_readings)
destroy(this.p_2)
destroy(this.p_3)
destroy(this.p_4)
destroy(this.p_5)
end on

type r_1 from rectangle within tabpage_readings
long linecolor = 32567268
integer linethickness = 4
long fillcolor = 28485258
integer x = -18
integer y = 1264
integer width = 1499
integer height = 316
end type

type em_2 from editmask within tabpage_readings
integer x = 210
integer y = 2000
integer width = 343
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
boolean border = false
end type

event getfocus;
end event

event losefocus;
end event

type hpb_1 from hprogressbar within tabpage_readings
boolean visible = false
integer x = 50
integer y = 60
integer width = 1029
integer height = 68
boolean bringtotop = true
unsignedinteger maxposition = 400
integer setstep = 1
boolean smoothscroll = true
end type

type em_1 from editmask within tabpage_readings
boolean visible = false
integer x = 55
integer y = 548
integer width = 974
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
maskdatatype maskdatatype = stringmask!
end type

event getfocus;
end event

event losefocus;
end event

type dw_readings from datawindow within tabpage_readings
event ue_insert_new_shift ( integer ai_tour,  integer ai_rev_no,  integer ai_shift_no,  date ad_shift_date )
event type long ue_retrieve ( )
event ue_update_row ( boolean ab_commit_changes )
event ue_navigate_to_row ( long al_direction,  string source )
event ue_post_retrieve ( )
event ue_character_entered pbm_dwnkey
event type boolean ue_evaluate_applicability ( long al_row,  boolean ab_show_message )
event type integer ue_navigate_to_first_row ( boolean ab_display_message )
event ue_navigate_to_last_row ( boolean ab_display_message )
event type integer ue_show_warnings ( long ll_row,  boolean ab_show_message,  boolean ab_update_spec_tol,  boolean ab_row_modified )
event type any ue_check_oos ( string ls_reading,  string ls_min,  string ls_max,  integer li_less_than,  integer li_greater_than )
event type integer ue_check_oot ( long al_row,  string as_tol_passed )
event type boolean ue_evaluate_reading ( long al_row,  boolean ab_show_message,  boolean ab_from_rfc_event )
event ue_close_tour ( )
event ue_enter_button ( )
event focus ( )
event type boolean ue_find_scan_code ( string as_scan )
event type long ue_filter_for_abnormal ( )
event ue_retrieve_current_tour ( boolean ab_close )
event type long ue_filter_for_required ( )
event type boolean ue_does_scancode_exist ( string as_scan )
event type integer ue_show_warnings_for_close ( long ll_row )
event ue_update_tabpages ( )
event type long ue_filter_for_missed ( )
event ue_update_note ( )
event ue_focus_on_reading ( )
event ue_set_oot ( long al_row )
event ue_remove_button_character ( )
event ue_update_row_2 ( long al_row )
event type long ue_filter_for_scanning ( )
event type integer ue_update_multi_tabpage ( )
event type integer ue_update_documents_tabpage ( )
event type integer ue_update_alert_tabpage ( )
event type integer scan ( long currentrow )
event type long ue_find_applicable_row ( long currentrow,  string al_direction )
event ue_exit_tour ( )
event ue_finish_retrieving_tour ( )
event ue_sharedata ( )
event ue_save_edit_mask_data ( long al_row,  ref boolean lb_modified )
event type boolean ue_verify_tour_was_taken ( )
event type integer ue_update_notes_tabpage ( )
event type any ue_show_warnings_for_final_close ( long ll_row,  boolean ab_show_message,  boolean ab_update_spec_tol )
event ue_test pbm_dwnprocessenter
event type long ue_filter_for_unscanned ( )
event ue_update_reading ( long al_row,  string as_reading,  datetime adt_cdt,  string as_user_id )
event ue_display_numpad ( long row )
event ue_update_filter_menus ( string as_menu_item )
integer x = 37
integer y = 8
integer width = 1413
integer height = 1168
integer taborder = 40
string title = "none"
string dataobject = "d_readings_no_ellipsis"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event ue_insert_new_shift(integer ai_tour, integer ai_rev_no, integer ai_shift_no, date ad_shift_date);//Insert a the specified shift for the specified date into the history table

// 2005-09-06 - Modified to exclude stations not applicable based on 
// the appl_shift_times table

IF gb_Copy_Notes_Forward THEN
	
	INSERT INTO history 
			 ( tour, rev_no, dt, sta, shift_no, reading_id, user_id, rd, cdt, notes, spec, tol, scan ) 
	( SELECT a.tour, 
				a.rev_no, 
				:ad_Shift_Date, 
				a.sta, 
				:ai_Shift_No, 
				0, 
				NULL, 
				'', 
				NULL, 
				( SELECT TOP 1 b.notes 
					 FROM history b 
					WHERE ( b.tour = a.tour ) 
					  AND ( b.reading_id = 0 ) 
					  AND ( ( b.dt < :ad_Shift_Date ) OR ( ( b.dt = :ad_Shift_Date ) AND ( b.shift_no < :ai_Shift_No ) ) ) 
					  AND ( b.rd IS NOT NULL ) 
					  AND ( trim(b.rd) <> '' ) 
					  AND ( a.sta = b.sta ) 
				  ORDER BY b.dt DESC, b.shift_no DESC ), 
				0, 
				0, 
				0 
		 FROM station a, 
				appl_shift_times b 
		WHERE ( a.tour = :ai_tour ) 
		  AND ( a.rev_no = :ai_rev_no ) 
		  AND ( a.tour = b.tour ) 
		  AND ( a.rev_no = b.rev_no ) 
		  AND ( a.sta = b.sta ) 
		  AND ( b.shift_no = :ai_Shift_No ) 
		  AND ( b.shift_appl = 1 ) 
		  AND NOT EXISTS 
			 ( SELECT * 
				FROM history 
				 WHERE ( history.tour = a.tour ) 
					AND ( history.sta = a.sta ) 
					AND ( history.dt = :ad_Shift_Date ) 
					AND ( history.shift_no = :ai_Shift_No ) 
					AND ( history.reading_id = 0 ) ) ) 
		USING SQLCA ;

ELSE

	INSERT INTO history 
			 ( tour, rev_no, dt, sta, shift_no, reading_id, user_id, rd, cdt, notes, spec, tol, scan ) 
	( SELECT a.tour, 
				a.rev_no, 
				:ad_Shift_Date, 
				a.sta, 
				:ai_Shift_No, 
				0, 
				NULL, 
				'', 
				NULL, 
				'', 
				0, 
				0, 
				0 
		 FROM station a, 
				appl_shift_times b 
		WHERE ( a.tour = :ai_tour ) 
		  AND ( a.rev_no = :ai_rev_no ) 
		  AND ( a.tour = b.tour ) 
		  AND ( a.rev_no = b.rev_no ) 
		  AND ( a.sta = b.sta ) 
		  AND ( b.shift_no = :ai_Shift_No ) 
		  AND ( b.shift_appl = 1 ) 
		  AND NOT EXISTS 
			 ( SELECT * 
				FROM history 
				 WHERE ( history.tour = a.tour ) 
					AND ( history.sta = a.sta ) 
					AND ( history.dt = :ad_Shift_Date ) 
					AND ( history.shift_no = :ai_Shift_No ) 
					AND ( history.reading_id = 0 ) ) ) 
		USING SQLCA ;

END IF
IF ( SQLCA.SQLCode <> 0 ) THEN

	ROLLBACK USING SQLCA ;

ELSE
	IF ( SQLCA.SQLNRows > 0 ) THEN

		COMMIT USING SQLCA ;

	END IF
END IF

// Added 06-19-2008 to make sure station.minimum is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET minimum = NULL 
 WHERE ( RTRIM(minimum) = '' ) ;

// Added 06-19-2008 to make sure station.maximum is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET maximum = NULL 
 WHERE ( RTRIM(maximum) = '' ) ;

// Added 06-19-2008 to make sure station.eapp is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET eapp = NULL 
 WHERE ( RTRIM(eapp) = '' ) ;
 
// Added 06-19-2008 to make sure station.erd is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET erd = NULL 
 WHERE ( RTRIM(erd) = '' ) ;
 
// Added 06-19-2008 to make sure station.emin is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET emin = NULL 
 WHERE ( RTRIM(emin) = '' ) ;
 
// Added 06-19-2008 to make sure station.max is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET emax = NULL 
 WHERE ( RTRIM(emax) = '' ) ;
 
// Added 06-19-2008 to make sure station.etol is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET etol = NULL 
 WHERE ( RTRIM(etol) = '' ) ;
 
// Added 01-21-2008 to make sure station.scan is NULL and NOT just blank for use elsewhere
UPDATE station 
   SET scan = NULL 
 WHERE ( RTRIM(scan) = '' ) ;
 
// Added 01-21-2008 to make sure station.reading_required is 0 and NOT NULL
// Corrected 01-21-2009 because the below SQL used the scan table name from the above SQL - copy/paste error
UPDATE station 
   SET reading_required = 0 
 WHERE ( RTRIM(reading_required) IS NULL ) ;
 
COMMIT USING SQLCA ;

//string ls_Sql
//string ls_Sql_Sta
//
//ls_Sql = " &
//		  SELECT a.notes AS notes, a.sta AS sta, a.dt AS dt, a.shift_no AS shift_no &
//			 FROM history a &
//			WHERE ( a.tour = " + String(ai_tour) + " ) &
//			  AND ( a.reading_id = 0 ) &
//			  AND ( ( a.dt < '" + String(ad_Shift_Date, 'yyyy-mm-dd') + "' ) OR ( ( a.dt = '" + String(ad_Shift_Date, 'yyyy-mm-dd') + "' ) AND ( a.shift_no < " + String(ai_Shift_No) + " ) ) ) &
//			  AND ( a.rd IS NOT NULL ) &
//	        AND ( ( a.notes IS NOT NULL ) AND ( a.notes <> '' ) ) &
//		  ORDER BY a.sta ASC, a.dt DESC, a.shift_no DESC "
//
//ls_Sql_Sta = " &
//		  SELECT DISTINCT a.sta AS sta &
//			 FROM history a &
//			WHERE ( a.tour = " + String(ai_tour) + " ) &
//			  AND ( a.reading_id = 0 ) &
//			  AND ( ( a.dt < '" + String(ad_Shift_Date, 'yyyy-mm-dd') + "' ) OR ( ( a.dt = '" + String(ad_Shift_Date, 'yyyy-mm-dd') + "' ) AND ( a.shift_no < " + String(ai_Shift_No) + " ) ) ) &
//			  AND ( a.rd IS NOT NULL ) &
//	        AND ( ( a.notes IS NOT NULL ) AND ( a.notes <> '' ) ) &
//		  ORDER BY a.sta ASC "
//
//IF FALSE THEN
//	long ll_Num_Rows
//	long ll_Num_Rows_Sta
//	long ll_Count
//	long ll_Count_Sta
//	long ll_Filtered_Rows
//	integer li_Sta
//	string ls_Filter
//	integer li_Return
//	string ls_Note
//	integer li_Sta_
//	datetime ldt_DT_
//	integer li_Shift_No_
//	datastore lds_temp
//	datastore lds_temp_sta
//	
//	lds_temp = CREATE datastore
//	lds_temp_sta = CREATE datastore
//	
//	ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
//	ll_Num_Rows_Sta = f_Datastore_From_Sql(ls_Sql_Sta, lds_temp_sta)
//	FOR ll_Count_Sta = 1 TO ll_Num_Rows_Sta
//		li_Sta = lds_temp_sta.GetItemNumber(ll_Count_Sta, 1)
//		ls_Filter = ' sta = ' + String(li_Sta)
//		li_Return = lds_temp.SetFilter(ls_Filter)
//		li_Return = lds_temp.Filter()
//		ll_Filtered_Rows = ll_Num_Rows - lds_temp.FilteredCount()
//		li_Return = lds_temp.SetSort(' #3 D, #4 D ')
//		li_Return = lds_temp.Sort()
//		IF ( ll_Filtered_Rows > 0 ) THEN
//			ls_Note = lds_temp.GetItemString(1, 1)
//			li_Sta_ = lds_temp.GetItemNumber(1, 2)
//			ldt_DT_ = lds_temp.GetItemDateTime(1, 3)
//			li_Shift_No_ = lds_temp.GetItemNumber(1, 4)
//		
//			UPDATE history b 
//				SET b.notes = :ls_Note
//			 WHERE ( b.tour = :ai_tour ) 
//				AND ( b.reading_id = 0 ) 
//				AND ( b.dt = :ad_Shift_Date ) 
//				AND ( b.shift_no = :ai_Shift_No ) 
//				AND ( ( b.notes IS NULL ) OR ( b.notes = '' ) ) 
//				AND ( b.sta = :li_Sta ) ;
//	
//		END IF
//	NEXT
//	
//	DESTROY lds_temp_sta
//	DESTROY lds_temp
//ELSE

//boolean lb_Copy_Notes_Forward
//lb_Copy_Notes_Forward = TRUE//( Upper(f_ProfileString(gs_Module_Id, 'Copy_Notes_Forward', 'No')) = 'YES' )
//IF lb_Copy_Notes_Forward THEN
//	f_Update_Notes(ai_tour, ai_shift_no, ad_shift_date)
//
//	UPDATE history b 
//		SET b.notes = 
//			( SELECT TOP 1 a.notes 
//				 FROM history a 
//				WHERE ( a.tour = :ai_tour ) 
//				  AND ( a.reading_id = 0 ) 
//				  AND ( ( a.dt < :ad_Shift_Date ) OR ( ( a.dt = :ad_Shift_Date ) AND ( a.shift_no < :ai_Shift_No ) ) ) 
//				  AND ( a.rd IS NOT NULL ) 
//				  AND ( trim(a.rd) <> '' ) 
//				  AND ( a.sta = b.sta ) 
//			  ORDER BY a.dt DESC, a.shift_no DESC ), 
//			 b.note_already_copied = 1
//	 WHERE ( b.tour = :ai_tour ) 
//		AND ( b.reading_id = 0 ) 
//		AND ( b.dt = :ad_Shift_Date ) 
//		AND ( b.shift_no = :ai_Shift_No ) 
//		AND ( ( b.notes IS NULL ) OR ( TRIM(b.notes) = '' ) ) 
//		AND ( b.note_already_copied = 0 ) ;
//
//	IF ( SQLCA.SQLCode <> 0 ) THEN
//	
//		ROLLBACK USING SQLCA ;
//	
//	ELSE
//		IF ( SQLCA.SQLNRows > 0 ) THEN
//	
//			COMMIT USING SQLCA ;
//	
//		END IF
//	END IF
//END IF
//END IF

////Insert a the specified shift for the specified date into the history table
//	
//INSERT INTO history 
//		 ( tour, rev_no, dt, sta, shift_no, reading_id, user_id, rd, cdt, notes, spec, tol, scan ) 
//( SELECT tour, 
//         rev_no, 
//			:ad_Shift_Date, 
//         sta, 
//			:ai_Shift_No, 
//			0, 
//			NULL, 
//			'', 
//			NULL, 
//			'', 
//			0, 
//			0, 
//			0 
//	 FROM station 
//	WHERE ( tour = :ai_tour ) 
//	  AND ( rev_no = :ai_rev_no ) 
//	  AND NOT EXISTS 
//		 ( SELECT * 
//			FROM history 
//			 WHERE ( history.tour = station.tour ) 
//			   AND ( history.sta = station.sta ) 
//				AND ( history.dt = :ad_Shift_Date )
//				AND ( history.shift_no = :ai_Shift_No ) 
//				AND ( history.reading_id = 0 ) ) ) 
//	USING SQLCA ;
//
//IF ( SQLCA.SQLCode <> 0 ) THEN
//
//	ROLLBACK USING SQLCA ;
//
//ELSE
//	IF ( SQLCA.SQLNRows > 0 ) THEN
//
//		COMMIT USING SQLCA ;
//
//	END IF
//END IF
//
//UPDATE history b 
//	SET b.notes = 
//		( SELECT TOP 1 a.notes 
//			 FROM history a 
//			WHERE ( a.tour = :ai_tour ) 
//			  AND ( a.reading_id = 0 ) 
//			  AND ( ( a.dt < :ad_Shift_Date ) OR ( ( a.dt = :ad_Shift_Date ) AND ( a.shift_no < :ai_Shift_No ) ) ) 
//			  AND ( a.rd IS NOT NULL ) 
//			  AND ( a.sta = b.sta ) 
//		  ORDER BY a.dt DESC, a.shift_no DESC ) 
// WHERE ( b.tour = :ai_tour ) 
//	AND ( b.reading_id = 0 ) 
//	AND ( b.dt = :ad_Shift_Date ) 
//	AND ( b.shift_no = :ai_Shift_No ) 
//	AND ( ( b.notes IS NULL ) OR ( b.notes = '' ) ) ;
//
//IF ( SQLCA.SQLCode <> 0 ) THEN
//
//	ROLLBACK USING SQLCA ;
//
//ELSE
//	IF ( SQLCA.SQLNRows > 0 ) THEN
//
//		COMMIT USING SQLCA ;
//
//	END IF
//END IF
//
end event

event type long ue_retrieve();string ls_history_rd
string ls_Text
string ls_MB_String
long ll_Num_Rows_Child
string ls_Mask
string ls_MaskDataType
integer li_Tour
integer li_Rev_No
integer li_Shift_No
integer li_Return
string ls_Return
long ll_Num_Rows
string ls_Tour_Name
date ld_Tour_Date
integer li_DOW
integer li_DOM
string ls_DOW
string ls_DOM
string ls_SQL_Clause
string ls_SQL
string ls_Sort_Order
string ls_Location
string ls_Abbreviation
datawindowchild dwChild


li_Tour			= gsu_tour_parameters[gi_Current_Tour].tour_number
li_Rev_No		= gsu_tour_parameters[gi_Current_Tour].rev_no
li_Shift_No		= gsu_tour_parameters[gi_Current_Tour].shift_no
ld_Tour_Date 	= gsu_tour_parameters[gi_Current_Tour].tour_date

integer li_Scan

SELECT scan 
  INTO :li_Scan
  FROM tour 
 WHERE ( tour = :li_Tour ) 
   AND ( rev_no = :li_Rev_No ) ;

ib_Hide_Scan_Screen = ( IsNull(li_Scan) OR ( li_Scan = 0 ) )

li_DOW = DayNumber(ld_Tour_Date)
li_DOM = Day(ld_Tour_Date)

ls_DOW = Fill("_", li_DOW - 1) + "X%"
ls_DOM = Fill("_", li_DOM - 1) + "X%"
    
ls_SQL_Clause = " AND ( ( a.appldow LIKE '" + ls_DOW + "' ) OR ( a.appldom LIKE '" + ls_DOM + "' ) ) "

// 2011-11-01 - Retrieve hidden stations and handle with preference
//IF NOT gb_display_hidden_records THEN
//	ls_SQL_Clause = ls_SQL_Clause + " AND ( ( a.hidden = 0 ) OR ( ( a.hidden = 1 ) AND NOT ISNULL(a.erd, '') = '' ) ) "
//END IF

// Retrieve the raw SQL and not the modified copy 
// of it from previous retrieves
//**********************************************\/
datastore lds_temp
lds_temp = CREATE datastore
//[NPTS]
lds_temp.dataobject = 'd_readings_no_ellipsis'
ls_SQL = lds_temp.Object.DataWindow.Table.Select

string ls_Temp
ls_Temp = f_LanguageString('SEQ', 'Seq')
ls_Temp = StrTran(ls_Temp, "'", "''")
ls_Sql = StrTran(ls_Sql, 'Seq: ', ls_Temp + ': ')
ls_Temp = f_LanguageString('STA', 'Rec')
ls_Temp = StrTran(ls_Temp, "'", "''")
ls_Sql = StrTran(ls_Sql, 'Sta: ', ls_Temp + ': ')

DESTROY lds_temp
//**********************************************/\

li_Return = This.SetTransObject(SQLCA)
IF ( li_Return = 1 ) THEN
	gb_Tour_Opened = FALSE
	ls_Sort_Order = " a.seq ASC "
	This.SetSort('')
//	This.Object.filter_t.Text = f_LanguageString('<ALL_READINGS>', "<All Readings>")
	ls_Sql = ls_SQL + ls_SQL_Clause + " ORDER BY " + ls_Sort_Order
	This.Object.DataWindow.Table.Select = ls_Sql
//	li_Return = This.GetChild('history_rd', dwchild)
//	// Set the transaction object for the child
//	dwchild.SetTransObject(SQLCA)
//	// Populate
//	ll_Num_Rows = dwchild.InsertRow(0)

	This.SetFilter('')
	This.Filter()
	ll_Num_Rows = This.Retrieve(li_Tour, li_Rev_No, li_Shift_No, ld_Tour_Date)

	gb_Tour_Opened = TRUE
//	IF ( ll_Num_Rows > 0 ) THEN
//		gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[1]
//	END IF
	
	SELECT tour_name INTO :ls_Tour_Name FROM tour WHERE ( tour = :li_Tour ) AND ( rev_no = :li_Rev_No ) USING SQLCA ;

//	This.Object.tour_name_t.Text = f_Ellipsis(UPPER(ls_Tour_Name), Integer(This.Object.tour_name_t.Width), TRUE)
	This.Object.tour_name_t.Text = f_Ellipsis(UPPER(STRTRAN(ls_Tour_Name, '&', '&&')), Integer(This.Object.tour_name_t.Width), TRUE)
	ls_Abbreviation = f_ProfileString(gs_Module_Id, 'StationAbbr', 'Rec')
	tab_tour.tabpage_stations.dw_stations.Object.sta_t.Text = ls_Abbreviation
//[NPTS]
//	This.Object.compute_sta.Expression = "'" + ls_Abbreviation + ": ' + String(station_sta)"

//	This.Object.tour_name_t.Text = f_Ellipsis(UPPER(ls_Tour_Name), 210, TRUE)
ELSE
//	MessageBox('Error', 'Unable to retrieve data due to error.')
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_RETRIEVE_DATA_DUE_TO_ERROR.', 'Unable to retrieve data due to error.'))
	ll_Num_Rows = -1
END IF

This.EVENT ue_ShareData()

//// Save for a possible preference later
//IF FALSE THEN
//	in_dwaw.of_Register(w_tour, tab_tour.tabpage_stations.dw_stations)
//	in_dwaw.of_ResizeAll()
//END IF

This.EVENT ue_Update_Filter_Menus('ALL')

// ***************************************************
IF ( ll_Num_Rows > 0 ) AND ib_Initial_Open_Of_Tour THEN
	ls_Mask = This.Object.station_mask[1]
	ib_Edit_Mask = NOT Empty(ls_Mask)
	em_1.Visible = ib_Edit_Mask
	IF ib_Edit_Mask THEN
		ls_MaskDataType = This.Object.station_maskdatatype[1]
		CHOOSE CASE UPPER(ls_MaskDataType)
			CASE 'DATE'
				em_1.SetMask(DateMask!, ls_Mask)
			CASE 'DATETIME'
				em_1.SetMask(DateTimeMask!, ls_Mask)
			CASE 'DECIMAL'
				em_1.SetMask(DecimalMask!, ls_Mask)
			CASE 'NUMERIC'
				em_1.SetMask(NumericMask!, ls_Mask)
			CASE 'STRING'
				em_1.SetMask(StringMask!, ls_Mask)
			CASE 'TIME'
				em_1.SetMask(TimeMask!, ls_Mask)
			CASE ELSE
				em_1.Visible = FALSE
				IF Empty(ls_MaskDataType) THEN
					ls_MaskDataType = ''
				END IF
//				MessageBox('Error', 'Unrecognized MaskDataType of "' + ls_MaskDataType + '"')
				ls_MB_String = f_LanguageString('UNRECOGNIZED_MASKDATATYPE_OF_###', 'Unrecognized MaskDataType of ###')
				ls_MB_String = StrTran(ls_MB_String, '###', ls_MaskDataType)
				MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
		END CHOOSE
		em_1.SelectText(1, 0)
//		em_1.Text = This.Object.history_rd[1]
		ls_history_rd = This.GetItemString(1, 'history_rd')
		IF ib_Edit_Mask THEN
			IF NOT Empty(ls_history_rd) THEN
//				IF ( UPPER(ls_MaskDataType) = 'STRING' ) THEN
					ls_Text = f_UnMask(ls_history_rd, ls_Mask, ls_MaskDataType)
//				ELSE
//					ls_Text = ls_history_rd
//				END IF
				em_1.Text = ls_Text
			END IF
		END IF
	END IF
	This.EVENT ue_Navigate_To_First_Row(FALSE)
END IF
// ***************************************************
il_Multi_Reading_Allowed = This.Object.station_multi_reading_allowed[This.GetRow()]
il_Current_Row_For_Update_TabPages = This.GetRow()

ls_Mask = This.Object.station_mask[il_Current_Row_For_Update_TabPages]
ib_Edit_Mask = NOT Empty(ls_Mask)
em_1.Visible = ib_Edit_Mask
IF ib_Edit_Mask THEN
	ls_MaskDataType = This.Object.station_maskdatatype[il_Current_Row_For_Update_TabPages]
	CHOOSE CASE UPPER(ls_MaskDataType)
		CASE 'DATE'
			em_1.SetMask(DateMask!, ls_Mask)
		CASE 'DATETIME'
			em_1.SetMask(DateTimeMask!, ls_Mask)
		CASE 'DECIMAL'
			em_1.SetMask(DecimalMask!, ls_Mask)
		CASE 'NUMERIC'
			em_1.SetMask(NumericMask!, ls_Mask)
		CASE 'STRING'
			em_1.SetMask(StringMask!, ls_Mask)
		CASE 'TIME'
			em_1.SetMask(TimeMask!, ls_Mask)
		CASE ELSE
			em_1.Visible = FALSE
			IF Empty(ls_MaskDataType) THEN
				ls_MaskDataType = ''
			END IF
//			MessageBox('Error', 'Unrecognized MaskDataType of "' + ls_MaskDataType + '"')
			ls_MB_String = f_LanguageString('UNRECOGNIZED_MASKDATATYPE_OF_###', 'Unrecognized MaskDataType of ###')
			ls_MB_String = StrTran(ls_MB_String, '###', ls_MaskDataType)
			MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
	END CHOOSE
//	em_1.Text = This.Object.history_rd[il_Current_Row_For_Update_TabPages]
	em_1.SelectText(1, 0)
	ls_history_rd = This.GetItemString(il_Current_Row_For_Update_TabPages, 'history_rd')
	IF ib_Edit_Mask THEN
		IF NOT Empty(ls_history_rd) THEN
//			IF ( UPPER(ls_MaskDataType) = 'STRING' ) THEN
				ls_Text = f_UnMask(ls_history_rd, ls_Mask, ls_MaskDataType)
//			ELSE
//				ls_Text = ls_history_rd
//			END IF
			em_1.Text = ls_Text
		END IF
	END IF
END IF

This.EVENT ue_Update_TabPages()
IF ( ll_Num_Rows > 0 ) THEN
	gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[This.GetRow()]
	li_Return = This.GetChild('history_rd', dwchild)
	// Set the transaction object for the child
	li_Return = dwchild.SetTransObject(SQLCA)
	// Populate
	integer li_Rev
	integer li_Sta
		
	li_Tour = gsu_tour_parameters[gi_Current_Tour].Tour_Number
	li_Rev = gsu_tour_parameters[gi_Current_Tour].rev_no
	li_Sta = gsu_tour_parameters[gi_Current_Tour].Station
	ll_Num_Rows_Child = dwchild.Retrieve(li_Tour, li_Rev, li_Sta)
//	dwChild.InsertRow(1)
END IF

RETURN ll_Num_Rows
end event

event ue_update_row(boolean ab_commit_changes);boolean lb_Allow_Update
integer li_Return
long ll_Row
string ls_Reading
string ls_Note
datetime ldt_Null

lb_Allow_Update = TRUE
IF lb_Allow_Update THEN
	IF ( This.ModifiedCount() > 0 ) THEN
		li_Return = This.Update()
		IF ( li_Return = 1 ) THEN
			IF ab_commit_changes THEN
//				ll_Row = This.GetRow()
//				ls_Reading = This.GetItemString(ll_Row, 'history_rd')
//				ls_Note = This.GetItemString(ll_Row, 'history_notes')
//				SetNull(ldt_Null)
//				IF Empty(ls_Reading) AND Empty(ls_Note) THEN
//					This.Object.history_cdt[ll_Row] = ldt_Null
//					This.Object.history_user_id[ll_Row] = ''
//				END IF
	
				COMMIT USING SQLCA ;
	
			END IF
		ELSE
			MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_READING_WAS_NOT_SAVED_DUE_TO_AN_ERROR', 'The reading was not saved due to an error'))
		END IF
	END IF
END IF
end event

event ue_navigate_to_row(long al_direction, string source);string ls_MB_String
string ls_MB_String_2
long ll_Return
integer li_Return
long CurrentRow
boolean lb_Modified
boolean lb_Scanned
long ll_Row
boolean lb_Abnormal
//dwitemstatus l_status

CurrentRow = This.GetRow()
ib_Edit_Mask = NOT Empty(This.GetItemString(currentrow, 'station_mask'))
IF ib_Edit_Mask THEN
	This.EVENT ue_Save_Edit_Mask_Data(CurrentRow, lb_Modified)
END IF
This.AcceptText()
//l_status = This.GetItemStatus(currentrow, 0, Primary!)
IF ( al_Direction = 1 ) THEN 			// Next
	ii_Last_Navigate_To_Row = 1
	IF NOT ib_Edit_Mask THEN
		lb_Modified = f_Check_If_Reading_Changed(currentrow)
	END IF
	lb_Scanned = f_Check_If_Scan_Changed(currentrow, ii_Scanned)
	IF lb_Modified OR lb_Scanned THEN
		li_Return = This.EVENT ue_Show_Warnings(CurrentRow, TRUE, FALSE, lb_Modified)
		IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
			This.PostEvent('ue_Post_Retrieve')
		ELSE
			This.EVENT ue_Update_Row_2(currentrow)
			IF ( li_Return = 1 ) AND ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			ELSEIF ( li_Return = 1 ) AND ib_AbnormalReadingsRequireNote AND Empty(This.GetItemString(currentrow, 'history_notes')) THEN
//				MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
				ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
				ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
				ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
				ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
				MessageBox(ls_MB_String, ls_MB_String_2)
				IF ib_Auto_Display_Notes_On_OOS THEN
					tab_tour.SelectedTab = 4
				END IF
			ELSE
				IF ( currentrow = This.RowCount() ) THEN
//					MessageBox('Last ' + gs_Station_Label, 'This is the last applicable ' + gs_Station_Label)
//					li_Return = MessageBox('Last ' + gs_Station_Label, 'This is the last applicable ' + gs_Station_Label + '.  Do you wish to view All Missed Readings?', Question!, YesNo!)
					ls_MB_String = f_LanguageString('LAST_###', 'Last ###')
					ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
					ls_MB_String_2 = f_LanguageString('THIS_IS_THE_LAST_APPLICABLE_###.__DO_YOU_WISH_TO_VIEW_ALL_MISSED_READINGS?', 'This is the last applicable ###.  Do you wish to view All Missed Readings?')
					ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
					li_Return = MessageBox(ls_MB_String, ls_MB_String_2, Question!, YesNo!)
					IF ( li_Return = 1 ) THEN
						This.EVENT ue_Filter_For_Missed()
					END IF
				ELSE
					ll_Row = This.EVENT ue_Find_Applicable_Row(currentrow, '+1')
					IF ( ll_Row = -1 ) THEN
						ll_Row = currentrow
					END IF
					gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Row, 'history_sta')
					gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Row, 'history_reading_id')
					IF ( currentrow <> ll_Row ) THEN
						// If the scan was not rejected
						ll_Return = This.ScrollToRow(ll_Row)
					END IF
				END IF
			END IF
		END IF
	ELSE
		lb_Abnormal = ( This.GetItemNumber(currentrow, 'history_spec') = 1 ) OR ( This.GetItemNumber(currentrow, 'history_tol') = 1 )
		IF lb_Abnormal AND ib_AbnormalReadingsRequireNote AND Empty(This.GetItemString(currentrow, 'history_notes')) THEN
//			MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
			ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
			ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
			MessageBox(ls_MB_String, ls_MB_String_2)
			IF ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			END IF
		ELSE
			li_Return = 0
			IF ( currentrow = This.RowCount() ) THEN
//				MessageBox('Last ' + gs_Station_Label, 'This is the last applicable ' + gs_Station_Label)
//				li_Return = MessageBox('Last ' + gs_Station_Label, 'This is the last applicable ' + gs_Station_Label + '.  Do you wish to view All Missed Readings?', Question!, YesNo!)
				ls_MB_String = f_LanguageString('LAST_###', 'Last ###')
				ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
				ls_MB_String_2 = f_LanguageString('THIS_IS_THE_LAST_APPLICABLE_###.__DO_YOU_WISH_TO_VIEW_ALL_MISSED_READINGS?', 'This is the last applicable ###.  Do you wish to view All Missed Readings?')
				ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
				li_Return = MessageBox(ls_MB_String, ls_MB_String_2, Question!, YesNo!)
				IF ( li_Return = 1 ) THEN
					This.EVENT ue_Filter_For_Missed()
				END IF
			ELSE
				ll_Row = This.EVENT ue_Find_Applicable_Row(currentrow, '+1')
				IF ( ll_Row = -1 ) THEN
					ll_Row = currentrow
				END IF
				gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Row, 'history_sta')
				gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Row, 'history_reading_id')
				IF ( currentrow <> ll_Row ) THEN
					// If the scan was not rejected
					ll_Return = This.ScrollToRow(ll_Row)
				END IF
			END IF
		END IF
	END IF
ELSEIF ( al_Direction = -1 ) THEN	// Prior
	ii_Last_Navigate_To_Row = -1
	IF NOT ib_Edit_Mask THEN
		lb_Modified = f_Check_If_Reading_Changed(currentrow)
	END IF
	IF lb_Modified THEN
		li_Return = This.EVENT ue_Show_Warnings(CurrentRow, TRUE, FALSE, lb_Modified)
		IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
			This.PostEvent('ue_Post_Retrieve')
		ELSE
			This.EVENT ue_Update_Row_2(currentrow)
			IF ( li_Return = 1 ) AND ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			ELSEIF ( li_Return = 1 ) AND ib_AbnormalReadingsRequireNote AND Empty(This.GetItemString(currentrow, 'history_notes')) THEN
//				MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
				ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
				ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
				ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
				ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
				MessageBox(ls_MB_String, ls_MB_String_2)
				IF ib_Auto_Display_Notes_On_OOS THEN
					tab_tour.SelectedTab = 4
				END IF
			ELSE
				IF ( currentrow = 1 ) THEN
//					MessageBox('First ' + gs_Station_Label, 'This is the first applicable ' + gs_Station_Label)
					ls_MB_String = f_LanguageString('FIRST_###', 'First ###')
					ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
					ls_MB_String_2 = f_LanguageString('THIS_IS_THE_FIRST_APPLICABLE_###', 'This is the first applicable ###')
					ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
					MessageBox(ls_MB_String, ls_MB_String_2)
				ELSE
					ll_Row = This.EVENT ue_Find_Applicable_Row(currentrow, '-1')
					IF ( ll_Row = -1 ) THEN
						ll_Row = currentrow
					END IF
					gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Row, 'history_sta')
					gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Row, 'history_reading_id')
					IF ( currentrow <> ll_Row ) THEN
						// If the scan was not rejected
						ll_Return = This.ScrollToRow(ll_Row)
					END IF
				END IF
			END IF
		END IF
	ELSE
		lb_Abnormal = ( This.GetItemNumber(currentrow, 'history_spec') = 1 ) OR ( This.GetItemNumber(currentrow, 'history_tol') = 1 )
		IF lb_Abnormal AND ib_AbnormalReadingsRequireNote AND Empty(This.GetItemString(currentrow, 'history_notes')) THEN
//			MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
			ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
			ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
			MessageBox(ls_MB_String, ls_MB_String_2)
			IF ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			END IF
		ELSE
			li_Return = 0
			IF ( currentrow = 1 ) THEN
//				MessageBox('First ' + gs_Station_Label, 'This is the first applicable ' + gs_Station_Label)
				ls_MB_String = f_LanguageString('FIRST_###', 'First ###')
				ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
				ls_MB_String_2 = f_LanguageString('THIS_IS_THE_FIRST_APPLICABLE_###', 'This is the first applicable ###')
				ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
				MessageBox(ls_MB_String, ls_MB_String_2)
			ELSE
				ll_Row = This.EVENT ue_Find_Applicable_Row(currentrow, '-1')
				IF ( ll_Row = -1 ) THEN
					ll_Row = currentrow
				END IF
				gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Row, 'history_sta')
				gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Row, 'history_reading_id')
				IF ( currentrow <> ll_Row ) THEN
					// If the scan was not rejected
					ll_Return = This.ScrollToRow(ll_Row)
				END IF
			END IF
		END IF
	END IF
ELSEIF IsNull(al_Direction) THEN // Absolute
	ii_Last_Navigate_To_Row = 0
	al_Direction = il_Row_For_Navigate_To_Row_PostEvent
	IF NOT ib_Edit_Mask THEN
		lb_Modified = f_Check_If_Reading_Changed(currentrow)
	END IF
	IF lb_Modified THEN
		li_Return = This.EVENT ue_Show_Warnings(CurrentRow, TRUE, FALSE, lb_Modified)
		IF ( li_Return = 2 ) OR ( li_Return = 20 ) THEN
			This.PostEvent('ue_Post_Retrieve')
		ELSEIF ( li_Return = 1 ) AND ib_AbnormalReadingsRequireNote AND Empty(This.GetItemString(currentrow, 'history_notes')) THEN
//			MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
			ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
			ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
			MessageBox(ls_MB_String, ls_MB_String_2)
			IF ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			END IF
		ELSE
			This.EVENT ue_Update_Row_2(currentrow)
			IF ( li_Return = 1 ) AND ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			ELSEIF ( li_Return = 1 ) AND ib_AbnormalReadingsRequireNote AND Empty(This.GetItemString(CURRENTROW, 'history_notes')) THEN
				IF ( This.GetItemNumber(currentrow, 'history_spec') = 1 ) OR ( This.GetItemNumber(currentrow, 'history_tol') = 1 ) THEN
//					MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
					ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
					ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
					ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
					ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
					MessageBox(ls_MB_String, ls_MB_String_2)
					IF ib_Auto_Display_Notes_On_OOS THEN
						tab_tour.SelectedTab = 4
					END IF
				END IF
			ELSE
				ll_Row = This.EVENT ue_Find_Applicable_Row(currentrow, String(al_Direction))
				IF ( ll_Row = -1 ) THEN
					ll_Row = currentrow
				END IF
				gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Row, 'history_sta')
				gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Row, 'history_reading_id')
				IF ( currentrow <> ll_Row ) THEN
					// If the scan was not rejected
					ll_Return = This.ScrollToRow(ll_Row)
				END IF
			END IF
		END IF
	ELSE
		lb_Abnormal = ( This.GetItemNumber(currentrow, 'history_spec') = 1 ) OR ( This.GetItemNumber(currentrow, 'history_tol') = 1 )
		IF lb_Abnormal AND ib_AbnormalReadingsRequireNote AND Empty(This.GetItemString(currentrow, 'history_notes')) THEN
//			MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
			ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
			ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
			MessageBox(ls_MB_String, ls_MB_String_2)
			IF ib_Auto_Display_Notes_On_OOS THEN
				tab_tour.SelectedTab = 4
			END IF
		ELSE
			li_Return = 0
			IF NOT This.EVENT ue_Evaluate_Applicability(al_Direction, FALSE) THEN
//				MessageBox('Not Applicable', 'This ' + gs_Station_Label + ' is not applicable under current conditions.')
				ls_MB_String = f_LanguageString('THIS_###_IS_NOT_APPLICABLE_UNDER_CURRENT_CONDITIONS.', 'This ### is not applicable under current conditions.')
				ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
//				ls_MB_String = StrTran(ls_MB_String, '###', String(This.GetItemString(al_Direction, 'station_eapp')))
				MessageBox(f_LanguageString('NOT_APPLICABLE', 'Not Applicable'), ls_MB_String)
				IF NOT Empty(This.GetItemString(al_Direction, 'station_eapp')) THEN
//					MessageBox("Applicability Expression", 'App Exp: ' + String(This.GetItemString(al_Direction, 'station_eapp')))
					ls_MB_String = f_LanguageString('APP_EXP_###', 'App Exp ###')
					ls_MB_String = StrTran(ls_MB_String, '###', String(This.GetItemString(al_Direction, 'station_eapp')))
					MessageBox(f_LanguageString('APPLICABILITY_EXPRESSION', "App Exp") + ':', ls_MB_String)
				END IF
				This.PostEvent('ue_Post_Retrieve')
			ELSE
				IF gb_Find_By_Scan THEN
					gb_Find_By_Scan = TRUE
				END IF
				ll_Row = This.EVENT ue_Find_Applicable_Row(currentrow, String(al_Direction))
				IF ( ll_Row = -1 ) THEN
					ll_Row = currentrow
				END IF
				gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Row, 'history_sta')
				gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Row, 'history_reading_id')
				IF ( currentrow <> ll_Row ) THEN
					// If the scan was not rejected
					ll_Return = This.ScrollToRow(ll_Row)
				END IF
			END IF
		END IF
	END IF
END IF
IF ( tab_tour.SelectedTab <> 1 ) THEN
	tab_tour.Event SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
END IF

end event

event ue_post_retrieve();IF gb_Use_Navigation_Arrows THEN
//	This.Object.history_rd.Visible = FALSE
//	This.Object.compute_rd.Visible = TRUE
	This.SetColumn('compute_rd')
ELSE
	IF ( This.Describe("history_rd.Protect") = "0" ) THEN
		This.SetColumn('history_rd')
//		This.Object.history_rd.Visible = TRUE
//		This.Object.compute_rd.Visible = FALSE
		This.SetColumn('history_rd')
		This.PostEvent('Focus')
	END IF
END IF

end event

event ue_character_entered;//long ll_Num_Rows
//integer li_Return
//string ls_Reading
character lc_Char
//long ll_Row
//datawindowchild ldwcTemp
//
//li_Return = This.GetChild('history_rd', ldwcTemp)
//IF ( li_Return = 1 ) THEN
//	ls_Reading = This.GetText()
	IF ( keyflags = 1 ) THEN
		CHOOSE CASE key
			CASE Key0!
				lc_Char = ')'
			CASE Key1!
				lc_Char = '!'
			CASE Key2!
				lc_Char = '@'
			CASE Key3!
				lc_Char = '#'
			CASE Key4!
				lc_Char = '$'
			CASE Key5!
				lc_Char = '%'
			CASE Key6!
				lc_Char = '^'
			CASE Key7!
				lc_Char = '&'
			CASE Key8!
				lc_Char = '*'
			CASE Key9!
				lc_Char = '('
			CASE Keybackquote!
				lc_Char = '~~'
			CASE Keybackslash!
				lc_Char = '|'
			CASE Keycomma!
				lc_Char = '<'
			CASE Keydash!
				lc_Char = '_'
			CASE Keyperiod!
				lc_Char = '>'
			CASE Keyquote!
				lc_Char = '"'
			CASE Keysemicolon!
				lc_Char = ':'
			CASE Keyslash!
				lc_Char = '?'
			CASE Keyrightbracket!
				lc_Char = '}'
			CASE Keyleftbracket!
				lc_Char = '{'
			CASE Keyequal!
				lc_Char = '+'
		END CHOOSE
	ELSE
		CHOOSE CASE key
			CASE KeyA!
				lc_Char = 'A'
			CASE KeyB!
				lc_Char = 'B'
			CASE KeyC!
				lc_Char = 'C'
			CASE KeyD!
				lc_Char = 'D'
			CASE KeyE!
				lc_Char = 'E'
			CASE KeyF!
				lc_Char = 'F'
			CASE KeyG!
				lc_Char = 'G'
			CASE KeyH!
				lc_Char = 'H'
			CASE KeyI!
				lc_Char = 'I'
			CASE KeyJ!
				lc_Char = 'J'
			CASE KeyK!
				lc_Char = 'K'
			CASE KeyL!
				lc_Char = 'L'
			CASE KeyM!
				lc_Char = 'M'
			CASE KeyN!
				lc_Char = 'N'
			CASE KeyO!
				lc_Char = 'O'
			CASE KeyP!
				lc_Char = 'P'
			CASE KeyQ!
				lc_Char = 'Q'
			CASE KeyR!
				lc_Char = 'R'
			CASE KeyS!
				lc_Char = 'S'
			CASE KeyT!
				lc_Char = 'T'
			CASE KeyU!
				lc_Char = 'U'
			CASE KeyV!
				lc_Char = 'V'
			CASE KeyW!
				lc_Char = 'W'
			CASE KeyX!
				lc_Char = 'X'
			CASE KeyY!
				lc_Char = 'Y'
			CASE KeyZ!
				lc_Char = 'Z'
			CASE Key0!
				lc_Char = '0'
			CASE Key1!
				lc_Char = '1'
			CASE Key2!
				lc_Char = '2'
			CASE Key3!
				lc_Char = '3'
			CASE Key4!
				lc_Char = '4'
			CASE Key5!
				lc_Char = '5'
			CASE Key6!
				lc_Char = '6'
			CASE Key7!
				lc_Char = '7'
			CASE Key8!
				lc_Char = '8'
			CASE Key9!
				lc_Char = '9'
			CASE Keyadd!
				lc_Char = '+'
			CASE Keybackquote!
				lc_Char = '`'
			CASE Keybackslash!
				lc_Char = '\'
			CASE Keycomma!
				lc_Char = ','
			CASE Keydash!
				lc_Char = '-'
			CASE Keydecimal!
				lc_Char = '.'
			CASE Keydivide!
				lc_Char = '/'
			CASE Keymultiply!
				lc_Char = '*'
			CASE Keyperiod!
				lc_Char = '.'
			CASE Keyquote!
				lc_Char = "'"
			CASE Keysemicolon!
				lc_Char = ';'
			CASE Keyslash!
				lc_Char = '/'
			CASE Keysubtract!
				lc_Char = '-'
			CASE Keyrightbracket!
				lc_Char = ']'
			CASE Keyleftbracket!
				lc_Char = '['
			CASE Keyequal!
				lc_Char = '='
			CASE Keyenter!
				RETURN -1
		END CHOOSE
	END IF
	IF NOT Empty(lc_Char) THEN
		long ll_Num_Rows
		integer li_Return
		string ls_Reading
		long ll_Row
		datawindowchild ldwcTemp
		
		li_Return = This.GetChild('history_rd', ldwcTemp)
		IF ( li_Return = 1 ) THEN
			ls_Reading = This.GetText()
			ls_Reading = ls_Reading + lc_Char
			ll_Num_Rows = ldwcTemp.RowCount()
			ll_Row = ldwcTemp.Find("#1 LIKE '" + ls_Reading + "%'", 1, ll_Num_Rows + 1)
			IF ( ll_Row > 0 ) THEN
				li_Return = ldwcTemp.SelectRow(ll_Row, TRUE)
			END IF
		END IF
	END IF
//END IF
end event

event type boolean ue_evaluate_applicability(long al_row, boolean ab_show_message);string ls_Result_2
string ls_MB_String
string ls_Eapp
string ls_Result
boolean lb_Return
boolean lb_App
integer li_Sta
boolean lb_Hidden

lb_Return = FALSE
IF ( al_Row > 0 ) THEN
	ls_Eapp = This.GetItemString(al_Row, 'station_eapp')
	lb_Hidden = ( This.GetItemNumber(al_Row, 'station_hidden') = 1 )
	IF Empty(ls_Eapp) THEN //AND NOT lb_Hidden THEN
		lb_Return = TRUE
		gl_Last_Applicable_Station = al_Row
	ELSE
		IF ( This.RowCount() = 1 ) THEN
			ls_result = Compile(ls_Eapp, Datetime(gsu_tour_parameters[gi_Current_Tour].tour_date, time('')), gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].station, gsu_tour_parameters[gi_Current_Tour].shift_no, gsu_tour_parameters[gi_Current_Tour].reading_id)
			ls_Result_2 = This.GetItemString(al_Row, 'compute_app')
		ELSE
			ls_result = This.GetItemString(al_Row, 'compute_app')
		END IF
		ls_result = Compile_Test(ls_Eapp)
		IF ( ls_Result = "!" ) THEN
			lb_App = FALSE
			IF ab_Show_Message THEN
				li_Sta = This.GetItemNumber(al_Row, 'history_sta')
//				MessageBox("APP Exp Error Sta: " + String(li_Sta), ls_Eapp, Exclamation!)
				ls_MB_String = f_LanguageString('APP_EXP_ERROR_REC_###', 'APP Exp Error Rec: ###')
				ls_MB_String = StrTran(ls_MB_String, '###', String(li_Sta))
				MessageBox(ls_MB_String, ls_Eapp, Exclamation!)
			END IF
		ELSE
			lb_App = ( UPPER(TRIM(ls_Result)) = "TRUE" )
			IF lb_App AND NOT lb_Hidden THEN
				gl_Last_Applicable_Station = al_Row
			END IF
		END IF
		lb_Return = lb_App
	END IF
END IF
RETURN lb_Return

//string ls_Eapp
//string ls_Eapp_2
//string ls_Result
//boolean lb_Return
//boolean lb_App
//integer li_Sta
//boolean lb_Hidden
//pointer l_pointer
//
//l_pointer = SetPointer(HourGlass!)
//lb_Return = FALSE
//IF ( al_Row > 0 ) THEN
////	IF ( This.Object.station_hidden[al_Row] = 1 ) THEN
////		lb_Return = FALSE
////	ELSE
//		ls_Eapp = This.Object.station_eapp[al_Row]
//		lb_Hidden = ( This.Object.station_hidden[al_Row] = 1 )
//		IF Empty(ls_Eapp) THEN //AND NOT lb_Hidden THEN
//			lb_Return = TRUE
//			gl_Last_Applicable_Station = al_Row
//		ELSE
//			// check applicability expression if necessary
//			IF ( POS(ls_Eapp, '"') > 0 ) THEN
//				// If dec quotes used then ...
//				ls_Eapp_2 = "Evaluate('" + ls_Eapp + "', 0)"
//			ELSE
//				// If no quotes or single quotes used then ...
//				ls_Eapp_2 = 'Evaluate("' + ls_Eapp + '", 1)'
//			END IF
//			ls_Result = ids_evaluate.Describe(ls_Eapp_2)
//			IF ( ls_Result = "!" ) THEN
//				lb_App = FALSE
//				IF ab_Show_Message THEN
//					li_Sta = This.Object.history_sta[al_Row]
//					MessageBox("APP Exp Error Sta: " + String(li_Sta), ls_Eapp, Exclamation!)
//				END IF
//			ELSE
//				lb_App = ( UPPER(TRIM(ls_Result)) = "TRUE" )
//				IF lb_App AND NOT lb_Hidden THEN
//					gl_Last_Applicable_Station = al_Row
//				END IF
//			END IF
//			lb_Return = lb_App
//		END IF
////	END IF
//END IF
//
////This.Object.history_rd.BringToFront = lb_Return
////This.Object.compute_rd.BringToFront = NOT lb_Return
//SetPointer(l_pointer)
//RETURN lb_Return
end event

event type integer ue_navigate_to_first_row(boolean ab_display_message);string ls_MB_String
string ls_MB_String_2
boolean lb_Modified
long ll_Current_Row
long ll_Row
long ll_Return
long ll_Count
long ll_Num_Rows
integer li_Return

This.SetRedraw(FALSE)

IF NOT ib_Initial_Open_Of_Tour THEN
	ll_Current_Row = This.GetRow()
	This.EVENT ue_Save_Edit_Mask_Data(ll_Current_Row, lb_Modified)
END IF
li_Return = 1
ll_Num_Rows = This.RowCount()
FOR ll_Count = 1 TO This.RowCount()
	ll_Row = This.EVENT ue_Find_Applicable_Row(0, '+1')
	IF ( ll_Row = -1 ) THEN
		ll_Row = ll_Current_Row
	END IF
	ll_Return = This.ScrollToRow(ll_Row)
	IF ab_Display_Message THEN
//		MessageBox('Sta: ' + String(This.GetItemNumber(ll_Count, 'history_sta')), 'This is the first applicable station')
		ls_MB_String = f_LanguageString('FIRST_###', 'First ###')
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		ls_MB_String_2 = f_LanguageString('THIS_IS_THE_FIRST_APPLICABLE_###', 'This is the first applicable ###')
		ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
		MessageBox(ls_MB_String, ls_MB_String_2)
	END IF
	EXIT
NEXT
IF ( ll_Count <= ll_Num_Rows ) THEN
	lb_Modified = f_Check_If_Reading_Changed(ll_Count)
	This.Event ue_Show_Warnings(ll_Count, TRUE, TRUE, lb_Modified)
ELSE
	li_Return = -1
END IF
IF ( tab_tour.SelectedTab <> 1 ) THEN
	tab_tour.Event SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
END IF
This.SetRedraw(TRUE)

RETURN li_Return


//long ll_Current_Row
//long ll_Row
//long ll_Return
//long ll_Count
//long ll_Num_Rows
//integer li_Return
//
//This.SetRedraw(FALSE)
//
//li_Return = 1
////IF NOT gb_Final_Close THEN
//	ll_Num_Rows = This.RowCount()
//	FOR ll_Count = 1 TO This.RowCount()
//		// check applicability columns
//		IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
//			il_Row_For_Navigate_To_Row_PostEvent = ll_Count
//			This.PostEvent('ue_Navigate_To_Row', 0, ll_Count)
//			EXIT
//		END IF
//	NEXT
////END IF
//IF ( tab_tour.SelectedTab <> 1 ) THEN
//	tab_tour.Event SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
//END IF
//This.SetRedraw(TRUE)
//
//RETURN li_Return



//long ll_Current_Row
//long ll_Row
//long ll_Return
//long ll_Count
//long ll_Num_Rows
//integer li_Return
//
//This.SetRedraw(FALSE)
//
//li_Return = 1
//IF NOT gb_Final_Close THEN
//	ll_Num_Rows = This.RowCount()
//	FOR ll_Count = 1 TO This.RowCount()
//		// check applicability columns
//		IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
//	//		This.ScrollToRow(ll_Count)
//	//		This.ScrollToRow(gl_Last_Applicable_Station)
//			ll_Current_Row = This.GetRow()
//			ll_Row = This.EVENT ue_Find_Applicable_Row(ll_Current_Row, String(ll_Count))
//			ll_Return = This.ScrollToRow(ll_Row)
//			IF ab_Display_Message THEN
//				MessageBox('Sta: ' + String(This.GetItemNumber(ll_Count, 'history_sta')), 'This is the first applicable station')
//			END IF
//			EXIT
//		END IF
//	NEXT
//	IF ( ll_Count <= ll_Num_Rows ) THEN
//		This.Event ue_Show_Warnings(ll_Count, TRUE, TRUE)
//	ELSE
//		li_Return = -1
//	END IF
//END IF
//IF ( tab_tour.SelectedTab <> 1 ) THEN
//	tab_tour.Event SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
//END IF
//This.SetRedraw(TRUE)
//
//RETURN li_Return
end event

event ue_navigate_to_last_row(boolean ab_display_message);string ls_MB_String
string ls_MB_String_2
integer li_Return
boolean lb_Modified
long ll_Current_Row
long ll_Row
long ll_Return
long ll_Count
long ll_Num_Rows

This.SetRedraw(FALSE)

ll_Current_Row = This.GetRow()
This.EVENT ue_Save_Edit_Mask_Data(ll_Current_Row, lb_Modified)
ll_Num_Rows = This.RowCount()
FOR ll_Count = ll_Num_Rows TO 1 STEP -1
	ll_Row = This.EVENT ue_Find_Applicable_Row(ll_Num_Rows + 1, '-1')
	IF ( ll_Row = -1 ) THEN
		ll_Row = ll_Current_Row
	END IF
	ll_Return = This.ScrollToRow(ll_Row)
	IF ab_Display_Message THEN
//		li_Return = MessageBox('Sta: ' + String(This.GetItemNumber(ll_Count, 'history_sta')), 'This is the last applicable ' + gs_Station_Label + '.  Do you wish to view All Missed Readings?', Question!, YesNo!)
		ls_MB_String = f_LanguageString('LAST_###', 'Last ###')
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		ls_MB_String_2 = f_LanguageString('THIS_IS_THE_LAST_APPLICABLE_###.__DO_YOU_WISH_TO_VIEW_ALL_MISSED_READINGS?', 'This is the last applicable ###.  Do you wish to view All Missed Readings?')
		ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
		li_Return = MessageBox(ls_MB_String, ls_MB_String_2, Question!, YesNo!)
		IF ( li_Return = 1 ) THEN
			This.EVENT ue_Filter_For_Missed()
		END IF
//		MessageBox('Sta: ' + String(This.GetItemNumber(ll_Count, 'history_sta')), 'This is the last applicable station')
	END IF
	EXIT
NEXT

IF ( ll_Count <= ll_Num_Rows ) THEN
	lb_Modified = f_Check_If_Reading_Changed(ll_count)
	This.Event ue_Show_Warnings(ll_Count, TRUE, TRUE, lb_Modified)
END IF
IF ( tab_tour.SelectedTab <> 1 ) THEN
	tab_tour.Event SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
END IF
This.SetRedraw(TRUE)


//long ll_Current_Row
//long ll_Row
//long ll_Return
//long ll_Count
//long ll_Num_Rows
//
//This.SetRedraw(FALSE)
//
//ll_Num_Rows = This.RowCount()
//FOR ll_Count = ll_Num_Rows TO 1 STEP -1
//	// check applicability columns
//	IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
//		il_Row_For_Navigate_To_Row_PostEvent = ll_Count
//		This.PostEvent('ue_Navigate_To_Row', 0, ll_Count)
//		EXIT
//	END IF
//NEXT
//
//IF ( tab_tour.SelectedTab <> 1 ) THEN
//	tab_tour.Event SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
//END IF
//This.SetRedraw(TRUE)



//long ll_Current_Row
//long ll_Row
//long ll_Return
//long ll_Count
//long ll_Num_Rows
//
//This.SetRedraw(FALSE)
//
//ll_Num_Rows = This.RowCount()
//FOR ll_Count = ll_Num_Rows TO 1 STEP -1
//	// check applicability columns
//	IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
////		This.ScrollToRow(ll_Count)
////		This.ScrollToRow(gl_Last_Applicable_Station)
//		ll_Current_Row = This.GetRow()
////		IF ( gsu_Tour_Parameters[gi_Current_Tour].Station = 0 ) THEN
////			ll_Current_Row = 0
////		END IF
//		ll_Row = This.EVENT ue_Find_Applicable_Row(ll_Current_Row, String(ll_Count))
//		ll_Return = This.ScrollToRow(ll_Row)
//		IF ab_Display_Message THEN
//			MessageBox('Sta: ' + String(This.GetItemNumber(ll_Count, 'history_sta')), 'This is the last applicable station')
//		END IF
//		EXIT
//	END IF
//NEXT
//
//IF ( ll_Count <= ll_Num_Rows ) THEN
//	This.Event ue_Show_Warnings(ll_Count, TRUE, TRUE)
//END IF
//IF ( tab_tour.SelectedTab <> 1 ) THEN
//	tab_tour.Event SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
//END IF
//This.SetRedraw(TRUE)
//
end event

event type integer ue_show_warnings(long ll_row, boolean ab_show_message, boolean ab_update_spec_tol, boolean ab_row_modified);string ls_MB_String
boolean lb_Alerts_Present
boolean lb_Scan_Modified
datetime ldt_now
string ls_Sql
string ls_EM_Text
boolean lb_Edit_Mask
string ls_Mask
string ls_Reading
string ls_Min
string ls_Max
string ls_Tol
integer li_OOS
integer li_OOT
integer li_Return
string ls_Message
string ls_emin, ls_emax, ls_etol, ls_erd
boolean lb_Row_Modified
boolean lb_Expression_OOS_OOT
string ls_Station
integer li_Tour
integer li_Rev_No
integer li_Sta
integer li_Less_Than
integer li_Greater_Than
boolean lb_In_Spec
integer li_Current_OOS
integer li_Current_OOT

This.AcceptText()

IF ( This.RowCount() > 0 ) THEN
	li_OOS = 0
	li_OOT = 0
	li_Tour = This.GetItemNumber(ll_Row, 'history_tour')
	li_Rev_No = This.GetItemNumber(ll_Row, 'history_rev_no')
	li_Sta = This.GetITemNumber(ll_Row, 'history_sta')
	
	li_Current_OOS = This.GetItemNumber(ll_Row, 'history_spec')
	li_Current_OOT = This.GetItemNumber(ll_Row, 'history_tol')
	
	ls_Station = String(li_Sta)
	ls_Mask = This.GetItemString(ll_row, 'station_mask')
	lb_Edit_Mask = NOT Empty(ls_Mask)
	IF lb_Edit_Mask THEN
		ldt_now = Datetime(Today(), Now())
		// Check if any part of the editmask has been modified
		IF f_Is_EditMask_Modified(em_1, em_2) THEN
			ls_Reading = This.GetItemString(ll_Row, 'history_rd')
			ls_EM_Text = em_1.Text
			IF ( ls_Reading <> ls_EM_Text ) THEN
				ls_Reading = em_1.Text
				This.EVENT ue_Update_Reading(ll_Row, ls_Reading, ldt_now, guo_user.ID)
//				This.Object.history_rd[ll_Row] = ls_Reading
//				This.Object.history_cdt[ll_Row] = ldt_now
//				This.Object.history_user_id[ll_Row] = guo_user.ID
			END IF
		ELSE
			ls_Reading = ''
			This.EVENT ue_Update_Reading(ll_Row, ls_Reading, ldt_now, guo_user.ID)
//			This.Object.history_rd[ll_Row] = ls_Reading
//			This.Object.history_cdt[ll_Row] = ldt_now
//			This.Object.history_user_id[ll_Row] = guo_user.ID
		END IF
	ELSE
		ls_Reading = This.GetItemString(ll_Row, 'history_rd')
		IF Empty(ls_Reading) THEN
			ls_Reading = ''
		END IF
	END IF
	ls_Emin = This.GetItemString(ll_Row, 'station_emin')
	ls_Emax = This.GetItemString(ll_Row, 'station_emax')
	ls_Etol = This.GetItemString(ll_Row, 'station_etol')
	ls_erd = This.GetItemString(ll_Row, "station_erd")
	lb_Expression_OOS_OOT = NOT Empty(ls_emin) OR NOT Empty(ls_emax) OR NOT Empty(ls_etol) OR NOT Empty(ls_erd)
	IF Empty(ls_erd) THEN
		lb_Row_Modified = ab_Row_Modified//f_Check_If_Reading_Changed(ll_Row)//( l_status = DataModified! ) OR ( l_status = NewModified! )
		lb_Scan_Modified = f_Check_If_Scan_Changed(ll_Row, ii_Scanned)
	ELSE
		lb_Row_Modified = ib_Calculated_Reading_Modified OR f_Check_If_Reading_Changed(ll_Row)
	END IF
	lb_Alerts_Present = ( This.GetItemNumber(ll_Row, 'station_alert_count') > 0 )

	IF lb_Row_Modified AND lb_Alerts_Present THEN
//		ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//		EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
				
		DELETE FROM alert_accept
		 WHERE ( tour = :li_Tour )
			AND ( rev_no = :li_Rev_No )
			AND ( sta = :li_Sta )
			AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No )
			AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date )
			AND ( reading_id = 0 ) ;
					
//		ls_Sql = 'START SYNCHRONIZATION DELETE'
//		EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
//		COMMIT ;
	END IF
	IF ( gb_Tour_Opened AND lb_Scan_Modified ) THEN
		This.Object.previous_scan[ll_row] = This.GetItemNumber(ll_Row, 'history_scan')
		This.Object.history_scan[ll_Row] = ii_Scanned
	END IF
	IF ( gb_Tour_Opened AND ( lb_Row_Modified OR lb_Expression_OOS_OOT OR lb_Scan_Modified ) ) THEN
		// Check for quick key OOS 
		integer li_Check_OOS_For_Quick_Key
		integer li_Row_Returned
		
//		//[NPTS]
//		// Now the quick_keys DDDW has ALL quick_keys for the tour/rev
//		// Do a find on it with sta/reading and return the spec_setting that way
//		datawindowchild ldwc_temp
//		long ll_Row_Found
//		li_Return = This.GetChild('history_rd', ldwc_temp)
//		ll_Row_Found = ldwc_temp.Find(" sta = " + String(li_Sta) + " AND TRIM(reading) = '" + TRIM(ls_Reading) + "'", 1, ldwc_temp.RowCount())
//		IF ( ll_Row_Found > 0 ) THEN
//			li_Check_OOS_For_Quick_Key = ldwc_temp.GetItemNumber(ll_Row_Found, 'spec_setting')
//		END IF
		
		// The sub-select below is necessary because the normal SELECT returns zero even if there is no record
		// and the SQLNRows started returning -11 for some reason
		
		//[NPTS]
		SELECT spec_setting, 
			  ( SELECT COUNT(*) FROM quick_keys WHERE ( tour = a.tour ) AND ( rev_no = a.rev_no ) AND ( sta = a.sta ) AND ( reading = a.reading ) ) 
		  INTO :li_Check_OOS_For_Quick_Key, :li_Row_Returned
		  FROM quick_keys a 
		 WHERE ( a.tour = :li_Tour ) 
			AND ( a.rev_no = :li_Rev_No ) 
			AND ( a.sta = :li_Sta ) 
			AND ( a.reading = :ls_Reading ) 
		USING SQLCA ;

		IF ( li_Check_OOS_For_Quick_Key = 0 ) AND ( li_Row_Returned > 0 ) THEN
			// Never OOS
			// 2004-10-12 Scott says never OOT as well
			li_OOS = 0
			li_OOT = 0
		ELSEIF ( li_Check_OOS_For_Quick_Key = 2 ) AND ( li_Row_Returned > 0 ) THEN
			// Always OOS
			// 2004-10-12 Scott says never OOT as well
			li_OOS = 1
			li_OOT = 0
		ELSE
			// Check for OOS
			ls_min = This.GetItemString(ll_Row, 'compute_min')
			ls_max = This.GetItemString(ll_Row, 'compute_max')
			ls_tol = This.GetItemString(ll_Row, 'compute_tol')

			li_Less_Than = This.GetItemNumber(ll_Row, 'station_less_than')
			li_Greater_Than = This.GetItemNumber(ll_Row, 'station_greater_than')
			li_OOS = This.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
			// The "OOT * 2" below is for the CASE below to 
			// determine if OOS, OOT or both are present
			li_OOT = This.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
		END IF
		This.Object.previous_scan[ll_row] = This.GetItemNumber(ll_Row, 'history_scan')
		This.Object.history_scan[ll_Row] = ii_Scanned
		This.Object.history_spec[ll_Row] = li_OOS
		This.Object.history_tol[ll_Row] = li_OOT / 2
		This.EVENT ue_Set_OOT(ll_Row)
		IF ab_Show_Message AND ( ib_Calculated_Reading_Modified OR lb_Row_Modified ) THEN //( l_rd_status = DataModified! ) OR ( l_rd_status = NewModified! ) ) THEN
			CHOOSE CASE li_OOS + li_OOT
				CASE 0
					// No message, everything is good
					li_Return = 0
				CASE 1
//					IF Empty(ls_erd) THEN
//						ls_Message = "Accept this reading?~n~r Min: "
//					ELSE
//						ls_Message = "Calculated reading.~n~r Min: "
//					END IF
					IF Empty(ls_erd) THEN
						ls_Message = f_LanguageString('ACCEPT_THIS_READING?', "Accept this reading?") + '~n~r' + f_LanguageString('MIN', "Min") + ': '
					ELSE
						ls_Message = f_LanguageString('CALCULATED_READING?', "Calculated reading") + '.~n~r' + f_LanguageString('MIN', "Min") + ': '
					END IF
					ls_Message = ls_Message + ls_Min + "~n~r"
					ls_Message = ls_Message + "  " + f_LanguageString('RD', "Rd") + ": "
					ls_Message = ls_Message + ls_Reading + "~n~r"
					ls_Message = ls_Message + "  " + f_LanguageString('MAX', "Max") + ": "
					ls_Message = ls_Message + ls_Max
//					IF Empty(ls_erd) THEN
//						li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//					ELSE
//						li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//					END IF
					ls_MB_String = f_LanguageString('REC:_###', "Rec: ###")
					ls_MB_String = StrTran(ls_MB_String, '###', String(This.GetItemNumber(ll_Row, 'history_sta')) + '~n~r' + ls_Message)
					IF Empty(ls_erd) THEN
						li_Return = MessageBox(f_LanguageString('READING_OUT_OF_SPEC', "Reading Out-Of-Spec"), ls_MB_String, Question!, YesNo!)
					ELSE
						li_Return = MessageBox(f_LanguageString('READING_OUT_OF_SPEC', "Reading Out-Of-Spec"), ls_MB_String, Question!, Ok!)
					END IF
				CASE 2
//					IF Empty(ls_erd) THEN
//						ls_Message = "Accept this reading?~n~r Rd: "
//					ELSE
//						ls_Message = "Calculated reading.~n~r Rd: "
//					END IF
					IF Empty(ls_erd) THEN
						ls_Message = f_LanguageString('ACCEPT_THIS_READING?', "Accept this reading?") + '~n~r' + f_LanguageString('RD', "Rd") + ' '
					ELSE
						ls_Message = f_LanguageString('CALCULATED_READING?', "Calculated reading") + '.~n~r' + f_LanguageString('RD', "Rd") + ' '
					END IF
					ls_Message = ls_Message + ls_Reading
//					IF Empty(ls_erd) THEN
//						li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//					ELSE
//						li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//					END IF
					ls_MB_String = f_LanguageString('REC:_###', "Rec: ###")
					ls_MB_String = StrTran(ls_MB_String, '###', String(This.GetItemNumber(ll_Row, 'history_sta')) + '~n~r' + ls_Message)
					IF Empty(ls_erd) THEN
						li_Return = MessageBox(f_LanguageString('READING_OUT_OF_TOLERANCE', "Reading Out-of-Tolerance"), ls_MB_String, Question!, YesNo!)
					ELSE
						li_Return = MessageBox(f_LanguageString('READING_OUT_OF_TOLERANCE', "Reading Out-of-Tolerance"), ls_MB_String, Question!, Ok!)
					END IF
				CASE 3
//					IF Empty(ls_erd) THEN
//						ls_Message = "Accept this reading?~n~r Min: "
//					ELSE
//						ls_Message = "Calculated reading.~n~r Min: "
//					END IF
//					ls_Message = ls_Message + ls_Min + "~n~r"
//					ls_Message = ls_Message + "  Rd: "
//					ls_Message = ls_Message + ls_Reading + "~n~r"
//					ls_Message = ls_Message + "Max: "
//					ls_Message = ls_Message + ls_Max
					IF Empty(ls_erd) THEN
						ls_Message = f_LanguageString('ACCEPT_THIS_READING?', "Accept this reading?") + '~n~r' + f_LanguageString('MIN', "Min") + ': '
					ELSE
						ls_Message = f_LanguageString('CALCULATED_READING?', "Calculated reading") + '.~n~r' + f_LanguageString('MIN', "Min") + ': '
					END IF
					ls_Message = ls_Message + ls_Min + "~n~r"
					ls_Message = ls_Message + "  " + f_LanguageString('RD', "Rd") + ": "
					ls_Message = ls_Message + ls_Reading + "~n~r"
					ls_Message = ls_Message + "  " + f_LanguageString('MAX', "Max") + ": "
					ls_Message = ls_Message + ls_Max

					ls_MB_String = f_LanguageString('REC:_###', "Rec: ###")
					ls_MB_String = StrTran(ls_MB_String, '###', String(This.GetItemNumber(ll_Row, 'history_sta')) + '~n~r' + ls_Message)
					IF Empty(ls_erd) THEN
//						li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
						li_Return = MessageBox(f_LanguageString('READING_OOS_&_OOT', "Reading OOS & OOT"), ls_MB_String, Question!, YesNo!)
					ELSE
//						li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
						li_Return = MessageBox(f_LanguageString('READING_OOS_&_OOT', "Reading OOS & OOT"), ls_MB_String, Question!, Ok!)
					END IF
			END CHOOSE
			IF ( li_Return = 1 ) THEN
				This.Object.history_spec[ll_Row] = li_OOS
				This.Object.history_tol[ll_Row] = li_OOT / 2
				This.EVENT ue_Set_OOT(ll_Row)
			END IF
		END IF
		lb_In_Spec = ( li_OOS + li_OOT = 0 )
		IF NOT lb_In_Spec THEN
			// If an OOS/OOT condition exists then set the status 
			// of the required note
			IF ib_AbnormalReadingsRequireNote THEN
				ib_Blank_Note = Empty(This.GetItemString(ll_Row, 'history_notes'))
			ELSE
				ib_Blank_Note = FALSE
			END IF
		END IF
//TODO: 2005-04-06 - Possibly later add code to re-evaluate the alerts if the 
// Min/Max/Tol has changed as well.  Don't just look at if 
// the reading has changed
		IF lb_Row_Modified AND lb_Alerts_Present AND ( ( li_Return <> 2 ) OR lb_In_Spec ) THEN
			integer li_Alert_Return
			li_Alert_Return = tab_tour.tabpage_instructions.dw_alerts.EVENT ue_Evaluate_Alerts_2(ab_Show_Message, ll_Row)
			// If there are no alerts to process then 0 is returned
			IF ( li_Alert_Return <> 0 ) THEN
				IF lb_In_Spec THEN
					// I have to identify when there is an alert with no OOS/OOT condition
					li_Return = li_Alert_Return * 10
				ELSE
					// Returns 1 or 2 for an Alert AND an OOS/OOT condition
					li_Return = li_Alert_Return
				END IF
			END IF
		END IF
	END IF
ELSE
	li_Return = 0
END IF

ib_Calculated_Reading_Modified = FALSE
RETURN li_Return

//string ls_Reading
//string ls_Return
//string ls_Min
//string ls_Max
//string ls_Tol
//integer li_OOS
//integer li_OOT
//integer li_Return
//string ls_Message
//boolean 	lb_Display
//boolean lb_Rows_Present
//string ls_Database_Reading
//integer li_Quick_Key_Exists
//string ls_emin, ls_emax, ls_etol, ls_erd
//boolean lb_Row_Modified
//boolean lb_Expression_OOS_OOT
//string ls_Station
//integer li_Tour
//integer li_Rev_No
//integer li_Sta
//integer li_Less_Than
//integer li_Greater_Than
////date ld_Tour_Date
////string ls_Reading_From_DB
////integer li_Shift_No
////boolean lb_Modified
//dwitemstatus l_status, l_rd_status
//pointer l_pointer
//
//This.AcceptText()
//
//l_pointer = SetPointer(HourGlass!)
//IF ( This.RowCount() > 0 ) THEN
////	Beep(1)
//	li_OOS = 0
//	li_OOT = 0
//	li_Tour = This.Object.history_tour[ll_Row]
//	li_Rev_No = This.Object.history_rev_no[ll_Row]
//	li_Sta = This.Object.history_sta[ll_Row]
////	ld_Tour_Date = This.Object.history_dt[ll_Row]
////	li_Shift_No = This.Object.history_shift_no[ll_Row]
//	ls_Station = String(li_Sta)
//	IF ib_Edit_Mask THEN
//		// Check if any part of the editmask has been modified
//		IF f_Is_EditMask_Modified(em_1, em_2) THEN
//			ls_Reading = This.Object.history_rd[ll_Row]
//			IF ( ls_Reading <> em_1.Text ) THEN
//				ls_Reading = em_1.Text
//				This.Object.history_rd[ll_Row] = ls_Reading
//				This.Object.history_cdt[ll_Row] = DateTime(Today(), Now())
//				This.Object.history_user_id[ll_Row] = guo_user.ID
//			END IF
//		ELSE
//			ls_Reading = ''
//			This.Object.history_rd[ll_Row] = ls_Reading
//			This.Object.history_cdt[ll_Row] = DateTime(Today(), Now())
//			This.Object.history_user_id[ll_Row] = guo_user.ID
//		END IF
//	ELSE
////		ls_Reading = This.GetItemString(ll_Row, 'history_rd')
//		ls_Reading = This.Object.history_rd[ll_Row]
//		IF Empty(ls_Reading) THEN
//			ls_Reading = ''
//		END IF
//	END IF
//	
////	l_status = This.GetItemStatus(ll_Row, 0, Primary!)
////	l_rd_status = This.GetItemStatus(ll_Row, "history_rd", Primary!)
//	
//	ls_Emin = This.Object.station_emin[ll_Row]
//	IF Empty(ls_Emin) THEN
//		ls_Emin = ''
//	ELSE
//		ls_Emin = StrTran(ls_Emin, "'", '"')
//		ls_Emin = f_Purge_Spaces(ls_Emin)
//	END IF
//
//	ls_Emax = This.Object.station_emax[ll_Row]
//	IF Empty(ls_Emax) THEN
//		ls_Emax = ''
//	ELSE
//		ls_Emax = StrTran(ls_Emax, "'", '"')
//		ls_Emax = f_Purge_Spaces(ls_Emax)
//	END IF
//
//	ls_Etol = This.Object.station_etol[ll_Row]
//	IF Empty(ls_Etol) THEN
//		ls_Etol = ''
//	ELSE
//		ls_Etol = StrTran(ls_Etol, "'", '"')
//		ls_Etol = f_Purge_Spaces(ls_Etol)
//	END IF
//
//	ls_erd = This.GetItemString(ll_Row, "station_erd")
//
//	ls_Emin = StrTran(Upper(ls_Emin), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//	ls_Emax = StrTran(Upper(ls_Emax), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//	ls_Etol = StrTran(Upper(ls_Etol), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//
//	lb_Expression_OOS_OOT = NOT Empty(ls_emin) OR NOT Empty(ls_emax) OR NOT Empty(ls_etol) OR NOT Empty(ls_erd) 
//	IF Empty(ls_erd) THEN
//		lb_Row_Modified = f_Check_If_Reading_Changed(ll_Row)//( l_status = DataModified! ) OR ( l_status = NewModified! )
//	ELSE
//		lb_Row_Modified = ib_Calculated_Reading_Modified OR f_Check_If_Reading_Changed(ll_Row)//( l_status = DataModified! ) OR ( l_status = NewModified! )
//	END IF
//	
//	IF lb_Row_Modified THEN
//				
//		DELETE FROM alert_accept
//		 WHERE ( tour = :li_Tour )
//			AND ( rev_no = :li_Rev_No )
//			AND ( sta = :li_Sta )
//			AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No )
//			AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date )
//			AND ( reading_id = 0 ) ;
//					
////		COMMIT ;
//	END IF
//
//	IF ( gb_Tour_Opened AND ( lb_Row_Modified OR NOT Empty(ls_emin) OR NOT Empty(ls_emax) OR NOT Empty(ls_etol) OR NOT Empty(ls_erd) ) ) THEN
////		IF NOT Empty(ls_Reading) THEN
//			// Check for quick key OOS 
//			integer li_Check_OOS_For_Quick_Key
//			integer li_Row_Returned
//			
//			// The sub-select below is necessary because the normal SELECT returns zero even if there is no record
//			// and the SQLNRows started returning -11 for some reason
//			
//			SELECT spec_setting, 
//				  ( SELECT COUNT(*) FROM quick_keys WHERE ( tour = :li_Tour ) AND ( rev_no = :li_Rev_No ) AND ( sta = :li_Sta ) AND ( reading = :ls_Reading ) ) 
//			  INTO :li_Check_OOS_For_Quick_Key, :li_Row_Returned
//			  FROM quick_keys 
//			 WHERE ( tour = :li_Tour ) 
//            AND ( rev_no = :li_Rev_No ) 
//            AND ( sta = :li_Sta ) 
//            AND ( reading = :ls_Reading ) 
//			USING SQLCA ;
//
//			IF ( li_Check_OOS_For_Quick_Key = 0 ) AND ( li_Row_Returned > 0 ) THEN
//				// Never OOS
//				// 2004-10-12 Scott says never OOT as well
////				This.Object.history_spec[ll_Row] = 0
////				This.Object.history_tol[ll_Row] = 0
//				li_OOS = 0
//				li_OOT = 0
//			ELSEIF ( li_Check_OOS_For_Quick_Key = 2 ) AND ( li_Row_Returned > 0 ) THEN
//				// Always OOS
//				// 2004-10-12 Scott says never OOT as well
////				This.Object.history_spec[ll_Row] = 1
////				This.Object.history_tol[ll_Row] = 0
//				li_OOS = 1
//				li_OOT = 0
//			ELSE
//				// Check for OOS
////				ls_Min = This.Object.compute_min[ll_Row]
////				ls_Max = This.Object.compute_max[ll_Row]
////				ls_Tol = This.Object.compute_tol[ll_Row]
//				
//				IF NOT Empty(ls_EMin) THEN
//					ls_Min = "Evaluate('" + ls_EMin + "', 0)"
//					ls_Min = ids_evaluate.Describe(ls_Min)
//				ELSE
//					ls_Min = This.Object.compute_min[ll_Row]
//				END IF
//
//				IF NOT Empty(ls_EMax) THEN
//					ls_Max = "Evaluate('" + ls_EMax + "', 0)"
//					ls_Max = ids_evaluate.Describe(ls_Max)
//				ELSE
//					ls_Max = This.Object.compute_max[ll_Row]
//				END IF
//
//				IF NOT Empty(ls_etol) THEN
//					ls_Tol = "Evaluate('" + ls_Etol + "', 0)"
//					ls_Tol = ids_evaluate.Describe(ls_Tol)
//				ELSE
//					ls_Tol = This.Object.compute_tol[ll_Row]
//				END IF
//
//				li_Less_Than = This.Object.station_less_than[ll_Row]
//				li_Greater_Than = This.Object.station_greater_than[ll_Row]
//				li_OOS = This.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
//				// The "OOT * 2" below is for the CASE below to 
//				// determine if OOS, OOT or both are present
//				li_OOT = This.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
//			END IF
//			This.Object.history_scan[ll_Row] = ii_Scanned
////			IF ab_Update_Spec_Tol THEN
////				This.Object.history_spec[ll_Row] = li_OOS
////				This.Object.history_tol[ll_Row] = li_OOT / 2
////				This.EVENT ue_Set_OOT(ll_Row)
////			END IF
//			IF ab_Show_Message AND ( ib_Calculated_Reading_Modified OR lb_Row_Modified ) THEN //( l_rd_status = DataModified! ) OR ( l_rd_status = NewModified! ) ) THEN
//				CHOOSE CASE li_OOS + li_OOT
//					CASE 0
//						// No message, everything is good
//						li_Return = 0
//					CASE 1
//						IF Empty(ls_erd) THEN
//							ls_Message = "Accept this reading?~n~r Min: "
//						ELSE
//							ls_Message = "Calculated reading.~n~r Min: "
//						END IF
//						ls_Message = ls_Message + ls_Min + "~n~r"
//						ls_Message = ls_Message + "  Rd: "
//						ls_Message = ls_Message + ls_Reading + "~n~r"
//						ls_Message = ls_Message + "Max: "
//						ls_Message = ls_Message + ls_Max
//						IF Empty(ls_erd) THEN
//							li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
//						ELSE
//							li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, Ok!)
//						END IF
//					CASE 2
//						IF Empty(ls_erd) THEN
//							ls_Message = "Accept this reading?~n~r Rd: "
//						ELSE
//							ls_Message = "Calculated reading.~n~r Rd: "
//						END IF
//						ls_Message = ls_Message + ls_Reading
//						IF Empty(ls_erd) THEN
//							li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
//						ELSE
//							li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, Ok!)
//						END IF
//					CASE 3
//						IF Empty(ls_erd) THEN
//							ls_Message = "Accept this reading?~n~r Min: "
//						ELSE
//							ls_Message = "Calculated reading.~n~r Min: "
//						END IF
//						ls_Message = ls_Message + ls_Min + "~n~r"
//						ls_Message = ls_Message + "  Rd: "
//						ls_Message = ls_Message + ls_Reading + "~n~r"
//						ls_Message = ls_Message + "Max: "
//						ls_Message = ls_Message + ls_Max
//						IF Empty(ls_erd) THEN
//							li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
//						ELSE
//							li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, Ok!)
//						END IF
//				END CHOOSE
////				IF ( li_Return = 1 ) OR ( li_OOS + li_OOT = 0 ) THEN
////					li_Return = tab_tour.tabpage_instructions.dw_alerts.EVENT ue_Evaluate_Alerts_2(TRUE)
////					IF ( li_Return = 1 ) THEN
//						This.Object.history_spec[ll_Row] = li_OOS
//						This.Object.history_tol[ll_Row] = li_OOT / 2
//						This.EVENT ue_Set_OOT(ll_Row)
////					END IF
////				END IF
//			END IF
//			IF lb_Row_Modified AND ( ( li_Return <> 2 ) OR ( li_OOS + li_OOT = 0 ) ) THEN
//				integer li_Alert_Return
//				li_Alert_Return = tab_tour.tabpage_instructions.dw_alerts.EVENT ue_Evaluate_Alerts_2(ab_Show_Message, ll_Row)
//				// If there are no alerts to process then 0 is returned
//				IF ( li_Alert_Return <> 0 ) THEN
//					li_Return = li_Alert_Return
//				END IF
//			END IF
//			IF ( li_Return = 1 ) THEN
//				// If an OOS/OOT/Alert condition exists then set the status 
//				// of the required note
//				IF ib_AbnormalReadingsRequireNote THEN
//					ib_Blank_Note = Empty(This.Object.history_notes[ll_Row])
//				ELSE
//					ib_Blank_Note = FALSE
//				END IF
//			END IF
////		END IF
//	END IF
//ELSE
//	ib_Calculated_Reading_Modified = FALSE
//	RETURN 0
//END IF
//
//ib_Calculated_Reading_Modified = FALSE
//SetPointer(l_pointer)
//RETURN li_Return
//
end event

event type any ue_check_oos(string ls_reading, string ls_min, string ls_max, integer li_less_than, integer li_greater_than);decimal ld_Reading
decimal ld_Max
decimal ld_Min
integer li_Return
integer li_Spec
boolean lb_Spec
boolean lb_Min_OOS
boolean lb_Max_OOS

li_Spec = 0
lb_Spec = FALSE

IF Empty(ls_Reading) THEN
	li_Return = 0
ELSE
	ls_Min = f_Check_For_Null(ls_Min)
	ls_Max = f_Check_For_Null(ls_Max)
	
	IF IsNumber(ls_Reading) THEN
		// 2004-09-07 - the below logic came from 
		// Scott after sending him my take on the <= >=
//		IF ( LEN(ls_Max) > 0 ) THEN
//			IF ( li_Greater_Than = 1 ) THEN
//				lb_Max_OOS = NOT ( N(ls_Reading) < N(ls_Max) )
//			ELSE
//				lb_Max_OOS = NOT ( N(ls_Reading) <= N(ls_Max) )
//			END IF
//		END IF
//		IF ( LEN(ls_Min) > 0 ) THEN
//			IF ( li_Less_Than = 1 ) THEN
//				lb_Min_OOS = NOT ( N(ls_Reading) > N(ls_Min) )
//			ELSE
//				lb_Min_OOS = NOT ( N(ls_Reading) >= N(ls_Min) )
//			END IF
//		END IF
		ld_Reading = Dec(ls_Reading)
		IF ( LEN(ls_Max) > 0 ) THEN
			ld_Max = Dec(ls_Max)
			IF ( li_Less_Than = 1 ) THEN
				lb_Max_OOS = NOT ( ld_Reading < ld_Max )
			ELSE
//MessageBox('ld_Reading <= ld_Max', String(ld_Reading) + ' <= ' + String(ld_Max))
//MessageBox('ld_Reading <= ld_Max', String(ld_Reading <= ld_Max))
				lb_Max_OOS = NOT ( ld_Reading <= ld_Max )
//MessageBox('lb_Max_OOS', String(lb_Max_OOS))
			END IF
		END IF
		IF ( LEN(ls_Min) > 0 ) THEN
			ld_Min = Dec(ls_Min)
			IF ( li_Greater_Than = 1 ) THEN
				lb_Min_OOS = NOT ( ld_Reading > ld_Min )
			ELSE
				lb_Min_OOS = NOT ( ld_Reading >= ld_Min )
			END IF
		END IF
		lb_Spec = lb_Min_OOS OR lb_Max_OOS
	ELSEIF Empty(ls_Min) AND Empty(ls_Max) THEN
		lb_Spec = FALSE
	ELSE
		lb_Spec = ( ls_Reading <> ls_Min ) AND ( ls_Reading <> ls_Max )
	END IF		
	
	IF lb_Spec THEN
		li_Spec = 1
	ELSE
		li_Spec = 0
	END IF
END IF

RETURN li_Spec
end event

event type integer ue_check_oot(long al_row, string as_tol_passed);long ll_Row_Count
long ll_Row_Found
integer li_Shift_No
integer li_Tour
integer li_Rev_No
date ld_Tour_Date
string ls_Reading
string ls_Tol_Sta
string ls_Tol
integer li_Sta_Count
dec min, max, diff
integer li_Return
integer I
integer li_sta

li_Tour = gsu_tour_parameters[gi_Current_Tour].tour_number
li_Rev_No = gsu_tour_parameters[gi_Current_Tour].rev_no
ld_Tour_Date = gsu_tour_parameters[gi_Current_Tour].tour_date
li_Shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no

IF ( al_Row > 0 ) THEN
	ls_Reading		= TRIM(This.GetItemString(al_Row, 'history_rd'))
	ls_Tol		= as_Tol_Passed
	ls_Tol_Sta		= TRIM(This.GetItemString(al_Row, 'station_tol_sta'))
	
	IF Empty(ls_Tol_Sta) OR Empty(ls_Tol) OR Empty(ls_Reading) THEN
		li_Return = 0
	ELSE
		ls_Tol_Sta		= StrTran(ls_Tol_Sta, ' ', '')
		li_Sta_Count	= StringCount(",", ls_Tol_Sta) + 1
		
		min = dec(ls_Reading)
		max = min

		integer li_history_sta
		li_history_sta = This.GetItemNumber(al_Row, 'history_sta')
		ll_Row_Count = This.RowCount()
		FOR I = 1 TO li_sta_count
			li_Sta = ParseRelated(ls_Tol_Sta, I)
			IF ( li_Sta <> li_history_sta ) THEN

		//[NPTS] Can this be done by searching the dw instead of hitting the database?
				ll_Row_Found = This.Find(" station_sta = " + String(li_Sta), 1, ll_Row_Count + 1)
				IF ( ll_Row_Found > 0 ) THEN
					ls_Reading = TRIM(This.GetItemString(ll_Row_Found, 'history_rd'))
				ELSE
					ls_Reading = ''
				END IF

//			  SELECT rd 
//				 INTO :ls_Reading 
//				 FROM history 
//				WHERE ( tour		= :li_Tour ) 
//				  AND ( rev_no		= :li_Rev_No ) 
//				  AND ( sta			= :li_Sta ) 
//				  AND ( shift_no	= :li_Shift_No ) 
//				  AND ( dt			= :ld_Tour_Date ) 
//				  AND ( reading_id = 0 ) 
//				USING SQLCA ; 

			END IF
			IF NOT Empty(ls_Reading) THEN
				min = MIN(min, dec(ls_Reading))
				max = MAX(max, dec(ls_Reading))
			END IF
		NEXT
		
		diff = max - min
		
		IF ( diff > dec(ls_Tol) ) THEN
			li_Return = 1
		ELSE
			li_Return = 0	
		END IF
	END IF
ELSE
	li_Return = 0
END IF

RETURN li_Return
end event

event type boolean ue_evaluate_reading(long al_row, boolean ab_show_message, boolean ab_from_rfc_event);string ls_MB_String
datetime ldt_now
string ls_Erd
string ls_Result
string ls_Reading
integer li_Sta
boolean lb_Reading_Expression
pointer l_pointer

ib_Calculated_Reading_Modified = FALSE
IF ( al_Row > 0 ) THEN
	ls_Erd = This.GetItemString(al_Row, 'station_erd')
	lb_Reading_Expression = NOT Empty(ls_Erd)
	IF lb_Reading_Expression THEN
		li_Sta = This.GetItemNumber(al_Row, 'history_sta')
		ls_Result = This.GetItemString(al_Row, 'compute_rd')
		IF ( ls_Result = "!" ) THEN
			ls_Reading = 'ERROR'
			IF ab_Show_Message THEN
//				MessageBox("RD Exp Error Sta: " + String(li_Sta), ls_Erd, Exclamation!)
				ls_MB_String = f_LanguageString('RD_EXP_ERROR_REC_###', 'RD Exp Error Rec: ###')
				ls_MB_String = StrTran(ls_MB_String, '###', String(li_Sta))
				MessageBox(ls_MB_String, ls_Erd, Exclamation!)
			END IF
		ELSE
			IF ( Len(ls_Result) > 40 ) AND IsNumber(ls_Result) THEN
				ls_Result = Fit(ls_Result)
			END IF
			ls_Reading = UPPER(TRIM(ls_Result))
		END IF
		ib_Calculated_Reading_Modified = ab_From_RFC_Event AND ( ls_Reading <> This.GetItemString(al_Row, 'history_rd') )
//		This.Object.history_rd[al_Row] = ls_Reading
		This.EVENT ue_Update_Reading(al_Row, ls_Reading, Datetime(Date(1900, 1, 1), Time('00:00:00')), '')
		IF f_Check_If_Reading_Changed(al_Row) THEN
			ldt_now = Datetime(Today(), Now())
			This.EVENT ue_Update_Reading(al_Row, ls_Reading, ldt_now, guo_user.ID)
//			This.Object.history_cdt[al_Row] = ldt_now
//			This.Object.history_user_id[al_Row] = guo_user.ID
			This.AcceptText()
			This.Update()
		END IF
	END IF
END IF
RETURN lb_Reading_Expression

//string ls_Erd
//string ls_Erd_2
//string ls_Result
//string ls_Reading
//integer li_Sta
//boolean lb_Reading_Expression
//pointer l_pointer
//
//l_pointer = SetPointer(HourGlass!)
//ib_Calculated_Reading_Modified = FALSE
//IF ( al_Row > 0 ) THEN
//	wf_Refresh_Evaluate_DS_With_Values(This.Object.history_reading_id[al_Row])
//	li_Sta = This.Object.history_sta[al_Row]
//	ls_Erd = This.Object.station_erd[al_Row]
//	lb_Reading_Expression = NOT Empty(ls_Erd)
////	IF NOT ib_Use_Navigation_Arrows THEN
////		This.Object.history_rd.Visible = NOT lb_Reading_Expression
////		This.Object.compute_rd.Visible = lb_Reading_Expression
////	END IF
//	IF lb_Reading_Expression THEN
//		// check applicability expression if necessary
//		IF ( POS(ls_Erd, '"') > 0 ) THEN
//			// If dec quotes used then ...
//			ls_Erd_2 = "Evaluate('" + ls_Erd + "', 0)"
//		ELSE
//			// If no quotes or single quotes used then ...
//			ls_Erd_2 = 'Evaluate("' + ls_Erd + '", 0)'
//		END IF
//		ls_Result = ids_evaluate.Describe(ls_Erd_2)
//		IF ( ls_Result = "!" ) THEN
//			ls_Reading = 'ERROR'
//			IF ab_Show_Message THEN
//				MessageBox("RD Exp Error Sta: " + String(li_Sta), ls_Erd, Exclamation!)
//			END IF
//		ELSE
//			IF ( Len(ls_Result) > 40 ) AND IsNumber(ls_Result) THEN
//				ls_Result = Fit(ls_Result)
//			END IF
//			ls_Reading = UPPER(TRIM(ls_Result))
//		END IF
//		
//		ib_Calculated_Reading_Modified = ab_From_RFC_Event AND ( ls_Reading <> This.Object.history_rd[al_Row] )
//		This.Object.history_rd[al_Row] = ls_Reading
//		IF f_Check_If_Reading_Changed(al_Row) THEN
//			This.Object.history_cdt[al_Row] = DateTime(Today(), Now())
//			This.Object.history_user_id[al_Row] = guo_user.ID
//			This.Update()
//		END IF
//	END IF
//END IF
//
//SetPointer(l_pointer)
//RETURN lb_Reading_Expression
end event

event ue_close_tour();string ls_MB_String
string ls_MB_String_2
boolean lb_Modified
long ll_Count
long ll_Row_Count
integer li_Return
string ls_Filename
long ll_Num_Rows
boolean lb_Prompt_For_Missed
boolean lb_Prompt_For_Required
boolean lb_Prompt_For_Abnormal
boolean lb_Prompt_For_Unscanned
//pointer oldpointer
integer li_Save_Current_Row
boolean lb_Abnormal
long ll_Current_Row
boolean lb_Some_Readings_Taken
integer li_Tour
integer li_Rev_No
integer li_Shift_No
date ld_Date

li_Tour			= gsu_tour_parameters[gi_Current_Tour].tour_number
li_Rev_No		= gsu_tour_parameters[gi_Current_Tour].rev_no
li_Shift_No		= gsu_tour_parameters[gi_Current_Tour].shift_no
ld_Date			= gsu_tour_parameters[gi_Current_Tour].tour_date

lb_Some_Readings_Taken = This.EVENT ue_Verify_Tour_Was_Taken()
IF NOT lb_Some_Readings_Taken THEN
	string ls_Sql
	
//	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
	
	DELETE FROM history 
    WHERE ( tour = :li_Tour ) 
      AND ( shift_no = :li_Shift_No ) 
      AND ( dt = :ld_Date ) ;
	
//	ls_Sql = 'START SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	f_Update_Tour_Open(li_Tour, li_Rev_no, 0)
			
	gsu_tour_parameters[gi_current_tour].tour_number = -1
	gsu_tour_parameters[gi_current_tour].filter = ''
	gsu_tour_parameters[gi_current_tour].last_location = ''
	gsu_tour_parameters[gi_current_tour].scanned_code = ''
	gsu_tour_parameters[gi_current_tour].sort_order = ''
	gsu_tour_parameters[gi_current_tour].tour_filename = ''
	gsu_tour_parameters[gi_current_tour].tour_type_id = ''
ELSE
	This.EVENT ue_Navigate_To_First_Row(FALSE)
	ll_Current_Row = This.GetRow()
	lb_Modified = f_Check_If_Reading_Changed(ll_Current_Row)
	li_Save_Current_Row = This.EVENT ue_Show_Warnings(ll_Current_Row, TRUE, TRUE, lb_Modified)
	lb_Abnormal = ( This.Object.history_spec[ll_Current_Row] = 1 ) OR ( This.Object.history_tol[ll_Current_Row] = 1 )
	IF ( li_Save_Current_Row = 2 ) OR ( li_Save_Current_Row = 20 ) THEN
		gb_Final_Close = FALSE
		RETURN
	ELSEIF ( li_Save_Current_Row = 1 ) THEN
		This.EVENT ue_Update_Row_2(ll_Current_Row)
		IF ib_Auto_Display_Notes_On_OOS AND Empty(This.Object.history_notes[ll_Current_Row]) THEN
			tab_tour.SelectedTab = 4
			gb_Final_Close = FALSE
			RETURN
		ELSEIF lb_Abnormal AND ib_AbnormalReadingsRequireNote AND Empty(This.Object.history_notes[ll_Current_Row]) THEN
//			MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
			ls_MB_String = f_LanguageString('###_REQUIRES_A_NOTE', '### Requires a note')
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			ls_MB_String_2 = f_LanguageString('THIS_###_IS_ABNORMAL_AND_REQUIRES_A_NOTE.', 'This ### is Abnormal and requires a Note.')
			ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
			MessageBox(ls_MB_String, ls_MB_String_2)
			gb_Final_Close = FALSE
			RETURN
		END IF
	//ELSE
	//	IF lb_Abnormal AND ib_AbnormalReadingsRequireNote AND Empty(This.Object.history_notes[ll_Current_Row]) THEN
	//		MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
	//		gb_Final_Close = FALSE
	//		RETURN
	//	END IF
	END IF
	
	gsu_tour_parameters[gi_Current_Tour].scanned_code = ''
	
	lb_Prompt_For_Missed		= ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "Prompt_For_Missed", f_LanguageString('YES', 'Yes'))) = Upper(f_LanguageString('YES', 'Yes')) )
	lb_Prompt_For_Required	= ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "CHECKREQUIREDREADINGS", f_LanguageString('YES', 'Yes'))) = Upper(f_LanguageString('YES', 'Yes')) )
	lb_Prompt_For_Abnormal	= ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "Prompt_For_Abnormal", f_LanguageString('YES', 'Yes'))) = Upper(f_LanguageString('YES', 'Yes')) )
	lb_Prompt_For_Unscanned	= ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "Prompt_For_Unscanned", f_LanguageString('YES', 'Yes'))) = Upper(f_LanguageString('YES', 'Yes')) )

	tab_tour.SelectTab(1)
	
	boolean lb_Redraw
	lb_Redraw = ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "Show_Tour_Close_Progress", f_LanguageString('YES', 'Yes'))) = Upper(f_LanguageString('YES', 'Yes')) )
	//w_tour.SetRedraw(lb_Redraw)
	tab_tour.Visible = lb_Redraw
	//tab_tour.tabpage_readings.SetRedraw(lb_Redraw)
	//This.SetRedraw(lb_Redraw)
	
//	oldpointer = SetPointer(HourGlass!)
	IF gb_Final_Close THEN
		IF lb_Prompt_For_Missed THEN
			li_Return = MessageBox(f_LanguageString('EXITING', 'Exiting') + ' ' + gsu_tour_parameters[gi_Current_Tour].tour_filename, f_LanguageString('REVIEW_MISSED_READINGS?', 'Review Missed Readings?'), Question!, YesNo!)
			IF ( li_Return = 1 ) THEN // Yes
SetPointer(HourGlass!)	
				ll_Num_Rows = This.EVENT ue_Filter_For_Missed()
				IF ( ll_Num_Rows > 0 ) THEN
//					SetPointer(oldpointer)
SetPointer(Arrow!)	
	//				w_tour.SetRedraw(TRUE)
					tab_tour.Visible = TRUE
	//				tab_tour.tabpage_readings.SetRedraw(TRUE)
	//				This.SetRedraw(TRUE)
					RETURN
				END IF
			ELSE // No
			END IF
		ELSE // No
		END IF
	//	IF ib_Check_Required_Readings THEN
		IF lb_Prompt_For_Required THEN
			li_Return = MessageBox(f_LanguageString('EXITING', 'Exiting') + ' ' + gsu_tour_parameters[gi_Current_Tour].tour_filename, f_LanguageString('REVIEW_REQUIRED_READINGS?', 'Review Required Readings?'), Question!, YesNo!)
			IF ( li_Return = 1 ) THEN // Yes
SetPointer(HourGlass!)	
				ll_Num_Rows = This.EVENT ue_Filter_For_Required()
				IF ( ll_Num_Rows > 0 ) THEN
//					SetPointer(oldpointer)
SetPointer(Arrow!)	
	//				w_tour.SetRedraw(TRUE)
					tab_tour.Visible = TRUE
	//				tab_tour.tabpage_readings.SetRedraw(TRUE)
	//				This.SetRedraw(TRUE)
					RETURN
				END IF
			ELSE // No
			END IF
		ELSE // No
		END IF
		IF lb_Prompt_For_Unscanned THEN
			li_Return = MessageBox(f_LanguageString('EXITING', 'Exiting') + ' ' + gsu_tour_parameters[gi_Current_Tour].tour_filename, f_LanguageString('REVIEW_UNSCANNED_READINGS?', 'Review Unscanned Readings?'), Question!, YesNo!)
			IF ( li_Return = 1 ) THEN // Yes
SetPointer(HourGlass!)	
				ll_Num_Rows = This.EVENT ue_Filter_For_Unscanned()
				IF ( ll_Num_Rows > 0 ) THEN
//					SetPointer(oldpointer)
SetPointer(Arrow!)	
	//				w_tour.SetRedraw(TRUE)
					tab_tour.Visible = TRUE
	//				tab_tour.tabpage_readings.SetRedraw(TRUE)
	//				This.SetRedraw(TRUE)
					RETURN
				END IF
			ELSE // No
			END IF
		ELSE // No
		END IF
	END IF
	IF ib_filtering THEN
		This.SetSort('station_seq A')
		This.Sort()
		This.EVENT ue_Retrieve()
	ELSE
		This.SetSort('station_seq A')
		This.Sort()
		This.EVENT ue_Navigate_To_First_Row(FALSE)
	END IF
SetPointer(HourGlass!)	
	ll_Row_Count = This.RowCount()
	w_tour.tab_tour.tabpage_readings.SetFocus()
	
	IF lb_Redraw THEN
		w_tour.tab_tour.tabpage_readings.hpb_1.MaxPosition = ll_Row_Count
		w_tour.tab_tour.tabpage_readings.hpb_1.MinPosition = 0
		w_tour.tab_tour.tabpage_readings.hpb_1.SetStep = 1
		w_tour.tab_tour.tabpage_readings.hpb_1.SetRange(0, ll_Row_Count)
		w_tour.tab_tour.tabpage_readings.hpb_1.OffSetPos(1)
		w_tour.tab_tour.tabpage_readings.hpb_1.Visible = TRUE
	END IF
//	string ls_Compute_Rd
//	string ls_Compute_Min
//	string ls_Compute_Max
//	string ls_Compute_Tol
//	string ls_Compute_App
	FOR ll_Count = 1 TO ll_Row_Count
		Yield()
//		ls_Compute_Rd	= This.Object.compute_rd[ll_Count]
//		ls_Compute_Min	= This.Object.compute_min[ll_Count]
//		ls_Compute_Max	= This.Object.compute_max[ll_Count]
//		ls_Compute_Tol	= This.Object.compute_tol[ll_Count]
//		ls_Compute_App	= This.Object.compute_app[ll_Count]
		// check applicability columns
		IF This.EVENT ue_Evaluate_Applicability(ll_Count, FALSE) THEN
			This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
// Mod 2006-10-25 to avoid ALL masked stations to be populated with the LAST mask data
			This.EVENT ue_Show_Warnings_For_Final_Close(ll_Count, FALSE, TRUE)
//			This.EVENT ue_Show_Warnings(ll_Count, FALSE, TRUE)
		END IF
		IF lb_Redraw THEN
			w_tour.tab_tour.tabpage_readings.hpb_1.position = ll_Count
		END IF
	NEXT
	
	li_Return = This.Update()
	IF ( li_Return = 1 ) THEN
		w_tour.tab_tour.tabpage_readings.hpb_1.Visible = FALSE
		IF gb_Final_Close THEN
			IF lb_Prompt_For_Abnormal THEN
				li_Return = MessageBox(f_LanguageString('EXITING', 'Exiting') + ' ' + gsu_tour_parameters[gi_Current_Tour].tour_filename, f_LanguageString('REVIEW_ABNORMAL_READINGS?', 'Review Abnormal Readings?'), Question!, YesNo!)
				IF ( li_Return = 1 ) THEN // Yes
					ll_Num_Rows = This.EVENT ue_Filter_For_Abnormal()
					IF ( ll_Num_Rows > 0 ) THEN
//						SetPointer(oldpointer)
SetPointer(Arrow!)	
	//					w_tour.SetRedraw(TRUE)
						tab_tour.Visible = TRUE
	//					tab_tour.tabpage_readings.SetRedraw(TRUE)
	//					This.SetRedraw(TRUE)
						RETURN
					END IF
				ELSE // No
				END IF
			END IF
			w_main.wf_Release_Menu(gsu_tour_parameters[gi_Current_Tour].menu_number)
				
			f_Update_Tour_Open(gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].rev_no, 0)
	
			// 2005-11-07 This was axed by Scott due to the fact he needed to 
			// detemine that the tour was opened and there were readings that 
			// were not taken
	//		// Remove any blank readings
	//
	//		 DELETE FROM history 
	//		  WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
	//		    AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
	//		    AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
	//		    AND ( ISNULL(TRIM(rd), '') = '' ) ;
			 
//			IF gb_Using_ML THEN
//				ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//				EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
//				
//				DELETE FROM history 
//				 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
//					AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No ) 
//					AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date ) 
//					AND ( ISNULL(TRIM(rd), '') = '' ) ;
//				
//				ls_Sql = 'START SYNCHRONIZATION DELETE'
//				EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
//				
//				COMMIT USING SQLCA ;
//			END IF

			COMMIT ;
				
			gsu_tour_parameters[gi_current_tour].tour_number = -1
			gsu_tour_parameters[gi_current_tour].filter = ''
			gsu_tour_parameters[gi_current_tour].last_location = ''
			gsu_tour_parameters[gi_current_tour].scanned_code = ''
			gsu_tour_parameters[gi_current_tour].sort_order = ''
			gsu_tour_parameters[gi_current_tour].tour_filename = ''
			gsu_tour_parameters[gi_current_tour].tour_type_id = ''
		END IF
	END IF
END IF
w_tour.tab_tour.tabpage_readings.hpb_1.Visible = FALSE
//w_tour.SetRedraw(TRUE)
tab_tour.Visible = TRUE
//tab_tour.tabpage_readings.SetRedraw(TRUE)
//This.SetRedraw(TRUE)

ls_Filename = "\eSOMS.db"
IF gb_Platform_Is_CE THEN
	SetFileAttributes_CE(ls_Filename, 128)
ELSE
	SetFileAttributes_NT(ls_Filename, 128)
END IF

SetPointer(Arrow!)
IF gb_Final_Close THEN
	CLOSE(w_tour)
ELSE
	gb_Final_Close = FALSE
//	SetPointer(oldpointer)
END IF

//long ll_Count
//long ll_Row_Count
//integer li_Return
//string ls_Filename
//long ll_Num_Rows
//boolean lb_Prompt_For_Missed
//boolean lb_Prompt_For_Required
//boolean lb_Prompt_For_Abnormal
//pointer oldpointer
//integer li_Save_Current_Row
//boolean lb_Abnormal
//long ll_Current_Row
//boolean lb_Some_Readings_Taken
//integer li_Tour
//integer li_Rev_No
//integer li_Shift_No
//date ld_Date
//
//li_Tour			= gsu_tour_parameters[gi_Current_Tour].tour_number
//li_Rev_No		= gsu_tour_parameters[gi_Current_Tour].rev_no
//li_Shift_No		= gsu_tour_parameters[gi_Current_Tour].shift_no
//ld_Date			= gsu_tour_parameters[gi_Current_Tour].tour_date
//
//lb_Some_Readings_Taken = This.EVENT ue_Verify_Tour_Was_Taken()
//IF NOT lb_Some_Readings_Taken THEN
//	string ls_Sql
//	
//	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
//	
//	DELETE FROM history 
//    WHERE ( tour = :li_Tour ) 
//      AND ( shift_no = :li_Shift_No ) 
//      AND ( dt = :ld_Date ) ;
//	
//	ls_Sql = 'START SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
//
//	f_Update_Tour_Open(li_Tour, li_Rev_no, 0)
//			
//	gsu_tour_parameters[gi_current_tour].tour_number = -1
//	gsu_tour_parameters[gi_current_tour].filter = ''
//	gsu_tour_parameters[gi_current_tour].last_location = ''
//	gsu_tour_parameters[gi_current_tour].scanned_code = ''
//	gsu_tour_parameters[gi_current_tour].sort_order = ''
//	gsu_tour_parameters[gi_current_tour].tour_filename = ''
//	gsu_tour_parameters[gi_current_tour].tour_type_id = ''
//ELSE
//	This.EVENT ue_Navigate_To_First_Row(FALSE)
//	ll_Current_Row = This.GetRow()
//	li_Save_Current_Row = This.EVENT ue_Show_Warnings(ll_Current_Row, TRUE, TRUE)
//	lb_Abnormal = ( This.Object.history_spec[ll_Current_Row] = 1 ) OR ( This.Object.history_tol[ll_Current_Row] = 1 )
//	IF ( li_Save_Current_Row = 2 ) OR ( li_Save_Current_Row = 20 ) THEN
//		gb_Final_Close = FALSE
//		RETURN
//	ELSEIF ( li_Save_Current_Row = 1 ) THEN
//		This.EVENT ue_Update_Row_2(ll_Current_Row)
//		IF ib_Auto_Display_Notes_On_OOS AND Empty(This.Object.history_notes[ll_Current_Row]) THEN
//			tab_tour.SelectedTab = 4
//			gb_Final_Close = FALSE
//			RETURN
//		ELSEIF lb_Abnormal AND ib_AbnormalReadingsRequireNote AND Empty(This.Object.history_notes[ll_Current_Row]) THEN
//			MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
//			gb_Final_Close = FALSE
//			RETURN
//		END IF
//	//ELSE
//	//	IF lb_Abnormal AND ib_AbnormalReadingsRequireNote AND Empty(This.Object.history_notes[ll_Current_Row]) THEN
//	//		MessageBox(gs_Station_Label + ' Requires a Note', 'This ' + gs_Station_Label + ' is Abnormal and requires a Note.')
//	//		gb_Final_Close = FALSE
//	//		RETURN
//	//	END IF
//	END IF
//	
//	gsu_tour_parameters[gi_Current_Tour].scanned_code = ""
//	
//	lb_Prompt_For_Missed = ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "Prompt_For_Missed", "Yes")) = 'YES' )
//	lb_Prompt_For_Required = ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "CHECKREQUIREDREADINGS", "Yes")) = 'YES' )
//	lb_Prompt_For_Abnormal = ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "Prompt_For_Abnormal", "Yes")) = 'YES' )
//	
//	tab_tour.SelectTab(1)
//	
//	boolean lb_Redraw
//	lb_Redraw = ( Upper(ProfileString(gs_INI_File, gs_Window_Title, "Show_Tour_Close_Progress", "Yes")) = 'YES' )
//	//w_tour.SetRedraw(lb_Redraw)
//	tab_tour.Visible = lb_Redraw
//	//tab_tour.tabpage_readings.SetRedraw(lb_Redraw)
//	//This.SetRedraw(lb_Redraw)
//	
//	oldpointer = SetPointer(HourGlass!)
//	
//	IF gb_Final_Close THEN
//		IF lb_Prompt_For_Missed THEN
//			li_Return = MessageBox(f_LanguageString('EXITING', 'Exiting') + ' ' + gsu_tour_parameters[gi_Current_Tour].tour_filename, 'Review Missed Readings?', Question!, YesNo!)
//			IF ( li_Return = 1 ) THEN // Yes
//				ll_Num_Rows = This.EVENT ue_Filter_For_Missed()
//				IF ( ll_Num_Rows > 0 ) THEN
//					SetPointer(oldpointer)
//	//				w_tour.SetRedraw(TRUE)
//					tab_tour.Visible = TRUE
//	//				tab_tour.tabpage_readings.SetRedraw(TRUE)
//	//				This.SetRedraw(TRUE)
//					RETURN
//				END IF
//			ELSE // No
//			END IF
//		ELSE // No
//		END IF
//	//	IF ib_Check_Required_Readings THEN
//		IF lb_Prompt_For_Required THEN
//			li_Return = MessageBox(f_LanguageString('EXITING', 'Exiting') + ' ' + gsu_tour_parameters[gi_Current_Tour].tour_filename, 'Review Required Readings?', Question!, YesNo!)
//			IF ( li_Return = 1 ) THEN // Yes
//				ll_Num_Rows = This.EVENT ue_Filter_For_Required()
//				IF ( ll_Num_Rows > 0 ) THEN
//					SetPointer(oldpointer)
//	//				w_tour.SetRedraw(TRUE)
//					tab_tour.Visible = TRUE
//	//				tab_tour.tabpage_readings.SetRedraw(TRUE)
//	//				This.SetRedraw(TRUE)
//					RETURN
//				END IF
//			ELSE // No
//			END IF
//		ELSE // No
//		END IF
//	END IF
//	IF ib_filtering THEN
//		This.SetSort('station_seq A')
//		This.Sort()
//		This.EVENT ue_Retrieve()
//	ELSE
//		This.SetSort('station_seq A')
//		This.Sort()
//		This.EVENT ue_Navigate_To_First_Row(FALSE)
//	END IF
//	ll_Row_Count = This.RowCount()
//	w_tour.tab_tour.tabpage_readings.SetFocus()
//	
//	IF lb_Redraw THEN
//		w_tour.tab_tour.tabpage_readings.hpb_1.MaxPosition = ll_Row_Count
//		w_tour.tab_tour.tabpage_readings.hpb_1.MinPosition = 0
//		w_tour.tab_tour.tabpage_readings.hpb_1.SetStep = 1
//		w_tour.tab_tour.tabpage_readings.hpb_1.SetRange(0, ll_Row_Count)
//		w_tour.tab_tour.tabpage_readings.hpb_1.OffSetPos(1)
//		w_tour.tab_tour.tabpage_readings.hpb_1.Visible = TRUE
//	END IF
//	FOR ll_Count = 1 TO ll_Row_Count
//		Yield()
//		// check applicability columns
//		IF This.EVENT ue_Evaluate_Applicability(ll_Count, FALSE) THEN
//	//		IF ( This.Object.history_sta[ll_Count] = 189 ) OR ( This.Object.history_sta[ll_Count] = 189 ) OR ( This.Object.history_sta[ll_Count] = 190 ) OR ( This.Object.history_sta[ll_Count] = 191 ) THEN
//	//			ll_Count = ll_Count
//	//		END IF
//			This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
//	//		// Update the reading from an expression
//	//		This.EVENT ue_Update_Row_2(ll_Count)
//			This.EVENT ue_Show_Warnings_For_Close(ll_Count)
//	//		// Update the OOS and OOT conditions
//	//		This.EVENT ue_Update_Row_2(ll_Count)
//		END IF
//		IF lb_Redraw THEN
//			w_tour.tab_tour.tabpage_readings.hpb_1.position = ll_Count
//		END IF
//	NEXT
//	
//	li_Return = This.Update()
//	IF ( li_Return = 1 ) THEN
//		w_tour.tab_tour.tabpage_readings.hpb_1.Visible = FALSE
//	
//		IF gb_Final_Close THEN
//			IF lb_Prompt_For_Abnormal THEN
//				li_Return = MessageBox(f_LanguageString('EXITING', 'Exiting') + ' ' + gsu_tour_parameters[gi_Current_Tour].tour_filename, 'Review Abnormal Readings?', Question!, YesNo!)
//				IF ( li_Return = 1 ) THEN // Yes
//					ll_Num_Rows = This.EVENT ue_Filter_For_Abnormal()
//					IF ( ll_Num_Rows > 0 ) THEN
//						SetPointer(oldpointer)
//	//					w_tour.SetRedraw(TRUE)
//						tab_tour.Visible = TRUE
//	//					tab_tour.tabpage_readings.SetRedraw(TRUE)
//	//					This.SetRedraw(TRUE)
//						RETURN
//					END IF
//				ELSE // No
//				END IF
//			END IF
//			w_main.wf_Release_Menu(gsu_tour_parameters[gi_Current_Tour].menu_number)
//				
//			f_Update_Tour_Open(gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].rev_no, 0)
//	
//			// 2005-11-07 This was axed by Scott due to the fact he needed to 
//			// detemine that the tour was opened and there were readings that 
//			// were not taken
//	//		// Remove any blank readings
//	//
//	//		 DELETE FROM history 
//	//		  WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
//	//		    AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
//	//		    AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
//	//		    AND ( ISNULL(TRIM(rd), '') = '' ) ;
//			 
//			 COMMIT ;
//				
//			gsu_tour_parameters[gi_current_tour].tour_number = -1
//			gsu_tour_parameters[gi_current_tour].filter = ''
//			gsu_tour_parameters[gi_current_tour].last_location = ''
//			gsu_tour_parameters[gi_current_tour].scanned_code = ''
//			gsu_tour_parameters[gi_current_tour].sort_order = ''
//			gsu_tour_parameters[gi_current_tour].tour_filename = ''
//			gsu_tour_parameters[gi_current_tour].tour_type_id = ''
//		END IF
//	END IF
//END IF
//w_tour.tab_tour.tabpage_readings.hpb_1.Visible = FALSE
////w_tour.SetRedraw(TRUE)
//tab_tour.Visible = TRUE
////tab_tour.tabpage_readings.SetRedraw(TRUE)
////This.SetRedraw(TRUE)
//
//ls_Filename = "\eSOMS.db"
//IF gb_Platform_Is_CE THEN
//	SetFileAttributes_CE(ls_Filename, 128)
//ELSE
//	SetFileAttributes_NT(ls_Filename, 128)
//END IF
//
//IF gb_Final_Close THEN
//	CLOSE(w_tour)
//	SetPointer(Arrow!)
//ELSE
//	gb_Final_Close = FALSE
//	SetPointer(oldpointer)
//END IF
end event

event ue_enter_button();datetime ldt_now
integer li_Return
long ll_Row
string ls_Rd
string ls_Prev
string ls_Mask
string ls_Result
string ls_MaskDataType
boolean lb_Empty

tab_tour.tabpage_readings.SetFocus()
ll_Row = This.GetRow()
AcceptText()
IF Empty(This.GetItemString(ll_Row, 'station_erd')) THEN
	ls_Rd = This.GetItemString(ll_Row, 'history_rd')
	IF ib_Edit_Mask THEN
		IF NOT Empty(This.GetItemString(ll_Row, 'prev')) THEN
			ls_MaskDataType = This.GetItemString(il_Current_Row_For_Update_TabPages, 'station_maskdatatype')
			CHOOSE CASE UPPER(ls_MaskDataType)
				CASE 'DATE'
					date ld_temp
					em_1.GetData(ld_temp)
					lb_Empty = ( ld_temp = Date(1900, 1, 1) )
				CASE 'DATETIME'
					datetime ldt_temp
					em_1.GetData(ldt_temp)
					lb_Empty = ( Date(ldt_temp) = Date(1900, 1, 1) )
				CASE 'DECIMAL'
					decimal ldec_temp
					decimal ldec_temp_2
					editmask em_temp_2
					string _temp
					string _temp_2

					em_temp_2 = CREATE editmask
					ls_Mask = em_1.mask
					li_Return = em_temp_2.SetMask(DecimalMask!, ls_Mask)
					em_temp_2.Text = ls_Rd
					em_1.GetData(ldec_temp)
					em_temp_2.GetData(ldec_temp_2)
					DESTROY em_temp_2
					_temp = String(ldec_temp)
					_temp_2 = String(ldec_temp_2)
					lb_Empty = Empty(_temp) OR ( ( ldec_temp = ldec_temp_2 ) AND ( ldec_temp = 0 ) )
					em_1.GetData(ldec_temp)
				CASE 'STRING'
					em_1.GetData(ls_Result)
					lb_Empty = Empty(ls_Result)
				CASE 'NUMERIC'
					dec ldb_temp
					dec ldb_temp_2
					editmask em_temp
					string temp
					string temp_2
	
					em_temp = CREATE editmask
					ls_Mask = em_1.mask
					em_temp.SetMask(NumericMask!, ls_Mask)
					em_temp.Text = ls_Rd
					em_1.GetData(ldb_temp)
					em_temp.GetData(ldb_temp_2)
					DESTROY em_temp
					temp = String(ldb_temp)
					temp_2 = String(ldb_temp_2)
					lb_Empty = Empty(temp) OR ( ( ldb_temp = ldb_temp_2 ) AND ( ldb_temp = 0 ) )
				CASE 'TIME'
					time lt_temp
					em_1.GetData(lt_temp)
					lb_Empty = ( lt_temp = Time('00:00:00') )
				CASE ELSE
					lb_Empty = TRUE
			END CHOOSE
			IF lb_Empty THEN
				em_1.Text = This.GetItemString(ll_Row, 'prev')
			END IF
		END IF
	ELSE
		IF Empty(ls_Rd) THEN
//			This.Object.history_rd[ll_Row] = This.Object.prev[ll_Row]
			ldt_now = Datetime(Today(), Now())
//			This.Object.history_cdt[ll_Row] = ldt_now
//			This.Object.history_user_id[ll_Row] = guo_user.ID
			This.EVENT ue_Update_Reading(ll_Row, This.GetItemString(ll_Row, 'prev'), ldt_now, guo_user.ID)
		END IF
	END IF
END IF
This.EVENT ue_Navigate_To_Row(1, 'ue_enter_button')

end event

event focus();IF ib_Edit_Mask THEN
	em_1.SetFocus()
ELSE
	IF gb_Use_Navigation_Arrows THEN
		tab_tour.tabpage_readings.SetFocus()
	ELSE
		This.SetFocus()
		This.SetColumn('history_rd')
	END If
END IF

end event

event type boolean ue_find_scan_code(string as_scan);long ll_Row_Found
boolean lb_Row_Found
string ls_Scan

ls_Scan = This.GetItemString(This.GetRow(), 'station_scan')

IF ( ls_Scan = as_Scan ) THEN
	lb_Row_Found = TRUE
ELSE
	ll_Row_Found = This.Find(" ( station_scan = '" + as_Scan + "' ) ", 1, This.RowCount())
	
	lb_Row_Found = ( ll_Row_Found > 0 )
	IF lb_Row_Found THEN
		il_Row_For_Navigate_To_Row_PostEvent = ll_Row_Found
		This.PostEvent("ue_Navigate_To_Row", 0, ll_Row_Found)
	END IF
END IF

RETURN lb_Row_Found
end event

event type long ue_filter_for_abnormal();string ls_MB_String
string ls_Filter
integer li_Return
long ll_Num_Rows
long ll_Count
boolean lb_Been_Here

This.SetRedraw(FALSE)
ib_Filter_During_Close = gb_Final_Close

IF Empty(is_Scan_Filter) THEN
	ls_Filter = " ( ( history_spec = 1 ) OR ( history_tol = 1 ) OR NOT Empty(history_notes) ) "
ELSE
	ls_Filter = is_Scan_Filter + " AND ( ( history_spec = 1 ) OR ( history_tol = 1 ) OR NOT Empty(history_notes) ) "
END IF

ib_Filtering = TRUE
This.SetRow(1)
li_Return = This.SetFilter(ls_Filter)
li_Return = This.Filter()

ll_Num_Rows = This.RowCount()
li_Return = 1
FOR ll_Count = 1 To ll_Num_Rows
	// check applicability columns
	IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
		lb_Been_Here = TRUE
		gl_Last_Applicable_Station = This.Object.history_sta[ll_Count]
		il_Row_For_Navigate_To_Row_PostEvent = ll_Count
		This.PostEvent('ue_Navigate_To_Row', 0, ll_Count)
//		This.EVENT ue_Navigate_To_First_Row(FALSE)
		EXIT
	END IF
NEXT
IF NOT lb_Been_Here THEN
	gsu_tour_parameters[gi_Current_Tour].Filter = ''
	ll_Num_Rows = 0
//	MessageBox("No " + gs_Station_Label + "(s)", "There are no Abnormal Readings to display", Exclamation!)
	ls_MB_String = f_LanguageString('THERE_ARE_NO_ABNORMAL_READINGS_TO_DISPLAY', "There are no Abnormal Readings to display")
	ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
	MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
	This.EVENT ue_Retrieve_Current_Tour(FALSE)
ELSE
	IF ( ll_Num_Rows = 0 ) THEN
		gsu_tour_parameters[gi_Current_Tour].Filter = ''
		ll_Num_Rows = 0
//		MessageBox("No " + gs_Station_Label + "(s)", "There are no Abnormal Readings to display", Exclamation!)
		ls_MB_String = f_LanguageString('THERE_ARE_NO_ABNORMAL_READINGS_TO_DISPLAY', "There are no Abnormal Readings to display")
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
		This.EVENT ue_Retrieve_Current_Tour(FALSE)
	ELSEIF ( ll_Num_Rows = 1 ) THEN
		IF NOT This.EVENT ue_Evaluate_Applicability(1, TRUE) THEN
			gsu_tour_parameters[gi_Current_Tour].Filter = ''
			ll_Num_Rows = 0
//			MessageBox("No " + gs_Station_Label + "(s)", "There are no Abnormal Readings to display", Exclamation!)
			ls_MB_String = f_LanguageString('THERE_ARE_NO_ABNORMAL_READINGS_TO_DISPLAY', "There are no Abnormal Readings to display")
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
			This.EVENT ue_Retrieve_Current_Tour(FALSE)
		ELSE
			gsu_tour_parameters[gi_Current_Tour].Filter = 'ABNORMAL'
			This.EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)

			tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//			IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//				MessageBox("No stations", "There are no Abnormal Readings to display", Exclamation!)
//				This.EVENT ue_Retrieve_Current_Tour(FALSE)
//			END IF
		END IF
	ELSE
		gsu_tour_parameters[gi_Current_Tour].Filter = 'ABNORMAL'
		This.EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)

		tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//		IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//			MessageBox("No stations", "There are no Abnormal Readings to display", Exclamation!)
//			This.EVENT ue_Retrieve_Current_Tour(FALSE)
//		END IF
	END IF
END IF

// Save for a possible preference later
IF FALSE THEN
	in_dwaw.of_Register(w_tour, tab_tour.tabpage_stations.dw_stations)
	in_dwaw.of_ResizeAll()
END IF

IF ( tab_tour.SelectedTab <> 1 ) THEN
	tab_tour.EVENT SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
END IF
il_Current_Row_For_Update_TabPages = This.GetRow()
This.SetRedraw(TRUE)

This.PostEvent('ue_Update_Tabpages')

RETURN ll_Num_Rows

end event

event ue_retrieve_current_tour(boolean ab_close);This.EVENT ue_Retrieve()
ib_Filter_During_Close = FALSE

end event

event type long ue_filter_for_required();string ls_MB_String
string ls_Filter
integer li_Return
long ll_Num_Rows
long ll_Count
boolean lb_Been_Here

This.SetRedraw(FALSE)
ib_Filter_During_Close = gb_Final_Close

IF Empty(is_Scan_Filter) THEN
	ls_Filter = " ( station_reading_required = 1 ) "
ELSE
	ls_Filter = is_Scan_Filter + " AND ( station_reading_required = 1 ) "
END IF

ib_Filtering = TRUE
This.SetRow(1)
li_Return = This.SetFilter(ls_Filter)
li_Return = This.Filter()

ll_Num_Rows = This.RowCount()
li_Return = 1
FOR ll_Count = 1 To ll_Num_Rows
	// check applicability columns
	IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
		lb_Been_Here = TRUE
		gl_Last_Applicable_Station = This.Object.history_sta[ll_Count]
		il_Row_For_Navigate_To_Row_PostEvent = ll_Count
		This.PostEvent('ue_Navigate_To_Row', 0, ll_Count)
//		This.EVENT ue_Navigate_To_First_Row(FALSE)
		EXIT
	END IF
NEXT
IF NOT lb_Been_Here THEN
	gsu_tour_parameters[gi_Current_Tour].Filter = ''
	ll_Num_Rows = 0
//	MessageBox("No " + gs_Station_Label + "(s)", "There are no Required Readings to display", Exclamation!)
	ls_MB_String = f_LanguageString('THERE_ARE_NO_REQUIRED_READINGS_TO_DISPLAY', "There are no Required Readings to display")
	ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
	MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
	This.EVENT ue_Retrieve_Current_Tour(FALSE)
ELSE
	IF ( ll_Num_Rows = 0 ) THEN
		gsu_tour_parameters[gi_Current_Tour].Filter = ''
//		MessageBox("No " + gs_Station_Label + "(s)", "There are no Required Readings to display", Exclamation!)
		ls_MB_String = f_LanguageString('THERE_ARE_NO_REQUIRED_READINGS_TO_DISPLAY', "There are no Required Readings to display")
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
		This.EVENT ue_Retrieve_Current_Tour(FALSE)
	ELSEIF ( ll_Num_Rows = 1 ) THEN
		IF NOT This.EVENT ue_Evaluate_Applicability(1, TRUE) THEN
			gsu_tour_parameters[gi_Current_Tour].Filter = ''
			ll_Num_Rows = 0
//			MessageBox("No " + gs_Station_Label + "(s)", "There are no Required Readings to display", Exclamation!)
			ls_MB_String = f_LanguageString('THERE_ARE_NO_REQUIRED_READINGS_TO_DISPLAY', "There are no Required Readings to display")
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
			This.EVENT ue_Retrieve_Current_Tour(FALSE)
		ELSE
			gsu_tour_parameters[gi_Current_Tour].Filter = 'REQUIRED'
			This.EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)

			tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//			IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//				MessageBox("No stations", "There are no Required Readings to display", Exclamation!)
//				This.EVENT ue_Retrieve_Current_Tour(FALSE)
//			END IF
		END IF
	ELSE
		gsu_tour_parameters[gi_Current_Tour].Filter = 'REQUIRED'
		This.EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)

		tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//		IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//			MessageBox("No stations", "There are no Required Readings to display", Exclamation!)
//			This.EVENT ue_Retrieve_Current_Tour(FALSE)
//		END IF
	END IF
END IF

// Save for a possible preference later
IF FALSE THEN
	in_dwaw.of_Register(w_tour, tab_tour.tabpage_stations.dw_stations)
	in_dwaw.of_ResizeAll()
END IF

IF ( tab_tour.SelectedTab <> 1 ) THEN
	tab_tour.EVENT SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
END IF
il_Current_Row_For_Update_TabPages = This.GetRow()
This.SetRedraw(TRUE)

This.PostEvent('ue_Update_Tabpages')

RETURN ll_Num_Rows

end event

event type boolean ue_does_scancode_exist(string as_scan);MessageBox('Not Used', 'ue_does_scancode_exist')
RETURN FALSE

//long ll_Num_Rows
//integer li_Shift_No
//date ld_Tour_Date
//integer li_Tour
//integer li_Rev_No
//integer li_DOW
//integer li_DOM
//string ls_DOW
//string ls_DOM
//string ls_Location
//
//IF ( as_Scan = '--BLANK--' ) THEN
//	as_Scan = ''
//END IF
//li_Tour = gsu_tour_parameters[gi_Current_Tour].tour_number
//li_Rev_No = gsu_tour_parameters[gi_Current_Tour].rev_no
//li_Shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no
//ld_Tour_Date = gsu_tour_parameters[gi_Current_Tour].tour_date
//ls_Location = gsu_tour_parameters[gi_Current_Tour].last_location
//
//li_DOW = DayNumber(ld_Tour_Date)
//li_DOM = Day(ld_Tour_Date)
//
//ls_DOW = Fill("_", li_DOW - 1) + "X%"
//ls_DOM = Fill("_", li_DOM - 1) + "X%"
//    
////SCAN TODO
//IF gb_Include_Equip_In_Scan THEN
//	IF NOT Empty(ls_Location) THEN
//	
//		SELECT COUNT(*) 
//		  INTO :ll_Num_Rows 
//		  FROM station a, 
//				 appl_shift_times b 
//		 WHERE ( a.tour = :li_Tour ) 
//			AND ( a.rev_no = :li_Rev_No ) 
//	//		AND ( ISNULL(a.scan, '') = :as_Scan ) 
//			AND ( ( ISNULL(a.scan, '') = :as_Scan ) OR ( ISNULL(a.equip_operator_id, '') = :as_Scan ) ) 
//			AND ( ( a.appldow LIKE :ls_DOW ) OR ( a.appldom LIKE :ls_DOM ) ) 
//			AND ( a.location = :ls_Location ) 
//			AND ( a.tour = b.tour ) 
//			AND ( a.rev_no = b.rev_no ) 
//			AND ( a.sta = b.sta ) 
//			AND ( b.shift_no = :li_Shift_No ) 
//			AND ( b.shift_appl = 1 ) 
//		USING SQLCA ; 
//		
//	ELSE
//	
//		SELECT COUNT(*) 
//		  INTO :ll_Num_Rows 
//		  FROM station a, appl_shift_times b 
//		 WHERE ( a.tour = :li_Tour ) 
//			AND ( a.rev_no = :li_Rev_No ) 
//	//		AND ( ISNULL(a.scan, '') = :as_Scan ) 
//			AND ( ( ISNULL(a.scan, '') = :as_Scan ) OR ( ISNULL(a.equip_operator_id, '') = :as_Scan ) ) 
//			AND ( ( a.appldow LIKE :ls_DOW ) OR ( a.appldom LIKE :ls_DOM ) ) 
//			AND ( a.tour = b.tour ) 
//			AND ( a.rev_no = b.rev_no ) 
//			AND ( a.sta = b.sta ) 
//			AND ( b.shift_no = :li_Shift_No ) 
//			AND ( b.shift_appl = 1 ) 
//		USING SQLCA ; 
//		
//	END IF
//ELSE
//	IF NOT Empty(ls_Location) THEN
//	
//		SELECT COUNT(*) 
//		  INTO :ll_Num_Rows 
//		  FROM station a, 
//				 appl_shift_times b 
//		 WHERE ( a.tour = :li_Tour ) 
//			AND ( a.rev_no = :li_Rev_No ) 
//			AND ( ISNULL(a.scan, '') = :as_Scan ) 
//			AND ( ( a.appldow LIKE :ls_DOW ) OR ( a.appldom LIKE :ls_DOM ) ) 
//			AND ( a.location = :ls_Location ) 
//			AND ( a.tour = b.tour ) 
//			AND ( a.rev_no = b.rev_no ) 
//			AND ( a.sta = b.sta ) 
//			AND ( b.shift_no = :li_Shift_No ) 
//			AND ( b.shift_appl = 1 ) 
//		USING SQLCA ; 
//		
//	ELSE
//	
//		SELECT COUNT(*) 
//		  INTO :ll_Num_Rows 
//		  FROM station a, appl_shift_times b 
//		 WHERE ( a.tour = :li_Tour ) 
//			AND ( a.rev_no = :li_Rev_No ) 
//			AND ( ISNULL(a.scan, '') = :as_Scan ) 
//			AND ( ( a.appldow LIKE :ls_DOW ) OR ( a.appldom LIKE :ls_DOM ) ) 
//			AND ( a.tour = b.tour ) 
//			AND ( a.rev_no = b.rev_no ) 
//			AND ( a.sta = b.sta ) 
//			AND ( b.shift_no = :li_Shift_No ) 
//			AND ( b.shift_appl = 1 ) 
//		USING SQLCA ; 
//		
//	END IF
//END IF
//
//RETURN ( ll_Num_Rows > 0 )
//
end event

event type integer ue_show_warnings_for_close(long ll_row);string ls_Erd
string ls_Compute_Erd
string ls_Reading
string ls_Return
string ls_Min
string ls_Max
string ls_Tol

string ls_Station_emin
string ls_Station_Minimum
string ls_Station_emax
string ls_Station_Maximum
string ls_Station_etol
string ls_Station_Tolerance

integer li_OOS
integer li_OOT
integer li_Less_Than
integer li_Greater_Than
integer li_Return
string ls_Message
boolean 	lb_Display
boolean lb_Rows_Present
//string ls_Database_Reading
//dwitemstatus l_status
pointer l_pointer
integer li_Sta

l_pointer = SetPointer(HourGlass!)

//l_status = This.GetItemStatus(ll_Row, 0, Primary!)
IF ( This.RowCount() > 0 ) /*AND ( ( l_status = DataModified! ) OR ( l_status = NewModified! ) )*/ THEN
	li_OOS = 0
	li_OOT = 0
	ls_Reading = This.GetITemString(ll_Row, 'history_rd')
	li_Sta = This.GetItemNumber(ll_Row, 'history_sta')
	
//	SELECT rd 
//	  INTO :ls_Database_Reading 
//	  FROM history 
//	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
//		AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
//		AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
//		AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
//		AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
//		AND ( reading_id = 0 ) 
//	 USING SQLCA ;
	
	lb_Rows_Present = ( This.RowCount() > 0 )
	
	IF ( gb_Tour_Opened AND lb_Rows_Present /*AND ls_Reading <> ls_Database_Reading */) THEN
		lb_Display = TRUE
	ELSE
		lb_Display = FALSE
	END IF
	
//	IF NOT Empty(ls_Reading) AND lb_Display THEN
	// Check for quick key OOS 
	integer li_Check_OOS_For_Quick_Key
	integer li_Row_Returned
			
	// The sub-select below is necessary because the normal SELECT returns zero even if there is no record
	// and the SQLNRows started returning -11 for some reason

	SELECT spec_setting, 
		  ( SELECT COUNT(*) 
		      FROM quick_keys 
			  WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
			    AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
				 AND ( sta = :li_Sta ) 
				 AND ( reading = :ls_Reading ) ) 
	  INTO :li_Check_OOS_For_Quick_Key, :li_Row_Returned
	  FROM quick_keys 
	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
		AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
		AND ( sta = :li_Sta ) 
		AND ( reading = :ls_Reading ) 
	 USING SQLCA ;

	IF ( li_Check_OOS_For_Quick_Key = 0 ) AND ( li_Row_Returned > 0 ) THEN
		// Never OOS
		// 2004-10-12 Scott says never OOT as well
//		This.Object.history_spec[ll_Row] = 0
//		This.Object.history_tol[ll_Row] = 0
		li_OOS = 0
		li_OOT = 0
	ELSEIF ( li_Check_OOS_For_Quick_Key = 2 ) AND ( li_Row_Returned > 0 ) THEN
		// Always OOS
		// 2004-10-12 Scott says never OOT as well
//		This.Object.history_spec[ll_Row] = 1
//		This.Object.history_tol[ll_Row] = 0
		li_OOS = 1
		li_OOT = 0
	ELSE
		ls_Station_emin = This.GetItemString(ll_Row, 'station_emin')
		ls_Station_Minimum = This.GetItemString(ll_Row, 'station_minimum')
		IF Empty(ls_Station_emin) THEN
			IF Empty(ls_Station_Minimum) THEN
				ls_Min = ""
			ELSE
				ls_Min = ls_Station_Minimum
			END IF
		ELSE
			ls_Min = This.Describe("Evaluate('" + ls_Station_emin + "', " + String(ll_Row) + ")")
			IF ( ls_Min = "!" ) THEN
				ls_Min = ""
			END IF
		END IF

		ls_Station_emax = This.GetItemString(ll_Row, 'station_emax')
		ls_Station_Maximum = This.GetItemString(ll_Row, 'station_maximum')
		IF Empty(ls_Station_emax) THEN
			IF Empty(ls_Station_Maximum) THEN
				ls_Max = ""
			ELSE
				ls_Max = ls_Station_Maximum
			END IF
		ELSE
			ls_Max = This.Describe("Evaluate('" + ls_Station_emax + "', " + String(ll_Row) + ")")
			IF ( ls_Max = "!" ) THEN
				ls_Max = ""
			END IF
		END IF

		ls_Station_etol = This.GetItemString(ll_Row, 'station_etol')
		ls_Station_Tolerance = This.GetItemString(ll_Row, 'station_tol')
		IF Empty(ls_Station_etol) THEN
			IF Empty(ls_Station_Tolerance) THEN
				ls_Tol = ""
			ELSE
				ls_Tol = ls_Station_Tolerance
			END IF
		ELSE
			ls_Tol = This.Describe("Evaluate('" + ls_Station_etol + "', " + String(ll_Row) + ")")
			IF ( ls_Tol = "!" ) THEN
				ls_Tol = ""
			END IF
		END IF
		
		li_Less_Than = This.GetItemNumber(ll_Row, 'station_less_than')
		li_Greater_Than = This.GetItemNumber(ll_Row, 'station_greater_than')
		li_OOS = This.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
		li_OOT = This.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
	END IF
	This.Object.history_spec[ll_Row] = li_OOS
	This.Object.history_tol[ll_Row] = li_OOT / 2
	This.EVENT ue_Set_OOT(ll_Row)
	This.Update()
//	END IF
ELSE
	SetPointer(l_pointer)
	RETURN 0
END IF

SetPointer(l_pointer)
RETURN li_Return
//string ls_Erd
//string ls_Compute_Erd
//string ls_Reading
//string ls_Return
//string ls_Min
//string ls_Max
//string ls_Tol
//
//string ls_Station_emin
//string ls_Station_Minimum
//string ls_Station_emax
//string ls_Station_Maximum
//string ls_Station_etol
//string ls_Station_Tolerance
//
//integer li_OOS
//integer li_OOT
//integer li_Less_Than
//integer li_Greater_Than
//integer li_Return
//string ls_Message
//boolean 	lb_Display
//boolean lb_Rows_Present
////string ls_Database_Reading
////dwitemstatus l_status
//pointer l_pointer
//
//l_pointer = SetPointer(HourGlass!)
//IF ( This.Object.history_sta[ll_Row] = 21 ) THEN
//	integer i
//	i = 1
//END IF
//
////l_status = This.GetItemStatus(ll_Row, 0, Primary!)
//IF ( This.RowCount() > 0 ) /*AND ( ( l_status = DataModified! ) OR ( l_status = NewModified! ) )*/ THEN
//	li_OOS = 0
//	li_OOT = 0
//	ls_Reading = This.Object.history_rd[ll_Row]
//	
////	SELECT rd 
////	  INTO :ls_Database_Reading 
////	  FROM history 
////	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
////		AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
////		AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
////		AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
////		AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
////		AND ( reading_id = 0 ) 
////	 USING SQLCA ;
//	
//	lb_Rows_Present = ( This.RowCount() > 0 )
//	
//	IF ( gb_Tour_Opened AND lb_Rows_Present /*AND ls_Reading <> ls_Database_Reading */) THEN
//		lb_Display = TRUE
//	ELSE
//		lb_Display = FALSE
//	END IF
//	
//	IF NOT Empty(ls_Reading) AND lb_Display THEN
//		ls_Station_emin = This.Object.station_emin[ll_Row]
//		ls_Station_Minimum = This.Object.station_minimum[ll_Row]
//		IF Empty(ls_Station_emin) THEN
//			IF Empty(ls_Station_Minimum) THEN
//				ls_Min = ""
//			ELSE
//				ls_Min = ls_Station_Minimum
//			END IF
//		ELSE
//			ls_Min = This.Describe("Evaluate('" + ls_Station_emin + "', " + String(ll_Row) + ")")
//			IF ( ls_Min = "!" ) THEN
//				ls_Min = ""
//			END IF
//		END IF
//
//		ls_Station_emax = This.Object.station_emax[ll_Row]
//		ls_Station_Maximum = This.Object.station_maximum[ll_Row]
//		IF Empty(ls_Station_emax) THEN
//			IF Empty(ls_Station_Maximum) THEN
//				ls_Max = ""
//			ELSE
//				ls_Max = ls_Station_Maximum
//			END IF
//		ELSE
//			ls_Max = This.Describe("Evaluate('" + ls_Station_emax + "', " + String(ll_Row) + ")")
//			IF ( ls_Max = "!" ) THEN
//				ls_Max = ""
//			END IF
//		END IF
//
//		ls_Station_etol = This.Object.station_etol[ll_Row]
//		ls_Station_Tolerance = This.Object.station_tol[ll_Row]
//		IF Empty(ls_Station_etol) THEN
//			IF Empty(ls_Station_Tolerance) THEN
//				ls_Tol = ""
//			ELSE
//				ls_Tol = ls_Station_Tolerance
//			END IF
//		ELSE
//			ls_Tol = This.Describe("Evaluate('" + ls_Station_etol + "', " + String(ll_Row) + ")")
//			IF ( ls_Tol = "!" ) THEN
//				ls_Tol = ""
//			END IF
//		END IF
//		
//		li_Less_Than = This.Object.station_less_than[ll_Row]
//		li_Greater_Than = This.Object.station_greater_than[ll_Row]
//		li_OOS = This.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
//		li_OOT = This.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
//		This.Object.history_spec[ll_Row] = li_OOS
//		This.Object.history_tol[ll_Row] = li_OOT / 2
//		This.EVENT ue_Set_OOT(ll_Row)
//		This.Update()
//	END IF
//ELSE
//	RETURN 0
//END IF
//
//SetPointer(l_pointer)
//RETURN li_Return
end event

event ue_update_tabpages();
integer li_Scanned
integer li_Notes
integer li_Documents
integer li_Alerts
integer li_Multi
integer li_X = 1230
integer li_Num_Icons
string ls_Instruction
long ll_Current_Row

This.SetRedraw(FALSE)
ll_Current_Row = il_Current_Row_For_Update_TabPages
IF NOT IsNull(ll_Current_Row) THEN
	ls_Instruction = This.GetItemString(ll_Current_Row, 'station_instr')

//[NPTS]
	li_Notes			= This.EVENT ue_Update_Notes_Tabpage()
	li_Alerts		= This.EVENT ue_Update_Alert_Tabpage()
	li_Documents	= This.EVENT ue_Update_Documents_Tabpage()
	li_Multi			= This.EVENT ue_Update_Multi_tabpage()

	li_Scanned = This.GetItemNumber(ll_Current_Row, 'history_scan')
	IF ( li_Scanned = 0 ) THEN
		li_Scanned = ii_Scanned
	END IF
	
	This.Object.p_scanned.Visible = li_Scanned
	/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
	This.Object.p_documents.visible = li_documents
	This.Object.p_notes.visible = li_Notes
	This.Object.p_alerts.visible = li_Alerts
	/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
	IF ( li_Scanned = 1 ) THEN
		This.Object.p_scanned.X = li_X
		li_X = li_X - 120
		li_Num_Icons ++
	END IF
	IF NOT Empty(ls_Instruction) THEN
		This.Object.p_long_instructions.visible = 1
		This.Object.p_long_instructions.X = li_X
		li_X = li_X - 120
		li_Num_Icons ++
	/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
	ELSE
		This.Object.p_long_instructions.visible = 0
	/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
	END IF
	IF ( li_documents = 1 ) THEN
		This.Object.p_documents.X = li_X
		li_X = li_X - 120
		li_Num_Icons ++
	END IF
	IF ( li_Notes = 1 ) THEN
		This.Object.p_notes.X = li_X
		li_X = li_X - 120
		li_Num_Icons ++
	END IF
	IF ( li_Alerts = 1 ) THEN
		This.Object.p_alerts.X = li_X
		li_X = li_X - 120
		li_Num_Icons ++
	END IF
	This.Object.tour_name_t.Width = Integer(This.Width) - Integer(This.Object.tour_name_t.X) - (li_Num_Icons * 60) - 20
END IF
This.SetRedraw(TRUE)

//[NPTS]
//integer li_Scanned
//integer li_Notes
//integer li_Documents
//integer li_Alerts
//integer li_Multi
//integer li_X = 983
//integer li_Num_Icons
//string ls_Instruction
//long ll_Current_Row
//
//This.SetRedraw(FALSE)
//ll_Current_Row = il_Current_Row_For_Update_TabPages
//IF NOT IsNull(ll_Current_Row) THEN
//	ls_Instruction = This.Object.station_instr[ll_Current_Row]
//
//	li_Notes			= This.EVENT ue_Update_Notes_Tabpage()
//	li_Alerts		= This.EVENT ue_Update_Alert_Tabpage()
//	li_Documents	= This.EVENT ue_Update_Documents_Tabpage()
//	li_Multi			= This.EVENT ue_Update_Multi_tabpage()
//
//	li_Scanned = This.Object.history_scan[ll_Current_Row]
//	IF ( li_Scanned = 0 ) THEN
//		li_Scanned = ii_Scanned
//	END IF
//	This.Object.p_scanned.Visible = li_Scanned
//	IF ( li_Scanned = 1 ) THEN
//		This.Object.p_scanned.X = 983
//		li_X = li_X - 60
//		li_Num_Icons ++
//	END IF
//	IF NOT Empty(ls_Instruction) THEN
//		This.Object.p_long_instructions.X = li_X
//		li_X = li_X - 60
//		li_Num_Icons ++
//	END IF
//	IF ( li_documents = 1 ) THEN
//		This.Object.p_documents.X = li_X
//		li_X = li_X - 60
//		li_Num_Icons ++
//	END IF
//	IF ( li_Notes = 1 ) THEN
//		This.Object.p_notes.X = li_X
//		li_X = li_X - 50
//		li_Num_Icons ++
//	END IF
//	IF ( li_Alerts = 1 ) THEN
//		This.Object.p_alerts.X = li_X
//		li_X = li_X - 50
//		li_Num_Icons ++
//	END IF
//	This.Object.tour_name_t.Width = Integer(This.Width) - Integer(This.Object.tour_name_t.X) - (li_Num_Icons * 60) - 20
//END IF
//This.SetRedraw(TRUE)
end event

event type long ue_filter_for_missed();//mnu_tour mnu_temp
string ls_MB_String
string ls_Sql
string ls_Filter
integer li_Return
long ll_Num_Rows
long ll_Count
boolean lb_Been_Here

This.SetRedraw(FALSE)
ib_Filter_During_Close = gb_Final_Close

//mnu_temp = w_tour.MenuId

IF Empty(is_Scan_Filter) THEN
	ls_Filter = " ( ( history_rd = '' ) OR IsNull(history_rd) ) "
	IF NOT gb_display_hidden_records THEN
		ls_Filter = ls_Filter + " AND ( station_hidden = 0 ) "
	END IF
ELSE
	ls_Filter = is_Scan_Filter + " AND ( ( history_rd = '' ) OR IsNull(history_rd) ) "
END IF

ib_Filtering = TRUE
This.SetRow(1)
li_Return = This.SetFilter(ls_Filter)
li_Return = This.Filter()
ls_Sql = This.Object.DataWindow.Table.Select

ll_Num_Rows = This.RowCount()
li_Return = 1
FOR ll_Count = 1 To ll_Num_Rows
	// check applicability columns
	IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
		lb_Been_Here = TRUE
		gl_Last_Applicable_Station = This.Object.history_sta[ll_Count]
		il_Row_For_Navigate_To_Row_PostEvent = ll_Count
		This.PostEvent('ue_Navigate_To_Row', 0, ll_Count)
//		This.EVENT ue_Navigate_To_First_Row(FALSE)
		EXIT
	END IF
NEXT
IF NOT lb_Been_Here THEN
	gsu_tour_parameters[gi_Current_Tour].Filter = ''
	ll_Num_Rows = 0
//	MessageBox("No " + gs_Station_Label + "(s)", "There are no Missed Readings to display", Exclamation!)
	ls_MB_String = f_LanguageString('THERE_ARE_NO_MISSED_READINGS_TO_DISPLAY', "There are no Missed Readings to display")
	ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
	MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
	This.EVENT ue_Retrieve_Current_Tour(FALSE)
ELSE
	IF ( ll_Num_Rows = 0 ) THEN
		gsu_tour_parameters[gi_Current_Tour].Filter = ''
//		MessageBox("No " + gs_Station_Label + "(s)", "There are no Missed Readings to display", Exclamation!)
		ls_MB_String = f_LanguageString('THERE_ARE_NO_MISSED_READINGS_TO_DISPLAY', "There are no Missed Readings to display")
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
		This.EVENT ue_Retrieve_Current_Tour(FALSE)
	ELSEIF ( ll_Num_Rows = 1 ) THEN
		IF NOT This.EVENT ue_Evaluate_Applicability(1, TRUE) THEN
			gsu_tour_parameters[gi_Current_Tour].Filter = ''
			ll_Num_Rows = 0
//			MessageBox("No " + gs_Station_Label + "(s)", "There are no Missed Readings to display", Exclamation!)
			ls_MB_String = f_LanguageString('THERE_ARE_NO_MISSED_READINGS_TO_DISPLAY', "There are no Missed Readings to display")
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
			This.EVENT ue_Retrieve_Current_Tour(FALSE)
		ELSE
			gsu_tour_parameters[gi_Current_Tour].Filter = 'MISSED'
			This.EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)

			tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//			IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//				MessageBox("No stations", "There are no Missed Readings to display", Exclamation!)
//				This.EVENT ue_Retrieve_Current_Tour(FALSE)
//			END IF
		END IF
	ELSE
		gsu_tour_parameters[gi_Current_Tour].Filter = 'MISSED'
		This.EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)

		tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//		IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//			MessageBox("No stations", "There are no Missed Readings to display", Exclamation!)
//			This.EVENT ue_Retrieve_Current_Tour(FALSE)
//		END IF
	END IF
END IF

// Save for a possible preference later
IF FALSE THEN
	in_dwaw.of_Register(w_tour, tab_tour.tabpage_stations.dw_stations)
	in_dwaw.of_ResizeAll()
END IF

IF ( tab_tour.SelectedTab <> 1 ) THEN
	tab_tour.EVENT SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
END IF
il_Current_Row_For_Update_TabPages = This.GetRow()
This.SetRedraw(TRUE)

This.PostEvent('ue_Update_Tabpages')

RETURN ll_Num_Rows

//string ls_Filter
//integer li_Return
//long ll_Num_Rows
//
//ls_Filter = This.Object.DataWindow.Table.Filter
//IF Empty(ls_Filter) OR ( ls_Filter = "?" ) THEN
//	ls_Filter = " ( ( history_rd = '' ) OR IsNull(history_rd) ) "
//ELSE
//	ls_Filter = ls_Filter  + " AND ( ( history_rd = '' ) OR IsNull(history_rd) ) "
//END IF
//li_Return = This.SetFilter(ls_Filter)
//li_Return = This.Filter()
//
//ll_Num_Rows = This.RowCount()
//IF ( ll_Num_Rows = 0 ) THEN
//	MessageBox("No stations", "There are no Missed Readings to display", Exclamation!)
//	This.EVENT ue_Retrieve_Current_Tour(FALSE)
//ELSEIF ( ll_Num_Rows = 1 ) THEN
//	IF NOT This.EVENT ue_Evaluate_Applicability(1, TRUE) THEN
//		MessageBox("No stations", "There are no Missed Readings to display", Exclamation!)
//		This.EVENT ue_Retrieve_Current_Tour(FALSE)
//	END IF
//ELSE
//	tab_tour.tabpage_readings.dw_readings.Object.filter_t.Text = f_LanguageString('<MISSED>', '<Missed>') 
//	mnu_temp.m_data.m_allreadings.Checked = FALSE
//	mnu_temp.m_data.m_requiredreadings.Checked = FALSE
//	mnu_temp.m_data.m_missedreadings.Checked = TRUE
//	mnu_temp.m_data.m_abnormalreadings.Checked = FALSE
//	This.EVENT ue_Navigate_To_First_Row(FALSE)
//END IF
//
//// Save for a possible preference later
//IF FALSE THEN
//	in_dwaw.of_Register(w_tour, tab_tour.tabpage_stations.dw_stations)
//	in_dwaw.of_ResizeAll()
//END IF
//
//RETURN ll_Num_Rows
end event

event ue_update_note();string ls_Note_Reverse
datetime ldt_now
string ls_Note
string ls_Note_2
long ll_Row
constant string CRLF = CHAR(13) + CHAR(10)
constant string CRLF_Reverse = Reverse(CRLF)

ls_Note = tab_tour.tabpage_notes.mle_note_1.Text
IF Empty(ls_Note) THEN
	ls_Note = ''
END IF

IF NOT gb_AllowLeadingAndTrailingCRLFInNotes THEN
	integer li_Pos
	DO
		li_POS = POS(ls_Note, CRLF)
		IF ( li_Pos = 1 ) THEN
			ls_Note = MID(ls_Note, 3)
		END IF
	LOOP WHILE ( li_Pos = 1 )
	ls_Note_Reverse = Reverse(ls_Note)
	DO
		li_POS = POS(ls_Note_Reverse, CRLF_Reverse)
		IF ( li_Pos = 1 ) THEN
			ls_Note_Reverse = MID(ls_Note_Reverse, 3)
		END IF
	LOOP WHILE ( li_Pos = 1 )
	ls_Note = Reverse(ls_Note_Reverse)
END IF

SELECT ISNULL(notes, '') 
  INTO :ls_Note_2
FROM history 
 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
   AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
   AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
   AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
	AND ( reading_id = 0 ) ;

ll_Row = This.GetRow()
IF ( ls_Note <> ls_Note_2 ) THEN
	ldt_now = Datetime(Today(), Now())
	This.Object.history_cdt[ll_Row] = ldt_now
	This.Object.history_user_id[ll_Row] = guo_user.ID
	This.Object.history_notes[ll_Row] = ls_Note
	IF ( This.Update() = 1 ) THEN
		COMMIT ;
	ELSE
		ROLLBACK ;
//		MessageBox('ERROR', 'Unable to save the note to the database')
		MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('UNABLE_TO_SAVE_THE_NOTE_TO_THE_DATABASE', 'Unable to save the note to the database'))
	END IF
END IF

This.EVENT ue_Update_Tabpages()
end event

event ue_Focus_On_Reading;This.SetFocus()
This.SelectText(16, 0)

end event

event ue_set_oot(long al_row);integer li_Num_Stations
integer li_Count
integer li_Sta
integer li_OOT
long ll_Num_Rows
long ll_Row_Found
string ls_Find
string ls_Tolerance_Station_List

ls_Tolerance_Station_List = This.GetItemString(al_Row, 'station_tol_sta')
li_OOT = This.GetItemNumber(al_Row, 'history_tol')
IF NOT Empty(ls_Tolerance_Station_List) THEN
	ls_Tolerance_Station_List = StrTran(ls_Tolerance_Station_List, ' ', '')
	li_Num_Stations = StringCount(",", ls_Tolerance_Station_List) + 1
	ll_Num_Rows = This.RowCount()
	FOR li_Count = 1 TO li_Num_Stations
		li_Sta = ParseRelated(ls_Tolerance_Station_List, li_Count)
		ls_Find = " station_sta = " + String(li_Sta)
		ll_Row_Found = This.Find(ls_Find, 1, ll_Num_Rows + 1)
		IF ( ll_Row_Found > 0 ) THEN
			This.Object.history_tol[ll_Row_Found] = li_OOT
		END IF
	NEXT
END IF
This.AcceptText()
end event

event ue_remove_button_character();// NOT USED ANYWHERE

datetime ldt_now
long ll_Row
string ls_Reading

ll_Row = This.GetRow()
This.AcceptText()
ls_Reading = This.Object.history_rd[ll_Row]
//IF NOT Empty(ls_Reading) AND ( gi_Hardware_Button > 0 ) AND ( POS(ls_Reading, CHAR(gi_Hardware_Button)) > 0 ) THEN
	ls_Reading = StrTran(ls_Reading, CHAR(gi_Hardware_Button), '')
//	This.Object.history_rd[ll_Row] = ls_Reading
	ldt_now = Datetime(Today(), Now())
//	This.Object.history_cdt[ll_Row] = ldt_now
//	This.Object.history_user_id[ll_Row] = guo_user.ID
	This.EVENT ue_Update_Reading(ll_Row, ls_Reading, ldt_now, guo_user.ID)
//END IF
end event

event ue_update_row_2(long al_row);integer li_Return
dwitemstatus l_status

l_status = This.GetItemStatus(al_Row, 0, Primary!)
IF ( l_status = DataModified! ) OR ( l_status = NewModified! ) THEN
//	IF ib_Edit_Mask THEN
//		string ls_Rd
//		
//		ls_Rd = This.GetItemString(al_Row, 'history_rd')
//		MessageBox('ls_Rd - ue_update_row_2 - al_Row', ls_Rd + ' - ' + String(al_Row))
//		
//		UPDATE history 
//		   SET rd = ls_Rd 
//			 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
//				AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
//				AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) ;
//
//		This.Object.history_rd[al_Row] = ls_Rd
//		This.SetItemStatus( al_Row, 'history_rd', Primary!, NotModified!)
//		li_Return = 1
//	ELSE

// 10-17-2008 - Commented out not used inf_Check_If_Reading_Changed()
//		This.Object.previous_rd[al_Row] = This.GetITemString(al_Row, 'history_rd')
		li_Return = This.Update()
//	END IF
	IF ( li_Return = -1 ) THEN
		MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_READING_WAS_NOT_SAVED_DUE_TO_AN_ERROR', 'The reading was not saved due to an error'))
	ELSE
		COMMIT ;
	END IF
END IF
end event

event type long ue_filter_for_scanning();MessageBox('Not used', 'ue_filter_for_scanning')
RETURN -1
//string ls_Filter
//integer li_Return
//long ll_Num_Rows
//long ll_Count
//boolean lb_Been_Here
//boolean lb_Hidden
//string ls_Return
//
//IF gsu_tour_parameters[gi_Current_tour].scanning_required AND Empty(gsu_tour_parameters[gi_Current_tour].scanned_code) THEN
//	ib_Filtering = TRUE
//	// Display scan screen
//	Open(w_scan)
//	ls_Return = Message.StringParm
//	Message.StringParm = ''
//	IF ( ls_Return = '--CANCEL--' ) THEN
//		is_Scan_filter = ""
//	ELSEIF ( ls_Return = '--BLANK--' ) THEN
//		is_Scan_filter = " ( Empty(station_scan) ) "
//		This.Object.filter_t.Text = gsu_tour_parameters[gi_Current_tour].scanned_code
//	ELSE
//		is_Scan_filter = ""
//	END IF
//ELSEIF NOT Empty(gsu_tour_parameters[gi_Current_tour].scanned_code) THEN
//	ib_Filtering = TRUE
//	IF ( 	gsu_tour_parameters[gi_Current_tour].scanned_code = '--BLANK--' ) THEN
//		is_Scan_filter = " ( Empty(station_scan) ) "
//	ELSE
//		is_Scan_filter = " ( station_scan = '" + gsu_tour_parameters[gi_Current_tour].scanned_code + "' ) "
//	END IF
//	This.Object.filter_t.Text = gsu_tour_parameters[gi_Current_tour].scanned_code
//ELSE
//	is_Scan_filter = ''
//END IF
//This.SetRedraw(FALSE)
//This.SetRow(1)
//li_Return = This.SetFilter(is_Scan_filter)
//li_Return = This.Filter()
//This.SetRedraw(TRUE)
//ll_Num_Rows = This.RowCount()
//li_Return = 1
//FOR ll_Count = 1 To ll_Num_Rows
//	// check applicability columns
//	lb_Hidden = ( This.Object.station_hidden[ll_Count] = 1 )
//	IF NOT lb_Hidden AND This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
//		lb_Been_Here = TRUE
//		gl_Last_Applicable_Station = This.Object.history_sta[ll_Count]
//		This.EVENT ue_Navigate_To_First_Row(FALSE)
//		EXIT
//	END IF
//NEXT
//IF NOT lb_Been_Here THEN
//	ll_Num_Rows = 0
//	MessageBox("No " + gs_Station_Label + "(s)", "There are no Applicable Readings for the scan-code to display", Exclamation!)
//	gsu_tour_parameters[gi_Current_tour].scanned_code = ''
//	This.EVENT ue_Retrieve_Current_Tour(FALSE)
//ELSE
//	IF ( ll_Num_Rows = 0 ) THEN
//		MessageBox("No " + gs_Station_Label + "(s)", "There are no Applicable Readings for the scan-code to display", Exclamation!)
//		gsu_tour_parameters[gi_Current_tour].scanned_code = ''
//		This.EVENT ue_Retrieve_Current_Tour(FALSE)
//	ELSEIF ( ll_Num_Rows = 1 ) THEN
//		IF NOT This.EVENT ue_Evaluate_Applicability(1, TRUE) THEN
//			ll_Num_Rows = 0
//			MessageBox("No " + gs_Station_Label + "(s)", "There are no Applicable Readings for the scan-code to display", Exclamation!)
//			gsu_tour_parameters[gi_Current_tour].scanned_code = ''
//			This.EVENT ue_Retrieve_Current_Tour(FALSE)
//		END IF
//	ELSE
//		IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//			MessageBox("No " + gs_Station_Label + "(s)", "There are no Applicable Readings for the scan-code to display", Exclamation!)
//			gsu_tour_parameters[gi_Current_tour].scanned_code = ''
//			This.EVENT ue_Retrieve_Current_Tour(FALSE)
//		END IF
//	END IF
//END IF
//
//// Save for a possible preference later
//IF FALSE THEN
//	in_dwaw.of_Register(w_tour, tab_tour.tabpage_stations.dw_stations)
//	in_dwaw.of_ResizeAll()
//END IF
//
//RETURN ll_Num_Rows
end event

event type integer ue_update_multi_tabpage();integer li_Visible
integer li_Num_Rows
long ll_Multi_Color
	
//[NPTS]
// Try turning this on !!!
IF TRUE THEN
	long ll_Current_Row
	
	ll_Current_Row = il_Current_Row_For_Update_TabPages
	li_Num_Rows = This.GetItemNumber(ll_Current_Row, 'history_multi_count')
	IF ( li_Num_Rows = 0 ) THEN
		ll_Multi_Color = RGB(0, 0, 0)
		li_Visible = 0
	ELSE
		ll_Multi_Color = RGB(255, 0, 0)
		li_Visible = 1
	END IF
	w_tour.tab_tour.tabpage_multi.tabtextcolor = ll_Multi_Color
	RETURN li_Visible
ELSE
	SELECT COUNT(*) 
	  INTO :li_Num_Rows
	  FROM history
	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
	   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].Rev_No ) 
	   AND ( sta = :gsu_tour_parameters[gi_Current_Tour].Station ) 
	   AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date ) 
	   AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No ) 
		AND ( reading_id <> 0 ) ;
	
	IF ( li_Num_Rows = 0 ) THEN
		ll_Multi_Color = RGB(0, 0, 0)
		li_Visible = 0
	ELSE
		ll_Multi_Color = RGB(255, 0, 0)
		li_Visible = 1
	END IF
	w_tour.tab_tour.tabpage_multi.tabtextcolor = ll_Multi_Color
	RETURN li_Visible
END IF
end event

event type integer ue_update_documents_tabpage();integer li_Visible
integer li_Perf_Documents
integer li_Ref_Documents
long ll_Documents_Color
	
//[NPTS]
// Try turning this on !!!
IF TRUE THEN
	long ll_Current_Row
	
	ll_Current_Row = il_Current_Row_For_Update_TabPages
	li_Perf_Documents = This.GetItemNumber(ll_Current_Row, 'history_perf_doc_count')
	li_Ref_Documents = This.GetItemNumber(ll_Current_Row, 'history_ref_doc_count')
	IF ( li_Perf_Documents + li_Ref_Documents = 0 ) THEN
		ll_Documents_Color = RGB(0, 0, 0)
		li_Visible = 0
	ELSE
		ll_Documents_Color = RGB(255, 0, 0)
		li_Visible = 1
	END IF
	w_tour.tab_tour.tabpage_documents.tabtextcolor = ll_Documents_Color
	w_tour.tab_tour.tabpage_readings.dw_readings.Object.p_documents.Visible = li_Visible
	RETURN li_Visible
ELSE
	//SELECT ( 
	//  ( SELECT COUNT(*) 
	//	  FROM tour_documents
	//	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
	//	   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].Rev_No ) 
	//	   AND ( sta = :gsu_tour_parameters[gi_Current_Tour].Station ) 
	//	   AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date ) 
	//	   AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No ) ) 
	//     + 
	//  ( SELECT COUNT(*) 
	//	  FROM revision_documents
	//	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
	//	   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].Rev_No ) 
	//	   AND ( ( sta = :gsu_tour_parameters[gi_Current_Tour].Station ) OR ( sta = 0 ) ) ) ) 
	//  INTO :li_Num_Rows 
	//  FROM dummy ;

   SELECT COUNT(*) 
	  INTO :li_Perf_Documents
	  FROM tour_documents
	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
	   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].Rev_No ) 
	   AND ( sta = :gsu_tour_parameters[gi_Current_Tour].Station ) 
	   AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date ) 
	   AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No ) ;

   SELECT COUNT(*) 
	  INTO :li_Ref_Documents 
	  FROM revision_documents
	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
	   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].Rev_No ) 
	   AND ( ( sta = :gsu_tour_parameters[gi_Current_Tour].Station ) OR ( sta = 0 ) ) ;
	
	IF ( li_Perf_Documents + li_Ref_Documents = 0 ) THEN
		ll_Documents_Color = RGB(0, 0, 0)
		li_Visible = 0
	ELSE
		ll_Documents_Color = RGB(255, 0, 0)
		li_Visible = 1
	END IF
	w_tour.tab_tour.tabpage_documents.tabtextcolor = ll_Documents_Color
	w_tour.tab_tour.tabpage_readings.dw_readings.Object.p_documents.Visible = li_Visible
	RETURN li_Visible
END IF
end event

event type integer ue_update_alert_tabpage();integer li_Visible
integer li_Num_Rows
long ll_Alert_Color

//[NPTS]
// Try turning this on !!!
IF TRUE THEN
	long ll_Current_Row
	
	ll_Current_Row = il_Current_Row_For_Update_TabPages
	li_Num_Rows = This.GetItemNumber(ll_Current_Row, 'history_alert_count')
	IF ( li_Num_Rows = 0 ) OR ISNULL(li_Num_Rows) THEN
		ll_Alert_Color = RGB(0, 0, 0)
		li_Visible = 0
	ELSE
		ll_Alert_Color = RGB(255, 0, 0)
		li_Visible = 1
	END IF
ELSE

	SELECT COUNT(*) 
	  INTO :li_Num_Rows
	  FROM alerts a, 
			 alert_accept b 
 	 WHERE ( a.tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number) 
	   AND ( a.rev_no = :gsu_tour_parameters[gi_Current_Tour].Rev_No ) 
	   AND ( a.sta = :gsu_tour_parameters[gi_Current_Tour].Station ) 
	   AND ( b.dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date ) 
	   AND ( b.shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No ) 
	   AND ( b.reading_id = 0 ) 
	   AND ( a.tour = b.tour ) 
	   AND ( a.rev_no = b.rev_no ) 
	   AND ( a.sta = b.sta ) 
	   AND ( a.alert_id = b.alert_id ) ;

	IF ( li_Num_Rows = 0 ) THEN
		ll_Alert_Color = RGB(0, 0, 0)
		li_Visible = 0
	ELSE
		ll_Alert_Color = RGB(255, 0, 0)
		li_Visible = 1
	END IF
END IF

w_tour.tab_tour.tabpage_instructions.tabtextcolor = ll_Alert_Color
w_tour.tab_tour.tabpage_readings.dw_readings.Object.p_alerts.Visible = li_Visible

RETURN li_Visible

end event

event type integer scan(long currentrow);string ls_MB_String
string ls_Scancode_Temp
//string ls_Return
string ls_Equip_Operator_Id
string ls_Scancode
boolean lb_Calculated
integer li_Return
pointer l_pointer
boolean lb_Final_Close
integer li_SelectedTab
boolean lb_Filter_During_Close

lb_Final_Close = gb_Final_Close
ii_Scanned = This.Object.history_scan[currentrow]
li_SelectedTab = tab_tour.SelectedTab
lb_Filter_During_Close = ib_Filter_During_Close
IF ( tab_tour.SelectedTab = 1 ) AND ( NOT gb_Final_Close OR ib_Filter_During_Close ) THEN
	ls_ScanCode = This.GetItemString(currentrow, 'station_scan')
	ls_Scancode_Temp = is_Scancode
	ls_Scancode_Temp = is_Scan_Result
	IF Empty(ls_Scancode) THEN //OR ( TRIM(UPPER(ls_Scancode)) = 'LANDCYCLOPS' ) OR ( MID(TRIM(UPPER(ls_Scancode)), 1, 7) = 'IQMETER' ) THEN
		ls_Scancode = ''
		is_Scancode = ''
		is_Last_Record_Scan_Code = ''
		li_Return = 1
		ii_Scanned = 0
//	ELSEIF ( TRIM(UPPER(ls_Scancode)) = 'LANDCYCLOPS' ) THEN
//		ls_Scancode = ''
//		is_Scancode = ''
//		is_Last_Record_Scan_Code = ''
//		li_Return = 1
//		ii_Scanned = 0
//
//		string ls_Reading
//		long ll_NTR_Row
//
//		// display pyrometer window
//		Open(w_landcyclops)
//		ls_Reading = Message.StringParm
//		Message.StringParm = ''
//
//		ll_NTR_Row = ii_Last_Navigate_To_Row
//		IF NOT Empty(ls_Reading) THEN
//			This.Object.history_rd[currentrow] = ls_Reading
//			This.Object.history_cdt[currentrow] = Datetime(Today(), Now())
//			This.Object.history_user_id[currentrow] = guo_user.ID
//			IF ( ll_NTR_Row = 0 ) THEN
//				ll_NTR_Row = 1
//			END IF
//			This.Post EVENT ue_Navigate_To_Row(ll_NTR_Row, 'ue_enter_button')
//		END IF
	ELSE
	//SCAN TODO
		ls_Equip_Operator_Id = This.GetItemString(currentrow, 'station_equip_operator_id')
		IF gb_Include_Equip_In_Scan AND NOT EMPTY(ls_Equip_Operator_Id) THEN
			IF Empty(ls_Equip_Operator_Id) THEN
				ls_Equip_Operator_Id = ''
			END IF
			IF NOT lb_Calculated AND NOT ib_Hide_Scan_Screen THEN
				IF gb_Find_By_Scan THEN
					gb_Find_By_Scan = FALSE
					li_Return = 1
					ii_Scanned = 1
				ELSEIF ( ls_ScanCode = is_ScanCode ) OR ( ls_Equip_Operator_Id = is_ScanCode ) THEN
					// Set the column's scan column to 1
		//			This.Object.history_scan[currentrow] = 1
					li_Return = 1
					ii_Scanned = 1
//				ELSEIF Empty(ls_ScanCode) THEN
//					li_Return = 1
//					ii_Scanned = 0
//				ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'SKIP' ) THEN
//					// Set the column's scan column to 0
//		//			This.Object.history_scan[currentrow] = 0
//					li_Return = 1
//					ii_Scanned = 0
				ELSEIF ( is_Last_Record_Scan_Code = ls_ScanCode ) AND ( is_Scan_Result = 'SKIP' ) THEN
					// Set the column's scan column to 0
		//			This.Object.history_scan[currentrow] = 0
					li_Return = 1
					ii_Scanned = 0
				ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'CANCEL' ) THEN
					// Set the column's scan column to 0
		//			This.Object.history_scan[currentrow] = 0
					li_Return = 1
					ii_scanned = 0
				ELSE
		//			l_pointer = SetPointer(Arrow!)
					IF gb_Force_Find_By_Scan THEN
						li_Return = f_Scancode(currentrow)
						IF ( li_Return = -1  ) THEN
							li_Return = f_Scancode(currentrow)
						END IF
						is_Scan_Result = is_Scancode
					ELSE
						OpenWithParm(w_scanning, String(currentrow))
					END IF
//					ls_Return = Message.StringParm
//					is_ScanCode = ls_Return
//					Message.StringParm = ''
		//			SetPointer(l_pointer)
					IF ( is_ScanCode = 'SKIP' ) THEN
						is_Scan_Result = 'SKIP'
						is_ScanCode = ''
	//				IF ( is_Scan_Result = 'SKIP' ) THEN
						// Set the column's scan column to 0
		//				This.Object.history_scan[currentrow] = 0
						li_Return = 1
						ii_Scanned = 0
						il_Last_Row_Scanned = currentrow
						IF gb_RequireNoteAfterScanSkip THEN
							// Force the note tab
							tab_tour.SelectedTab = 4
						END IF
					ELSEIF ( is_ScanCode = 'CANCEL' ) THEN
						is_Scan_Result = 'CANCEL'
						is_ScanCode = ''
	//				ELSEIF ( is_Scan_Result = 'CANCEL' ) THEN
						li_Return = -1 // or 0?
					ELSEIF ( ls_ScanCode = is_ScanCode ) OR ( ls_Equip_Operator_Id = is_ScanCode ) THEN
						is_Scan_Result = ''
//						is_ScanCode = ls_Return
	//				ELSEIF ( ls_ScanCode = is_ScanCode ) OR ( ls_Equip_Operator_Id = is_ScanCode ) THEN
						// Set the column's scan column to 1
						ii_Scanned = 1
						li_Return = 1
		//				This.Object.history_scan[currentrow] = 1
						il_Last_Row_Scanned = currentrow
					ELSE
		//				IF NOT ib_Initial_Open_Of_Tour THEN
//							MessageBox('Error', '"' + is_ScanCode + '" scancode incorrect for record ' + String(This.Object.station_sta[currentrow]), Information!)
							ls_MB_String = f_LanguageString('###_SCANCODE_INCORRECT_FOR_RECORD_@@@', "'###' scancode incorrect for record @@@")
							ls_MB_String = StrTran(ls_MB_String, '###', is_ScanCode)
							ls_MB_String = StrTran(ls_MB_String, '@@@', String(This.Object.station_sta[currentrow]))
							MessageBox(f_LanguageString('ERROR', "Error"), ls_MB_String)
		//				END IF
						li_Return = This.EVENT Scan(currentrow)
					END IF
				END IF
			ELSE
				li_Return = 1
			END IF
		ELSE
			IF NOT lb_Calculated AND NOT ib_Hide_Scan_Screen THEN
				IF gb_Find_By_Scan THEN
					gb_Find_By_Scan = FALSE
					li_Return = 1
					ii_Scanned = 1
				ELSEIF ( ls_ScanCode = is_ScanCode ) THEN
					// Set the column's scan column to 1
		//			This.Object.history_scan[currentrow] = 1
					li_Return = 1
					ii_Scanned = 1
//				ELSEIF Empty(ls_ScanCode) THEN
//					li_Return = 1
//					ii_Scanned = 0
//				ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'SKIP' ) THEN
//					// Set the column's scan column to 0
//		//			This.Object.history_scan[currentrow] = 0
//					li_Return = 1
//					ii_Scanned = 0
				ELSEIF ( is_Last_Record_Scan_Code = ls_ScanCode ) AND ( is_Scan_Result = 'SKIP' ) THEN
					// Set the column's scan column to 0
		//			This.Object.history_scan[currentrow] = 0
					li_Return = 1
					ii_Scanned = 0
				ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'CANCEL' ) THEN
					// Set the column's scan column to 0
		//			This.Object.history_scan[currentrow] = 0
					li_Return = 1
					ii_scanned = 0
				ELSE
		//			l_pointer = SetPointer(Arrow!)
					IF gb_Force_Find_By_Scan THEN
						li_Return = f_Scancode(currentrow)
						IF ( li_Return = -1  ) THEN
							li_Return = f_Scancode(currentrow)
						END IF
						is_Scan_Result = is_Scancode
					ELSE
						OpenWithParm(w_scanning, String(currentrow))
					END IF
//					ls_Return = Message.StringParm
//					is_ScanCode = ls_Return
//					Message.StringParm = ''
		//			SetPointer(l_pointer)
					IF ( is_ScanCode = 'SKIP' ) THEN
						is_Scan_Result = 'SKIP'
						is_ScanCode = ''
	//				IF ( is_Scan_Result = 'SKIP' ) THEN
						// Set the column's scan column to 0
						ii_Scanned = 0
						li_Return = 1
		//				This.Object.history_scan[currentrow] = 0
						il_Last_Row_Scanned = currentrow
						IF gb_RequireNoteAfterScanSkip THEN
							// Force the note tab
							tab_tour.SelectedTab = 4
						END IF
					ELSEIF ( is_ScanCode = 'CANCEL' ) THEN
						is_Scan_Result = 'CANCEL'
						is_ScanCode = ''
	//				ELSEIF ( is_Scan_Result = 'CANCEL' ) THEN
						li_Return = -1 // or 0?
					ELSEIF ( ls_ScanCode = is_ScanCode ) THEN
						is_Scan_Result = ''
//						is_ScanCode = ls_Return
	//				ELSEIF ( ls_ScanCode = is_ScanCode ) THEN
						// Set the column's scan column to 1
						ii_Scanned = 1
						li_Return = 1
		//				This.Object.history_scan[currentrow] = 1
						il_Last_Row_Scanned = currentrow
					ELSE
						IF NOT gb_force_find_by_scan THEN
//							MessageBox('Error', '"' + is_ScanCode + '" scancode incorrect for record ' + String(This.Object.station_sta[currentrow]), Information!)
							ls_MB_String = f_LanguageString('###_SCANCODE_INCORRECT_FOR_RECORD_@@@', "'###' scancode incorrect for record @@@")
							ls_MB_String = StrTran(ls_MB_String, '###', is_ScanCode)
							ls_MB_String = StrTran(ls_MB_String, '@@@', String(This.Object.station_sta[currentrow]))
							MessageBox(f_LanguageString('ERROR', "Error"), ls_MB_String)
						END IF
						li_Return = This.EVENT Scan(currentrow)
					END IF
				END IF
			ELSE
				li_Return = 1
			END IF
		END IF
	END IF
ELSE
	li_Return = 1
END IF

is_Last_Record_Scan_Code = ls_ScanCode
This.Object.previous_scan[currentrow] = This.GetItemNumber(currentrow, 'history_scan')
This.Object.history_scan[currentrow] = ii_Scanned
// *****
// 2008-04-22 - Added redundant call here because filter for unscanned did NOT update the scanned icon properly
// after scanning the first station immediatley after the filter was applied
il_Current_Row_For_Update_TabPages = currentrow
This.Event ue_Update_Tabpages()
// *****

RETURN li_Return

// Commented out / modified on 2007-11-01
//string ls_Return
//string ls_Equip_Operator_Id
//string ls_Scancode
//boolean lb_Calculated
//integer li_Return
//pointer l_pointer
//boolean lb_Final_Close
//integer li_SelectedTab
//boolean lb_Filter_During_Close
//
//lb_Final_Close = gb_Final_Close
//li_SelectedTab = tab_tour.SelectedTab
//lb_Filter_During_Close = ib_Filter_During_Close
//IF ( tab_tour.SelectedTab = 1 ) AND ( NOT gb_Final_Close OR ib_Filter_During_Close ) THEN
//	ls_ScanCode = This.Object.station_scan[currentrow]
//	IF Empty(ls_Scancode) THEN
//		ls_Scancode = ''
//	END IF
////SCAN TODO
//	IF gb_Include_Equip_In_Scan THEN
//		ls_Equip_Operator_Id = This.Object.station_equip_operator_id[currentrow]
//		IF Empty(ls_Equip_Operator_Id) THEN
//			ls_Equip_Operator_Id = ''
//		END IF
//		IF NOT lb_Calculated AND NOT ib_Hide_Scan_Screen THEN
//			IF gb_Find_By_Scan THEN
//				gb_Find_By_Scan = FALSE
//				li_Return = 1
//				ii_Scanned = 1
//			ELSEIF ( ls_ScanCode = is_ScanCode ) OR ( ls_Equip_Operator_Id = is_ScanCode ) THEN
//				// Set the column's scan column to 1
//	//			This.Object.history_scan[currentrow] = 1
//				li_Return = 1
//				ii_Scanned = 1
//			ELSEIF Empty(ls_ScanCode) THEN
//				li_Return = 1
//				ii_Scanned = 0
//			ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'SKIP' ) THEN
//				// Set the column's scan column to 0
//	//			This.Object.history_scan[currentrow] = 0
//				li_Return = 1
//				ii_Scanned = 0
//			ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'CANCEL' ) THEN
//				// Set the column's scan column to 0
//				ii_scanned = 0
//	//			This.Object.history_scan[currentrow] = 0
//				li_Return = 1
//			ELSE
//	//			l_pointer = SetPointer(Arrow!)
//				OpenWithParm(w_scanning, String(currentrow))
//				ls_Return = Message.StringParm
//				is_ScanCode = ls_Return
//				Message.StringParm = ''
//	//			SetPointer(l_pointer)
//				IF ( ls_Return = 'SKIP' ) THEN
//					is_Scan_Result = 'SKIP'
//					is_ScanCode = ''
////				IF ( is_Scan_Result = 'SKIP' ) THEN
//					// Set the column's scan column to 0
//					ii_Scanned = 0
//					li_Return = 1
//	//				This.Object.history_scan[currentrow] = 0
//					il_Last_Row_Scanned = currentrow
//				ELSEIF ( ls_Return = 'CANCEL' ) THEN
//					is_Scan_Result = 'CANCEL'
//					is_ScanCode = ''
////				ELSEIF ( is_Scan_Result = 'CANCEL' ) THEN
//					li_Return = -1 // or 0?
//				ELSEIF ( ls_ScanCode = ls_Return ) OR ( ls_Equip_Operator_Id = ls_Return ) THEN
//					is_Scan_Result = ''
//					is_ScanCode = ls_Return
////				ELSEIF ( ls_ScanCode = is_ScanCode ) OR ( ls_Equip_Operator_Id = is_ScanCode ) THEN
//					// Set the column's scan column to 1
//					ii_Scanned = 1
//					li_Return = 1
//	//				This.Object.history_scan[currentrow] = 1
//					il_Last_Row_Scanned = currentrow
//				ELSE
//	//				IF NOT ib_Initial_Open_Of_Tour THEN
//						MessageBox('Error', '"' + is_ScanCode + '" scancode incorrect for record ' + String(This.Object.station_sta[currentrow]), Information!)
//	//				END IF
//					li_Return = This.EVENT Scan(currentrow)
//				END IF
//			END IF
//		ELSE
//			li_Return = 1
//		END IF
//	ELSE
//		IF NOT lb_Calculated AND NOT ib_Hide_Scan_Screen THEN
//			IF gb_Find_By_Scan THEN
//				gb_Find_By_Scan = FALSE
//				li_Return = 1
//				ii_Scanned = 1
//			ELSEIF ( ls_ScanCode = is_ScanCode ) THEN
//				// Set the column's scan column to 1
//	//			This.Object.history_scan[currentrow] = 1
//				li_Return = 1
//				ii_Scanned = 1
//			ELSEIF Empty(ls_ScanCode) THEN
//				li_Return = 1
//				ii_Scanned = 0
//			ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'SKIP' ) THEN
//				// Set the column's scan column to 0
//	//			This.Object.history_scan[currentrow] = 0
//				li_Return = 1
//				ii_Scanned = 0
//			ELSEIF ( currentrow = il_Last_Row_Scanned ) AND ( is_Scan_Result = 'CANCEL' ) THEN
//				// Set the column's scan column to 0
//				ii_scanned = 0
//	//			This.Object.history_scan[currentrow] = 0
//				li_Return = 1
//			ELSE
//	//			l_pointer = SetPointer(Arrow!)
//				OpenWithParm(w_scanning, String(currentrow))
//				ls_Return = Message.StringParm
//				is_ScanCode = ls_Return
//				Message.StringParm = ''
//	//			SetPointer(l_pointer)
//				IF ( ls_Return = 'SKIP' ) THEN
//					is_Scan_Result = 'SKIP'
//					is_ScanCode = ''
////				IF ( is_Scan_Result = 'SKIP' ) THEN
//					// Set the column's scan column to 0
//					ii_Scanned = 0
//					li_Return = 1
//	//				This.Object.history_scan[currentrow] = 0
//					il_Last_Row_Scanned = currentrow
//				ELSEIF ( ls_Return = 'CANCEL' ) THEN
//					is_Scan_Result = 'CANCEL'
//					is_ScanCode = ''
////				ELSEIF ( is_Scan_Result = 'CANCEL' ) THEN
//					li_Return = -1 // or 0?
//				ELSEIF ( ls_ScanCode = ls_Return ) THEN
//					is_Scan_Result = ''
//					is_ScanCode = ls_Return
////				ELSEIF ( ls_ScanCode = is_ScanCode ) THEN
//					// Set the column's scan column to 1
//					ii_Scanned = 1
//					li_Return = 1
//	//				This.Object.history_scan[currentrow] = 1
//					il_Last_Row_Scanned = currentrow
//				ELSE
//	//				IF NOT ib_Initial_Open_Of_Tour THEN
//						MessageBox('Error', '"' + is_ScanCode + '" scancode incorrect for record ' + String(This.Object.station_sta[currentrow]), Information!)
//	//				END IF
//					li_Return = This.EVENT Scan(currentrow)
//				END IF
//			END IF
//		ELSE
//			li_Return = 1
//		END IF
//	END IF
//ELSE
//	li_Return = 1
//END IF
//
//RETURN li_Return
//
end event

event type long ue_find_applicable_row(long currentrow, string al_direction);string ls_MB_String
string ls_MB_String_2
long newrow
long ll_Count
long ll_Num_Rows
integer li_Accept_Warning
boolean lb_Applicable
boolean lb_Calculated
boolean lb_Hidden
integer li_Return

newrow = currentrow

IF ( al_Direction = '+1' ) THEN
	ll_Num_Rows = This.RowCount()
	FOR ll_Count = currentrow + 1 TO ll_Num_Rows
		gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Count, 'history_sta')
		gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Count, 'history_reading_id')
		lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, FALSE)
		IF lb_Applicable THEN
			lb_Hidden = ( This.GetItemNumber(ll_Count, 'station_hidden') = 1 ) AND NOT gb_Display_Hidden_Records
			lb_Calculated = This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
			IF lb_Calculated THEN
				// Check OOS / OOT
				li_Accept_Warning = This.EVENT ue_Show_Warnings(ll_Count, TRUE, TRUE, TRUE)
				IF ( li_Accept_Warning <> 2 ) OR ( li_Accept_Warning <> 20 ) THEN
					//Update the row
					This.EVENT ue_Update_Row_2(ll_Count)
					//If it's hidden move to the next row
					IF NOT lb_Hidden THEN
						newrow = ll_Count
						This.Object.history_rd_t.Text = f_LanguageString('CALCULATED_READING', "Calculated Reading")
						EXIT
					END IF
				ELSE
					This.Object.history_rd_t.Text = f_LanguageString('CALCULATED_READING', "Calculated Reading")
					EXIT
				END IF
			ELSE
				// If it's hidden move to the next row
				IF NOT lb_Hidden THEN
					newrow = ll_Count
					This.Object.history_rd_t.Text = f_LanguageString('CURRENT_READING', 'Current Reading')
					EXIT
				END IF
			END IF
		END IF
	NEXT
	IF ( newrow = currentrow ) THEN
//		MessageBox('Last Applicable ' + gs_Station_Label, 'You are at the last applicable ' + gs_Station_Label + '.')
//		li_Return = MessageBox('Last ' + gs_Station_Label, 'This is the last applicable ' + gs_Station_Label + '.  Do you wish to view All Missed Readings?', Question!, YesNo!)
		ls_MB_String = f_LanguageString('LAST_###', 'Last ###')
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		ls_MB_String_2 = f_LanguageString('THIS_IS_THE_LAST_APPLICABLE_###.__DO_YOU_WISH_TO_VIEW_ALL_MISSED_READINGS?', 'This is the last applicable ###.  Do you wish to view All Missed Readings?')
		ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
		li_Return = MessageBox(ls_MB_String, ls_MB_String_2, Question!, YesNo!)
		IF ( li_Return = 1 ) THEN
			This.EVENT ue_Filter_For_Missed()
			newrow = This.Find('history_sta = ' + String(gsu_tour_parameters[gi_current_tour].station), 1, This.RowCount())
		END IF
	ELSE
		li_Return = This.Event Scan(newrow)
		IF ib_Initial_Open_Of_Tour AND ( li_Return = -1 ) THEN
			This.PostEvent('ue_Exit_Tour')
			ib_Initial_Open_Of_Tour = FALSE
			RETURN newrow
		ELSEIF ( li_Return = -1 ) THEN
			newrow = -1//currentrow
		END IF
	END IF
ELSEIF ( al_Direction = '-1' ) THEN
	ll_Num_Rows = This.RowCount()
	FOR ll_Count = currentrow - 1 TO 1 STEP -1
		gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Count, 'history_sta')
		gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Count, 'history_reading_id')
		lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, FALSE)
		IF lb_Applicable THEN
			lb_Hidden = ( This.GetItemNumber(ll_Count, 'station_hidden') = 1 ) AND NOT gb_Display_Hidden_Records
			lb_Calculated = This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
			IF lb_Calculated THEN
//				// Check OOS / OOT
				li_Accept_Warning = This.EVENT ue_Show_Warnings(ll_Count, TRUE, TRUE, TRUe)
				IF ( li_Accept_Warning <> 2 ) OR ( li_Accept_Warning <> 20 ) THEN
					// Update the row
					This.EVENT ue_Update_Row_2(ll_Count)
					// If it's hidden move to the next row
					IF NOT lb_Hidden THEN
						newrow = ll_Count
						This.Object.history_rd_t.Text = f_LanguageString('CALCULATED_READING', "Calculated Reading")
						EXIT
					END IF
				ELSE
					This.Object.history_rd_t.Text = f_LanguageString('CALCULATED_READING', "Calculated Reading")
					EXIT
				END IF
			ELSE
				// If it's hidden move to the next row
				IF NOT lb_Hidden THEN
					newrow = ll_Count
					This.Object.history_rd_t.Text = f_LanguageString('CURRENT_READING', 'Current Reading')
					EXIT
				END IF
			END IF
		END IF
	NEXT
	IF ( newrow = currentrow ) THEN
		MessageBox('First Applicable ' + gs_Station_Label, 'You are at the first applicable ' + gs_Station_Label + '.')
		ls_MB_String = f_LanguageString('FIRST_APPLICABLE_###', 'First Applicable ###')
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		ls_MB_String_2 = f_LanguageString('YOU_ARE_AT_THE_FIRST_APPLICABLE_###.', 'You are at the first applicable ###.')
		ls_MB_String_2 = StrTran(ls_MB_String_2, '###', gs_Station_Label)
		MessageBox(ls_MB_String, ls_MB_String_2)
	ELSE
		li_Return = This.Event Scan(newrow)
		IF ib_Initial_Open_Of_Tour AND ( li_Return = -1 ) THEN
			This.PostEvent('ue_Exit_Tour')
			ib_Initial_Open_Of_Tour = FALSE
			RETURN newrow
		ELSEIF ( li_Return = -1 ) THEN
			newrow = -1//currentrow
		END IF
	END IF
ELSE
	ll_Count = Long(al_Direction)
	gsu_tour_parameters[gi_Current_Tour].station = This.GetItemNumber(ll_Count, 'history_sta')
	gsu_tour_parameters[gi_Current_Tour].reading_id = This.GetItemNumber(ll_Count, 'history_reading_id')
	lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE)
	IF lb_Applicable THEN
		lb_Hidden = ( This.GetItemNumber(ll_Count, 'station_hidden') = 1 ) AND NOT gb_Display_Hidden_Records
		lb_Calculated = This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
		IF lb_Calculated THEN
			// Check OOS / OOT
			li_Accept_Warning = This.EVENT ue_Show_Warnings(ll_Count, TRUE, TRUE, TRUE)
			IF ( li_Accept_Warning = 1 ) OR ( li_Accept_Warning = 0 ) THEN
				// Update the row
				This.EVENT ue_Update_Row_2(ll_Count)
				// If it's hidden move back to the current row
				IF NOT lb_Hidden THEN
					newrow = ll_Count
				ELSE
					newrow = currentrow
				END IF
			ELSE
				newrow = currentrow
			END IF
			This.Object.history_rd_t.Text = f_LanguageString('CALCULATED_READING', "Calculated Reading")
		ELSE
			// If it's hidden move to the last row
			IF NOT lb_Hidden THEN
				newrow = ll_Count
				This.Object.history_rd_t.Text = f_LanguageString('CURRENT_READING', 'Current Reading')
			ELSE
				newrow = currentrow
			END IF
		END IF
	ELSE
		newrow = currentrow
	END IF
	IF gb_Find_By_Scan THEN
		gb_Find_By_Scan = TRUE
	END IF
	li_Return = This.Event Scan(newrow)
	IF ( li_Return <> 1 ) THEN
		// TODO: Fix this here, might have to recursively 
		// call this event
		IF ib_Initial_Open_Of_Tour AND ( li_Return = -1 ) THEN
			This.PostEvent('ue_Exit_Tour')
			ib_Initial_Open_Of_Tour = FALSE
			RETURN 1
		ELSE
			newrow = -1//currentrow
		END IF
	END IF
END IF

//gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[newrow]
ib_Initial_Open_Of_Tour = FALSE
RETURN newrow

//long newrow
//long ll_Count
//long ll_Num_Rows
//integer li_Accept_Warning
//boolean lb_Applicable
//boolean lb_Calculated
//boolean lb_Hidden
//integer li_Return
//
//newrow = currentrow
//
//IF ( al_Direction = '+1' ) THEN
//	ll_Num_Rows = This.RowCount()
//	FOR ll_Count = currentrow + 1 TO ll_Num_Rows
//		gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[ll_Count]
//		lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, FALSE)
//		IF lb_Applicable THEN
//			lb_Hidden = ( This.Object.station_hidden[ll_Count] = 1 ) AND NOT gb_Display_Hidden_Records
//			lb_Calculated = This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
//			IF lb_Calculated THEN
//				// Check OOS / OOT
//				li_Accept_Warning = This.EVENT ue_Show_Warnings(ll_Count, TRUE, TRUE)
//				IF ( li_Accept_Warning <> 2 ) OR ( li_Accept_Warning <> 20 ) THEN
//					// Update the row
//					This.EVENT ue_Update_Row_2(ll_Count)
//					// If it's hidden move to the next row
//					IF NOT lb_Hidden THEN
//						newrow = ll_Count
//						This.Object.history_rd_t.Text = 'Calculated Reading'
//						EXIT
//					END IF
//				ELSE
//					This.Object.history_rd_t.Text = 'Calculated Reading'
//					EXIT
//				END IF
//			ELSE
//				// If it's hidden move to the next row
//				IF NOT lb_Hidden THEN
//					newrow = ll_Count
//					This.Object.history_rd_t.Text = 'Current Reading'
//					EXIT
//				END IF
//			END IF
//		END IF
//	NEXT
//	IF ( newrow = currentrow ) THEN
//		MessageBox('Last Applicable ' + gs_Station_Label, 'You are at the last applicable ' + gs_Station_Label + '.')
//	ELSE
//		li_Return = This.Event Scan(newrow)
//		IF ib_Initial_Open_Of_Tour AND ( li_Return = -1 ) THEN
//			This.PostEvent('ue_Exit_Tour')
//			ib_Initial_Open_Of_Tour = FALSE
//			RETURN newrow
//		ELSEIF ( li_Return = -1 ) THEN
//			newrow = currentrow
//		END IF
//	END IF
//ELSEIF ( al_Direction = '-1' ) THEN
//	ll_Num_Rows = This.RowCount()
//	FOR ll_Count = currentrow - 1 TO 1 STEP -1
//		gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[ll_Count]
//		lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, FALSE)
//		IF lb_Applicable THEN
//			lb_Hidden = ( This.Object.station_hidden[ll_Count] = 1 ) AND NOT gb_Display_Hidden_Records
//			lb_Calculated = This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
//			IF lb_Calculated THEN
//				// Check OOS / OOT
//				li_Accept_Warning = This.EVENT ue_Show_Warnings(ll_Count, TRUE, TRUE)
//				IF ( li_Accept_Warning <> 2 ) OR ( li_Accept_Warning <> 20 ) THEN
//					// Update the row
//					This.EVENT ue_Update_Row_2(ll_Count)
//					// If it's hidden move to the next row
//					IF NOT lb_Hidden THEN
//						newrow = ll_Count
//						This.Object.history_rd_t.Text = 'Calculated Reading'
//						EXIT
//					END IF
//				ELSE
//					This.Object.history_rd_t.Text = 'Calculated Reading'
//					EXIT
//				END IF
//			ELSE
//				// If it's hidden move to the next row
//				IF NOT lb_Hidden THEN
//					newrow = ll_Count
//					This.Object.history_rd_t.Text = 'Current Reading'
//					EXIT
//				END IF
//			END IF
//		END IF
//	NEXT
//	IF ( newrow = currentrow ) THEN
//		MessageBox('First Applicable ' + gs_Station_Label, 'You are at the first applicable ' + gs_Station_Label + '.')
//	ELSE
//		li_Return = This.Event Scan(newrow)
//		IF ib_Initial_Open_Of_Tour AND ( li_Return = -1 ) THEN
//			This.PostEvent('ue_Exit_Tour')
//			ib_Initial_Open_Of_Tour = FALSE
//			RETURN newrow
//		ELSEIF ( li_Return = -1 ) THEN
//			newrow = currentrow
//		END IF
//	END IF
//ELSE
//	ll_Count = Long(al_Direction)
//	gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[ll_Count]
//	lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE)
//	IF lb_Applicable THEN
//		lb_Hidden = ( This.Object.station_hidden[ll_Count] = 1 ) AND NOT gb_Display_Hidden_Records
//		lb_Calculated = This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
//		IF lb_Calculated THEN
//			// Check OOS / OOT
//			li_Accept_Warning = This.EVENT ue_Show_Warnings(ll_Count, TRUE, TRUE)
//			IF ( li_Accept_Warning = 1 ) OR ( li_Accept_Warning = 0 ) THEN
//				// Update the row
//				This.EVENT ue_Update_Row_2(ll_Count)
//				// If it's hidden move back to the current row
//				IF NOT lb_Hidden THEN
//					newrow = ll_Count
//				ELSE
//					newrow = currentrow
//				END IF
//			ELSE
//				newrow = currentrow
//			END IF
//			This.Object.history_rd_t.Text = 'Calculated Reading'
//		ELSE
//			// If it's hidden move to the last row
//			IF NOT lb_Hidden THEN
//				newrow = ll_Count
//				This.Object.history_rd_t.Text = 'Current Reading'
//			ELSE
//				newrow = currentrow
//			END IF
//		END IF
//	ELSE
//		newrow = currentrow
//	END IF
//	li_Return = This.Event Scan(newrow)
//	IF ( li_Return <> 1 ) THEN
//		// TODO: Fix this here, might have to recursively 
//		// call this event
//		IF ib_Initial_Open_Of_Tour AND ( li_Return = -1 ) THEN
//			This.PostEvent('ue_Exit_Tour')
//			ib_Initial_Open_Of_Tour = FALSE
//			RETURN 1
//		ELSE
//			newrow = currentrow
//		END IF
//	END IF
//END IF
//
//gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[newrow]
//ib_Initial_Open_Of_Tour = FALSE
//RETURN newrow
end event

event ue_exit_tour();gsu_tour_parameters[gi_Current_Tour].scanned_code = ""

w_main.wf_Release_Menu(gsu_tour_parameters[gi_Current_Tour].menu_number)
			
f_Update_Tour_Open(gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].rev_no, 0)
			
gsu_tour_parameters[gi_current_tour].tour_number = -1

w_main.Visible = TRUE
gb_Final_Close = FALSE
CLOSE(w_tour)
SetPointer(Arrow!)
end event

event ue_finish_retrieving_tour();string ls_MB_String
// NOT USED ANYWHERE

This.EVENT ue_Navigate_To_First_Row(FALSE)
il_Multi_Reading_Allowed = This.Object.station_multi_reading_allowed[This.GetRow()]
il_Current_Row_For_Update_TabPages = This.GetRow()
	
string ls_Mask
string ls_MaskDataType
	
ls_Mask = This.Object.station_mask[il_Current_Row_For_Update_TabPages]
ib_Edit_Mask = NOT Empty(ls_Mask)
em_1.Visible = ib_Edit_Mask
IF ib_Edit_Mask THEN
	ls_MaskDataType = This.Object.station_maskdatatype[il_Current_Row_For_Update_TabPages]
	CHOOSE CASE UPPER(ls_MaskDataType)
		CASE 'DATE'
			em_1.SetMask(DateMask!, ls_Mask)
		CASE 'DATETIME'
			em_1.SetMask(DateTimeMask!, ls_Mask)
		CASE 'DECIMAL'
			em_1.SetMask(DecimalMask!, ls_Mask)
		CASE 'NUMERIC'
			em_1.SetMask(NumericMask!, ls_Mask)
		CASE 'STRING'
			em_1.SetMask(StringMask!, ls_Mask)
		CASE 'TIME'
			em_1.SetMask(TimeMask!, ls_Mask)
		CASE ELSE
			em_1.Visible = FALSE
			IF Empty(ls_MaskDataType) THEN
				ls_MaskDataType = ''
			END IF
//			MessageBox('Error', 'Unrecognized MaskDataType of "' + ls_MaskDataType + '"')
			ls_MB_String = f_LanguageString('UNRECOGNIZED_MASKDATATYPE_OF_###', 'Unrecognized MaskDataType of ###')
			ls_MB_String = StrTran(ls_MB_String, '###', ls_MaskDataType)
			MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
	END CHOOSE
END IF
	
This.EVENT ue_Update_TabPages()
end event

event ue_sharedata();integer li_Return
string ls_Return

This.SetRedraw(FALSE)
w_tour.tab_tour.tabpage_stations.dw_stations.SetRedraw(FALSE)
li_Return = w_tour.tab_tour.tabpage_stations.dw_stations.SetTransObject(SQLCA)

// IUSCQ00220255  2011-11-01 - Moved the Dataobject set to BEFORE the properties of the DW being set
IF NOT gb_Alternate_Locked_List_View THEN
	tab_tour.tabpage_stations.dw_stations.DataObject = 'd_station'
ELSE
	tab_tour.tabpage_stations.dw_stations.DataObject = 'd_station_2'
END IF

IF ( UPPER(ProfileString(gs_INI_File, gs_Window_Title, "Ignore_EAPP_In_Stations_DW", f_LanguageString('YES', 'Yes'))) = UPPER(f_LanguageString('YES', 'Yes')) ) THEN
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.compute_1.expression = "'TRUE'"
END IF

IF gb_Display_Hidden_Records THEN
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.seq.Visible = 1
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.history_rd.Visible = 1
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.description.Visible = 1
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.equip_operator_id.Visible = 1
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.location.Visible = 1
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.sta.Visible = 1

// vv IUSCQ00220255  2011-11-01 - Added text color expression being set
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.seq.Color = "0"
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.history_rd.Color = "0"
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.description.Color = "0"
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.equip_operator_id.Color = "0"
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.location.Color = "0"
	w_tour.tab_tour.tabpage_stations.dw_stations.Object.sta.Color = "0"
// ^^ IUSCQ00220255  2011-11-01
	
ELSE
//// vv IUSCQ00220255  2011-11-01 - Added text color expression being set
//	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify('seq.Color = "33554432~tIF((station_hidden = 1) AND NOT f_Display_Hidden_Records(), RGB(255,255,255), IF(compute_1 = ~'TRUE~', 0, RGB(255,255,255)))"')
//	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify('history_rd.Color = "33554432~tIF((station_hidden = 1) AND NOT f_Display_Hidden_Records(), RGB(255,255,255), IF(compute_1 = ~'TRUE~', 0, RGB(255,255,255)))"')
//	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify('description.Color = "33554432~tIF((station_hidden = 1) AND NOT f_Display_Hidden_Records(), RGB(255,255,255), IF(compute_1 = ~'TRUE~', 0, RGB(255,255,255)))"')
//	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify('equip_operator_id.Color = "33554432~tIF((station_hidden = 1) AND NOT f_Display_Hidden_Records(), RGB(255,255,255), IF(compute_1 = ~'TRUE~', 0, RGB(255,255,255)))"')
//	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify('location.Color = "33554432~tIF((station_hidden = 1) AND NOT f_Display_Hidden_Records(), RGB(255,255,255), IF(compute_1 = ~'TRUE~', 0, RGB(255,255,255)))"')
//	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify('sta.Color = "33554432~tIF((station_hidden = 1) AND NOT f_Display_Hidden_Records(), RGB(255,255,255), IF(compute_1 = ~'TRUE~', 0, RGB(255,255,255)))"')
//// ^^ IUSCQ00220255  2011-11-01
	
//	w_tour.tab_tour.tabpage_stations.dw_stations.Modify("seq.Visible='1~tIf(station_hidden=1,0,IF(UPPER(compute_1) = 'TRUE', 1, 0))'")
//	w_tour.tab_tour.tabpage_stations.dw_stations.Modify("history_rd.Visible='1~tIf(station_hidden=1,0,IF(UPPER(compute_1) = 'TRUE', 1, 0))'")
//	w_tour.tab_tour.tabpage_stations.dw_stations.Modify("description.Visible='1~tIf(station_hidden=1,0,IF(UPPER(compute_1) = 'TRUE', 1, 0))'")
//	w_tour.tab_tour.tabpage_stations.dw_stations.Modify("equip_operator_id.Visible='1~tIf(station_hidden=1,0,IF(UPPER(compute_1) = 'TRUE', 1, 0))'")
//	w_tour.tab_tour.tabpage_stations.dw_stations.Modify("location.Visible='1~tIf(station_hidden=1,0,IF(UPPER(compute_1) = 'TRUE', 1, 0))'")
//	w_tour.tab_tour.tabpage_stations.dw_stations.Modify("sta.Visible='1~tIf(station_hidden=1,0,IF(UPPER(compute_1) = 'TRUE', 1, 0))'")
	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify("seq.Visible='1~tIf(station_hidden=1,0,1)'")
	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify("history_rd.Visible='1~tIf(station_hidden=1,0,1)'")
	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify("description.Visible='1~tIf(station_hidden=1,0,1)'")
	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify("equip_operator_id.Visible='1~tIf(station_hidden=1,0,1)'")
	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify("location.Visible='1~tIf(station_hidden=1,0,1)'")
	ls_Return = w_tour.tab_tour.tabpage_stations.dw_stations.Modify("sta.Visible='1~tIf(station_hidden=1,0,1)'")

END IF

//IF((station_hidden = 1) AND NOT f_Display_Hidden_Records(), 0, IF(UPPER(compute_1) = 'TRUE', 1, 0))

li_Return = This.ShareDataOff()
li_Return = This.ShareData(w_tour.tab_tour.tabpage_stations.dw_stations)
tab_tour.tabpage_stations.dw_stations.SelectRow(0, FALSE)
tab_tour.tabpage_stations.dw_stations.SelectRow(This.GetRow(), TRUE)

tab_tour.tabpage_stations.dw_stations.Object.description_t.Text = f_LanguageString('DESCRIPTION', 'Description')
tab_tour.tabpage_stations.dw_stations.Object.equip_operator_id_t.Text = f_LanguageString('EQUIPMENT', 'Equipment')
tab_tour.tabpage_stations.dw_stations.Object.history_rd_t.Text = f_LanguageString('READING', 'Reading')
tab_tour.tabpage_stations.dw_stations.Object.location_t.Text = f_LanguageString('LOCATION', 'Location')
tab_tour.tabpage_stations.dw_stations.Object.misc_t.Text = f_LanguageString('SHORT_INSTRUCTION', 'Short Instruction')
tab_tour.tabpage_stations.dw_stations.Object.seq_t.Text = f_LanguageString('SEQ', 'Seq')
tab_tour.tabpage_stations.dw_stations.Object.sta_t.Text = f_LanguageString('REC', 'Rec')

This.SetRedraw(TRUE)
w_tour.tab_tour.tabpage_stations.dw_stations.SetRedraw(TRUE)

end event

event ue_save_edit_mask_data(long al_row, ref boolean lb_modified);string ls_Mask_Temp
datetime ldt_now
string ls_Rd
string ls_Result
string ls_MaskDataType
string ls_Mask
boolean lb_Empty

IF ib_Edit_Mask THEN
	ls_Mask = This.GetItemString(il_Current_Row_For_Update_TabPages, 'station_mask')
	ls_MaskDataType = This.GetItemString(il_Current_Row_For_Update_TabPages, 'station_maskdatatype')
	CHOOSE CASE UPPER(ls_MaskDataType)
		CASE 'DATE'
			date ld_temp
			em_1.GetData(ld_temp)
			lb_Empty = ( ld_temp = Date(1900, 1, 1) )
			IF NOT lb_Empty THEN
				ls_Rd = String(ld_temp, ls_Mask)
			ELSE
				ls_Rd = ''
			END IF
		CASE 'DATETIME'
			datetime ldt_temp
			em_1.GetData(ldt_temp)
			lb_Empty = ( ldt_temp = Datetime(Date(1900, 1, 1), Time('00:00:00')) )
			IF NOT lb_Empty THEN
				ls_Rd = String(ldt_temp, ls_Mask)
			ELSE
				ls_Rd = ''
			END IF
		CASE 'DECIMAL'
			decimal ldec_temp
			em_1.GetData(ldec_temp)
			ls_Result = String(ldec_temp)
			lb_Empty = Empty(ls_Result)
			IF NOT lb_Empty THEN
				ls_Rd = em_1.Text
				ls_Mask_Temp = StrTran(ls_Mask, '#', '')
				ls_Rd = em_1.Text
				IF ( ls_Rd = ls_Mask_Temp ) THEN
					ls_Rd = ''
				END IF
			ELSE
				ls_Rd = ''
			END IF
		CASE 'STRING'
			em_1.GetData(ls_Result)
			lb_Empty = Empty(ls_Result)
			IF NOT lb_Empty THEN
				ls_Rd = em_1.Text
			ELSE
				ls_Rd = ''
			END IF
		CASE 'NUMERIC'
			dec ldb_temp
			em_1.GetData(ldb_temp)
			lb_Empty = Empty(String(ldb_temp))
			IF NOT lb_Empty THEN
				ls_Mask_Temp = StrTran(ls_Mask, '#', '')
				ls_Rd = em_1.Text
				IF ( ls_Rd = ls_Mask_Temp ) THEN
					ls_Rd = ''
				END IF
//				ls_Rd = f_UnMask(ls_Rd, ls_Mask)
			ELSE
				ls_Rd = ''
			END IF
		CASE 'TIME'
			time lt_temp
			em_1.GetData(lt_temp)
			lb_Empty = ( lt_temp = Time('00:00:00') )
			IF NOT lb_Empty THEN
				ls_Rd = String(lt_temp, ls_Mask)
			ELSE
				ls_Rd = ''
			END IF
		CASE ELSE
			lb_Empty = TRUE
			ls_Rd = ''
	END CHOOSE
//	This.Object.history_rd[al_Row] = ls_Rd

	This.SetItem(al_Row, 'history_rd', ls_Rd)
	lb_Modified = f_Check_If_Reading_Changed(al_Row)
	
	This.EVENT ue_Update_Reading(al_Row, ls_Rd, Datetime(Date(1900, 1, 1), Time('00:00:00')), '')
	This.SetItem(al_Row, 'history_rd', ls_Rd)
	IF f_Check_If_Reading_Changed(al_Row) THEN
		ldt_now = Datetime(Today(), Now())
//		This.Object.history_cdt[al_Row] = ldt_now
//		This.Object.history_user_id[al_Row] = guo_user.ID
		This.EVENT ue_Update_Reading(al_Row, ls_Rd, ldt_now, guo_user.ID)
		This.AcceptText()
		This.EVENT ue_Update_Row_2(al_Row)
	END IF
END IF
end event

event type boolean ue_verify_tour_was_taken();long ll_Row_Count
integer li_Tour
integer li_Rev_No
integer li_Shift_No
date ld_Date

li_Tour			= gsu_tour_parameters[gi_Current_Tour].tour_number
li_Rev_No		= gsu_tour_parameters[gi_Current_Tour].rev_no
li_Shift_No		= gsu_tour_parameters[gi_Current_Tour].shift_no
ld_Date			= gsu_tour_parameters[gi_Current_Tour].tour_date

// 2005-11-11 added the ability to wipe the history for a tour that was never taken
// on the handheld as well as skipping the whole tour close process
/*
Bob says:
SELECT COUNT  
  FROM history a, 
       station b 
 WHERE ( b.tour = 18 ) 
   AND ( b.rev_no = 1 ) 
   AND ( a.shift_no = 2 ) 
   AND ( a.dt = '2005-11-11' ) 
   AND ( a.tour = b.tour ) 
   AND ( a.rev_no = b.rev_no ) 
   AND ( a.sta = b.sta ) 
   AND ( ( erd IS NULL ) OR ( erd = '' ) ) 
   AND ( rd IS NOT NULL ) 
   AND ( rd <> '' ) 

Scott says:
looks good
Bob says:
if that returns zero, then I'll delete that [tour - shift_no - dt] from history and just close the tour window returning the user to the mai nscreen
Scott says:
do it with extreme prejudice
Bob says:
rather than going through any questions and the tour close loop
Scott says:
roger that
*/

SELECT COUNT(*) 
  INTO :ll_Row_Count 
  FROM history a, 
       station b 
 WHERE ( b.tour = :li_Tour ) 
   AND ( b.rev_no = :li_Rev_No ) 
   AND ( a.shift_no = :li_Shift_No ) 
   AND ( a.dt = :ld_Date ) 
   AND ( a.tour = b.tour ) 
   AND ( a.rev_no = b.rev_no ) 
   AND ( a.sta = b.sta ) 
   AND ( ( erd IS NULL ) OR ( TRIM(erd) = '' ) ) 
   AND ( rd IS NOT NULL ) 
   AND ( TRIM(rd) <> '' ) ;

RETURN ( ll_Row_Count > 0 )

end event

event type integer ue_update_notes_tabpage();// NOTE*** = Commented out because it's taken care of in the tour open event
// if the pref is true then prev notes are auto-inserted and there's no need to re-check
// for previous notes
integer li_Note_Already_Copied
integer li_Count
boolean lb_Previous_Note
long ll_Note_Color
integer li_Visible
string ls_Note

IF TRUE THEN
	long ll_Current_Row
	
	ll_Current_Row = il_Current_Row_For_Update_TabPages
	IF IsNull(ll_Current_Row) THEN
		
	ELSE
		ls_Note = This.GetItemString(ll_Current_Row, 'history_notes')
		IF Empty(ls_Note) THEN
			ll_Note_Color = RGB(0, 0, 0)
			li_Visible = 0
		ELSE
			ll_Note_Color = RGB(255, 0, 0)
			li_Visible = 1
		END IF
		
		w_tour.tab_tour.tabpage_notes.tabtextcolor = ll_Note_Color
		w_tour.tab_tour.tabpage_readings.dw_readings.Object.p_notes.Visible = li_Visible
		RETURN li_Visible
	END IF
ELSE
	li_Count = 0
	
	SELECT ISNULL(notes, ''), 
			 note_already_copied 
	  INTO :ls_Note, 
			 :li_Note_Already_Copied
	FROM history 
	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
		AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
		AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
		AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
		AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
		AND ( reading_id = 0 ) ;
	
	// NOTE***
	//IF gb_Copy_Notes_Forward AND ( li_Note_Already_Copied = 0 ) THEN
	//	f_Update_Notes(gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].shift_no, gsu_tour_parameters[gi_Current_Tour].tour_date, gsu_tour_parameters[gi_Current_Tour].station)
	//
	//	SELECT ISNULL(notes, '') 
	//	  INTO :ls_Note
	//	FROM history 
	//	 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
	//		AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
	//		AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
	//		AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
	//		AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
	//		AND ( reading_id = 0 ) ;
	//	
	//END IF
	
	IF Empty(ls_Note) THEN
	// NOTE***
	//	// CPCHEM - Now do a check for previous note here
	//	IF NOT gb_Copy_Notes_Forward THEN
	//
	//		SELECT TOP 1 notes 
	//		  INTO :ls_Note
	//		  FROM history 
	//		 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].tour_number ) 
	//		   AND ( reading_id = 0 ) 
	//			AND ( ( dt < :gsu_tour_parameters[gi_Current_Tour].tour_date ) OR ( ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) AND ( shift_no < :gsu_tour_parameters[gi_Current_Tour].shift_no ) ) ) 
	//			AND ( RTRIM(ISNULL(rd, '')) <> '' ) 
	//			AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
	//	 ORDER BY dt DESC, shift_no DESC ;
	//		
	//		lb_Previous_Note = NOT EMPTY(ls_Note)
	//		IF lb_Previous_Note THEN
	//			ll_Note_Color = RGB(255, 0, 0)
	//			li_Visible = 1
	//		END IF
	//	ELSE
			ll_Note_Color = RGB(0, 0, 0)
			li_Visible = 0
	//	END IF
	ELSE
		ll_Note_Color = RGB(255, 0, 0)
		li_Visible = 1
	END IF
	
	w_tour.tab_tour.tabpage_notes.tabtextcolor = ll_Note_Color
	w_tour.tab_tour.tabpage_readings.dw_readings.Object.p_notes.Visible = li_Visible
	RETURN li_Visible
END IF
end event

event type any ue_show_warnings_for_final_close(long ll_row, boolean ab_show_message, boolean ab_update_spec_tol);datetime ldt_now
string ls_Sql
string ls_EM_Text
boolean lb_Edit_Mask
string ls_Mask
string ls_Reading
string ls_Min
string ls_Max
string ls_Tol
integer li_OOS
integer li_OOT
integer li_Return
string ls_Message
string ls_emin, ls_emax, ls_etol, ls_erd
boolean lb_Row_Modified
boolean lb_Expression_OOS_OOT
string ls_Station
integer li_Tour
integer li_Rev_No
integer li_Sta
integer li_Less_Than
integer li_Greater_Than
boolean lb_In_Spec
integer li_Current_OOS
integer li_Current_OOT

This.AcceptText()

IF ( This.RowCount() > 0 ) THEN
	li_OOS = 0
	li_OOT = 0
	li_Tour = This.GetItemNumber(ll_Row, 'history_tour')
	li_Rev_No = This.GetItemNumber(ll_Row, 'history_rev_no')
	li_Sta = This.GetItemNumber(ll_Row, 'history_sta')
	
	li_Current_OOS = This.GetItemNumber(ll_Row, 'history_spec')
	li_Current_OOT = This.GetItemNumber(ll_Row, 'history_tol')
	
	ls_Station = String(li_Sta)
// Mod 2006-10-25 to avoid ALL masked stations to be populated with the LAST mask data
//	ls_Mask = This.Object.station_mask[ll_row]
//	lb_Edit_Mask = NOT Empty(ls_Mask)
//	IF lb_Edit_Mask THEN
//		ldt_now = Datetime(Today(), Now())
//		// Check if any part of the editmask has been modified
//		IF f_Is_EditMask_Modified(em_1, em_2) THEN
//			ls_Reading = This.Object.history_rd[ll_Row]
//			ls_EM_Text = em_1.Text
//			IF ( ls_Reading <> ls_EM_Text ) THEN
//				ls_Reading = em_1.Text
//				This.Object.history_rd[ll_Row] = ls_Reading
//				This.Object.history_cdt[ll_Row] = ldt_now
//				This.Object.history_user_id[ll_Row] = guo_user.ID
//			END IF
//		ELSE
//			ls_Reading = ''
//			This.Object.history_rd[ll_Row] = ls_Reading
//			This.Object.history_cdt[ll_Row] = ldt_now
//			This.Object.history_user_id[ll_Row] = guo_user.ID
//		END IF
//	ELSE
		ls_Reading = This.GetItemString(ll_Row, 'history_rd')
		IF Empty(ls_Reading) THEN
			ls_Reading = ''
		END IF
//	END IF
	ls_Emin = This.GetItemString(ll_Row, 'station_emin')
	ls_Emax = This.GetItemString(ll_Row, 'station_emax')
	ls_Etol = This.GetItemString(ll_Row, 'station_etol')
	ls_erd = This.GetItemString(ll_Row, "station_erd")
	lb_Expression_OOS_OOT = NOT Empty(ls_emin) OR NOT Empty(ls_emax) OR NOT Empty(ls_etol) OR NOT Empty(ls_erd)
	IF Empty(ls_erd) THEN
		lb_Row_Modified = f_Check_If_Reading_Changed(ll_Row)//( l_status = DataModified! ) OR ( l_status = NewModified! )
	ELSE
		lb_Row_Modified = ib_Calculated_Reading_Modified OR f_Check_If_Reading_Changed(ll_Row)//( l_status = DataModified! ) OR ( l_status = NewModified! )
	END IF
	
	IF lb_Row_Modified THEN
//		ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//		EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
				
		DELETE FROM alert_accept
		 WHERE ( tour = :li_Tour )
			AND ( rev_no = :li_Rev_No )
			AND ( sta = :li_Sta )
			AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No )
			AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date )
			AND ( reading_id = 0 ) ;
					
//		ls_Sql = 'START SYNCHRONIZATION DELETE'
//		EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
//		COMMIT ;
	END IF

	IF ( gb_Tour_Opened AND ( lb_Row_Modified OR lb_Expression_OOS_OOT ) ) THEN
		// Check for quick key OOS 
		integer li_Check_OOS_For_Quick_Key
		integer li_Row_Returned
		
		// The sub-select below is necessary because the normal SELECT returns zero even if there is no record
		// and the SQLNRows started returning -11 for some reason
		
		SELECT spec_setting, 
			  ( SELECT COUNT(*) 
			      FROM quick_keys 
				  WHERE ( tour = :li_Tour ) 
				    AND ( rev_no = :li_Rev_No ) 
					 AND ( sta = :li_Sta ) 
					 AND ( reading = :ls_Reading ) ) 
		  INTO :li_Check_OOS_For_Quick_Key, :li_Row_Returned
		  FROM quick_keys 
		 WHERE ( tour = :li_Tour ) 
         AND ( rev_no = :li_Rev_No ) 
         AND ( sta = :li_Sta ) 
         AND ( reading = :ls_Reading ) 
		 USING SQLCA ;

		IF ( li_Check_OOS_For_Quick_Key = 0 ) AND ( li_Row_Returned > 0 ) THEN
			// Never OOS
			// 2004-10-12 Scott says never OOT as well
			li_OOS = 0
			li_OOT = 0
		ELSEIF ( li_Check_OOS_For_Quick_Key = 2 ) AND ( li_Row_Returned > 0 ) THEN
			// Always OOS
			// 2004-10-12 Scott says never OOT as well
			li_OOS = 1
			li_OOT = 0
		ELSE
			// Check for OOS
			ls_Min = This.GetItemString(ll_Row, 'compute_min')
			ls_Max = This.GetItemString(ll_Row, 'compute_max')
			ls_Tol = This.GetItemString(ll_Row, 'compute_tol')
			li_Less_Than = This.GetItemNumber(ll_Row, 'station_less_than')
			li_Greater_Than = This.GetItemNumber(ll_Row, 'station_greater_than')
			li_OOS = This.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
			// The "OOT * 2" below is for the CASE below to 
			// determine if OOS, OOT or both are present
			li_OOT = This.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
		END IF
// REMOVE ME !!!!
//		This.Object.previous_scan[ll_Row] = This.GetItemNumber(ll_Row, 'history_scan')
//		This.Object.history_scan[ll_Row] = ii_Scanned

		This.Object.history_spec[ll_Row] = li_OOS
		This.Object.history_tol[ll_Row] = li_OOT / 2
		This.EVENT ue_Set_OOT(ll_Row)
// 2006-06-18 - Commented out because ab_Show_Message is never TRUE
//		IF ab_Show_Message AND ( ib_Calculated_Reading_Modified OR lb_Row_Modified ) THEN //( l_rd_status = DataModified! ) OR ( l_rd_status = NewModified! ) ) THEN
//			CHOOSE CASE li_OOS + li_OOT
//				CASE 0
//					// No message, everything is good
//					li_Return = 0
//				CASE 1
//					IF Empty(ls_erd) THEN
//						ls_Message = "Accept this reading?~n~r Min: "
//					ELSE
//						ls_Message = "Calculated reading.~n~r Min: "
//					END IF
//					ls_Message = ls_Message + ls_Min + "~n~r"
//					ls_Message = ls_Message + "  Rd: "
//					ls_Message = ls_Message + ls_Reading + "~n~r"
//					ls_Message = ls_Message + "Max: "
//					ls_Message = ls_Message + ls_Max
//					IF Empty(ls_erd) THEN
//						li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//					ELSE
//						li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//					END IF
//				CASE 2
//					IF Empty(ls_erd) THEN
//						ls_Message = "Accept this reading?~n~r Rd: "
//					ELSE
//						ls_Message = "Calculated reading.~n~r Rd: "
//					END IF
//					ls_Message = ls_Message + ls_Reading
//					IF Empty(ls_erd) THEN
//						li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//					ELSE
//						li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//					END IF
//				CASE 3
//					IF Empty(ls_erd) THEN
//						ls_Message = "Accept this reading?~n~r Min: "
//					ELSE
//						ls_Message = "Calculated reading.~n~r Min: "
//					END IF
//					ls_Message = ls_Message + ls_Min + "~n~r"
//					ls_Message = ls_Message + "  Rd: "
//					ls_Message = ls_Message + ls_Reading + "~n~r"
//					ls_Message = ls_Message + "Max: "
//					ls_Message = ls_Message + ls_Max
//					IF Empty(ls_erd) THEN
//						li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//					ELSE
//						li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//					END IF
//			END CHOOSE
//			IF ( li_Return = 1 ) THEN
//				This.Object.history_spec[ll_Row] = li_OOS
//				This.Object.history_tol[ll_Row] = li_OOT / 2
//				This.EVENT ue_Set_OOT(ll_Row)
//			END IF
//		END IF
		lb_In_Spec = ( li_OOS + li_OOT = 0 )
		IF NOT lb_In_Spec THEN
			// If an OOS/OOT condition exists then set the status 
			// of the required note
			IF ib_AbnormalReadingsRequireNote THEN
				ib_Blank_Note = Empty(This.GetItemString(ll_Row, 'history_notes'))
			ELSE
				ib_Blank_Note = FALSE
			END IF
		END IF
//TODO: 2005-04-06 - Possibly later add code to re-evaluate the alerts if the 
// Min/Max/Tol has changed as well.  Don't just look at if 
// the reading has changed
		IF lb_Row_Modified AND ( ( li_Return <> 2 ) OR lb_In_Spec ) THEN
			integer li_Alert_Return
			li_Alert_Return = tab_tour.tabpage_instructions.dw_alerts.EVENT ue_Evaluate_Alerts_2(ab_Show_Message, ll_Row)
			// If there are no alerts to process then 0 is returned
			IF ( li_Alert_Return <> 0 ) THEN
				IF lb_In_Spec THEN
					// I have to identify when there is an alert with no OOS/OOT condition
					li_Return = li_Alert_Return * 10
				ELSE
					// Returns 1 or 2 for an Alert AND an OOS/OOT condition
					li_Return = li_Alert_Return
				END IF
			END IF
		END IF
	END IF
ELSE
	ib_Calculated_Reading_Modified = FALSE
	RETURN 0
END IF

ib_Calculated_Reading_Modified = FALSE
RETURN li_Return

//string ls_Reading
//string ls_Return
//string ls_Min
//string ls_Max
//string ls_Tol
//integer li_OOS
//integer li_OOT
//integer li_Return
//string ls_Message
//boolean 	lb_Display
//boolean lb_Rows_Present
//string ls_Database_Reading
//integer li_Quick_Key_Exists
//string ls_emin, ls_emax, ls_etol, ls_erd
//boolean lb_Row_Modified
//boolean lb_Expression_OOS_OOT
//string ls_Station
//integer li_Tour
//integer li_Rev_No
//integer li_Sta
//integer li_Less_Than
//integer li_Greater_Than
////date ld_Tour_Date
////string ls_Reading_From_DB
////integer li_Shift_No
////boolean lb_Modified
//dwitemstatus l_status, l_rd_status
//pointer l_pointer
//
//This.AcceptText()
//
//l_pointer = SetPointer(HourGlass!)
//IF ( This.RowCount() > 0 ) THEN
////	Beep(1)
//	li_OOS = 0
//	li_OOT = 0
//	li_Tour = This.Object.history_tour[ll_Row]
//	li_Rev_No = This.Object.history_rev_no[ll_Row]
//	li_Sta = This.GetItemNumber(ll_Row, 'history_sta')
////	ld_Tour_Date = This.Object.history_dt[ll_Row]
////	li_Shift_No = This.Object.history_shift_no[ll_Row]
//	ls_Station = String(li_Sta)
//	IF ib_Edit_Mask THEN
//		// Check if any part of the editmask has been modified
//		IF f_Is_EditMask_Modified(em_1, em_2) THEN
//			ls_Reading = This.Object.history_rd[ll_Row]
//			IF ( ls_Reading <> em_1.Text ) THEN
//				ls_Reading = em_1.Text
//				This.Object.history_rd[ll_Row] = ls_Reading
//				This.Object.history_cdt[ll_Row] = DateTime(Today(), Now())
//				This.Object.history_user_id[ll_Row] = guo_user.ID
//			END IF
//		ELSE
//			ls_Reading = ''
//			This.Object.history_rd[ll_Row] = ls_Reading
//			This.Object.history_cdt[ll_Row] = DateTime(Today(), Now())
//			This.Object.history_user_id[ll_Row] = guo_user.ID
//		END IF
//	ELSE
////		ls_Reading = This.GetItemString(ll_Row, 'history_rd')
//		ls_Reading = This.Object.history_rd[ll_Row]
//		IF Empty(ls_Reading) THEN
//			ls_Reading = ''
//		END IF
//	END IF
//	
////	l_status = This.GetItemStatus(ll_Row, 0, Primary!)
////	l_rd_status = This.GetItemStatus(ll_Row, "history_rd", Primary!)
//	
//	ls_Emin = This.Object.station_emin[ll_Row]
//	IF Empty(ls_Emin) THEN
//		ls_Emin = ''
//	ELSE
//		ls_Emin = StrTran(ls_Emin, "'", '"')
//		ls_Emin = f_Purge_Spaces(ls_Emin)
//	END IF
//
//	ls_Emax = This.Object.station_emax[ll_Row]
//	IF Empty(ls_Emax) THEN
//		ls_Emax = ''
//	ELSE
//		ls_Emax = StrTran(ls_Emax, "'", '"')
//		ls_Emax = f_Purge_Spaces(ls_Emax)
//	END IF
//
//	ls_Etol = This.Object.station_etol[ll_Row]
//	IF Empty(ls_Etol) THEN
//		ls_Etol = ''
//	ELSE
//		ls_Etol = StrTran(ls_Etol, "'", '"')
//		ls_Etol = f_Purge_Spaces(ls_Etol)
//	END IF
//
//	ls_erd = This.GetItemString(ll_Row, "station_erd")
//
//	ls_Emin = StrTran(Upper(ls_Emin), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//	ls_Emax = StrTran(Upper(ls_Emax), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//	ls_Etol = StrTran(Upper(ls_Etol), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//
//	lb_Expression_OOS_OOT = NOT Empty(ls_emin) OR NOT Empty(ls_emax) OR NOT Empty(ls_etol) OR NOT Empty(ls_erd) 
//	IF Empty(ls_erd) THEN
//		lb_Row_Modified = f_Check_If_Reading_Changed(ll_Row)//( l_status = DataModified! ) OR ( l_status = NewModified! )
//	ELSE
//		lb_Row_Modified = ib_Calculated_Reading_Modified OR f_Check_If_Reading_Changed(ll_Row)//( l_status = DataModified! ) OR ( l_status = NewModified! )
//	END IF
//	
//	IF lb_Row_Modified THEN
//				
//		DELETE FROM alert_accept
//		 WHERE ( tour = :li_Tour )
//			AND ( rev_no = :li_Rev_No )
//			AND ( sta = :li_Sta )
//			AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No )
//			AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date )
//			AND ( reading_id = 0 ) ;
//					
////		COMMIT ;
//	END IF
//
//	IF ( gb_Tour_Opened AND ( lb_Row_Modified OR NOT Empty(ls_emin) OR NOT Empty(ls_emax) OR NOT Empty(ls_etol) OR NOT Empty(ls_erd) ) ) THEN
////		IF NOT Empty(ls_Reading) THEN
//			// Check for quick key OOS 
//			integer li_Check_OOS_For_Quick_Key
//			integer li_Row_Returned
//			
//			// The sub-select below is necessary because the normal SELECT returns zero even if there is no record
//			// and the SQLNRows started returning -11 for some reason
//			
//			SELECT spec_setting, 
//				  ( SELECT COUNT(*) FROM quick_keys WHERE ( tour = :li_Tour ) AND ( rev_no = :li_Rev_No ) AND ( sta = :li_Sta ) AND ( reading = :ls_Reading ) ) 
//			  INTO :li_Check_OOS_For_Quick_Key, :li_Row_Returned
//			  FROM quick_keys 
//			 WHERE ( tour = :li_Tour ) 
//            AND ( rev_no = :li_Rev_No ) 
//            AND ( sta = :li_Sta ) 
//            AND ( reading = :ls_Reading ) 
//			USING SQLCA ;
//
//			IF ( li_Check_OOS_For_Quick_Key = 0 ) AND ( li_Row_Returned > 0 ) THEN
//				// Never OOS
//				// 2004-10-12 Scott says never OOT as well
////				This.Object.history_spec[ll_Row] = 0
////				This.Object.history_tol[ll_Row] = 0
//				li_OOS = 0
//				li_OOT = 0
//			ELSEIF ( li_Check_OOS_For_Quick_Key = 2 ) AND ( li_Row_Returned > 0 ) THEN
//				// Always OOS
//				// 2004-10-12 Scott says never OOT as well
////				This.Object.history_spec[ll_Row] = 1
////				This.Object.history_tol[ll_Row] = 0
//				li_OOS = 1
//				li_OOT = 0
//			ELSE
//				// Check for OOS
////				ls_Min = This.Object.compute_min[ll_Row]
////				ls_Max = This.Object.compute_max[ll_Row]
////				ls_Tol = This.Object.compute_tol[ll_Row]
//				
//				IF NOT Empty(ls_EMin) THEN
//					ls_Min = "Evaluate('" + ls_EMin + "', 0)"
//					ls_Min = ids_evaluate.Describe(ls_Min)
//				ELSE
//					ls_Min = This.Object.compute_min[ll_Row]
//				END IF
//
//				IF NOT Empty(ls_EMax) THEN
//					ls_Max = "Evaluate('" + ls_EMax + "', 0)"
//					ls_Max = ids_evaluate.Describe(ls_Max)
//				ELSE
//					ls_Max = This.Object.compute_max[ll_Row]
//				END IF
//
//				IF NOT Empty(ls_etol) THEN
//					ls_Tol = "Evaluate('" + ls_Etol + "', 0)"
//					ls_Tol = ids_evaluate.Describe(ls_Tol)
//				ELSE
//					ls_Tol = This.Object.compute_tol[ll_Row]
//				END IF
//
//				li_Less_Than = This.Object.station_less_than[ll_Row]
//				li_Greater_Than = This.Object.station_greater_than[ll_Row]
//				li_OOS = This.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
//				// The "OOT * 2" below is for the CASE below to 
//				// determine if OOS, OOT or both are present
//				li_OOT = This.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
//			END IF
//			This.Object.history_scan[ll_Row] = ii_Scanned
////			IF ab_Update_Spec_Tol THEN
////				This.Object.history_spec[ll_Row] = li_OOS
////				This.Object.history_tol[ll_Row] = li_OOT / 2
////				This.EVENT ue_Set_OOT(ll_Row)
////			END IF
//			IF ab_Show_Message AND ( ib_Calculated_Reading_Modified OR lb_Row_Modified ) THEN //( l_rd_status = DataModified! ) OR ( l_rd_status = NewModified! ) ) THEN
//				CHOOSE CASE li_OOS + li_OOT
//					CASE 0
//						// No message, everything is good
//						li_Return = 0
//					CASE 1
//						IF Empty(ls_erd) THEN
//							ls_Message = "Accept this reading?~n~r Min: "
//						ELSE
//							ls_Message = "Calculated reading.~n~r Min: "
//						END IF
//						ls_Message = ls_Message + ls_Min + "~n~r"
//						ls_Message = ls_Message + "  Rd: "
//						ls_Message = ls_Message + ls_Reading + "~n~r"
//						ls_Message = ls_Message + "Max: "
//						ls_Message = ls_Message + ls_Max
//						IF Empty(ls_erd) THEN
//							li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//						ELSE
//							li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//						END IF
//					CASE 2
//						IF Empty(ls_erd) THEN
//							ls_Message = "Accept this reading?~n~r Rd: "
//						ELSE
//							ls_Message = "Calculated reading.~n~r Rd: "
//						END IF
//						ls_Message = ls_Message + ls_Reading
//						IF Empty(ls_erd) THEN
//							li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//						ELSE
//							li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//						END IF
//					CASE 3
//						IF Empty(ls_erd) THEN
//							ls_Message = "Accept this reading?~n~r Min: "
//						ELSE
//							ls_Message = "Calculated reading.~n~r Min: "
//						END IF
//						ls_Message = ls_Message + ls_Min + "~n~r"
//						ls_Message = ls_Message + "  Rd: "
//						ls_Message = ls_Message + ls_Reading + "~n~r"
//						ls_Message = ls_Message + "Max: "
//						ls_Message = ls_Message + ls_Max
//						IF Empty(ls_erd) THEN
//							li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, YesNo!)
//						ELSE
//							li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(This.GetItemNumber(ll_Row, 'history_sta')) + "~n~r" + ls_Message, Question!, Ok!)
//						END IF
//				END CHOOSE
////				IF ( li_Return = 1 ) OR ( li_OOS + li_OOT = 0 ) THEN
////					li_Return = tab_tour.tabpage_instructions.dw_alerts.EVENT ue_Evaluate_Alerts_2(TRUE)
////					IF ( li_Return = 1 ) THEN
//						This.Object.history_spec[ll_Row] = li_OOS
//						This.Object.history_tol[ll_Row] = li_OOT / 2
//						This.EVENT ue_Set_OOT(ll_Row)
////					END IF
////				END IF
//			END IF
//			IF lb_Row_Modified AND ( ( li_Return <> 2 ) OR ( li_OOS + li_OOT = 0 ) ) THEN
//				integer li_Alert_Return
//				li_Alert_Return = tab_tour.tabpage_instructions.dw_alerts.EVENT ue_Evaluate_Alerts_2(ab_Show_Message, ll_Row)
//				// If there are no alerts to process then 0 is returned
//				IF ( li_Alert_Return <> 0 ) THEN
//					li_Return = li_Alert_Return
//				END IF
//			END IF
//			IF ( li_Return = 1 ) THEN
//				// If an OOS/OOT/Alert condition exists then set the status 
//				// of the required note
//				IF ib_AbnormalReadingsRequireNote THEN
//					ib_Blank_Note = Empty(This.Object.history_notes[ll_Row])
//				ELSE
//					ib_Blank_Note = FALSE
//				END IF
//			END IF
////		END IF
//	END IF
//ELSE
//	ib_Calculated_Reading_Modified = FALSE
//	RETURN 0
//END IF
//
//ib_Calculated_Reading_Modified = FALSE
//SetPointer(l_pointer)
//RETURN li_Return
//
end event

event ue_test;This.EVENT ue_Enter_Button()
end event

event type long ue_filter_for_unscanned();string ls_MB_String
//string ls_Sql
string ls_Filter
integer li_Return
long ll_Num_Rows
long ll_Count
boolean lb_Been_Here

This.SetRedraw(FALSE)
ib_Filter_During_Close = gb_Final_Close

IF Empty(is_Scan_Filter) THEN
	ls_Filter = " ( ( NOT ISNULL(station_scan) ) AND ( TRIM(station_scan) > '' ) AND ( history_scan = 0 ) ) "
	IF NOT gb_display_hidden_records THEN
		ls_Filter = ls_Filter + " AND ( station_hidden = 0 ) "
	END IF
ELSE
	ls_Filter = is_Scan_Filter + " AND ( NOT ISNULL(station_scan) AND ( TRIM(station_scan) > '' ) AND ( history_scan = 0 ) ) "
END IF

ib_Filtering = TRUE
This.SetRow(1)
li_Return = This.SetFilter(ls_Filter)
li_Return = This.Filter()
//ls_Sql = This.Object.DataWindow.Table.Select

ll_Num_Rows = This.RowCount()
li_Return = 1
FOR ll_Count = 1 To ll_Num_Rows
	// check applicability columns
	IF This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE) THEN
		lb_Been_Here = TRUE
		gl_Last_Applicable_Station = This.Object.history_sta[ll_Count]
		il_Row_For_Navigate_To_Row_PostEvent = ll_Count
		This.PostEvent('ue_Navigate_To_Row', 0, ll_Count)
//		This.EVENT ue_Navigate_To_First_Row(FALSE)
		EXIT
	END IF
NEXT
IF NOT lb_Been_Here THEN
	gsu_tour_parameters[gi_Current_Tour].Filter = ''
	ll_Num_Rows = 0
//	MessageBox("No " + gs_Station_Label + "(s)", "There are no " + gs_Station_Label + "s to display", Exclamation!)
	ls_MB_String = f_LanguageString('THERE_ARE_NO_###S_TO_DISPLAY', "There are no ###s to display")
	ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
	MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
	This.EVENT ue_Retrieve_Current_Tour(FALSE)
ELSE
	IF ( ll_Num_Rows = 0 ) THEN
		gsu_tour_parameters[gi_Current_Tour].Filter = ''
//		MessageBox("No " + gs_Station_Label + "(s)", "There are no " + gs_Station_Label + "s to display", Exclamation!)
		ls_MB_String = f_LanguageString('THERE_ARE_NO_###S_TO_DISPLAY', "There are no ###s to display")
		ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
		MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
		This.EVENT ue_Retrieve_Current_Tour(FALSE)
	ELSEIF ( ll_Num_Rows = 1 ) THEN
		IF NOT This.EVENT ue_Evaluate_Applicability(1, TRUE) THEN
			gsu_tour_parameters[gi_Current_Tour].Filter = ''
			ll_Num_Rows = 0
//			MessageBox("No " + gs_Station_Label + "(s)", "There are no " + gs_Station_Label + "s to display", Exclamation!)
			ls_MB_String = f_LanguageString('THERE_ARE_NO_###S_TO_DISPLAY', "There are no ###s to display")
			ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
			MessageBox(f_LanguageString('NO', "No") + " " + gs_Station_Label, ls_MB_String, Exclamation!)
			This.EVENT ue_Retrieve_Current_Tour(FALSE)
		ELSE
			gsu_tour_parameters[gi_Current_Tour].Filter = 'UNSCANNED'
			This.Post EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)
	
			tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//			IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//				MessageBox("No stations", "There are no Missed Readings to display", Exclamation!)
//				This.EVENT ue_Retrieve_Current_Tour(FALSE)
//			END IF
		END IF
	ELSE
		gsu_tour_parameters[gi_Current_Tour].Filter = 'UNSCANNED'
		This.Post EVENT ue_update_filter_menus(gsu_tour_parameters[gi_Current_Tour].Filter)

		tab_tour.tabpage_stations.dw_stations.EVENT ue_Sort_DW("station_seq", "", 1, 'A')
//		IF ( This.EVENT ue_Navigate_To_First_Row(FALSE) = -1 ) THEN
//			MessageBox("No stations", "There are no Missed Readings to display", Exclamation!)
//			This.EVENT ue_Retrieve_Current_Tour(FALSE)
//		END IF
	END IF
END IF

// Save for a possible preference later
IF FALSE THEN
	in_dwaw.of_Register(w_tour, tab_tour.tabpage_stations.dw_stations)
	in_dwaw.of_ResizeAll()
END IF

IF ( tab_tour.SelectedTab <> 1 ) THEN
	tab_tour.EVENT SelectionChanged(tab_tour.SelectedTab, tab_tour.SelectedTab)
END IF
il_Current_Row_For_Update_TabPages = This.GetRow()
IF lb_Been_Here AND ( ll_Num_rows > 0 ) THEN
	is_ScanCode = ''
	is_Scan_Result = ''
END IF

This.SetRedraw(TRUE)

This.PostEvent('ue_Update_Tabpages')

RETURN ll_Num_Rows

end event

event ue_update_reading(long al_row, string as_reading, datetime adt_cdt, string as_user_id);// 10-17-2008 - Commented out not used inf_Check_If_Reading_Changed()
//This.Object.previous_rd[al_Row] = This.GetItemString(al_Row, 'history_rd')

// 2008-10-17 - Added
IF Empty(as_Reading) THEN
	This.Object.history_spec[al_Row] = 0
	This.Object.history_tol[al_Row] = 0
END IF

// 2009-02-26 - RPR - Added for use by w_num_pad
IF ib_Edit_Mask THEN
	// vv IUSCQ00193244 2009-09-04 - RPR
//	em_1.Text = as_Reading
	string ls_Mask
	string ls_MaskDataType
	ls_Mask = This.GetItemString(al_Row, 'station_mask')
	ls_MaskDataType = This.GetItemString(al_row, 'station_maskdatatype')
	em_1.Text = f_Unmask(as_Reading, ls_Mask, ls_MaskDataType)
	// ^^ IUSCQ00193244 2009-09-04 - RPR
END IF

This.Object.history_rd[al_Row] = as_Reading
IF ( adt_Cdt = Datetime(Date(1900, 1, 1), Time('00:00:00')) ) THEN
ELSE
	This.Object.history_cdt[al_Row] = adt_Cdt
END IF
IF ( as_User_Id = '' ) THEN
ELSE
	This.Object.history_user_id[al_Row] = as_User_Id
END IF

end event

event ue_display_numpad(long row);string ls_Parm
string ls_Mask
string ls_Mask_DataType
string ls_MB_String
boolean lb_Use_Num_Pad

IF Empty(This.Object.station_erd[row]) THEN
	string ls_Reading
	//[NPTS]
	lb_Use_Num_Pad = TRUE
	ls_Reading = This.Object.history_rd[row]
	IF Empty(TRIM(ls_Reading)) THEN
		ls_Reading = ''
	END IF
	IF ( IsNumber(ls_Reading) OR ( ls_Reading = '' ) OR ( RIGHT(TRIM(ls_Reading), 1) = guo_date_format.is_Decimal_Separator )) AND lb_Use_Num_Pad THEN
		ls_Mask = This.Object.station_mask[row]
		ls_Mask_DataType = This.Object.station_maskdatatype[row]
		IF Empty(ls_Mask_DataType) THEN
			ls_Mask_DataType = ''
		END IF
		IF ( ls_Mask_DataType = 'NUMERIC' ) OR ( ls_Mask_DataType = 'DECIMAL' ) THEN
			IF Empty(ls_Mask) THEN
				ls_Mask = ''
			END IF
		ELSE
			ls_Mask = ''
		END IF
		ls_Parm = ls_Reading + '|' + ls_Mask

		OpenWithParm(w_num_pad, ls_Parm)
		ls_Reading = Message.StringParm
		Message.StringParm = ''
		// Empty string = no change
		IF ( TRIM(ls_Reading) <> '' ) THEN
			This.EVENT ue_Update_Reading(row, ls_Reading, DateTime(Today(), Now()), guo_user.ID)
		END IF
	END IF
ELSE
//	MessageBox("Calculated Reading", 'Rd: ' + String(This.Object.history_rd[row]) + '~n~rRd Exp: ' + String(This.Object.station_erd[row]))
	ls_MB_String = f_LanguageString('RD_###_RD_EXP_$$$', 'Rd ### Rd Exp $$$')
	ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.history_rd[row]) + '~n~r')
	ls_MB_String = StrTran(ls_MB_String, '$$$', String(This.Object.station_erd[row]))
	MessageBox(f_LanguageString('CALCULATED_READING', "Calculated Reading"), ls_MB_String)
END IF

end event

event ue_update_filter_menus(string as_menu_item);// 2008-10-03 - Because of the crazy-ass way of updating menus, 
// along with the new language modifications to the menu items, 
// I'm done checking / disabling the selected menu item

CHOOSE CASE as_Menu_Item
	CASE 'ALL'
		tab_tour.tabpage_readings.dw_readings.Object.filter_t.Text = f_LanguageString('<ALL_READINGS>', '<All Readings>')
	CASE 'ABNORMAL'
		tab_tour.tabpage_readings.dw_readings.Object.filter_t.Text = f_LanguageString('<ABNORMAL>', '<Abnormal>')
	CASE 'MISSED'
		tab_tour.tabpage_readings.dw_readings.Object.filter_t.Text = f_LanguageString('<MISSED>', '<Missed>')
	CASE 'REQUIRED'
		tab_tour.tabpage_readings.dw_readings.Object.filter_t.Text = f_LanguageString('<REQUIRED>', '<Required>')
	CASE 'UNSCANNED'
		tab_tour.tabpage_readings.dw_readings.Object.filter_t.Text = f_LanguageString('<UNSCANNED>', '<Unscanned>')
END CHOOSE

end event

event rbuttondown;string ls_MB_String
boolean lb_Use_Num_Pad
integer li_Tab
string ls_Column
string ls_Message
string ls_Equip_Operator_Id
string ls_Long_Instructions
string ls_Expression
string ls_Inequality

ls_Column = dwo.Name

CHOOSE CASE ls_Column
	CASE 'history_rd', 'history_rd_t'
//		This.EVENT ue_Display_NumPad(row)
		IF Empty(This.Object.station_erd[row]) THEN
//			string ls_Reading
//			//[NPTS]
//			lb_Use_Num_Pad = TRUE
//			ls_Reading = This.Object.history_rd[row]
//			IF Empty(TRIM(ls_Reading)) THEN
//				ls_Reading = ''
//			END IF
//			IF ( IsNumber(ls_Reading) OR ( ls_Reading = '' ) ) AND lb_Use_Num_Pad THEN
//				OpenWithParm(w_num_pad, ls_Reading)
//				ls_Reading = Message.StringParm
//				Message.StringParm = ''
//				// Empty string = no change
//				IF ( TRIM(ls_Reading) <> '' ) THEN
//					This.EVENT ue_Update_Reading(row, ls_Reading, DateTime(Today(), Now()), guo_user.ID)
//				END IF
//			END IF
		ELSE
//			MessageBox("Calculated Reading", 'Rd: ' + String(This.Object.history_rd[row]) + '~n~rRd Exp: ' + String(This.Object.station_erd[row]))
			ls_Expression = String(This.Object.station_erd[row])
			ls_MB_String = f_LanguageString('RD_###_RD_EXP_$$$', 'Rd ### Rd Exp $$$')
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.history_rd[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Expression)
			::ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('CALCULATED_READING', "Calculated Reading"), ls_MB_String)
		END IF
////		This.EVENT ue_Navigate_To_Row(1, 'rbuttondown')
	CASE 'p_long_instructions'
		ls_Long_Instructions = String(This.Object.station_instr[row])
		IF NOT Empty(ls_Long_Instructions) THEN
			ls_Message = 'Long Instructions|' + ls_Long_Instructions
			OpenWithParm(w_detail, ls_Message)
		END IF
	CASE 'p_alerts'
		li_Tab = 3
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_instructions.st_station_description_instructions.Post SetFocus()
	CASE 'p_notes'
		li_Tab = 4
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_notes.mle_note_1.Post SetFocus()
	CASE 'p_multi'
		li_Tab = 6
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_multi.st_station_description_multi.Post SetFocus()
	CASE 'p_documents'
		li_Tab = 7
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_documents.st_station_description_docs.Post SetFocus()
	CASE 'compute_min', 'station_minimum_t'
//	CASE 'compute_min_display'
		IF NOT Empty(String(This.Object.compute_min[row])) THEN
			IF ( This.Object.station_greater_than[row] = 1 ) THEN
				ls_Inequality = "> "
			ELSE
				ls_Inequality = ">= "
			END IF
		ELSE
			ls_Inequality = ""
		END IF
		IF NOT Empty(This.Object.station_emin[row]) THEN
			ls_Expression = String(This.Object.station_emin[row])
//			MessageBox("Minimum", 'Min: ' + ls_Inequality + String(This.Object.compute_min[row]) + '~n~rMin Exp: ' + ls_Expression)
			ls_MB_String = f_LanguageString('MIN_$$$_###_MIN_EXP_@@@', 'Min $$$ ### Min Exp @@@')
			ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_min[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '@@@', ls_Expression)
			::ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('MINIMUM', "Minimum"), ls_MB_String)
		ELSE
			IF NOT Empty(This.Object.compute_min[row]) THEN
//				MessageBox("Minimum", 'Min: ' + ls_Inequality + String(This.Object.compute_min[row]))
				ls_MB_String = f_LanguageString('MIN_$$$_###', 'Min $$$ ###')
				ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
				ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_min[row]))
				MessageBox(f_LanguageString('MINIMUM', "Minimum"), ls_MB_String)
			END IF
		END IF
	CASE 'compute_max', 'station_maximum_t'
//	CASE 'compute_max_display'
		IF NOT Empty(String(This.Object.compute_max[row])) THEN
			IF ( This.Object.station_less_than[row] = 1 ) THEN
				ls_Inequality = "< "
			ELSE
				ls_Inequality = "<= "
			END IF
		ELSE
			ls_Inequality = ""
		END IF
		IF NOT Empty(This.Object.station_emax[row]) THEN
			ls_Expression = String(This.Object.station_emax[row])
//			MessageBox("Maximum", 'Max: ' + ls_Inequality + String(This.Object.compute_max[row]) + '~n~rMax Exp: ' + ls_Expression)
			ls_MB_String = f_LanguageString('MAX_$$$_###_MAX_EXP_@@@', 'Max $$$ ### Max Exp @@@')
			ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_max[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '@@@', ls_Expression)
			::ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('MAXIMUM', "Maximum"), ls_MB_String)
		ELSE
			IF NOT Empty(This.Object.compute_max[row]) THEN
//				MessageBox("Maximum", 'Max: ' + ls_Inequality + String(This.Object.compute_max[row]))
				ls_MB_String = f_LanguageString('MAX_$$$_###', 'Max $$$ ###')
				ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
				ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_max[row]))
				MessageBox(f_LanguageString('MAXIMUM', "Maximum"), ls_MB_String)
			END IF
		END IF
	CASE 'compute_tol', 'station_tolerance_t'
//	CASE 'compute_tol_display'
		IF NOT Empty(This.Object.station_etol[row]) THEN
//			MessageBox("Tolerance", 'Tol: ' + String(This.Object.compute_tol[row]) + '~n~rTol Exp: ' + String(This.Object.station_etol[row]) + '~n~rTol Recs: ' + String(This.Object.station_tol_sta[row]))
			ls_MB_String = f_LanguageString('TOL_@@@_TOL_EXP_$$$_TOL_RECS_###', 'Tol @@@ Tol Exp $$$ Tol Recs ###')
			ls_MB_String = StrTran(ls_MB_String, '@@@', String(This.Object.compute_tol[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.station_etol[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '$$$', String(This.Object.station_tol_sta[row]))
			ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('TOLERANCE', "Tolerance"), ls_MB_String)
		ELSE
			IF NOT Empty(This.Object.station_tol_sta[row]) THEN
//				MessageBox("Tolerance", 'Tol: ' + String(This.Object.compute_tol[row]) + '~n~rTol Recs: ' + String(This.Object.station_tol_sta[row]))
				ls_MB_String = f_LanguageString('TOL_$$$_TOL_RECS_###', 'Tol $$$ Tol Recs ###')
				ls_MB_String = StrTran(ls_MB_String, '$$$', String(This.Object.compute_tol[row]) + '~n~r')
				ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.station_tol_sta[row]))
				MessageBox(f_LanguageString('TOLERANCE', "Tolerance"), ls_MB_String)
			END IF
		END IF
	CASE 'seq_seq', 'sta_sta'
//	CASE 'compute_seq', 'compute_sta'
		IF NOT Empty(This.Object.station_eapp[row]) THEN
//			MessageBox("Applicability Expression", 'App Exp: ' + String(This.Object.station_eapp[row]))
			ls_MB_String = f_LanguageString('APP_EXP_###', 'App Exp ###')
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.station_eapp[row]))
			MessageBox(f_LanguageString('APPLICABILITY_EXPRESSION', "App Exp"), ls_MB_String)
		END IF
	CASE 'station_units'
//	CASE 'compute_station_units'
//		MessageBox("Units", String(This.Object.station_units[row]))
		MessageBox(f_LanguageString('UNITS', "Units"), String(This.Object.station_units[row]))
	CASE 'station_description'
//	CASE 'compute_station_description'
//		MessageBox("Record Description", String(This.Object.station_description[row]))
		MessageBox(f_LanguageString('RECORD_DESCRIPTION', "Record Description"), String(This.Object.station_description[row]))
	CASE 'station_location'
//	CASE 'compute_station_location'
//		MessageBox("Record Location", String(This.Object.station_location[row]))
		MessageBox(f_LanguageString('RECORD_LOCATION', "Record Location"), String(This.Object.station_location[row]))
	CASE 'station_equip_operator_id'
//	CASE 'compute_station_equip_operator_id'
		ls_Equip_Operator_Id = String(This.Object.station_equip_operator_id[row])
		IF NOT Empty(ls_Equip_Operator_Id) THEN
			ls_Message = 'Equipment Detail|' + ls_Equip_Operator_Id
//			ls_Message = 'Equipment Detail|' + f_Get_Equipment_Detail(ls_Equip_Operator_Id)
			OpenWithParm(w_detail, ls_Message)
		END IF
	CASE 'tour_name_t'
		ls_Message = 'Tour Detail|' //+ f_Get_Tour_Detail(gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].rev_no)
		OpenWithParm(w_detail, ls_Message)
	CASE 'station_misc'
//		MessageBox("Short Instructions", String(This.Object.station_misc[row]))
		MessageBox(f_LanguageString('SHORT_INSTRUCTIONS', "Short Instructions"), String(This.Object.station_misc[row]))
	CASE 'datawindow'
	CASE ELSE
//		IF ( RIGHT(ls_Column, 2) <> '_t' ) THEN
//			MessageBox(This.Describe("'" + ls_Column + '_t' + "'.Text"), This.GetItemString(row, ls_Column))
//		END IF
END CHOOSE

end event

event editchanged;datetime ldt_now
integer li_Return
long ll_Row
long ll_Num_Rows
string ls_Search
string ls_Item_Found
string ls_Reading
datawindowchild ldwcTemp

IF ( dwo.Name = 'history_rd' ) THEN
	This.AcceptText()
	ls_Reading = This.Object.history_rd[row]
//	IF ( POS(ls_Reading, CHAR(gi_Hardware_Button)) > 0 ) THEN
//		This.Object.history_rd[row] = StrTran(ls_Reading, CHAR(gi_Hardware_Button), '')
//	END IF
// 10-17-2008 - Added
	IF Empty(ls_Reading) THEN
		This.Object.history_spec[Row] = 0
		This.Object.history_tol[Row] = 0
	END IF
	IF ( is_Reading_Typed_In_Dropdown <> data ) THEN
		li_Return = This.GetChild(dwo.Name, ldwcTemp)
		IF ( li_Return = 1 ) THEN
			is_Reading_Typed_In_Dropdown = data
			ll_Num_Rows = ldwcTemp.RowCount()
			ls_Search = "POS(reading, '" + UPPER(data) + "', 1) = 1"
			ll_Row = ldwcTemp.Find(ls_Search, 1, ll_Num_Rows + 1)
			IF ( ll_Row > 0 ) THEN
				ls_Item_Found = ldwcTemp.GetItemString(ll_Row, 'reading')
				ldt_now = DateTime(Today(), Now())
//				This.Object.history_rd[row] = ls_Item_Found
//				This.Object.history_cdt[row] = ldt_now
//				This.Object.history_user_id[row] = guo_user.ID
				This.EVENT ue_Update_Reading(row, ls_Item_Found, ldt_now, guo_user.ID)
				This.SelectText(LEN(data) + 1, LEN(ls_Item_Found) - LEN(data) + 1)
			END IF
		END IF
	END IF
END IF
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//string ls_Column
//string ls_Message
//
//ls_Column = dwo.Name
//CHOOSE CASE ls_Column
//	CASE 'history_rd'
//Beep(1)
//		This.SetFocus()
//		This.SetColumn('history_rd')
////		This.Post Event Focus()
//	CASE 'p_long_instructions', 'p_alerts', 'p_notes', 'p_documents'
//	CASE ELSE
//		This.Post Event Focus()
//END CHOOSE

string ls_MB_String
boolean lb_Use_Num_Pad
integer li_Tab
string ls_Column
string ls_Message
string ls_Equip_Operator_Id
string ls_Long_Instructions
string ls_Expression
string ls_Inequality

ls_Column = dwo.Name

CHOOSE CASE ls_Column
	CASE 'history_rd', 'history_rd_t'
//		This.EVENT ue_Display_NumPad(row)
		IF Empty(This.Object.station_erd[row]) THEN
//			string ls_Reading
//			//[NPTS]
//			lb_Use_Num_Pad = TRUE
//			ls_Reading = This.Object.history_rd[row]
//			IF Empty(TRIM(ls_Reading)) THEN
//				ls_Reading = ''
//			END IF
//			IF ( IsNumber(ls_Reading) OR ( ls_Reading = '' ) ) AND lb_Use_Num_Pad THEN
//				OpenWithParm(w_num_pad, ls_Reading)
//				ls_Reading = Message.StringParm
//				Message.StringParm = ''
//				// Empty string = no change
//				IF ( TRIM(ls_Reading) <> '' ) THEN
//					This.EVENT ue_Update_Reading(row, ls_Reading, DateTime(Today(), Now()), guo_user.ID)
//				END IF
//			END IF
		ELSE
//			MessageBox("Calculated Reading", 'Rd: ' + String(This.Object.history_rd[row]) + '~n~rRd Exp: ' + String(This.Object.station_erd[row]))
			ls_Expression = String(This.Object.station_erd[row])
			ls_MB_String = f_LanguageString('RD_###_RD_EXP_$$$', 'Rd ### Rd Exp $$$')
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.history_rd[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Expression)
			::ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('CALCULATED_READING', "Calculated Reading"), ls_MB_String)
		END IF
////		This.EVENT ue_Navigate_To_Row(1, 'rbuttondown')

		Beep(1)
		This.SetFocus()
		This.SetColumn('history_rd')
		return
		
	CASE 'p_long_instructions'
		ls_Long_Instructions = String(This.Object.station_instr[row])
		IF NOT Empty(ls_Long_Instructions) THEN
			ls_Message = 'Long Instructions|' + ls_Long_Instructions
			OpenWithParm(w_detail, ls_Message)
		END IF
		return
		
	CASE 'p_alerts'
		li_Tab = 3
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_instructions.st_station_description_instructions.Post SetFocus()
		return
		
	CASE 'p_notes'
		li_Tab = 4
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_notes.mle_note_1.Post SetFocus()
		return
		
	CASE 'p_multi'
		li_Tab = 6
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_multi.st_station_description_multi.Post SetFocus()
	CASE 'p_documents'
		li_Tab = 7
		tab_tour.SelectedTab = li_Tab
//		// Below is necessary because when AUTOSIP is set the SIP does odd things sometimes
//		tab_tour.Post EVENT SelectionChanged(li_Tab, li_Tab)
//		tab_tour.tabpage_documents.st_station_description_docs.Post SetFocus()
		return
		
	CASE 'compute_min', 'station_minimum_t'
//	CASE 'compute_min_display'
		IF NOT Empty(String(This.Object.compute_min[row])) THEN
			IF ( This.Object.station_greater_than[row] = 1 ) THEN
				ls_Inequality = "> "
			ELSE
				ls_Inequality = ">= "
			END IF
		ELSE
			ls_Inequality = ""
		END IF
		IF NOT Empty(This.Object.station_emin[row]) THEN
			ls_Expression = String(This.Object.station_emin[row])
//			MessageBox("Minimum", 'Min: ' + ls_Inequality + String(This.Object.compute_min[row]) + '~n~rMin Exp: ' + ls_Expression)
			ls_MB_String = f_LanguageString('MIN_$$$_###_MIN_EXP_@@@', 'Min $$$ ### Min Exp @@@')
			ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_min[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '@@@', ls_Expression)
			::ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('MINIMUM', "Minimum"), ls_MB_String)
		ELSE
			IF NOT Empty(This.Object.compute_min[row]) THEN
//				MessageBox("Minimum", 'Min: ' + ls_Inequality + String(This.Object.compute_min[row]))
				ls_MB_String = f_LanguageString('MIN_$$$_###', 'Min $$$ ###')
				ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
				ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_min[row]))
				MessageBox(f_LanguageString('MINIMUM', "Minimum"), ls_MB_String)
			END IF
		END IF
	CASE 'compute_max', 'station_maximum_t'
//	CASE 'compute_max_display'
		IF NOT Empty(String(This.Object.compute_max[row])) THEN
			IF ( This.Object.station_less_than[row] = 1 ) THEN
				ls_Inequality = "< "
			ELSE
				ls_Inequality = "<= "
			END IF
		ELSE
			ls_Inequality = ""
		END IF
		IF NOT Empty(This.Object.station_emax[row]) THEN
			ls_Expression = String(This.Object.station_emax[row])
//			MessageBox("Maximum", 'Max: ' + ls_Inequality + String(This.Object.compute_max[row]) + '~n~rMax Exp: ' + ls_Expression)
			ls_MB_String = f_LanguageString('MAX_$$$_###_MAX_EXP_@@@', 'Max $$$ ### Max Exp @@@')
			ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_max[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '@@@', ls_Expression)
			::ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('MAXIMUM', "Maximum"), ls_MB_String)
		ELSE
			IF NOT Empty(This.Object.compute_max[row]) THEN
//				MessageBox("Maximum", 'Max: ' + ls_Inequality + String(This.Object.compute_max[row]))
				ls_MB_String = f_LanguageString('MAX_$$$_###', 'Max $$$ ###')
				ls_MB_String = StrTran(ls_MB_String, '$$$', ls_Inequality)
				ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.compute_max[row]))
				MessageBox(f_LanguageString('MAXIMUM', "Maximum"), ls_MB_String)
			END IF
		END IF
	CASE 'compute_tol', 'station_tolerance_t'
//	CASE 'compute_tol_display'
		IF NOT Empty(This.Object.station_etol[row]) THEN
//			MessageBox("Tolerance", 'Tol: ' + String(This.Object.compute_tol[row]) + '~n~rTol Exp: ' + String(This.Object.station_etol[row]) + '~n~rTol Recs: ' + String(This.Object.station_tol_sta[row]))
			ls_MB_String = f_LanguageString('TOL_@@@_TOL_EXP_$$$_TOL_RECS_###', 'Tol @@@ Tol Exp $$$ Tol Recs ###')
			ls_MB_String = StrTran(ls_MB_String, '@@@', String(This.Object.compute_tol[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.station_etol[row]) + '~n~r')
			ls_MB_String = StrTran(ls_MB_String, '$$$', String(This.Object.station_tol_sta[row]))
			ClipBoard(ls_Expression)
			MessageBox(f_LanguageString('TOLERANCE', "Tolerance"), ls_MB_String)
		ELSE
			IF NOT Empty(This.Object.station_tol_sta[row]) THEN
//				MessageBox("Tolerance", 'Tol: ' + String(This.Object.compute_tol[row]) + '~n~rTol Recs: ' + String(This.Object.station_tol_sta[row]))
				ls_MB_String = f_LanguageString('TOL_$$$_TOL_RECS_###', 'Tol $$$ Tol Recs ###')
				ls_MB_String = StrTran(ls_MB_String, '$$$', String(This.Object.compute_tol[row]) + '~n~r')
				ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.station_tol_sta[row]))
				MessageBox(f_LanguageString('TOLERANCE', "Tolerance"), ls_MB_String)
			END IF
		END IF
	CASE 'seq_seq', 'sta_sta'
//	CASE 'compute_seq', 'compute_sta'
		IF NOT Empty(This.Object.station_eapp[row]) THEN
//			MessageBox("Applicability Expression", 'App Exp: ' + String(This.Object.station_eapp[row]))
			ls_MB_String = f_LanguageString('APP_EXP_###', 'App Exp ###')
			ls_MB_String = StrTran(ls_MB_String, '###', String(This.Object.station_eapp[row]))
			MessageBox(f_LanguageString('APPLICABILITY_EXPRESSION', "App Exp"), ls_MB_String)
		END IF
	CASE 'station_units'
//	CASE 'compute_station_units'
//		MessageBox("Units", String(This.Object.station_units[row]))
		MessageBox(f_LanguageString('UNITS', "Units"), String(This.Object.station_units[row]))
	CASE 'station_description'
//	CASE 'compute_station_description'
//		MessageBox("Record Description", String(This.Object.station_description[row]))
		MessageBox(f_LanguageString('RECORD_DESCRIPTION', "Record Description"), String(This.Object.station_description[row]))
	CASE 'station_location'
//	CASE 'compute_station_location'
//		MessageBox("Record Location", String(This.Object.station_location[row]))
		MessageBox(f_LanguageString('RECORD_LOCATION', "Record Location"), String(This.Object.station_location[row]))
	CASE 'station_equip_operator_id'
//	CASE 'compute_station_equip_operator_id'
		ls_Equip_Operator_Id = String(This.Object.station_equip_operator_id[row])
		IF NOT Empty(ls_Equip_Operator_Id) THEN
			ls_Message = 'Equipment Detail|' + ls_Equip_Operator_Id
//			ls_Message = 'Equipment Detail|' + f_Get_Equipment_Detail(ls_Equip_Operator_Id)
			OpenWithParm(w_detail, ls_Message)
		END IF
	CASE 'tour_name_t'
		ls_Message = 'Tour Detail|' //+ f_Get_Tour_Detail(gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].rev_no)
		OpenWithParm(w_detail, ls_Message)
	CASE 'station_misc'
//		MessageBox("Short Instructions", String(This.Object.station_misc[row]))
		MessageBox(f_LanguageString('SHORT_INSTRUCTIONS', "Short Instructions"), String(This.Object.station_misc[row]))
	CASE 'datawindow'
	CASE ELSE
//		IF ( RIGHT(ls_Column, 2) <> '_t' ) THEN
//			MessageBox(This.Describe("'" + ls_Column + '_t' + "'.Text"), This.GetItemString(row, ls_Column))
//		END IF
END CHOOSE

This.Post Event Focus()

/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

event rowfocuschanged;//[NPTS]
string ls_MB_String
string ls_history_rd
long ll_Num_Rows
integer li_Return
string ls_Mask
string ls_MaskDataType
string ls_Error
string ls_Find
string ls_Text
long ll_Row
boolean lb_Calculated

This.SetRedraw(FALSE)
IF ( currentrow > 0 ) THEN
	ls_Mask = This.GetItemString(currentrow, 'station_mask')
	ib_Edit_Mask = NOT Empty(ls_Mask)
	em_1.Visible = ib_Edit_Mask
	IF ib_Edit_Mask THEN
		ls_MaskDataType = This.GetItemString(currentrow, 'station_maskdatatype')
		CHOOSE CASE UPPER(ls_MaskDataType)
			CASE 'DATE'
				em_1.SetMask(DateMask!, ls_Mask)
			CASE 'DATETIME'
				em_1.SetMask(DateTimeMask!, ls_Mask)
			CASE 'DECIMAL'
				em_1.SetMask(DecimalMask!, ls_Mask)
			CASE 'NUMERIC'
				em_1.SetMask(NumericMask!, ls_Mask)
			CASE 'STRING'
				em_1.SetMask(StringMask!, ls_Mask)
			CASE 'TIME'
				em_1.SetMask(TimeMask!, ls_Mask)
			CASE ELSE
				em_1.Visible = FALSE
				IF Empty(ls_MaskDataType) THEN
					ls_MaskDataType = ''
				END IF
//				MessageBox('Error', 'Unrecognized MaskDataType of "' + ls_MaskDataType + '"')
				ls_MB_String = f_LanguageString('UNRECOGNIZED_MASKDATATYPE_OF_###', 'Unrecognized MaskDataType of ###')
				ls_MB_String = StrTran(ls_MB_String, '###', ls_MaskDataType)
				MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
		END CHOOSE
		em_1.SelectText(1, 0)
	END IF
	ls_history_rd = This.GetItemString(currentrow, 'history_rd')
	IF ib_Edit_Mask THEN
		IF NOT Empty(ls_history_rd) THEN
			IF ( UPPER(ls_MaskDataType) = 'STRING' ) THEN
				ls_Text = f_UnMask(ls_history_rd, ls_Mask, ls_MaskDataType)
			ELSE
				ls_Text = ls_history_rd
			END IF
			em_1.Text = ls_Text
		END IF
	ELSE
//		datawindowchild dwchild
//		li_Return = This.GetChild('history_rd', dwchild)
//		IF NOT Empty(This.GetItemString(currentrow, 'station_erd')) THEN
//			ls_Error = This.Modify("history_rd.dddw.AllowEdit=No")
//		ELSE
//			IF ( This.GetItemNumber(currentrow, 'station_validated') = 1 ) THEN
//				ls_Error = This.Modify("history_rd.dddw.AllowEdit=No")
//			ELSE
//				ls_Error = This.Modify("history_rd.dddw.AllowEdit=Yes")
//			END IF
//			li_Return = dwchild.RowCount()
//			string ls_Sta
//			ls_Sta = String(This.GetItemNumber(currentrow, 'station_sta'))
//			li_Return = dwchild.SetFilter("sta = " + ls_Sta)
//			li_Return = dwchild.Filter()
//			li_Return = dwchild.RowCount()
//		END IF
	END IF
	il_Current_Row_For_Update_TabPages = currentrow
	This.Event ue_Post_Retrieve()
	
	// this prevents the dropdown from keeping focus and preventing the 
	// navigation keys from working
	This.Event Focus()

	tab_tour.tabpage_stations.dw_stations.SetRedraw(FALSE)
	tab_tour.tabpage_stations.dw_stations.SelectRow(0, FALSE)
	tab_tour.tabpage_stations.dw_stations.ScrollToRow(currentrow)
	tab_tour.tabpage_stations.dw_stations.SelectRow(currentrow, TRUE)
	tab_tour.tabpage_stations.dw_stations.SetRedraw(TRUE)

	il_Multi_Reading_Allowed = This.GetItemNumber(currentrow, 'station_multi_reading_allowed')

	// Added 12-13-2004 in order to update the OOS/OOT visual indications
	// if they are based on expressions
	boolean lb_Expressions

	lb_Expressions = ( NOT Empty(ls_history_rd) ) &
		AND ( ( NOT Empty(This.GetItemString(currentrow, 'station_emin')) ) &
		OR ( NOT Empty(This.GetItemString(currentrow, 'station_emax')) ) &
		OR ( NOT Empty(This.GetItemString(currentrow, 'station_etol')) ) )
	IF lb_Expressions THEN // emin, emax or etol not null
		li_Return = This.EVENT ue_Show_Warnings(currentrow, FALSE, TRUE, TRUE)
	END IF

//	This.Post EVENT ue_LANDCyclops(currentrow)
	This.SetRedraw(TRUE)
	This.EVENT ue_Update_Tabpages()
END IF

//long ll_Num_Rows
//integer li_Return
//string ls_Mask
//string ls_MaskDataType
//string ls_Error
//string ls_Find
//string ls_Text
//long ll_Row
//boolean lb_Calculated
//
//This.SetRedraw(FALSE)
//IF ( currentrow > 0 ) THEN
//	ls_Mask = This.Object.station_mask[currentrow]
//	ib_Edit_Mask = NOT Empty(ls_Mask)
//	em_1.Visible = ib_Edit_Mask
//	IF ib_Edit_Mask THEN
//		ls_MaskDataType = This.Object.station_maskdatatype[currentrow]
//		CHOOSE CASE UPPER(ls_MaskDataType)
//			CASE 'DATE'
//				em_1.SetMask(DateMask!, ls_Mask)
//			CASE 'DATETIME'
//				em_1.SetMask(DateTimeMask!, ls_Mask)
//			CASE 'DECIMAL'
//				em_1.SetMask(DecimalMask!, ls_Mask)
//			CASE 'NUMERIC'
//				em_1.SetMask(NumericMask!, ls_Mask)
//			CASE 'STRING'
//				em_1.SetMask(StringMask!, ls_Mask)
//			CASE 'TIME'
//				em_1.SetMask(TimeMask!, ls_Mask)
//			CASE ELSE
//				em_1.Visible = FALSE
//				IF Empty(ls_MaskDataType) THEN
//					ls_MaskDataType = ''
//				END IF
//				MessageBox('Error', 'Unrecognized MaskDataType of "' + ls_MaskDataType + '"')
//		END CHOOSE
//		em_1.SelectText(1, 0)
//	END IF
//	
//	//IF NOT ib_Filtering THEN
////		IF NOT ISNULL(currentrow) THEN
//			IF ib_Edit_Mask THEN
//				IF NOT Empty(This.Object.history_rd[currentrow]) THEN
//					IF ( UPPER(ls_MaskDataType) = 'STRING' ) THEN
//						ls_Text = f_UnMask(This.Object.history_rd[currentrow], ls_Mask)
//					ELSE
//						ls_Text = This.Object.history_rd[currentrow]
//					END IF
//					em_1.Text = ls_Text
//				END IF
//			ELSE
//	//			lb_Calculated = This.EVENT ue_Evaluate_Reading(currentrow, TRUE, TRUE)
//	//			IF lb_Calculated THEN
//	//				This.Object.history_rd_t.Text = 'Calculated Reading'
//	//			ELSE
//	//				This.Object.history_rd_t.Text = 'Current Reading'
//	//			END IF
//	//			IF f_Check_If_Reading_Changed(currentrow) THEN
//	//				This.EVENT ue_Update_Row_2(currentrow)
//	//				This.Event ue_Show_Warnings(CurrentRow, TRUE, TRUE)
//	//			END IF
//			END IF
//			il_Current_Row_For_Update_TabPages = currentrow
////			This.Event ue_Update_Tabpages()
////			This.PostEvent('ue_Update_Tabpages')
//			This.Event ue_Post_Retrieve()
//	
//			// this prevents the dropdown from keeping focus and preventing the 
//			// navigation keys from working
//			This.Event Focus()
//	
////[NPTS]
////			tab_tour.tabpage_stations.dw_stations.SetRedraw(FALSE)
////			tab_tour.tabpage_stations.dw_stations.SelectRow(0, FALSE)
////			tab_tour.tabpage_stations.dw_stations.ScrollToRow(currentrow)
////			tab_tour.tabpage_stations.dw_stations.SelectRow(currentrow, TRUE)
////			tab_tour.tabpage_stations.dw_stations.SetRedraw(TRUE)
//			il_Multi_Reading_Allowed = This.Object.station_multi_reading_allowed[currentrow]
//			// Added 12-13-2004 in order to update the OOS/OOT visual indications
//			// if they are based on expressions
//			boolean lb_Expressions
//			lb_Expressions = ( NOT Empty(This.Object.history_rd[currentrow]) ) AND ( ( NOT Empty(This.Object.station_emin[currentrow]) ) OR ( NOT Empty(This.Object.station_emax[currentrow]) ) OR ( NOT Empty(This.Object.station_etol[currentrow]) ) )
//			IF lb_Expressions THEN // emin, emax or etol not null
//				li_Return = This.EVENT ue_Show_Warnings(currentrow, FALSE, TRUE, TRUE)
//			END IF
////		END IF
//	//END IF
//	This.Post EVENT ue_LANDCyclops(currentrow)
//	This.SetRedraw(TRUE)
//	This.EVENT ue_Update_Tabpages()
//END IF
end event

event rowfocuschanging;//integer li_Return
//long ll_Count
//long ll_Num_Rows
//boolean lb_Applicable
//boolean lb_Hidden
//boolean lb_Modified
//pointer oldpointer
//
////This.SetRedraw(FALSE)
////TRY
//ii_Previous_Station = currentrow
//	IF ( CurrentRow > 0 ) AND ( CurrentRow <= This.RowCount() ) AND ( This.RowCount() > 0 ) THEN
//		gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[Currentrow]
//		
//		IF ( tab_tour.SelectedTab = 4 ) THEN
//			This.Object.history_notes[currentrow] = TRIM(tab_tour.tabpage_notes.mle_note_1.Text)
//		END IF
//			
////		This.AcceptText()
//		lb_Hidden = ( This.Object.station_hidden[newrow] = 1 )
//		IF lb_Hidden THEN
////			This.EVENT ue_Evaluate_Reading(newrow, FALSE)
////			This.EVENT ue_Update_Row_2(newrow)
//			li_Return = 0
//		ELSE
//			lb_Modified = f_Check_If_Reading_Changed(currentrow)
//			IF lb_Modified THEN
//				li_Return = This.EVENT ue_Show_Warnings(CurrentRow, TRUE, TRUE)
//			ELSE
//				li_Return = 0
//			END IF
//		END IF
//		IF ( li_Return = 2 ) THEN
//			This.PostEvent('ue_Post_Retrieve')
//			RETURN 1
//		ELSE
//			This.EVENT ue_Update_Row_2(currentrow)
//			IF ( li_Return = 1 ) AND ib_Auto_Display_Notes_On_OOS THEN
//				tab_tour.SelectedTab = 4
//				RETURN 1
//			ELSE
//				// Check applicability of the next row
//				gsu_tour_parameters[gi_Current_Tour].station = This.Object.history_sta[newrow]
//				lb_Hidden = ( This.Object.station_hidden[newrow] = 1 ) AND NOT f_Display_Hidden_Records()
//				lb_Applicable = This.EVENT ue_Evaluate_Applicability(newrow, TRUE)
//				IF NOT lb_Applicable OR lb_Hidden THEN
//					// Check if the first or last rows are not applicable 
//					// in order to navigate back to the last known applicable
//					// station
////					ib_Been_Here_RowFocusChanging = TRUE
//					IF ( newrow = This.RowCount() ) OR ( newrow = 1 ) THEN
//						ib_Been_Here_RowFocusChanging = TRUE
//						IF ( newrow = 1 ) THEN
//							MessageBox('First Station', 'This is the first applicable station')
//						ELSEIF ( newrow = This.RowCount() ) THEN
//							MessageBox('Last Station', 'This is the last applicable station')
//						END IF
//						il_Row_For_Navigate_To_Row_PostEvent = gl_Last_Applicable_Station
//						This.PostEvent("ue_Navigate_To_Row", 0, gl_Last_Applicable_Station)
//						gsu_tour_parameters[gi_Current_Tour].station = gl_Last_Applicable_Station
//					ELSE
//						// Skip over the current non-applicable station
//						// depending on the direction being navigated
//	
//						IF ( currentRow < newRow ) THEN 		// Next
//							ll_Num_Rows = This.RowCount()
//							FOR ll_Count = newrow TO ll_Num_Rows
//								// check applicability columns
//								lb_Hidden = ( This.Object.station_hidden[ll_Count] = 1 ) AND NOT f_Display_Hidden_Records()
//								lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE)
//								IF lb_Hidden THEN
//									This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
//									This.EVENT ue_Update_Row_2(ll_Count)
//								END IF
//								IF lb_Applicable AND NOT lb_Hidden THEN
////									IF ib_Been_Here_RowFocusChanging THEN
////										MessageBox('Last Station', 'This is the last applicable station')
////									END IF
////									IF ( This.Event Scan(ll_Count) = 1 ) THEN
////										This.SetRow(ll_Count)
////										EXIT
////									ELSE
////										RETURN 0
////									END IF
//								END IF
//							NEXT
//	//						This.SetRow(newrow + 1)
//						ELSEIF ( currentRow > newRow ) THEN	// Prior
//							ll_Num_Rows = This.RowCount()
//							FOR ll_Count = newrow TO 1 Step -1
//								// check applicability columns
//								lb_Hidden = ( This.Object.station_hidden[ll_Count] = 1 ) AND NOT f_Display_Hidden_Records()
//								lb_Applicable = This.EVENT ue_Evaluate_Applicability(ll_Count, TRUE)
//								IF lb_Hidden THEN
//									This.EVENT ue_Evaluate_Reading(ll_Count, FALSE, TRUE)
//									This.EVENT ue_Update_Row_2(ll_Count)
//								END IF
//								IF lb_Applicable AND NOT lb_Hidden THEN
////									IF ib_Been_Here_RowFocusChanging THEN
////										MessageBox('c First Station', 'This is the first applicable station')
////									END IF
////									IF ( This.Event Scan(ll_Count) = 1 ) THEN
////										This.SetRow(ll_Count)
////										EXIT
////									ELSE
////										RETURN 0
////									END IF
//								END IF
//							NEXT
//	//						This.SetRow(newrow - 1)
//						END IF
//					END IF
//					RETURN 1
//				ELSE
//					IF ib_Been_Here_RowFocusChanging THEN
////						IF ( newrow = This.RowCount() ) OR ( newrow = 1 ) THEN
//							IF ( newrow = 1 ) THEN
//								MessageBox('b First Station', 'This is the first applicable station')
//							ELSEIF ( newrow = This.RowCount() ) THEN
//								MessageBox('Last Station', 'This is the last applicable station')
//							END IF
////						END IF
//					END IF
//					ib_Been_Here_RowFocusChanging = FALSE
//				END IF
//		//		This.PostEvent('ue_Post_Retrieve')
//				// this prevents the dropdown fromkeeping focus and preventing the 
//				// navigation keys from working
//				tab_tour.tabpage_readings.SetFocus()
//			END IF
//		END IF
//	ELSE
////		This.PostEvent('ue_Retrieve_Current_Tour')
//		RETURN 1
//	END IF
////CATCH (runtimeerror er)
////	This.PostEvent('ue_Retrieve_Current_Tour')
////	RETURN 1
////END TRY
end event

event itemchanged;datetime ldt_now

IF ( dwo.name = 'history_notes' ) OR ( dwo.name = 'history_rd' ) THEN
	ldt_now = Datetime(Today(), Now())
	This.Object.history_cdt[row] = ldt_now
	This.Object.history_user_id[row] = guo_user.ID
END IF
	
//string ls_Temp
//
//IF ( dwo.name = 'history_notes' ) THEN
//	ls_Temp = This.GetItemString(Row, 'history_notes')
//	IF NOT Empty(ls_Temp) THEN
//		This.Object.history_cdt[row] = DateTime(Today(), Now())
//		This.Object.history_user_id[row] = guo_user.ID
//	END IF
//ELSEIF ( dwo.name = 'history_rd' ) THEN
//	ls_Temp = This.GetItemString(Row, 'history_rd')
//	IF NOT Empty(ls_Temp) THEN
//		This.Object.history_cdt[row] = DateTime(Today(), Now())
//		This.Object.history_user_id[row] = guo_user.ID
//	END IF
//END IF
end event

event itemfocuschanged;//[NPTS]
//string ls_Error
//integer li_Return
//long ll_Num_Rows
//datawindowchild dwchild
//
////IF ( This.GetChild('history_rd', dwchild) = 1 ) THEN
////	dwchild.Reset()
////END IF
//CHOOSE CASE dwo.name
//	CASE 'history_rd'
//		IF ( row > 0 ) THEN
//			IF NOT Empty(This.GetItemString(row, 'station_erd')) THEN
//				ls_Error = This.Modify("history_rd.dddw.AllowEdit=No")
//			ELSE
//				IF ( This.GetItemNumber(row, 'station_validated') = 1 ) THEN
//					ls_Error = This.Modify("history_rd.dddw.AllowEdit=No")
//				ELSE
//					ls_Error = This.Modify("history_rd.dddw.AllowEdit=Yes")
//				END IF
////[NPTS]
////				li_Return = This.GetChild('history_rd', dwchild)
////				// Set the transaction object for the child
////				li_Return = dwchild.SetTransObject(SQLCA)
////				// Populate
////				integer li_Tour
////				integer li_Rev
////				integer li_Sta
////				
////				li_Tour = gsu_tour_parameters[gi_Current_Tour].Tour_Number
////				li_Rev = gsu_tour_parameters[gi_Current_Tour].rev_no
////				li_Sta = This.GetItemNumber(row, 'station_sta')
////[NPTS] - moved below to rowfocuschanged
////li_Return = dwchild.RowCount()
////string ls_Sta
////ls_Sta = String(This.GetItemNumber(row, 'station_sta'))
////li_Return = dwchild.SetFilter("sta = " + ls_Sta)
////li_Return = dwchild.Filter()
////li_Return = dwchild.RowCount()
////				ll_Num_Rows = dwchild.Retrieve(li_Tour, li_Rev, li_Sta)
//			END IF
//		END IF
//	CASE ELSE
//END CHOOSE
//	

string ls_Error
integer li_Return
long ll_Num_Rows
datawindowchild dwchild

IF ( This.GetChild('history_rd', dwchild) = 1 ) THEN
	dwchild.Reset()
END IF
CHOOSE CASE dwo.name
	CASE 'history_rd'
		IF ( This.Object.station_validated[row] = 1 ) OR NOT Empty(This.GetItemString(row, 'station_erd')) THEN
			ls_Error = This.Modify("history_rd.dddw.AllowEdit=No")
		ELSE
			ls_Error = This.Modify("history_rd.dddw.AllowEdit=Yes")
			ls_Error = This.Modify("history_rd.dddw.AutoHScroll=Yes")
		END IF
		li_Return = This.GetChild('history_rd', dwchild)
		// Set the transaction object for the child
		li_Return = dwchild.SetTransObject(SQLCA)
		// Populate
		integer li_Tour
		integer li_Rev
		integer li_Sta
		
		li_Tour = gsu_tour_parameters[gi_Current_Tour].Tour_Number
		li_Rev = gsu_tour_parameters[gi_Current_Tour].rev_no
		li_Sta = This.Object.station_sta[row]
		ll_Num_Rows = dwchild.Retrieve(li_Tour, li_Rev, li_Sta)
//		dwChild.InsertRow(1)
	CASE ELSE
END CHOOSE

//li_Return = This.GetChild('history_rd', dwchild)
//// Set the transaction object for the child
//li_Return = dwchild.SetTransObject(SQLCA)
//// Populate
//integer li_Tour
//integer li_Rev
//integer li_Sta
//
//li_Tour = gsu_tour_parameters[gi_Current_Tour].Tour_Number
//li_Rev = gsu_tour_parameters[gi_Current_Tour].rev_no
//li_Sta = gsu_tour_parameters[gi_Current_Tour].Station
//ll_Num_Rows = dwchild.Retrieve(li_Tour, li_Rev, li_Sta)
//dwChild.InsertRow(1)
//	
end event

event other;//[NPTS]
CHOOSE CASE wparam
	CASE 8, 32 TO 127
		datetime ldt_now
		string ls_Modified_Reading
		string ls_Previous_Reading
		string ls_Reading
		boolean lb_Computed
		character ls_Char
		long ll_Row

		ll_Row = This.GetRow()
		lb_Computed = NOT Empty(This.Object.station_erd[ll_Row])
		IF NOT lb_Computed THEN
			IF ( This.Object.station_validated[This.GetRow()] <> 1 ) THEN
				IF NOT ib_Been_Here THEN
					ls_Reading = This.Object.history_rd[ll_Row]
					IF Empty(ls_Reading) THEN
						ls_Reading = ''
					END IF
					IF ( wparam = 8 ) THEN
						ls_Reading = LEFT(ls_Reading, LEN(ls_Reading) - 1)
					ELSE
						ls_Reading = ls_Reading + f_Convert_To_Char(wparam)
					END IF
					ldt_now = Datetime(Today(), Now())
//					This.Object.history_cdt[ll_Row] = ldt_now
//					This.Object.history_user_id[ll_Row] = guo_user.ID
					This.EVENT ue_Update_Reading(ll_Row, ls_Reading, ldt_now, guo_user.ID)
					This.PostEvent('ue_Focus_On_Reading')
					ib_Been_Here = TRUE
				ELSE
					ib_Been_Here = FALSE
				END IF
			END IF
		END IF
END CHOOSE

end event

event itemerror;MessageBox('1', '1')
end event

type p_2 from picture within tabpage_readings
integer x = 201
integer y = 1312
integer width = 146
integer height = 128
boolean bringtotop = true
boolean originalsize = true
string picturename = "Bitmaps\calculator.jpg"
boolean focusrectangle = false
end type

event clicked;string ls_PictureName

ls_PictureName = This.PictureName

IF ( ls_PictureName = 'bitmaps\calculator.jpg' ) THEN
	dw_readings.EVENT ue_Display_Numpad(dw_readings.GetRow())
//ELSEIF ( ls_PictureName = 'Custom078!' ) THEN
//	string ls_Command
//	ls_Command = MID(dw_readings.GetItemString(dw_readings.GetRow(), 'station_Scan'), 9)
//	OpenWithParm(w_iqmeter, ls_Command)
//ELSE
////	dw_readings.EVENT ue_LANDCyclops(dw_readings.GetRow())
//	Open(w_landcyclops)
END IF
end event

type p_3 from picture within tabpage_readings
integer x = 503
integer y = 1312
integer width = 146
integer height = 128
boolean bringtotop = true
boolean originalsize = true
string picturename = "Bitmaps\previous.jpg"
boolean focusrectangle = false
end type

event clicked;dw_readings.EVENT ue_Navigate_To_Row(-1, 'pb_previous')
end event

type p_4 from picture within tabpage_readings
integer x = 823
integer y = 1308
integer width = 146
integer height = 128
boolean bringtotop = true
boolean originalsize = true
string picturename = "Bitmaps\next.jpg"
boolean focusrectangle = false
end type

event clicked;dw_readings.EVENT ue_Navigate_To_Row(1, 'pb_next')
end event

type p_5 from picture within tabpage_readings
integer x = 1129
integer y = 1308
integer width = 146
integer height = 128
boolean bringtotop = true
boolean originalsize = true
string picturename = "Bitmaps\update.jpg"
boolean focusrectangle = false
end type

event clicked;//string ls_Reading
//
tab_tour.tabpage_readings.dw_readings.AcceptText()
//ls_Reading = String(tab_tour.tabpage_readings.dw_readings.GetItemString(tab_tour.tabpage_readings.dw_readings.GetRow(), 'history_rd'))
//Messagebox('', ls_Reading)

dw_readings.EVENT ue_Enter_Button()
end event

type tabpage_stations from userobject within tab_tour
integer x = 18
integer y = 104
integer width = 1431
integer height = 1580
long backcolor = 32567268
string text = "List"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
st_station_description_list st_station_description_list
st_list st_list
dw_stations dw_stations
p_1 p_1
end type

on tabpage_stations.create
this.st_station_description_list=create st_station_description_list
this.st_list=create st_list
this.dw_stations=create dw_stations
this.p_1=create p_1
this.Control[]={this.st_station_description_list,&
this.st_list,&
this.dw_stations,&
this.p_1}
end on

on tabpage_stations.destroy
destroy(this.st_station_description_list)
destroy(this.st_list)
destroy(this.dw_stations)
destroy(this.p_1)
end on

type st_station_description_list from statictext within tabpage_stations
integer x = 23
integer y = 72
integer width = 1262
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 32567268
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
end type

event rbuttondown;long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))

end event

event getfocus;
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////

end event

type st_list from statictext within tabpage_stations
integer x = 23
integer width = 1024
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "List View"
boolean focusrectangle = false
end type

type dw_stations from datawindow within tabpage_stations
event pause ( )
event ue_evaluate ( )
event ue_sort_dw ( string ls_search,  string ls_sub_sort,  integer li_column,  string as_current_order )
string tag = "804"
integer y = 152
integer width = 1454
integer height = 1280
integer taborder = 30
string title = "none"
string dataobject = "d_station"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event pause();Sleep(1)
end event

event ue_evaluate();MessageBox('NOT USED', This.ClassName() + ' - ue_evaluate()')
//long ll_FirstRowOnPage
//long ll_LastRowOnPage
//long ll_Row
//boolean lb_Perform_Recalc
//integer li_Return
//pointer l_pointer
//
////BEEP(1)
//Timer(0, w_tour)
//IF ( il_FirstRowOnPage > 0 ) THEN
//	ll_FirstRowOnPage = Long(This.Object.Datawindow.FirstRowOnPage)
//	ll_LastRowOnPage = Long(This.Object.Datawindow.LastRowOnPage)
//	IF ( ll_FirstRowOnPage <> il_FirstRowOnPage ) THEN
//		// Perform subsequent re-calc of displayed rows
//		lb_Perform_Recalc = TRUE
//	ELSE
//		// Do nothing because the datawindow has not scrolled
//	END IF
//	il_FirstRowOnPage = ll_FirstRowOnPage
//	il_LastRowOnPage = ll_LastRowOnPage
//ELSE
//	il_FirstRowOnPage = Long(This.Object.Datawindow.FirstRowOnPage)
//	il_LastRowOnPage = Long(This.Object.Datawindow.LastRowOnPage)
//	ll_FirstRowOnPage = il_FirstRowOnPage
//	ll_LastRowOnPage = il_LastRowOnPage
//	// Perform first re-calc of displayed rows
//	lb_Perform_Recalc = TRUE
//END IF
//
//IF lb_Perform_Recalc THEN
//	l_pointer = SetPointer(HourGlass!)
//	FOR ll_Row = ll_FirstRowOnPage TO ll_LastRowOnPage
//		// check applicability columns
//		IF tab_tour.tabpage_readings.dw_readings.EVENT ue_Evaluate_Applicability(ll_Row, FALSE) THEN
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Evaluate_Reading(ll_Row, FALSE, TRUE)
//			// Update the reading from an expression
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(ll_Row)
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Show_Warnings_For_Close(ll_Row)
//			// Update the OOS and OOT conditions
//			tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Row_2(ll_Row)
//		END IF
//	NEXT
//	li_Return = tab_tour.tabpage_readings.dw_readings.Update()
//	IF ( li_Return = 1 ) THEN
//		COMMIT ;
//	ELSE
//		ROLLBACK ;
//	END IF
//	SetPointer(l_pointer)
//END IF
//Timer(5, w_tour)
//
end event

event ue_sort_dw(string ls_search, string ls_sub_sort, integer li_column, string as_current_order);string ls_Current_Sort
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

ls_New_Order = ' A'
ls_Order_Direction = "ˆ"

ls_Header_Text[1] = f_DW_Language_Call_2("Seq")
ls_Header_Text[2] = f_DW_Language_Call_2("Rec")
ls_Header_Text[3] = f_DW_Language_Call_2("Reading")
ls_Header_Text[4] = f_DW_Language_Call_2("Description")
ls_Header_Text[5] = f_DW_Language_Call_2("Equipment")
ls_Header_Text[6] = f_DW_Language_Call_2("Location")
ls_Header_Text[7] = f_DW_Language_Call_2("Short Instruction")

FOR li_Count = 1 TO UpperBound(ls_Header_Text)
	ls_Header_Text[li_Count] = StrTran(ls_Header_Text[li_Count], "'", "~~'")
NEXT

ls_Column_Name[1] = "seq_t"
ls_Column_Name[2] = "sta_t"
ls_Column_Name[3] = "history_rd_t"
ls_Column_Name[4] = "description_t"
ls_Column_Name[5] = "equip_operator_id_t"
ls_Column_Name[6] = "location_t"
ls_Column_Name[7] = "misc_t"

IF NOT Empty(as_Current_Order) THEN
	ls_New_Order = ' A'
	ls_Order_Direction = "ˆ"
	li_Column = 1
ELSE
	// Check if previously sorted
	ls_Current_Sort = w_tour.tab_tour.tabpage_readings.dw_readings.Object.Datawindow.Table.Sort
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
END IF
ls_New_Sort = ls_Search + ls_New_Order
IF NOT Empty(ls_Sub_Sort) THEN
	ls_New_Sort  = ls_New_Sort + ", " + ls_Sub_Sort + " A"
END IF
FOR li_Count = 1 TO 7
	ls_Header_Column_Text = ls_Column_Name[li_Count] + ".Text='" + ls_Header_Text[li_Count]
	IF ( li_Count = li_Column ) THEN
		ls_Header_Column_Text = ls_Header_Column_Text +  + " " + ls_Order_Direction
	END IF
	ls_Error = w_tour.tab_tour.tabpage_stations.dw_stations.Modify(ls_Header_Column_Text + "'")
NEXT
w_tour.tab_tour.tabpage_readings.dw_readings.SetSort(ls_New_Sort)
w_tour.tab_tour.tabpage_readings.dw_readings.Sort()
li_Row = w_tour.tab_tour.tabpage_readings.dw_readings.Find(' history_sta = ' + String(gsu_tour_parameters[gi_Current_tour].Station), 1, w_tour.tab_tour.tabpage_readings.dw_readings.RowCount() + 1)
IF ( li_Row > 0 ) THEN
	w_tour.tab_tour.tabpage_readings.dw_readings.SetRow(li_Row)
	w_tour.tab_tour.tabpage_readings.dw_readings.ScrollToRow(li_Row)
	This.SelectRow(0, FALSE)
	this.SelectRow(li_Row, TRUE)
ELSE
	w_tour.tab_tour.tabpage_readings.dw_readings.SetRow(1)
	w_tour.tab_tour.tabpage_readings.dw_readings.ScrollToRow(1)
	This.SelectRow(0, FALSE)
	this.SelectRow(1, TRUE)
END IF

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
	CASE 'seq_t'
		ls_Search = "station_seq"
		ls_Sub_Sort = ""
		li_Column = 1
	CASE 'sta_t'
		ls_Search = "station_sta"
		ls_Sub_Sort = ""
		li_Column = 2
	CASE 'history_rd_t'
		ls_Search = "history_rd"
		ls_Sub_Sort = "station_seq"
		li_Column = 3
	CASE 'description_t'
		ls_Search = "station_description"
		ls_Sub_Sort = "station_seq"
		li_Column = 4
	CASE 'equip_operator_id_t'
		ls_Search = "station_equip_operator_id"
		ls_Sub_Sort = "station_seq"
		li_Column = 5
	CASE 'location_t'
		ls_Search = "station_location"
		ls_Sub_Sort = "station_seq"
		li_Column = 6
	CASE 'misc_t'
		ls_Search = "station_misc"
		ls_Sub_Sort = "station_seq"
		li_Column = 7
	CASE 'datawindow'
		// do nothing
	CASE ELSE
		il_Last_row_Scanned = -1
		il_Row_For_Navigate_To_Row_PostEvent = row
//		w_tour.tab_tour.tabpage_readings.dw_readings.PostEvent("ue_navigate_to_row", 0, row)
		integer li_Null
		SetNull(li_Null)
//		w_tour.tab_tour.tabpage_readings.dw_readings.Event ue_Navigate_To_Row(li_Null, '')
		w_tour.tab_tour.tabpage_readings.dw_readings.Post Event ue_Navigate_To_Row(li_Null, '')
//		This.PostEvent('Pause')
END CHOOSE

IF NOT Empty(ls_Search) THEN
	This.EVENT ue_Sort_DW(ls_Search, ls_Sub_Sort, li_Column, '')
END IF
end event

event other;CHOOSE CASE wparam
	CASE 37 // Left arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab > 1 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab - 1
			END IF
		END IF
//	CASE 38 // Up arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(-1, 'dw_history other 38')
	CASE 39 // Right arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab < 7 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab + 1
			END IF
		END IF
//	CASE 40 // Down arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(1, 'dw_history other 40')
	CASE 13, 134
END CHOOSE
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
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
	CASE 'seq_t'
		ls_Search = "station_seq"
		ls_Sub_Sort = ""
		li_Column = 1
	CASE 'sta_t'
		ls_Search = "station_sta"
		ls_Sub_Sort = ""
		li_Column = 2
	CASE 'history_rd_t'
		ls_Search = "history_rd"
		ls_Sub_Sort = "station_seq"
		li_Column = 3
	CASE 'description_t'
		ls_Search = "station_description"
		ls_Sub_Sort = "station_seq"
		li_Column = 4
	CASE 'equip_operator_id_t'
		ls_Search = "station_equip_operator_id"
		ls_Sub_Sort = "station_seq"
		li_Column = 5
	CASE 'location_t'
		ls_Search = "station_location"
		ls_Sub_Sort = "station_seq"
		li_Column = 6
	CASE 'misc_t'
		ls_Search = "station_misc"
		ls_Sub_Sort = "station_seq"
		li_Column = 7
	CASE 'datawindow'
		// do nothing
	CASE ELSE
		il_Last_row_Scanned = -1
		il_Row_For_Navigate_To_Row_PostEvent = row
//		w_tour.tab_tour.tabpage_readings.dw_readings.PostEvent("ue_navigate_to_row", 0, row)
		integer li_Null
		SetNull(li_Null)
//		w_tour.tab_tour.tabpage_readings.dw_readings.Event ue_Navigate_To_Row(li_Null, '')
		w_tour.tab_tour.tabpage_readings.dw_readings.Post Event ue_Navigate_To_Row(li_Null, '')
//		This.PostEvent('Pause')
END CHOOSE

IF NOT Empty(ls_Search) THEN
	This.EVENT ue_Sort_DW(ls_Search, ls_Sub_Sort, li_Column, '')
END IF
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

type p_1 from picture within tabpage_stations
integer x = 1266
integer y = 16
integer width = 146
integer height = 128
boolean bringtotop = true
boolean originalsize = true
string picturename = "Bitmaps\sort.jpg"
boolean focusrectangle = false
boolean map3dcolors = true
end type

event rbuttondown;dw_stations.EVENT ue_Sort_DW('station_seq', '', 1, 'D')
end event

event clicked;dw_stations.EVENT ue_Sort_DW('station_seq', '', 1, 'D')
end event

type tabpage_instructions from userobject within tab_tour
integer x = 18
integer y = 104
integer width = 1431
integer height = 1580
long backcolor = 32567268
string text = "Alert"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_alerts dw_alerts
st_station_description_instructions st_station_description_instructions
st_instructions st_instructions
end type

on tabpage_instructions.create
this.dw_alerts=create dw_alerts
this.st_station_description_instructions=create st_station_description_instructions
this.st_instructions=create st_instructions
this.Control[]={this.dw_alerts,&
this.st_station_description_instructions,&
this.st_instructions}
end on

on tabpage_instructions.destroy
destroy(this.dw_alerts)
destroy(this.st_station_description_instructions)
destroy(this.st_instructions)
end on

type dw_alerts from datawindow within tabpage_instructions
event type any ue_evaluate_alerts_2 ( boolean ab_display_message,  integer ai_row )
event type long ue_retrieve ( integer ai_sta )
string tag = "804"
integer y = 148
integer width = 1454
integer height = 1276
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "d_alerts_tour"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event type any ue_evaluate_alerts_2(boolean ab_display_message, integer ai_row);string ls_MB_String
boolean lb_Calculated
string ls_erd
integer li_Count
integer li_Num_rows
integer li_Row
string ls_Sql
integer li_Return
integer li_tour
integer li_Sta
integer li_Rev_No
string ls_Ealert
string ls_Reading
boolean lb_Alert
string ls_Alert_Text
string ls_Alert_Description
string ls_Alert_Expression
long ll_Alert_Color
string ls_Message
integer li_Alert_Id
datetime ldt_Now
//string ls_Tour_Alert_Description
string ls_Describe
integer li_Temp
integer li_Main_Return
pointer l_pointer
string ls_Tol
string ls_Max
string ls_Min
string ls_CD
string ls_Spec
string ls_OOT
string ls_SD
string ls_ND

li_Row = ai_Row//tab_tour.tabpage_readings.dw_readings.GetRow()

li_Main_Return = 0
l_pointer = SetPointer(HourGlass!)
This.SetRedraw(FALSE)
li_Temp = tab_tour.tabpage_readings.dw_readings.AcceptText()
ls_erd = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'station_erd')
lb_Calculated = NOT Empty(ls_erd)
IF lb_Calculated THEN
	ls_Reading = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'compute_rd')
ELSE
	ls_Reading = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'history_rd')
END IF
//MessageBox('Reading', ls_Reading)
//ls_Reading = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'history_rd')
ls_Tol = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'compute_tol')
ls_Max = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'compute_max')
ls_Min = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'compute_min')
ls_Spec = String(tab_tour.tabpage_readings.dw_readings.GetItemNumber(li_Row, 'history_spec'))
CHOOSE CASE ls_Spec
	CASE '1'
		ls_Spec = 'YES'
	CASE '0'
		ls_Spec = 'NO'
END CHOOSE
ls_OOT = String(tab_tour.tabpage_readings.dw_readings.GetItemNumber(li_Row, 'history_tol'))
CHOOSE CASE ls_OOT
	CASE '1'
		ls_OOT = 'YES'
	CASE '0'
		ls_OOT = 'NO'
END CHOOSE
//ls_Max = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'compute_max')
//ls_Min = tab_tour.tabpage_readings.dw_readings.GetItemString(li_Row, 'compute_min')
ls_CD = String(DateTime(Today(),Now()),"mm-dd-yyyy hh:mm:ss")
//ls_Spec = String(tab_tour.tabpage_readings.dw_readings.GetItemNumber(li_Row, 'history_spec'))
//ls_OOT = String(tab_tour.tabpage_readings.dw_readings.GetItemNumber(li_Row, 'history_tol'))

//[NPTS]
// Repalce the below ESQL with gsu_tour_parameters[gi_Current_tour].~ variables that are 
// retrieved when the tour is open
//string ls_normal_start_time
//long ll_normal_start_day
//
//  SELECT normal_start_time, 
//         normal_start_day 
//	 INTO :ls_normal_start_time, 
//	      :ll_normal_start_day 
//    FROM shift_time 
//   WHERE ( tour = :gsu_tour_parameters[gi_Current_tour].Tour_Number ) 
//	  AND ( rev_no = :gsu_tour_parameters[gi_Current_tour].rev_no ) 
//	  AND ( shift_no = :gsu_tour_parameters[gi_Current_tour].shift_no ) ;
//
//ls_SD = String(gsu_tour_parameters[gi_Current_tour].tour_date, "mm-dd-yyyy")
ls_ND = String(RelativeDate(Date(gsu_tour_parameters[gi_Current_Tour].Tour_Date),  gsu_tour_parameters[gi_Current_tour].normal_start_day),"mm-dd-yyyy")+" " + gsu_tour_parameters[gi_Current_tour].normal_start_time

li_tour = gsu_tour_parameters[gi_Current_tour].Tour_Number
li_Sta = tab_tour.tabpage_readings.dw_readings.GetItemNumber(li_Row, 'station_sta')//gsu_tour_parameters[gi_Current_tour].Station
li_Rev_No = gsu_tour_parameters[gi_Current_tour].Rev_No

//	SELECT alert_description 
//	  INTO :ls_Tour_Alert_Description
//	  FROM tour 
//	 WHERE ( tour = :li_Tour ) 
//	   AND ( rev_no = :li_Rev_No ) ;
//		
//IF Empty(ls_Tour_Alert_Description) THEN
//	ls_Tour_Alert_Description = 'Alert'
//END IF

// Remove all existing alert acceptances before continuing.
// The idea is that the user cannot move off of the station
// until they accept the reading which will always leave
// the OOS/OOT and alert acceptances in the proper status

//ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

DELETE FROM alert_accept 
 WHERE ( tour = :li_Tour ) 
	AND ( sta = :li_Sta ) 
	AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date ) 
	AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No ) 
	AND ( reading_id = 0 ) ;
								
IF ( SQLCA.SQLCode = 0 ) THEN
	COMMIT ;
ELSE
//	MessageBox('ERROR', 'Unable to remove existing "' + gsu_tour_parameters[gi_current_tour].Tour_Alert_Description + "' acceptance records~n~r" + SQLCA.SQLErrText)
	ls_MB_String = f_LanguageString('UNABLE_TO_REMOVE_EXISTING_###_ACCEPTANCE_RECORDS_$$$', "Unable to remove existing '###' acceptance records~n~r $$$")
	ls_MB_String = StrTran(ls_MB_String, '###', gsu_tour_parameters[gi_current_tour].Tour_Alert_Description)
	ls_MB_String = StrTran(ls_MB_String, '$$$', SQLCA.SQLErrText)
	MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
	ROLLBACK ;
END IF
//ls_Sql = 'START SYNCHRONIZATION DELETE'
//EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

li_Num_Rows = This.EVENT ue_Retrieve(li_Sta)
IF Empty(ls_Reading) THEN
//	li_Return = 1
	li_Main_Return = 1
ELSE
	FOR li_Count = 1 TO li_Num_Rows
		ls_Ealert = This.GetItemString(li_Count, 7)
		IF Empty(ls_Ealert) THEN
			ls_Ealert = ''
		ELSE
			ls_Ealert = StrTran(ls_Ealert, "'", '"')
			ls_Ealert = f_Purge_Spaces(ls_Ealert)

			ls_Ealert = StrTran(Upper(ls_Ealert), 'STA(' + String(li_Sta) + ')', '"' + ls_Reading + '"')

// This is because the current reading hasn't been punched into the database
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"ID")', '"' + guo_user.ID + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"NAME")', '"' + guo_user.Name + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"TOL")', '"' + ls_Tol + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"MAX")', '"' + ls_Max + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"MIN")', '"' + ls_Min + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"CD")', '"' + ls_CD + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"SD")', '"' + ls_SD + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"ND")', '"' + ls_ND + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"SPEC")', '"' + ls_Spec + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"OOT")', '"' + ls_OOT + '"')

			ls_Ealert = StrTran(Upper(ls_Ealert), 'CLOCKDTTM(' + String(li_Sta) + ',0)', '"' + ls_CD + '"')
			ls_Ealert = StrTran(Upper(ls_Ealert), 'NORMSTARTDTTM(' + String(li_Sta) + ',0)', '"' + ls_ND + '"')

//			ls_Ealert = 'IF(' + ls_Ealert + ', "TRUE", "FALSE")'
			ls_Ealert = "Evaluate('" + ls_Ealert + "', 0)"
//MessageBox('alert getting evaluated', ls_Ealert)
			ls_Describe = ids_evaluate.Describe(ls_Ealert)

//IF ( li_Sta = 13 ) THEN
//	string ls_test, ls_test2
//	ls_test = 'N(Prev(13,1))'
//	ls_test = "Evaluate('" + ls_test + "', 0)"
//	ls_Describe = ids_evaluate.Describe(ls_test)
//	Messagebox(ls_test, ls_Describe)
//	ls_test = 'RDINFO(13, 1, "ND")'
//	ls_test = "Evaluate('" + ls_test + "', 0)"
//	ls_Describe = ids_evaluate.Describe(ls_test)
//	Messagebox(ls_test, ls_Describe)
//	ls_test = 'RDINFO(13,0,"ND")'
//	ls_test = StrTran(Upper(ls_test), 'RDINFO(' + String(li_Sta) + ',0,"ND")', '"' + ls_ND + '"')
//	ls_test = "Evaluate('" + ls_test + "', 0)"
//	ls_Describe = ids_evaluate.Describe(ls_test)
//	Messagebox(ls_test, ls_Describe)
//	ls_test = f_Purge_Spaces('N(HourDiff(RDINFO(13, 1, "ND"), RDINFO(13, 0, "ND"))) * 1.37')
//	ls_test = StrTran(Upper(ls_test), 'RDINFO(' + String(li_Sta) + ',0,"ND")', '"' + ls_ND + '"')
//	ls_test = "Evaluate('" + ls_test + "', 0)"
//	ls_Describe = ids_evaluate.Describe(ls_test)
//	Messagebox(ls_test, ls_Describe)
//	//(N(Sta(13)) - N(Prev(13,1)) ) > N(HourDiff(RDINFO(13, 1, "ND"), RDINFO(13, 0, "ND"))) * 1.37
//END IF
			
			lb_Alert = ( Upper(ls_Describe) = 'TRUE' )
			IF lb_Alert THEN
				ls_Alert_Text = This.GetItemString(li_Count, 8)
				ls_Alert_Description = This.GetItemString(li_Count, 6)
				ll_Alert_Color = This.GetItemNumber(li_Count, 9)
				li_Alert_Id = This.GetItemNumber(li_Count, 'alert_id')
				IF ab_Display_Message THEN
					IF NOT lb_Calculated THEN
						ls_Message = ls_Alert_Description + "~n~r" + ls_Alert_Text + "~n~r" + f_LanguageString('ACCEPT_THIS_READING?', "Accept this reading?") + "~n~r  " + f_LanguageString('RD', 'Rd') + ": " + ls_Reading
						OpenWithParm(w_alert_notify, String(li_Alert_Id) + '|' + ls_Reading + '|Alert')
					ELSE
						ls_Message = ls_Alert_Description + "~n~r" + ls_Alert_Text + "~n~r" + f_LanguageString('CALCULATED_READING', "Calculated Reading") + ".~n~r  " + f_LanguageString('RD', 'Rd') + ": " + ls_Reading
						OpenWithParm(w_alert_notify, String(li_Alert_Id) + '|' + ls_Reading + '|Info')
					END IF
					li_Return = ii_Alert_Notify
					li_Main_Return = ii_Alert_Notify
					ii_Alert_Notify = 0
				ELSE
					li_Main_Return = 1
					li_Return = 1
				END IF
				IF ( li_Return = 1 ) THEN
					li_Main_Return = 1
					ldt_Now = DateTime(Today(), Now())
	
					INSERT INTO alert_accept 
							 ( tour, rev_no, sta, dt, shift_no, reading_id, alert_id, user_id, accept_dt ) 
					VALUES ( :li_Tour, 
								:li_Rev_No, 
								:li_Sta, 
								:gsu_tour_parameters[gi_Current_Tour].Tour_Date, 
								:gsu_tour_parameters[gi_Current_Tour].Shift_No, 
								0, 
								:li_Alert_Id, 
								:guo_user.ID, 
								:ldt_Now ) ;
									
					IF ( SQLCA.SQLCode = 0 ) THEN
						COMMIT ;
					ELSE
//						MessageBox('ERROR', 'Unable to add new "' + gsu_tour_parameters[gi_current_tour].Tour_Alert_Description + "' acceptance records~n~r" + SQLCA.SQLErrText)
						ls_MB_String = f_LanguageString('UNABLE_TO_ADD_NEW_###_ACCEPTANCE_RECORDS_$$$', "Unable to add new '###' acceptance records~n~r $$$")
						ls_MB_String = StrTran(ls_MB_String, '###', gsu_tour_parameters[gi_current_tour].Tour_Alert_Description)
						ls_MB_String = StrTran(ls_MB_String, '$$$', SQLCA.SQLErrText)
						MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
						ROLLBACK ;
					END IF
				ELSEIF ( li_Return = 2 ) THEN
					// This is because of the loop, all of the Alerts need to be evaluated to 
					// force acceptance of TRUE alerts
					li_Main_Return = 2
					EXIT
				END IF
			END IF
		END IF
	NEXT
END IF

li_Num_Rows = This.EVENT ue_Retrieve(li_Sta)
This.SetRedraw(TRUE)
SetPointer(l_Pointer)

RETURN li_Main_Return


//string ls_erd
//integer li_Count
//integer li_Num_rows
//integer li_Row
//string ls_Sql
//integer li_Return
//integer li_tour
//integer li_Sta
//integer li_Rev_No
//string ls_Ealert
//string ls_Reading
//boolean lb_Alert
//string ls_Alert_Text
//string ls_Alert_Description
//string ls_Alert_Expression
//long ll_Alert_Color
//string ls_Message
//integer li_Alert_Id
//datetime ldt_Now
//string ls_Tour_Alert_Description
//string ls_Describe
//integer li_Temp
//integer li_Main_Return
//pointer l_pointer
//
//li_Main_Return = 1
//l_pointer = SetPointer(HourGlass!)
//This.SetRedraw(FALSE)
//li_Temp = tab_tour.tabpage_readings.dw_readings.AcceptText()
//ls_Reading = tab_tour.tabpage_readings.dw_readings.GetItemString(tab_tour.tabpage_readings.dw_readings.GetRow(), 'history_rd')
//
//string ls_Max
//string ls_Min
//string ls_CD
//string ls_Spec
//string ls_OOT
//
//ls_Max = tab_tour.tabpage_readings.dw_readings.GetItemString(tab_tour.tabpage_readings.dw_readings.GetRow(), 'compute_max')
//ls_Min = tab_tour.tabpage_readings.dw_readings.GetItemString(tab_tour.tabpage_readings.dw_readings.GetRow(), 'compute_min')
//ls_CD = String(DateTime(Today(),Now()),"mm-dd-yyyy hh:mm:ss")
//ls_Spec = String(tab_tour.tabpage_readings.dw_readings.GetItemNumber(tab_tour.tabpage_readings.dw_readings.GetRow(), 'history_spec'))
//ls_OOT = String(tab_tour.tabpage_readings.dw_readings.GetItemNumber(tab_tour.tabpage_readings.dw_readings.GetRow(), 'history_tol'))
//
//
//
//li_tour = gsu_tour_parameters[gi_Current_tour].Tour_Number
//li_Sta = gsu_tour_parameters[gi_Current_tour].Station
//li_Rev_No = gsu_tour_parameters[gi_Current_tour].Rev_No
//ls_erd = tab_tour.tabpage_readings.dw_readings.GetItemString(tab_tour.tabpage_readings.dw_readings.GetRow(), 'station_erd')
//
//	SELECT alert_description 
//	  INTO :ls_Tour_Alert_Description
//	  FROM tour 
//	 WHERE ( tour = :li_Tour ) 
//	   AND ( rev_no = :li_Rev_No ) ;
//		
//IF Empty(ls_Tour_Alert_Description) THEN
//	ls_Tour_Alert_Description = 'Alert'
//END IF
//
//// Remove all existing alert acceptances before continuing.
//// The idea is that the user cannot move off of the station
//// until they accept the reading which will always leave
//// the OOS/OOT and alert acceptances in the proper status
//
//DELETE FROM alert_accept 
// WHERE ( tour = :li_Tour ) 
//	AND ( rev_no = :li_Rev_No ) 
//	AND ( sta = :li_Sta ) 
//	AND ( dt = :gsu_tour_parameters[gi_Current_Tour].Tour_Date ) 
//	AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].Shift_No ) 
//	AND ( reading_id = 0 ) ;
//								
//IF ( SQLCA.SQLCode = 0 ) THEN
//	COMMIT ;
//ELSE
//	MessageBox('ERROR', 'Unable to remove existing "' + ls_Tour_Alert_Description + "' acceptance records~n~r" + SQLCA.SQLErrText)
//	ROLLBACK ;
//END IF
//
//li_Num_Rows = This.EVENT ue_Retrieve()
//IF Empty(ls_Reading) THEN
//	li_Return = 1
//ELSE
//	FOR li_Count = 1 TO li_Num_Rows
//		ls_Ealert = This.GetItemString(li_Count, 7)
//		IF Empty(ls_Ealert) THEN
//			ls_Ealert = ''
//			li_Return = 1
//		ELSE
//			ls_Ealert = StrTran(ls_Ealert, "'", '"')
//			ls_Ealert = f_Purge_Spaces(ls_Ealert)
//			ls_Ealert = StrTran(Upper(ls_Ealert), 'STA(' + String(li_Sta) + ')', '"' + ls_Reading + '"')
//
//// This is because the current reading hasn't been punched into the database
//			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"MAX")', '"' + ls_Max + '"')
//			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"MIN")', '"' + ls_Min + '"')
//			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"CD")', '"' + ls_CD + '"')
//			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"SPEC")', '"' + ls_Spec + '"')
//			ls_Ealert = StrTran(Upper(ls_Ealert), 'RDINFO(' + String(li_Sta) + ',0,"OOT")', '"' + ls_OOT + '"')
//			
//			ls_Ealert = "Evaluate('" + ls_Ealert + "', 0)"
//			ls_Describe = ids_evaluate.Describe(ls_Ealert)
//			lb_Alert = ( Upper(ls_Describe) = 'TRUE' )
//			IF lb_Alert THEN
//				ls_Alert_Text = This.GetItemString(li_Count, 8)
//				ls_Alert_Description = This.GetItemString(li_Count, 6)
//				ll_Alert_Color = This.GetItemNumber(li_Count, 9)
//				li_Alert_Id = This.Object.alert_id[li_Count]
//				IF ab_Display_Message THEN
//					IF Empty(ls_erd) THEN
//						ls_Message = ls_Alert_Description + "~n~r" + ls_Alert_Text + "~n~rAccept this reading?~n~r  Rd: " + ls_Reading
//					ELSE
//						ls_Message = ls_Alert_Description + "~n~r" + ls_Alert_Text + "~n~rCalculated reading.~n~r  Rd: " + ls_Reading
//					END IF
//					IF Empty(ls_erd) THEN
//						OpenWithParm(w_alert_notify, String(li_Alert_Id) + '|' + ls_Reading + '|Alert')
////						li_Return = MessageBox(ls_Tour_Alert_Description + "!", ls_Message, StopSign!, YesNo!)
//					ELSE
//						OpenWithParm(w_alert_notify, String(li_Alert_Id) + '|' + ls_Reading + '|Info')
////						li_Return = MessageBox(ls_Tour_Alert_Description + "!", ls_Message, Information!, Ok!)
//					END IF
//					li_Return = ii_Alert_Notify
//					ii_Alert_Notify = 0
//				ELSE
//					li_Return = 1
//				END IF
//				IF ( li_Return = 1 ) THEN
//					ldt_Now = DateTime(Today(), Now())
//	
//					INSERT INTO alert_accept 
//							 ( tour, rev_no, sta, dt, shift_no, reading_id, alert_id, user_id, accept_dt ) 
//					VALUES ( :li_Tour, 
//								:li_Rev_No, 
//								:li_Sta, 
//								:gsu_tour_parameters[gi_Current_Tour].Tour_Date, 
//								:gsu_tour_parameters[gi_Current_Tour].Shift_No, 
//								0, 
//								:li_Alert_Id, 
//								:guo_user.ID, 
//								:ldt_Now ) ;
//									
//					IF ( SQLCA.SQLCode = 0 ) THEN
//						COMMIT ;
//					ELSE
//						MessageBox('ERROR', 'Unable to add new "' + ls_Tour_Alert_Description + "' acceptance records~n~r" + SQLCA.SQLErrText)
//						ROLLBACK ;
//					END IF
//				ELSEIF ( li_Return = 2 ) THEN
//					// This is because of the loop, all of the Alerts need to be evaluated to 
//					// force acceptance of TRUE alerts
//					li_Main_Return = 2
//				END IF
//			ELSE
//				li_Return = 1
//			END IF
//		END IF
//	NEXT
//END IF
//
//li_Num_Rows = This.EVENT ue_Retrieve()
//This.SetRedraw(TRUE)
//SetPointer(l_Pointer)
//
//RETURN li_Main_Return
//
end event

event type long ue_retrieve(integer ai_sta);integer li_Return
long ll_Num_Rows
integer li_Tour
integer li_Sta
integer li_Rev_No
string ls_Sql
string ls_Error
date ld_Tour_Date
integer li_Shift_No

This.SetRedraw(FALSE)
li_tour = gsu_tour_parameters[gi_Current_tour].Tour_Number
li_Sta = ai_sta//gsu_tour_parameters[gi_Current_tour].Station
li_Rev_No = gsu_tour_parameters[gi_Current_tour].Rev_No
ld_Tour_Date = gsu_tour_parameters[gi_Current_tour].Tour_Date
li_Shift_No = gsu_tour_parameters[gi_Current_tour].Shift_No

//ls_Sql = " &
//SELECT a.tour, &
//       a.rev_no, &
//       a.sta, &
//       a.alert_id, &
//       a.alert_order, &
//       a.alert_description, &
//       a.alert_expression, &
//       a.alert_text, &
//       a.alert_color &
//  FROM alerts a, &
//       alert_accept b &
// WHERE ( a.tour = :ai_tour) &
//   AND ( a.rev_no = :ai_rev_no ) &
//   AND ( a.sta = :ai_station ) &
//   AND ( b.dt = '" + String(ld_Tour_date, 'yyyy-mm-dd') + "' ) &
//   AND ( b.shift_no = " + String(li_Shift_No) + " ) &
//   AND ( b.reading_id = 0 ) &
//   AND ( a.tour = b.tour ) &
//   AND ( a.rev_no = b.rev_no ) &
//   AND ( a.sta = b.sta ) &
//   AND (a.alert_id = b.alert_id) &
//UNION &
//SELECT tour, &
//       rev_no, &
//       sta, &
//       alert_id, &
//       alert_order, &
//       alert_description, &
//       alert_expression, &
//       alert_text, &
//       " + String(RGB(192, 192, 192)) + " AS alert_color &
//  FROM alerts &
// WHERE ( tour = :ai_tour) &
//   AND ( rev_no = :ai_rev_no ) &
//   AND ( sta = :ai_station ) &
//    AND NOT EXISTS &
//        ( SELECT * &
//            FROM alert_accept b &
//           WHERE ( alerts.tour = b.tour ) &
//             AND ( alerts.rev_no = b.rev_no ) &
//             AND ( alerts.sta = b.sta ) &
//             AND (alerts.alert_id = b.alert_id) &
//             AND ( b.dt = '" + String(ld_Tour_date, 'yyyy-mm-dd') + "' ) &
//             AND ( b.shift_no = " + String(li_Shift_No) + " ) &
//             AND ( reading_id = 0 ) ) &
//ORDER BY 5 ASC "
//
//ls_Error = This.Modify('DataWindow.Table.Select = "' + ls_Sql + '"')
//li_Return = This.Reset()
li_Return = This.SetTransObject(SQLCA)
ll_Num_Rows = This.Retrieve(li_Tour, li_Rev_No, li_Sta, ld_tour_date, li_shift_no)

integer li_Num_Alerts

SELECT COUNT(*)
  INTO :li_Num_Alerts 
  FROM alert_accept b 
 WHERE ( b.tour = :li_tour) 
   AND ( b.rev_no = :li_rev_no ) 
   AND ( b.sta = :li_sta ) 
   AND ( b.dt = :ld_Tour_date ) 
   AND ( b.shift_no = :li_Shift_No ) 
   AND ( b.reading_id = 0 ) ;

wf_Update_Counts('ALERT', String(li_Num_Alerts), tab_tour.tabpage_readings.dw_readings.GetRow())

This.SetRedraw(TRUE)

RETURN ll_Num_Rows
end event

event rbuttondown;string ls_Expression
string ls_Detail
string ls_Message
integer li_Reading_Id
integer li_Alert_Id
string ls_User
datetime ldt_temp 
string CRLF

CRLF	= CHAR(13) + CHAR(10)

CHOOSE CASE dwo.Name
	CASE 'datawindow'
	CASE ELSE
		IF ( row > 0 ) THEN
//			li_Reading_Id = 0
//			li_Alert_Id = This.Object.alert_id[row]
			ls_Detail = '0'
			ls_Detail = ls_Detail + '|' + String(This.Object.alert_id[row])
			ls_Detail = ls_Detail + '|' + This.Object.alert_description[row]
			ls_Detail = ls_Detail + '|' + This.Object.alert_text[row]
			ls_Expression = This.Object.alert_expression[row]
			::ClipBoard(ls_Expression)
			ls_Detail = ls_Detail + '|' + ls_Expression

//			ls_Detail = "Description:" + CRLF
//			ls_Detail = ls_Detail + This.Object.alert_description[row] + CRLF + CRLF
//			ls_Detail = ls_Detail + "Text:" + CRLF
//			ls_Detail = ls_Detail + This.Object.alert_text[row] + CRLF + CRLF
//			ls_Detail = ls_Detail + "Expression:" + CRLF
//			ls_Detail = ls_Detail + This.Object.alert_expression[row] + CRLF + CRLF
//			
//			SELECT name, 
//			       accept_dt 
//			  INTO :ls_User, 
//			       :ldt_temp 
//			  FROM alert_accept, userlog 
//			 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
//			   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
//				AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
//				AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
//				AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
//				AND ( reading_id = :li_Reading_Id ) 
//				AND ( alert_id = :li_Alert_Id ) 
//				AND ( alert_accept.user_id = userlog.user_id ) ;
//				
//			IF ( SQLCA.SQLNRows = 1 ) THEN
//				ls_Detail = ls_Detail + 'Acceptance:' + CRLF
//				ls_Detail = ls_Detail + '   ' + ls_User + CRLF
//				ls_Detail = ls_Detail + '   ' + String(ldt_temp, date_format + ' hh:mm:ss') + CRLF + CRLF
//			END IF
				
			ls_Message = 'Alert Detail|' + ls_Detail
			OpenWithParm(w_detail, ls_Message)
		END IF
END CHOOSE
end event

event other;CHOOSE CASE wparam
	CASE 37 // Left arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab > 1 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab - 1
			END IF
		END IF
//	CASE 38 // Up arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(-1, 'dw_history other 38')
	CASE 39 // Right arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab < 7 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab + 1
			END IF
		END IF
//	CASE 40 // Down arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(1, 'dw_history other 40')
	CASE 13, 134
END CHOOSE
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
string ls_Expression
string ls_Detail
string ls_Message
integer li_Reading_Id
integer li_Alert_Id
string ls_User
datetime ldt_temp 
string CRLF

CRLF	= CHAR(13) + CHAR(10)

CHOOSE CASE dwo.Name
	CASE 'datawindow'
	CASE ELSE
		IF ( row > 0 ) THEN
//			li_Reading_Id = 0
//			li_Alert_Id = This.Object.alert_id[row]
			ls_Detail = '0'
			ls_Detail = ls_Detail + '|' + String(This.Object.alert_id[row])
			ls_Detail = ls_Detail + '|' + This.Object.alert_description[row]
			ls_Detail = ls_Detail + '|' + This.Object.alert_text[row]
			ls_Expression = This.Object.alert_expression[row]
			::ClipBoard(ls_Expression)
			ls_Detail = ls_Detail + '|' + ls_Expression

//			ls_Detail = "Description:" + CRLF
//			ls_Detail = ls_Detail + This.Object.alert_description[row] + CRLF + CRLF
//			ls_Detail = ls_Detail + "Text:" + CRLF
//			ls_Detail = ls_Detail + This.Object.alert_text[row] + CRLF + CRLF
//			ls_Detail = ls_Detail + "Expression:" + CRLF
//			ls_Detail = ls_Detail + This.Object.alert_expression[row] + CRLF + CRLF
//			
//			SELECT name, 
//			       accept_dt 
//			  INTO :ls_User, 
//			       :ldt_temp 
//			  FROM alert_accept, userlog 
//			 WHERE ( tour = :gsu_tour_parameters[gi_Current_Tour].Tour_Number ) 
//			   AND ( rev_no = :gsu_tour_parameters[gi_Current_Tour].rev_no ) 
//				AND ( dt = :gsu_tour_parameters[gi_Current_Tour].tour_date ) 
//				AND ( sta = :gsu_tour_parameters[gi_Current_Tour].station ) 
//				AND ( shift_no = :gsu_tour_parameters[gi_Current_Tour].shift_no ) 
//				AND ( reading_id = :li_Reading_Id ) 
//				AND ( alert_id = :li_Alert_Id ) 
//				AND ( alert_accept.user_id = userlog.user_id ) ;
//				
//			IF ( SQLCA.SQLNRows = 1 ) THEN
//				ls_Detail = ls_Detail + 'Acceptance:' + CRLF
//				ls_Detail = ls_Detail + '   ' + ls_User + CRLF
//				ls_Detail = ls_Detail + '   ' + String(ldt_temp, date_format + ' hh:mm:ss') + CRLF + CRLF
//			END IF
				
			ls_Message = 'Alert Detail|' + ls_Detail
			OpenWithParm(w_detail, ls_Message)
		END IF
END CHOOSE
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type st_station_description_instructions from statictext within tabpage_instructions
integer x = 23
integer y = 68
integer width = 1413
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 32567268
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
end type

event rbuttondown;long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))

end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

type st_instructions from statictext within tabpage_instructions
integer x = 23
integer width = 1024
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Alerts"
boolean focusrectangle = false
end type

type tabpage_notes from userobject within tab_tour
integer x = 18
integer y = 104
integer width = 1431
integer height = 1580
long backcolor = 32567268
string text = "Note"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
string picturename = "Custom079!"
long picturemaskcolor = 536870912
st_previous_note_1 st_previous_note_1
st_current_note st_current_note
mle_note_2 mle_note_2
mle_note_1 mle_note_1
st_notes st_notes
st_station_description_notes st_station_description_notes
ddlb_quick_note ddlb_quick_note
end type

on tabpage_notes.create
this.st_previous_note_1=create st_previous_note_1
this.st_current_note=create st_current_note
this.mle_note_2=create mle_note_2
this.mle_note_1=create mle_note_1
this.st_notes=create st_notes
this.st_station_description_notes=create st_station_description_notes
this.ddlb_quick_note=create ddlb_quick_note
this.Control[]={this.st_previous_note_1,&
this.st_current_note,&
this.mle_note_2,&
this.mle_note_1,&
this.st_notes,&
this.st_station_description_notes,&
this.ddlb_quick_note}
end on

on tabpage_notes.destroy
destroy(this.st_previous_note_1)
destroy(this.st_current_note)
destroy(this.mle_note_2)
destroy(this.mle_note_1)
destroy(this.st_notes)
destroy(this.st_station_description_notes)
destroy(this.ddlb_quick_note)
end on

type st_previous_note_1 from statictext within tabpage_notes
integer x = 32
integer y = 656
integer width = 1024
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Previous Note:"
boolean focusrectangle = false
end type

type st_current_note from statictext within tabpage_notes
integer x = 32
integer y = 136
integer width = 1024
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Current Note:"
boolean focusrectangle = false
end type

type mle_note_2 from multilineedit within tabpage_notes
string tag = "448"
integer x = 23
integer y = 732
integer width = 1403
integer height = 696
integer taborder = 3
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
integer tabstop[] = {2}
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;string ls_Text
string ls_Tag
mnu_edit popmenu

This.SetFocus()
ls_Text = This.SelectedText()

popmenu = CREATE mnu_edit

long hwnd_mle
hwnd_mle = handle(This)

mnu_edit.m_copy.Text = f_LanguageString('COPY', 'Copy')
mnu_edit.m_cut.Text = f_LanguageString('CUT', 'Cut')
mnu_edit.m_edit.Text = f_LanguageString('EDIT', 'Edit')
mnu_edit.m_paste.Text = f_LanguageString('PASTE', 'Paste')
mnu_edit.m_selectall.Text = f_LanguageString('SELECT_ALL', 'Select All')

//popmenu.m_cut.Enabled = TRUE
popmenu.m_copy.Enabled = TRUE
//popmenu.m_paste.Enabled = TRUE
popmenu.m_selectall.Enabled = TRUE
popmenu.m_edit.Visible = FALSE
popmenu.PopMenu(Parent.PointerX(), Parent.PointerY())
ls_Tag = popmenu.Tag

CHOOSE CASE ls_Tag
	CASE 'SELECTALL'
		This.SelectText(1, LEN(This.Text))
	CASE 'CUT'
		Clipboard(ls_Text)
		This.ReplaceText('')
	CASE 'COPY'
		Clipboard(ls_Text)
	CASE 'PASTE'
		This.ReplaceText(Clipboard())
END CHOOSE

integer WM_ACTIVATE = 6
integer wParam = 2 // WA_CLICKACTIVE
Post( hwnd_mle, WM_ACTIVATE, wParam, 0 )

DESTROY popmenu

end event

type mle_note_1 from multilineedit within tabpage_notes
string tag = "140"
integer x = 23
integer y = 316
integer width = 1403
integer height = 324
integer taborder = 2
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 250
integer tabstop[] = {1}
borderstyle borderstyle = stylelowered!
end type

event losefocus;
/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//w_tour.SetRedraw(FALSE)
//This.Height = Integer(This.Tag)
//st_previous_note_1.Y = This.Y + This.Height
//mle_note_2.Y = st_previous_note_1.Y + st_previous_note_1.Height
//mle_note_2.Height = Integer(mle_note_2.Tag)
//w_tour.SetRedraw(TRUE)
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

event getfocus;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//w_tour.SetRedraw(FALSE)
//This.Height = Integer(mle_note_2.Tag)
//st_previous_note_1.Y = This.Y + This.Height
//mle_note_2.Y = st_previous_note_1.Y + st_previous_note_1.Height
//mle_note_2.Height = Integer(This.Tag)
//w_tour.SetRedraw(TRUE)
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

event rbuttondown;string ls_Note
string ls_Text
string ls_Tag
mnu_edit popmenu

This.SetFocus()
ls_Text = This.SelectedText()

popmenu = CREATE mnu_edit

long hwnd_mle
hwnd_mle = handle(This)

mnu_edit.m_copy.Text = f_LanguageString('COPY', 'Copy')
mnu_edit.m_cut.Text = f_LanguageString('CUT', 'Cut')
mnu_edit.m_edit.Text = f_LanguageString('EDIT', 'Edit')
mnu_edit.m_paste.Text = f_LanguageString('PASTE', 'Paste')
mnu_edit.m_selectall.Text = f_LanguageString('SELECT_ALL', 'Select All')

popmenu.m_cut.Enabled = TRUE
popmenu.m_copy.Enabled = TRUE
popmenu.m_paste.Enabled = TRUE
popmenu.m_selectall.Enabled = TRUE
popmenu.m_edit.Visible = gb_AllowEditNoteInWindow
popmenu.PopMenu(Parent.PointerX(), Parent.PointerY())
ls_Tag = popmenu.Tag

CHOOSE CASE ls_Tag
	CASE 'SELECTALL'
		This.SelectText(1, LEN(This.Text))
	CASE 'CUT'
		Clipboard(ls_Text)
		This.ReplaceText('')
	CASE 'COPY'
		Clipboard(ls_Text)
	CASE 'PASTE'
		This.ReplaceText(Clipboard())
	CASE 'EDIT'
		ls_Note = This.Text
		OpenWithParm(w_edit_note, ls_Note)
END CHOOSE

integer WM_ACTIVATE = 6
integer wParam = 2 // WA_CLICKACTIVE
Post( hwnd_mle, WM_ACTIVATE, wParam, 0 )

DESTROY popmenu

end event

type st_notes from statictext within tabpage_notes
integer x = 32
integer width = 1024
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Notes"
boolean focusrectangle = false
end type

type st_station_description_notes from statictext within tabpage_notes
integer x = 32
integer y = 68
integer width = 1408
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 32567268
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
end type

event rbuttondown;long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))

end event

event getfocus;
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type ddlb_quick_note from dropdownlistbox within tabpage_notes
integer x = 23
integer y = 208
integer width = 1403
integer height = 532
integer taborder = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean vscrollbar = true
end type

event selectionchanged;string ls_Sql
string ls_Note
string ls_Current_Note
string ls_Note_Desc
long ll_Num_Rows
datastore lds_temp

lds_temp = CREATE datastore

ls_Note_Desc = This.Text

ls_Sql = " &
SELECT note_text &
  FROM quick_notes &
 WHERE ( note_desc = '" + ls_Note_Desc + "' ) &
   AND ( tour = " + string(gsu_tour_parameters[gi_Current_Tour].tour_number) + " ) &
	AND ( rev_no = " + string(gsu_tour_parameters[gi_Current_Tour].rev_no) + " ) &
	AND ( sta = " + string(gsu_tour_parameters[gi_Current_Tour].station) + " ) "
 
ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
IF ( ll_Num_Rows = 1 ) THEN
	ls_Note = TRIM(lds_temp.GetItemString(1, 1))
	IF NOT Empty(ls_Note) THEN
		ls_Current_Note = mle_note_1.Text
		IF Empty(ls_Current_Note) THEN
			mle_note_1.Text = MID(ls_Note, 1, 250)
		ELSE
			mle_note_1.Text = MID(ls_Current_Note + " - " + ls_Note, 1, 250)
		END IF
	END IF
END IF

DESTROY lds_temp
end event

type tabpage_history from userobject within tab_tour
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 1431
integer height = 1580
long backcolor = 32567268
string text = "Hist"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
pb_history_display pb_history_display
pb_graphics_display pb_graphics_display
st_history st_history
st_station_description_history st_station_description_history
st_minimum st_minimum
st_maximum st_maximum
gr_history gr_history
dw_history dw_history
end type

on tabpage_history.create
this.pb_history_display=create pb_history_display
this.pb_graphics_display=create pb_graphics_display
this.st_history=create st_history
this.st_station_description_history=create st_station_description_history
this.st_minimum=create st_minimum
this.st_maximum=create st_maximum
this.gr_history=create gr_history
this.dw_history=create dw_history
this.Control[]={this.pb_history_display,&
this.pb_graphics_display,&
this.st_history,&
this.st_station_description_history,&
this.st_minimum,&
this.st_maximum,&
this.gr_history,&
this.dw_history}
end on

on tabpage_history.destroy
destroy(this.pb_history_display)
destroy(this.pb_graphics_display)
destroy(this.st_history)
destroy(this.st_station_description_history)
destroy(this.st_minimum)
destroy(this.st_maximum)
destroy(this.gr_history)
destroy(this.dw_history)
end on

type pb_history_display from picture within tabpage_history
boolean visible = false
integer x = 1262
integer y = 28
integer width = 146
integer height = 128
boolean originalsize = true
string picturename = "Bitmaps\curve.jpg"
boolean focusrectangle = false
end type

event clicked;ib_History_Graph_Visible = NOT ib_History_Graph_Visible
tab_tour.EVENT ue_History_Display()
pb_graphics_display.Visible = TRUE
This.Visible = FALSE
end event

type pb_graphics_display from picture within tabpage_history
integer x = 1262
integer y = 28
integer width = 146
integer height = 128
boolean bringtotop = true
boolean originalsize = true
string picturename = "Bitmaps\table.jpg"
boolean focusrectangle = false
end type

event clicked;ib_History_Graph_Visible = NOT ib_History_Graph_Visible
tab_tour.EVENT ue_History_Display()
pb_history_display.Visible = TRUE
This.Visible = FALSE
end event

type st_history from statictext within tabpage_history
integer x = 23
integer width = 837
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "History"
boolean focusrectangle = false
end type

type st_station_description_history from statictext within tabpage_history
integer x = 23
integer y = 72
integer width = 1216
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 32567268
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
end type

event getfocus;
end event

event rbuttondown;long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))

end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

type st_minimum from statictext within tabpage_history
integer y = 1336
integer width = 256
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 32567268
string text = "Minimum"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_maximum from statictext within tabpage_history
integer x = 274
integer y = 1336
integer width = 274
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 32768
long backcolor = 32567268
string text = "Maximum"
alignment alignment = center!
boolean focusrectangle = false
end type

type gr_history from graph within tabpage_history
integer y = 160
integer width = 1431
integer height = 1272
grgraphtype graphtype = linegraph!
long textcolor = 33554432
long backcolor = 32567268
integer spacing = 100
integer depth = 100
boolean focusrectangle = false
grsorttype seriessort = ascending!
grsorttype categorysort = ascending!
end type

on gr_history.create
TitleDispAttr = create grDispAttr
LegendDispAttr = create grDispAttr
PieDispAttr = create grDispAttr
Series = create grAxis
Series.DispAttr = create grDispAttr
Series.LabelDispAttr = create grDispAttr
Category = create grAxis
Category.DispAttr = create grDispAttr
Category.LabelDispAttr = create grDispAttr
Values = create grAxis
Values.DispAttr = create grDispAttr
Values.LabelDispAttr = create grDispAttr
TitleDispAttr.FaceName="Tahoma"
TitleDispAttr.FontCharSet=DefaultCharSet!
TitleDispAttr.FontFamily=Swiss!
TitleDispAttr.FontPitch=Variable!
TitleDispAttr.Alignment=Center!
TitleDispAttr.BackColor=536870912
TitleDispAttr.Format="[General]"
TitleDispAttr.DisplayExpression="title"
TitleDispAttr.AutoSize=true
Category.AutoScale=true
Category.ShadeBackEdge=true
Category.SecondaryLine=transparent!
Category.MajorGridLine=transparent!
Category.MinorGridLine=transparent!
Category.DropLines=transparent!
Category.OriginLine=transparent!
Category.MajorTic=Outside!
Category.DataType=adtDouble!
Category.DispAttr.Weight=400
Category.DispAttr.FaceName="Arial"
Category.DispAttr.FontCharSet=DefaultCharSet!
Category.DispAttr.FontFamily=Swiss!
Category.DispAttr.FontPitch=Variable!
Category.DispAttr.Alignment=Center!
Category.DispAttr.BackColor=536870912
Category.DispAttr.Format="[General]"
Category.DispAttr.DisplayExpression="category"
Category.DispAttr.AutoSize=true
Category.LabelDispAttr.Weight=400
Category.LabelDispAttr.FaceName="Arial"
Category.LabelDispAttr.FontCharSet=DefaultCharSet!
Category.LabelDispAttr.FontFamily=Swiss!
Category.LabelDispAttr.FontPitch=Variable!
Category.LabelDispAttr.Alignment=Center!
Category.LabelDispAttr.BackColor=536870912
Category.LabelDispAttr.Format="[General]"
Category.LabelDispAttr.DisplayExpression="categoryaxislabel"
Category.LabelDispAttr.AutoSize=true
Values.AutoScale=true
Values.SecondaryLine=transparent!
Values.MajorGridLine=transparent!
Values.MinorGridLine=transparent!
Values.DropLines=transparent!
Values.MajorTic=Outside!
Values.DataType=adtDouble!
Values.DispAttr.Weight=400
Values.DispAttr.FaceName="Arial"
Values.DispAttr.FontCharSet=DefaultCharSet!
Values.DispAttr.FontFamily=Swiss!
Values.DispAttr.FontPitch=Variable!
Values.DispAttr.Alignment=Right!
Values.DispAttr.BackColor=536870912
Values.DispAttr.Format="[General]"
Values.DispAttr.DisplayExpression="value"
Values.DispAttr.AutoSize=true
Values.LabelDispAttr.Weight=400
Values.LabelDispAttr.FaceName="Arial"
Values.LabelDispAttr.FontCharSet=DefaultCharSet!
Values.LabelDispAttr.FontFamily=Swiss!
Values.LabelDispAttr.FontPitch=Variable!
Values.LabelDispAttr.Alignment=Center!
Values.LabelDispAttr.BackColor=536870912
Values.LabelDispAttr.Format="[General]"
Values.LabelDispAttr.DisplayExpression="valuesaxislabel"
Values.LabelDispAttr.AutoSize=true
Values.LabelDispAttr.Escapement=900
Series.Label="(None)"
Series.AutoScale=true
Series.SecondaryLine=transparent!
Series.MajorGridLine=transparent!
Series.MinorGridLine=transparent!
Series.DropLines=transparent!
Series.OriginLine=transparent!
Series.MajorTic=Outside!
Series.DataType=adtText!
Series.DispAttr.Weight=400
Series.DispAttr.FaceName="Arial"
Series.DispAttr.FontCharSet=DefaultCharSet!
Series.DispAttr.FontFamily=Swiss!
Series.DispAttr.FontPitch=Variable!
Series.DispAttr.BackColor=536870912
Series.DispAttr.Format="[General]"
Series.DispAttr.DisplayExpression="series"
Series.DispAttr.AutoSize=true
Series.LabelDispAttr.Weight=400
Series.LabelDispAttr.FaceName="Arial"
Series.LabelDispAttr.FontCharSet=DefaultCharSet!
Series.LabelDispAttr.FontFamily=Swiss!
Series.LabelDispAttr.FontPitch=Variable!
Series.LabelDispAttr.Alignment=Center!
Series.LabelDispAttr.BackColor=536870912
Series.LabelDispAttr.Format="[General]"
Series.LabelDispAttr.DisplayExpression="seriesaxislabel"
Series.LabelDispAttr.AutoSize=true
LegendDispAttr.Weight=400
LegendDispAttr.FaceName="Arial"
LegendDispAttr.FontCharSet=DefaultCharSet!
LegendDispAttr.FontFamily=Swiss!
LegendDispAttr.FontPitch=Variable!
LegendDispAttr.BackColor=536870912
LegendDispAttr.Format="[General]"
LegendDispAttr.DisplayExpression="series"
LegendDispAttr.AutoSize=true
PieDispAttr.Weight=400
PieDispAttr.FaceName="Arial"
PieDispAttr.FontCharSet=DefaultCharSet!
PieDispAttr.FontFamily=Swiss!
PieDispAttr.FontPitch=Variable!
PieDispAttr.BackColor=536870912
PieDispAttr.Format="[General]"
PieDispAttr.DisplayExpression="if(seriescount > 1, series,string(percentofseries,~"0.00%~"))"
PieDispAttr.AutoSize=true
end on

on gr_history.destroy
destroy TitleDispAttr
destroy LegendDispAttr
destroy PieDispAttr
destroy Series.DispAttr
destroy Series.LabelDispAttr
destroy Series
destroy Category.DispAttr
destroy Category.LabelDispAttr
destroy Category
destroy Values.DispAttr
destroy Values.LabelDispAttr
destroy Values
end on

event rbuttondown;long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))

end event

type dw_history from datawindow within tabpage_history
event ue_populate_graph ( )
event ue_retrieve ( )
integer y = 156
integer width = 1454
integer height = 1276
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_history"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event ue_populate_graph();integer li_Series
integer li_Minimum_Series
integer li_Maximum_Series
long ll_Num_Rows
string ls_Reading
dec ld_Reading
dec ld_Minimum
dec ld_Maximum
long ll_Count
long ll_Row
string ls_Minimum
string ls_Maximum
integer li_Return

SetNull(ld_Minimum)
SetNull(ld_Maximum)
gr_history.SetRedraw(FALSE)
gr_history.DeleteSeries("History")
gr_history.DeleteSeries("Minimum")
gr_history.DeleteSeries("Maximum")

ll_Row = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
IF ( ll_Row > 0 ) THEN
	// Plot Minimum
	li_Minimum_Series = gr_history.AddSeries("Minimum")
	gr_history.SetSeriesStyle("Minimum", LineColor!, RGB(0, 0, 255))
	gr_history.SetSeriesStyle("Minimum", Background!, RGB(0, 0, 255))
	gr_history.SetSeriesStyle("Minimum", Foreground!, RGB(0, 0, 255))
	gr_history.SetSeriesStyle("Minimum", Shade!, RGB(0, 0, 255))
//TODO: add each individual min/max point based on the 
// proper revision's min/max or emin/emax
	ls_Minimum = w_tour.tab_tour.tabpage_readings.dw_readings.Object.compute_min[ll_Row]
	IF IsNumber(ls_Minimum) THEN
		ld_Minimum = dec(ls_Minimum)
		ll_Num_Rows = This.RowCount()
		FOR ll_Count = 1 TO ll_Num_rows
			li_Return = gr_history.AddData(li_Minimum_Series, ld_Minimum)
			IF ( li_Return >= 0 ) THEN
				gr_history.SetDataStyle(li_Minimum_Series, li_Return, NoSymbol!)
			END IF
		NEXT
	END IF
	
	// Plot Maximum
	li_Maximum_Series = gr_history.AddSeries("Maximum")
	gr_history.SetSeriesStyle("Maximum", LineColor!, RGB(0, 255, 0))
	gr_history.SetSeriesStyle("Maximum", Background!, RGB(0, 255, 0))
	gr_history.SetSeriesStyle("Maximum", Foreground!, RGB(0, 255, 0))
	gr_history.SetSeriesStyle("Maximum", Shade!, RGB(0, 255, 0))
//TODO: add each individual min/max point based on the 
// proper revision's min/max or emin/emax
	ls_Maximum = w_tour.tab_tour.tabpage_readings.dw_readings.Object.compute_max[ll_Row]
	IF IsNumber(ls_Maximum) THEN
		ld_Maximum = dec(ls_Maximum)
		ll_Num_Rows = This.RowCount()
		FOR ll_Count = 1 TO ll_Num_Rows
			li_Return = gr_history.AddData(li_Maximum_Series, ld_Maximum)
			IF ( li_Return >= 0 ) THEN
				gr_history.SetDataStyle(li_Maximum_Series, li_Return, NoSymbol!)
			END IF
		NEXT
	END IF
END IF

li_Series = gr_history.AddSeries("History")
gr_history.SetSeriesStyle("History", Continuous!, 1)
gr_history.SetSeriesStyle("History", LineColor!, RGB(255, 0, 0))
ll_Num_Rows = This.RowCount()
FOR ll_Count = 1 TO ll_Num_rows
	ls_Reading = This.Object.rd[ll_Count]
	IF IsNumber(ls_Reading) THEN
		ld_Reading = dec(ls_Reading)
		li_Return = gr_history.InsertData(li_Series, ll_Count, ld_Reading)
//		IF ( li_Return >= 0 ) THEN
//			// Set to none
//			li_Return = gr_history.SetDataStyle(li_Series, li_Return, SymbolSolidCircle!)
//			gr_history.SetDataStyle(li_Series, li_Return, Continuous!, 1)
//			// Set to red
//			li_Return = gr_history.SetDataStyle(li_Series, li_Return, Background!, 255)
//		END IF
	ELSE
//		IF NOT IsNull(ld_Minimum) THEN
			// Set to minimum value so as not to skew the graph 
			li_Return = gr_history.InsertData(li_Series, ll_Count, ld_Minimum)
			IF ( li_Return >= 0 ) THEN
				// Set to X
				li_Return = gr_history.SetDataStyle(li_Series, li_Return, SymbolX!)
				// Set to black
				gr_history.SetDataStyle(li_Series, li_Return, Background!, RGB(0, 0, 0))
				gr_history.SetDataStyle(li_Series, li_Return, LineColor!, RGB(0, 0, 0))
				gr_history.SetDataStyle(li_Series, li_Return, Foreground!, RGB(0, 0, 0))
				gr_history.SetDataStyle(li_Series, li_Return, Shade!, RGB(0, 0, 0))
			END IF
//		END IF
	END IF
NEXT

gr_history.SetRedraw(TRUE)

end event

event ue_retrieve();long ll_Row
integer li_Return
string ls_Order_Direction

This.SetRedraw(FALSE)
li_Return = This.SetTransObject(SQLCA)
li_Return = This.Retrieve(gsu_tour_parameters[gi_Current_Tour].Tour_Number, gsu_tour_parameters[gi_Current_Tour].station, gsu_tour_parameters[gi_Current_Tour].rev_no)
CHOOSE CASE is_History_Sort
	CASE Upper(f_LanguageString('ASC', 'Asc')) //'ASC'
		li_Return = dw_history.SetSort('dt A, shift_no A, reading_id A')
		ls_Order_Direction = "ˆ"
	CASE Upper(f_LanguageString('DESC', 'Desc')) //'DESC'
		li_Return = dw_history.SetSort('dt D, shift_no D, reading_id D')
		ls_Order_Direction = "ˇ"
END CHOOSE
li_Return = dw_history.Sort()
This.Object.dt_t.Text = f_LanguageString('DATE', "Date") + ls_Order_Direction
This.Object.shift_no_t.Text = f_LanguageString('SHIFT', "Shift") + ls_Order_Direction

/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//string ls_Error
//ls_Error = This.Modify("dt.EditMask.Mask = '" + Date_Format + "'")
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////

dw_history.EVENT ue_Populate_Graph()

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
IF ( ll_Row > 0 ) THEN
	tab_tour.tabpage_history.st_station_description_history.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row], st_station_description_history.Width, TRUE)
//	tab_tour.tabpage_history.st_station_description_history.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row], UnitsToPixels(st_station_description_history.Width, XUnitsToPixels!), TRUE)
ELSE
	tab_tour.tabpage_history.st_station_description_history.Text = ''
END IF
This.SetRedraw(TRUE)

end event

event rbuttondown;string ls_Column

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
	CASE 'dt_t', 'shift_no_t'
		CHOOSE CASE is_History_Sort
			CASE Upper(f_LanguageString('ASC', 'Asc')) //'ASC'
				is_History_Sort = Upper(f_LanguageString('DESC', 'Desc')) //'DESC'
			CASE Upper(f_LanguageString('DESC', 'Desc')) //'DESC'
				is_History_Sort = Upper(f_LanguageString('ASC', 'Asc')) //'ASC'
		END CHOOSE
		
		This.EVENT ue_Retrieve()
END CHOOSE

This.Event ue_Populate_Graph()

end event

event other;CHOOSE CASE wparam
	CASE 37 // Left arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab > 1 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab - 1
			END IF
		END IF
//	CASE 38 // Up arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(-1, 'dw_history other 38')
	CASE 39 // Right arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab < 7 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab + 1
			END IF
		END IF
//	CASE 40 // Down arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(1, 'dw_history other 40')
	CASE 13, 134
END CHOOSE
end event

type tabpage_multi from userobject within tab_tour
integer x = 18
integer y = 104
integer width = 1431
integer height = 1580
long backcolor = 32567268
string text = "Multi"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
dw_multi dw_multi
st_station_description_multi st_station_description_multi
st_multi st_multi
end type

on tabpage_multi.create
this.dw_multi=create dw_multi
this.st_station_description_multi=create st_station_description_multi
this.st_multi=create st_multi
this.Control[]={this.dw_multi,&
this.st_station_description_multi,&
this.st_multi}
end on

on tabpage_multi.destroy
destroy(this.dw_multi)
destroy(this.st_station_description_multi)
destroy(this.st_multi)
end on

type dw_multi from datawindow within tabpage_multi
event pause ( )
event ue_retrieve ( )
event ue_delete_multi ( )
event ue_popup_menu ( )
event ue_add_multi ( )
string tag = "804"
integer y = 148
integer width = 1454
integer height = 1280
integer taborder = 40
string title = "none"
string dataobject = "d_multi_test"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean hsplitscroll = true
boolean livescroll = true
end type

event pause();Sleep(1)
end event

event ue_retrieve();long ll_Row
long ll_Num_Rows
long ll_Count

This.SetRedraw(FALSE)
IF ( il_Multi_Reading_Allowed = 1 ) THEN
	This.Enabled = TRUE
	This.SetTransObject(SQLCA)
	ll_Num_Rows = This.Retrieve(gsu_tour_parameters[gi_Current_Tour].Tour_Number, gsu_tour_parameters[gi_Current_Tour].rev_no, gsu_tour_parameters[gi_Current_Tour].station, gsu_tour_parameters[gi_Current_Tour].Shift_No, gsu_tour_parameters[gi_Current_Tour].Tour_Date)
	tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Multi_Tabpage()
//	IF ( ll_Num_Rows < 9 ) THEN
//		FOR ll_Count = ll_Num_Rows TO 9
//			ll_Row = This.InsertRow(0)
//		NEXT
//	ELSE
		ll_Row = This.InsertRow(0)
//	END IF
	This.ScrollToRow(ll_Row)
ELSE
	This.Reset()
	This.Enabled = FALSE
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
		MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_MULTI-READING_WAS_UNABLE_TO_BE_DELETED', 'The multi-reading was unable to be deleted'))
	END IF
ELSE
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_MULTI-READING_WAS_UNABLE_TO_BE_DELETED', 'The multi-reading was unable to be deleted'))
END IF
wf_Update_Counts('MULTI', '-1', tab_tour.tabpage_readings.dw_readings.GetRow())
This.EVENT ue_Retrieve()
end event

event ue_popup_menu();mnu_multi_reading popmenu

popmenu = CREATE mnu_multi_reading

mnu_multi_reading.m_copy.Text = f_LanguageString('COPY', 'Copy')
mnu_multi_reading.m_delete.Text = f_LanguageString('DELETE', 'Delete')
mnu_multi_reading.m_edit.Text = f_LanguageString('EDIT', 'Edit')

popmenu.PopMenu(Parent.PointerX(), Parent.PointerY())

DESTROY popmenu
end event

event ue_add_multi();
OpenWithParm(w_multi_reading, 'NEW')
//This.EVENT ue_Retrieve()

wf_Update_Counts('MULTI', '+1', tab_tour.tabpage_readings.dw_readings.GetRow())
end event

event other;CHOOSE CASE wparam
	CASE 37 // Left arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab > 1 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab - 1
			END IF
		END IF
//	CASE 38 // Up arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(-1, 'dw_history other 38')
	CASE 39 // Right arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab < 7 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab + 1
			END IF
		END IF
//	CASE 40 // Down arrow
//		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(1, 'dw_history other 40')
	CASE 13, 134
END CHOOSE
end event

event rbuttondown;integer li_Reading_Id

CHOOSE CASE dwo.Name
	CASE 'datawindow'
	CASE ELSE
		IF ( row > 0 ) THEN
			IF ( dwo.Name = 'history_notes' ) THEN
				OpenWithParm(w_detail, 'Note Detail|' + String(This.Object.history_notes[row]))
//				MessageBox('Note', String(This.Object.history_notes[row]))
			ELSE
				This.SetRow(row)
				li_Reading_Id = This.Object.history_reading_id[row]
				IF NOT IsNull(li_Reading_Id) AND ( li_Reading_Id > 0 ) THEN
					il_Multi_Row = This.GetRow()
					This.PostEvent('ue_Popup_Menu')
				ELSE
					This.PostEvent('ue_Add_Multi')
				END IF
			END IF
		END IF
END CHOOSE
end event

event rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
integer li_Reading_Id

CHOOSE CASE dwo.Name
	CASE 'datawindow'
	CASE ELSE
		IF ( row > 0 ) THEN
			IF ( dwo.Name = 'history_notes' ) THEN
				OpenWithParm(w_detail, 'Note Detail|' + String(This.Object.history_notes[row]))
//				MessageBox('Note', String(This.Object.history_notes[row]))
			ELSE
				This.SetRow(row)
				li_Reading_Id = This.Object.history_reading_id[row]
				IF NOT IsNull(li_Reading_Id) AND ( li_Reading_Id > 0 ) THEN
					il_Multi_Row = This.GetRow()
					This.PostEvent('ue_Popup_Menu')
				ELSE
					This.PostEvent('ue_Add_Multi')
				END IF
			END IF
		END IF
END CHOOSE
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type st_station_description_multi from statictext within tabpage_multi
integer x = 23
integer y = 72
integer width = 1408
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 32567268
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
long bordercolor = 32567268
boolean focusrectangle = false
end type

event rbuttondown;long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))

end event

event getfocus;
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type st_multi from statictext within tabpage_multi
integer x = 23
integer width = 1024
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Multi-Reading"
long bordercolor = 32567268
boolean focusrectangle = false
end type

type tabpage_documents from userobject within tab_tour
event create ( )
event destroy ( )
integer x = 18
integer y = 104
integer width = 1431
integer height = 1580
long backcolor = 32567268
string text = "Docs"
long tabtextcolor = 33554432
long tabbackcolor = 1073741824
long picturemaskcolor = 536870912
ddlb_temp_files ddlb_temp_files
dw_perf_docs dw_perf_docs
st_station_description_docs st_station_description_docs
st_ref_docs st_ref_docs
st_perf_docs st_perf_docs
dw_ref_docs dw_ref_docs
end type

on tabpage_documents.create
this.ddlb_temp_files=create ddlb_temp_files
this.dw_perf_docs=create dw_perf_docs
this.st_station_description_docs=create st_station_description_docs
this.st_ref_docs=create st_ref_docs
this.st_perf_docs=create st_perf_docs
this.dw_ref_docs=create dw_ref_docs
this.Control[]={this.ddlb_temp_files,&
this.dw_perf_docs,&
this.st_station_description_docs,&
this.st_ref_docs,&
this.st_perf_docs,&
this.dw_ref_docs}
end on

on tabpage_documents.destroy
destroy(this.ddlb_temp_files)
destroy(this.dw_perf_docs)
destroy(this.st_station_description_docs)
destroy(this.st_ref_docs)
destroy(this.st_perf_docs)
destroy(this.dw_ref_docs)
end on

type ddlb_temp_files from dropdownlistbox within tabpage_documents
boolean visible = false
integer x = 869
integer y = 528
integer width = 411
integer height = 324
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

type dw_perf_docs from datawindow within tabpage_documents
event pause ( )
event type long ue_retrieve ( )
event ue_add_document ( )
event ue_delete_document ( )
event ue_popup_menu ( )
event ue_extract_document ( boolean ab_open )
event ue_clean_temp_folder ( )
event ue_sort_dw ( string ls_search,  string ls_sub_sort,  integer li_column,  string as_current_order )
string tag = "804"
integer y = 772
integer width = 1454
integer height = 660
integer taborder = 90
string title = "none"
string dataobject = "d_documents"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event pause();Sleep(1)
end event

event type long ue_retrieve();long ll_Num_Rows
long ll_Row

This.SetRedraw(FALSE)
This.SetTransObject(SQLCA)
ll_Num_Rows = This.Retrieve(gsu_tour_parameters[gi_Current_Tour].Tour_Number, gsu_tour_parameters[gi_Current_Tour].rev_no, gsu_tour_parameters[gi_Current_Tour].station, gsu_tour_parameters[gi_Current_Tour].tour_date, gsu_tour_parameters[gi_Current_Tour].shift_no, 1)

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
IF ( ll_Row > 0 ) THEN
	tab_tour.tabpage_documents.st_station_description_docs.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row], st_station_description_docs.Width, TRUE)
ELSE
	tab_tour.tabpage_documents.st_station_description_docs.Text = ''
END IF

ll_Row = This.InsertRow(0)
This.ScrollToRow(ll_Row)
This.SetRedraw(TRUE)

RETURN ll_Num_Rows
end event

event ue_add_document();long ll_Num_Rows

OpenWithParm(w_documents, 'NEW')
//IF gb_Platform_Is_CE THEN
//// Disable the Automatic SIP with the new systemfunction
//	SetRuntimeProperty("AutomaticSIPHandling", FALSE)
//END IF
ll_Num_Rows = This.EVENT ue_Retrieve()
wf_Update_Counts('DOC', String(ll_Num_Rows), tab_tour.tabpage_readings.dw_readings.GetRow())
//tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Documents_Tabpage()
tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Tabpages()

end event

event ue_delete_document();long ll_Row
integer li_Return
pointer l_pointer

//l_pointer = SetPointer(HourGlass!)
ll_Row = This.GetRow()
li_Return = This.DeleteRow(ll_Row)
IF ( li_Return = 1 ) THEN
	li_Return = This.Update()
	IF ( li_Return = 1 ) THEN
		COMMIT ;
		wf_Update_Counts('DOC', '-1', tab_tour.tabpage_readings.dw_readings.GetRow())
	ELSE
		ROLLBACK ;
		MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_PERFORMANCE_DOCUMENT_WAS_UNABLE_TO_BE_DELETED', 'The performance document was unable to be deleted'))
	END IF
ELSE
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THE_PERFORMANCE_DOCUMENT_WAS_UNABLE_TO_BE_DELETED', 'The performance document was unable to be deleted'))
END IF

//This.EVENT ue_Retrieve()
////tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Documents_Tabpage()
//tab_tour.tabpage_readings.dw_readings.EVENT ue_Update_Tabpages()
//SetPointer(l_pointer)
end event

event ue_popup_menu();integer li_Row
integer li_Sta
mnu_documents popmenu

popmenu = CREATE mnu_documents

mnu_documents.m_copy.Text = f_LanguageString('COPY', 'Copy')
mnu_documents.m_delete.Text = f_LanguageString('DELETE', 'Delete')
mnu_documents.m_edit.Text = f_LanguageString('EDIT', 'Edit')
mnu_documents.m_open.Text = f_LanguageString('OPEN', 'Open')

popmenu.Tag = 'PERF'
popmenu.mf_Display()
li_Row = This.GetRow()
li_Sta = This.Object.sta[li_Row]
popmenu.m_edit.Enabled = ( li_Sta = gsu_tour_parameters[gi_Current_Tour].Station )
popmenu.m_delete.Enabled = ( li_Sta = gsu_tour_parameters[gi_Current_Tour].Station )
popmenu.PopMenu(Parent.PointerX(), Parent.PointerY())

DESTROY popmenu
end event

event ue_extract_document(boolean ab_open);integer li_Tour
integer li_Rev_No
date ld_Shift_Date
integer li_Shift_No
integer li_Sta
string ls_Filename
integer li_Return
integer li_Reading_Id
integer li_Document_Number
integer li_Station
string ls_Folder
pointer l_pointer

//l_pointer = SetPointer(HourGlass!)
This.EVENT ue_Clean_Temp_Folder()

li_Reading_Id			= This.Object.reading_id[il_Document_Row]
li_Station				= This.Object.sta[il_Document_Row]
li_Document_Number	= This.Object.document_number[il_Document_Row]
li_Tour					= gsu_tour_parameters[gi_Current_Tour].Tour_Number
//li_Rev_No				= gsu_tour_parameters[gi_Current_Tour].Rev_No
ld_Shift_Date			= gsu_tour_parameters[gi_Current_Tour].Tour_Date
li_Shift_No				= gsu_tour_parameters[gi_Current_Tour].Shift_No
li_Sta					= li_Station //gsu_tour_parameters[gi_Current_Tour].Station

ls_Folder = '\Temp\'
IF ( Right(ls_Folder, 1) <> '\' ) THEN
	ls_Folder = ls_Folder + '\'
END IF

 SELECT document_filename 
	INTO :ls_Filename 
	FROM tour_documents 
  WHERE ( tour = :li_Tour ) 
	 AND ( dt = :ld_Shift_Date ) 
	 AND ( sta = :li_Sta ) 
	 AND ( shift_no = :li_Shift_No ) 
	 AND ( reading_id = :li_Reading_Id ) 
	 AND ( document_number = :li_Document_Number ) ;

IF ( UPPER(LEFT(ls_Filename, 5)) = 'HTTP:' ) THEN
	li_Return = 1
ELSEIF FileExists(ls_Folder + ls_Filename) THEN
	ls_Filename = ls_Folder + ls_Filename
	li_Return = 1
ELSE
	li_Return = f_Blob_To_File(ls_Filename, li_Reading_Id, li_Document_Number, li_Station)
END IF

IF ( li_Return = 1 ) AND ab_Open THEN
	f_Open_File(ls_Filename)
END IF
//SetPointer(l_pointer)
end event

event ue_clean_temp_folder();string ls_Folder
integer li_Total_Items
integer li_Count
string ls_CurrentDir
boolean lb_Return
integer li_Return
string ls_File

ls_CurrentDir = GetCurrentDirectory()
ls_Folder = '/Temp/'
li_Return = ChangeDirectory(ls_Folder)
IF ddlb_temp_files.DirList(ls_Folder + "*.*", 32) THEN
	li_Total_Items = ddlb_temp_files.TotalItems()
	FOR li_Count = 1 TO li_Total_Items
		ls_File = ls_Folder + ddlb_temp_files.Text(li_Count)
		lb_Return = FileDelete(ls_File)
	NEXT
END IF
li_Return = ChangeDirectory(ls_CurrentDir)

end event

event ue_sort_dw(string ls_search, string ls_sub_sort, integer li_column, string as_current_order);string ls_Current_Sort
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

li_Row = This.GetRow()
IF ( li_Row > 0 ) THEN
	ls_New_Order = ' A'
	ls_Order_Direction = "ˆ"
	
	ls_Header_Text[1] = "Description"
	ls_Header_Text[2] = "Filename"
	
	FOR li_Count = 1 TO UpperBound(ls_Header_Text)
		ls_Header_Text[li_Count] = StrTran(ls_Header_Text[li_Count], "'", "~~'")
	NEXT
	
	ls_Column_Name[1] = "document_description_t"
	ls_Column_Name[2] = "document_filename_t"
		
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
	IF NOT Empty(ls_Sub_Sort) THEN
		ls_New_Sort  = ls_New_Sort + ", " + ls_Sub_Sort + " A"
	END IF
	FOR li_Count = 1 TO 2
		ls_Header_Column_Text = ls_Column_Name[li_Count] + ".Text='" + ls_Header_Text[li_Count]
		IF ( li_Count = li_Column ) THEN
			ls_Header_Column_Text = ls_Header_Column_Text +  + " " + ls_Order_Direction
		END IF
		ls_Error = This.Modify(ls_Header_Column_Text + "'")
	NEXT
	integer li_Document_Number
	li_Document_Number = This.Object.document_number[li_Row]
	
	This.SetSort(ls_New_Sort)
	This.Sort()
	li_Row = This.Find(" document_number = " + String(li_Document_Number), 1, This.RowCount() + 1)
	IF ( li_Row > 0 ) THEN
		This.ScrollToRow(li_Row)
	ELSE
		This.ScrollToRow(1)
	END IF
END IF
end event

event other;CHOOSE CASE wparam
	CASE 37 // Left arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab > 1 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab - 1
			END IF
		END IF
	CASE 38 // Up arrow
		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(-1, 'dw_history other 38')
	CASE 39 // Right arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab < 7 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab + 1
			END IF
		END IF
	CASE 40 // Down arrow
		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(1, 'dw_history other 40')
	CASE 13, 134
END CHOOSE
end event

event rbuttondown;integer li_Reading_Id
integer li_document_number
string ls_Sub_Sort
string ls_Search
string ls_Column
integer li_Column
string ls_Equip_Operator_Id

integer li_X
integer li_Column_Left
integer li_Column_Right
integer li_Scroll_Position

This.EVENT Clicked(xpos, ypos, row, dwo)
ls_Column = dwo.Name
IF ( Upper(Right(ls_Column, 2)) <> '_T' ) THEN
	CHOOSE CASE dwo.Name
		CASE 'datawindow'
		CASE ELSE
			IF ( row > 0 ) THEN
				This.SetRow(row)
				li_Reading_Id = This.Object.reading_id[row]
				IF NOT IsNull(li_Reading_Id) THEN
					il_Document_Row = This.GetRow()
					This.Event ue_Popup_Menu()
				ELSE
					IF ( guo_user.Is_Granted('OR' + f_PadL(String(gsu_tour_parameters[gi_Current_Tour].Tour_Number), 3, '0'), 22) > 0 ) THEN
						This.PostEvent('ue_Add_Document')
					ELSE
						MessageBox(f_LanguageString('WARNING', 'Warning'), f_LanguageString('YOU_DO_NOT_HAVE_THE_PROPER_SECURITY_RIGHT_TO_ADD_A_PERFORMANCE_DOCUMENT.', 'You do not have the proper security right to add a performance document.'))
					END IF
				END IF
			END IF
	END CHOOSE
ELSE
	// Sort the dw by the column header just clicked
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
	CHOOSE CASE ls_Column
		CASE 'document_description_t'
			ls_Search = "document_description"
			ls_Sub_Sort = ""
			li_Column = 1
		CASE 'document_filename_t'
			ls_Search = "document_filename"
			ls_Sub_Sort = ""
			li_Column = 2
		CASE 'datawindow'
			// do nothing
	END CHOOSE
	
	IF NOT Empty(ls_Search) THEN
		This.EVENT ue_Sort_DW(ls_Search, ls_Sub_Sort, li_Column, '')
	END IF
END IF

end event

event rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)
end event

event clicked;This.EVENT RowFocusChanged(row)

/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
integer li_Reading_Id
integer li_document_number
string ls_Sub_Sort
string ls_Search
string ls_Column
integer li_Column
string ls_Equip_Operator_Id

integer li_X
integer li_Column_Left
integer li_Column_Right
integer li_Scroll_Position

ls_Column = dwo.Name
IF ( Upper(Right(ls_Column, 2)) <> '_T' ) THEN
	CHOOSE CASE dwo.Name
		CASE 'datawindow'
		CASE ELSE
			IF ( row > 0 ) THEN
				This.SetRow(row)
				li_Reading_Id = This.Object.reading_id[row]
				IF NOT IsNull(li_Reading_Id) THEN
					il_Document_Row = This.GetRow()
					This.Event ue_Popup_Menu()
				ELSE
					IF ( guo_user.Is_Granted('OR' + f_PadL(String(gsu_tour_parameters[gi_Current_Tour].Tour_Number), 3, '0'), 22) > 0 ) THEN
						This.PostEvent('ue_Add_Document')
					ELSE
						MessageBox(f_LanguageString('WARNING', 'Warning'), f_LanguageString('YOU_DO_NOT_HAVE_THE_PROPER_SECURITY_RIGHT_TO_ADD_A_PERFORMANCE_DOCUMENT.', 'You do not have the proper security right to add a performance document.'))
					END IF
				END IF
			END IF
	END CHOOSE
ELSE
	// Sort the dw by the column header just clicked
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
	CHOOSE CASE ls_Column
		CASE 'document_description_t'
			ls_Search = "document_description"
			ls_Sub_Sort = ""
			li_Column = 1
		CASE 'document_filename_t'
			ls_Search = "document_filename"
			ls_Sub_Sort = ""
			li_Column = 2
		CASE 'datawindow'
			// do nothing
	END CHOOSE
	
	IF NOT Empty(ls_Search) THEN
		This.EVENT ue_Sort_DW(ls_Search, ls_Sub_Sort, li_Column, '')
	END IF
END IF
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

type st_station_description_docs from statictext within tabpage_documents
integer x = 18
integer y = 8
integer width = 1408
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 32567268
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
end type

event rbuttondown;long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))

end event

event getfocus;

end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
long ll_Row

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row]))
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////

end event

type st_ref_docs from statictext within tabpage_documents
integer x = 18
integer y = 80
integer width = 1024
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Reference Docs:"
boolean focusrectangle = false
end type

type st_perf_docs from statictext within tabpage_documents
integer x = 18
integer y = 692
integer width = 1024
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Performance Docs:"
boolean focusrectangle = false
end type

type dw_ref_docs from datawindow within tabpage_documents
event pause ( )
event ue_retrieve ( )
event ue_popup_menu ( )
event ue_extract_document ( )
event ue_sort_dw ( string ls_search,  string ls_sub_sort,  integer li_column,  string as_current_order )
event ue_clean_temp_folder ( )
string tag = "804"
integer y = 160
integer width = 1454
integer height = 536
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_rev_documents"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event pause();Sleep(1)
end event

event ue_retrieve();long ll_Num_Rows
long ll_Row

This.SetRedraw(FALSE)
This.SetTransObject(SQLCA)
ll_Num_Rows = This.Retrieve(gsu_tour_parameters[gi_Current_Tour].Tour_Number, gsu_tour_parameters[gi_Current_Tour].rev_no, gsu_tour_parameters[gi_Current_Tour].station)

ll_Row = tab_tour.tabpage_readings.dw_readings.GetRow()
IF ( ll_Row > 0 ) THEN
	tab_tour.tabpage_documents.st_station_description_docs.Text = f_Ellipsis(tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row], st_station_description_docs.Width, TRUE)
ELSE
	tab_tour.tabpage_documents.st_station_description_docs.Text = ''
END IF
This.SetRedraw(TRUE)

end event

event ue_popup_menu();mnu_documents popmenu

popmenu = CREATE mnu_documents

mnu_documents.m_copy.Text = f_LanguageString('COPY', 'Copy')
mnu_documents.m_delete.Text = f_LanguageString('DELETE', 'Delete')
mnu_documents.m_edit.Text = f_LanguageString('EDIT', 'Edit')
mnu_documents.m_open.Text = f_LanguageString('OPEN', 'Open')

popmenu.Tag = 'REV'
popmenu.mf_Display()
popmenu.PopMenu(Parent.PointerX(), Parent.PointerY())

DESTROY popmenu
end event

event ue_extract_document();integer li_Document_Number
integer li_Tour
integer li_Rev_No
integer li_Sta
string ls_Folder
string ls_Filename
integer li_Return
pointer l_pointer

//l_pointer = SetPointer(HourGlass!)
This.EVENT ue_Clean_Temp_Folder()

ls_Folder = '\Temp\'
IF ( Right(ls_Folder, 1) <> '\' ) THEN
	ls_Folder = ls_Folder + '\'
END IF
li_Document_Number	= This.Object.document_number[il_Document_Row]
li_Tour					= gsu_tour_parameters[gi_Current_Tour].Tour_Number
li_Rev_No				= gsu_tour_parameters[gi_Current_Tour].Rev_No
li_Sta					= This.Object.sta[il_Document_Row]

 SELECT document_filename 
	INTO :ls_Filename 
	FROM revision_documents 
  WHERE ( tour = :li_Tour ) 
	 AND ( rev_no = :li_Rev_No ) 
	 AND ( sta = :li_Sta ) 
	 AND ( document_number = :li_Document_Number ) ;

IF ( UPPER(LEFT(ls_Filename, 5)) = 'HTTP:' ) THEN
	li_Return = 1
ELSEIF FileExists(ls_Folder + ls_Filename) THEN
	ls_Filename = ls_Folder + ls_Filename
	li_Return = 1
ELSE
	li_Return = f_Rev_Blob_To_File(ls_Filename, li_Sta, li_Document_Number)
END IF

IF ( li_Return = 1 ) THEN
	f_Open_File(ls_Filename)
END IF
//SetPointer(l_pointer)
end event

event ue_sort_dw(string ls_search, string ls_sub_sort, integer li_column, string as_current_order);string ls_Current_Sort
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

li_Row = This.GetRow()
IF ( li_Row > 0 ) THEN
	ls_New_Order = ' A'
	ls_Order_Direction = "ˆ"
	
	ls_Header_Text[1] = "Description"
	ls_Header_Text[2] = "Filename"
	
	FOR li_Count = 1 TO UpperBound(ls_Header_Text)
		ls_Header_Text[li_Count] = StrTran(ls_Header_Text[li_Count], "'", "~~'")
	NEXT
	
	ls_Column_Name[1] = "document_description_t"
	ls_Column_Name[2] = "document_filename_t"
		
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
	IF NOT Empty(ls_Sub_Sort) THEN
		ls_New_Sort  = ls_New_Sort + ", " + ls_Sub_Sort + " A"
	END IF
	FOR li_Count = 1 TO 2
		ls_Header_Column_Text = ls_Column_Name[li_Count] + ".Text='" + ls_Header_Text[li_Count]
		IF ( li_Count = li_Column ) THEN
			ls_Header_Column_Text = ls_Header_Column_Text +  + " " + ls_Order_Direction
		END IF
		ls_Error = This.Modify(ls_Header_Column_Text + "'")
	NEXT
	integer li_Document_Number
	li_Document_Number = This.Object.document_number[li_Row]
	
	This.SetSort(ls_New_Sort)
	This.Sort()
	li_Row = This.Find(" document_number = " + String(li_Document_Number), 1, This.RowCount() + 1)
	IF ( li_Row > 0 ) THEN
		This.ScrollToRow(li_Row)
	ELSE
		This.ScrollToRow(1)
	END IF
END IF
end event

event ue_clean_temp_folder();string ls_Folder
integer li_Total_Items
integer li_Count
string ls_CurrentDir
boolean lb_Return
integer li_Return
string ls_File

ls_CurrentDir = GetCurrentDirectory()
ls_Folder = '/Temp/'
li_Return = ChangeDirectory(ls_Folder)
IF ddlb_temp_files.DirList(ls_Folder + "*.*", 32) THEN
	li_Total_Items = ddlb_temp_files.TotalItems()
	FOR li_Count = 1 TO li_Total_Items
		ls_File = ls_Folder + ddlb_temp_files.Text(li_Count)
		lb_Return = FileDelete(ls_File)
	NEXT
END IF
li_Return = ChangeDirectory(ls_CurrentDir)

end event

event other;CHOOSE CASE wparam
	CASE 37 // Left arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab > 1 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab - 1
			END IF
		END IF
	CASE 38 // Up arrow
		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(-1, 'dw_history other 38')
	CASE 39 // Right arrow
		IF ib_Changed_Tabs THEN
			ib_Changed_Tabs = FALSE
		ELSE
			IF ( tab_tour.SelectedTab < 7 ) THEN
				tab_tour.SelectedTab = tab_tour.SelectedTab + 1
			END IF
		END IF
	CASE 40 // Down arrow
		tab_tour.tabpage_readings.dw_readings.EVENT ue_Navigate_To_Row(1, 'dw_history other 40')
	CASE 13, 134
END CHOOSE
end event

event rbuttondown;string ls_Sub_Sort
string ls_Search
string ls_Column
integer li_Column
string ls_Equip_Operator_Id

integer li_X
integer li_Column_Left
integer li_Column_Right
integer li_Scroll_Position

ls_Column = dwo.Name
IF ( Upper(Right(ls_Column, 2)) <> '_T' ) THEN
	CHOOSE CASE dwo.Name
		CASE 'datawindow'
		CASE ELSE
			IF ( row > 0 ) THEN
				This.SetRow(row)
				il_Document_Row = This.GetRow()
				This.PostEvent('ue_Extract_Document')
			END IF
	END CHOOSE
ELSE
	// Sort the dw by the column header just clicked
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
	CHOOSE CASE ls_Column
		CASE 'document_description_t'
			ls_Search = "document_description"
			ls_Sub_Sort = ""
			li_Column = 1
		CASE 'document_filename_t'
			ls_Search = "document_filename"
			ls_Sub_Sort = ""
			li_Column = 2
		CASE 'datawindow'
			// do nothing
	END CHOOSE
	
	IF NOT Empty(ls_Search) THEN
		This.EVENT ue_Sort_DW(ls_Search, ls_Sub_Sort, li_Column, '')
	END IF
END IF

end event

event rowfocuschanged;This.SelectRow(0, FALSE)
This.SelectRow(currentrow, TRUE)
end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
string ls_Sub_Sort
string ls_Search
string ls_Column
integer li_Column
string ls_Equip_Operator_Id

integer li_X
integer li_Column_Left
integer li_Column_Right
integer li_Scroll_Position

ls_Column = dwo.Name
IF ( Upper(Right(ls_Column, 2)) <> '_T' ) THEN
	CHOOSE CASE dwo.Name
		CASE 'datawindow'
		CASE ELSE
			IF ( row > 0 ) THEN
				This.SetRow(row)
				il_Document_Row = This.GetRow()
				This.PostEvent('ue_Extract_Document')
			END IF
	END CHOOSE
ELSE
	// Sort the dw by the column header just clicked
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
	CHOOSE CASE ls_Column
		CASE 'document_description_t'
			ls_Search = "document_description"
			ls_Sub_Sort = ""
			li_Column = 1
		CASE 'document_filename_t'
			ls_Search = "document_filename"
			ls_Sub_Sort = ""
			li_Column = 2
		CASE 'datawindow'
			// do nothing
	END CHOOSE
	
	IF NOT Empty(ls_Search) THEN
		This.EVENT ue_Sort_DW(ls_Search, ls_Sub_Sort, li_Column, '')
	END IF
END IF
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

