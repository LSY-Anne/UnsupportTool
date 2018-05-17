$PBExportHeader$w_multi_reading.srw
forward
global type w_multi_reading from window
end type
type dw_2 from datawindow within w_multi_reading
end type
type dw_1 from datawindow within w_multi_reading
end type
type ddlb_notes from dropdownlistbox within w_multi_reading
end type
type st_station_description from statictext within w_multi_reading
end type
type st_notes from statictext within w_multi_reading
end type
type mle_notes from multilineedit within w_multi_reading
end type
type em_date from editmask within w_multi_reading
end type
type st_date from statictext within w_multi_reading
end type
type ddlb_reading from dropdownlistbox within w_multi_reading
end type
type cb_cancel from commandbutton within w_multi_reading
end type
type cb_ok from commandbutton within w_multi_reading
end type
type cb_timer from commandbutton within w_multi_reading
end type
type st_multi_readings from statictext within w_multi_reading
end type
type st_reading from statictext within w_multi_reading
end type
type pb_date from picturebutton within w_multi_reading
end type
end forward

global type w_multi_reading from window
string tag = "1280"
integer width = 1097
integer height = 1280
boolean titlebar = true
string menuname = "mnu_blank"
boolean controlmenu = true
boolean vscrollbar = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
boolean contexthelp = true
event ue_copy_multi ( )
event ue_edit_multi ( )
event ue_load_quick_keys ( )
event post_open ( )
event ue_load_quick_notes ( )
dw_2 dw_2
dw_1 dw_1
ddlb_notes ddlb_notes
st_station_description st_station_description
st_notes st_notes
mle_notes mle_notes
em_date em_date
st_date st_date
ddlb_reading ddlb_reading
cb_cancel cb_cancel
cb_ok cb_ok
cb_timer cb_timer
st_multi_readings st_multi_readings
st_reading st_reading
pb_date pb_date
end type
global w_multi_reading w_multi_reading

type variables
integer		ii_Alert_Notify

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
end variables

forward prototypes
public subroutine wf_update_alert_acceptance ()
public function integer wf_show_warnings ()
public function integer wf_evaluate_alerts (boolean ab_display_message)
end prototypes

event ue_copy_multi();ddlb_reading.Text = String(w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_rd[il_Row])
em_date.Text = String(w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_cdt[il_Row], Date_Format + ' hh:mm:ss')
mle_notes.Text = String(w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_notes[il_Row])
end event

event ue_edit_multi();ddlb_reading.Text = String(w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_rd[il_Row])
em_date.Text = String(w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_cdt[il_Row], Date_Format + ' hh:mm:ss')
mle_notes.Text = String(w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_notes[il_Row])

end event

event ue_load_quick_keys();long ll_Num_Rows
long ll_Count
integer li_Return

li_Return = ddlb_reading.Reset()

datastore lds_temp
lds_temp = CREATE datastore
lds_temp.DataObject = 'dddw_quick'
li_Return = lds_temp.SetTransObject(SQLCA)
ll_Num_Rows = lds_temp.Retrieve(li_tour, li_Rev_No, li_Sta)
FOR ll_Count = 1 TO ll_Num_Rows
	ls_Reading = lds_temp.GetItemString(ll_Count, 1)
	li_Return = ddlb_reading.AddItem(ls_Reading)
NEXT
DESTROY lds_temp
end event

event post_open();w_tour.Visible = FALSE
This.EVENT ue_Load_Quick_Keys()
IF ib_Edit_Multi THEN
	This.EVENT ue_Edit_Multi()
ELSEIF ib_New_Multi THEN
	// Normal window open
	em_date.Text = String(Now(), Date_Format + ' hh:mm:ss')
ELSE
	This.EVENT ue_Copy_Multi()
END IF
ddlb_reading.Post SetFocus()

end event

event ue_load_quick_notes();datastore lds_temp
string ls_Sql
long ll_Num_Rows
long ll_Count
string ls_Note_Desc

lds_temp = CREATE datastore

// Load quick notes
ls_Sql = " &
SELECT note_desc &
  FROM quick_notes &
 WHERE ( tour = " + string(gsu_tour_parameters[gi_Current_Tour].tour_number) + " ) &
	AND ( rev_no = " + string(gsu_tour_parameters[gi_Current_Tour].rev_no) + " ) &
	AND ( sta = " + string(gsu_tour_parameters[gi_Current_Tour].station) + " ) &
ORDER BY note_desc "
		
ddlb_notes.Reset()
ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
FOR ll_Count = 1 TO ll_Num_Rows
	ls_Note_Desc = lds_temp.GetItemString(ll_Count, 1)
	ddlb_notes.AddItem(ls_Note_Desc)
NEXT

lds_temp.Reset()
DESTROY lds_temp


end event

public subroutine wf_update_alert_acceptance ();string ls_Sql
integer li_Count
boolean lb_Commit

lb_Commit = TRUE

// Remove all existing alert acceptances before continuing.
// The idea is that the user cannot move off of the station
// until they accept the reading which will always leave
// the OOS/OOT and alert acceptances in the proper status

IF ( UpperBound(iuo_Alert) > 0 ) THEN
//	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	DELETE FROM alert_accept 
	WHERE ( tour = :iuo_alert[1].Tour ) 
	  AND ( rev_no = :iuo_alert[1].Rev_No ) 
	  AND ( sta = :iuo_alert[1].Sta ) 
	  AND ( dt = :iuo_alert[1].dt ) 
	  AND ( shift_no = :iuo_alert[1].Shift_No ) 
	  AND ( reading_id = :li_Reading_Id ) ;

//	ls_Sql = 'START SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
END IF
FOR li_Count = 1 TO UpperBound(iuo_Alert)
					
	INSERT INTO alert_accept 
	       ( tour, rev_no, sta, dt, shift_no, reading_id, alert_id, user_id, accept_dt ) 
	VALUES ( :iuo_alert[li_Count].Tour, 
				:iuo_alert[li_Count].Rev_No, 
				:iuo_alert[li_Count].Sta, 
				:iuo_alert[li_Count].dt, 
				:iuo_alert[li_Count].Shift_No, 
				:li_Reading_Id, 
				:iuo_alert[li_Count].Alert_Id, 
				:guo_user.ID, 
				:iuo_alert[li_Count].DateTime ) ;
							
	IF ( SQLCA.SQLCode = 0 ) THEN
		lb_Commit = TRUE
	ELSE
		lb_Commit = FALSE
		EXIT
	END IF
NEXT

IF lb_Commit THEN
	COMMIT ;
ELSE
	ROLLBACK ;
END IF
end subroutine

public function integer wf_show_warnings ();string ls_MB_String
string ls_Return
string ls_Min
string ls_Max
string ls_Tol
integer li_Return
string ls_Message
boolean 	lb_Display
integer li_Quick_Key_Exists
boolean lb_Expression_OOS_OOT
string ls_Station
long ll_Row
integer li_Less_Than
integer li_Greater_Than
long ll_Num_Rows

dw_1.SetTransObject(SQLCA)
ll_Num_Rows = dw_1.Retrieve(li_Tour, li_Rev_No, li_Shift_No, ld_Shift_Date, li_Sta)

li_Return = 1
ll_Row = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
li_OOS = 0
li_OOT = 0
ls_Station = String(li_Sta)
IF Empty(ls_Reading) THEN
	ls_Reading = ''
END IF

IF NOT Empty(ls_Reading) THEN
	// Check for quick key OOS 
	integer li_Check_OOS_For_Quick_Key
	integer li_Row_Returned
			
	// The sub-select below is necessary because the normal SELECT returns zero even if there is no record
	// and the SQLNRows started returning -11 for some reason
			
  SELECT spec_setting, 
         ( SELECT COUNT(*) FROM quick_keys WHERE ( tour = :li_Tour ) AND ( rev_no = :li_Rev_No ) AND ( sta = :li_Sta ) AND ( reading = :ls_Reading ) ) 
    INTO :li_Check_OOS_For_Quick_Key, :li_Row_Returned
    FROM quick_keys 
   WHERE ( tour = :li_Tour ) 
     AND ( rev_no = :li_Rev_No ) 
     AND ( sta = :li_Sta ) 
     AND ( reading = :ls_Reading ) 
	USING SQLCA ;

	IF ( li_Check_OOS_For_Quick_Key = 0 ) AND ( li_Row_Returned > 0 ) THEN
		li_OOS = 0
		li_OOT = 0
	ELSE
		ls_Min = dw_1.Object.compute_min[1]
		ls_Max = dw_1.Object.compute_max[1]
		ls_Tol = dw_1.Object.compute_tol[1]
		li_Less_Than = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_less_than[ll_Row]
		li_Greater_Than = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_greater_than[ll_Row]
		li_OOS = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
		// The "OOT * 2" below is for the CASE below to 
		// determine if OOS, OOT or both are present
		li_OOT = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
		li_Return = 1
		CHOOSE CASE li_OOS + li_OOT
			CASE 0
				// No message, everything is good
			CASE 1
//				ls_Message = "Accept this reading?~n~r Min: "
//				ls_Message = ls_Message + ls_Min + "~n~r"
//				ls_Message = ls_Message + "  Rd: "
//				ls_Message = ls_Message + ls_Reading + "~n~r"
//				ls_Message = ls_Message + "Max: "
//				ls_Message = ls_Message + ls_Max
				ls_Message = f_LanguageString('ACCEPT_THIS_READING?', "Accept this reading?") + '~n~r' + f_LanguageString('MIN', "Min") + ': '
				ls_Message = ls_Message + ls_Min + "~n~r"
				ls_Message = ls_Message + "  " + f_LanguageString('RD', "Rd") + ": "
				ls_Message = ls_Message + ls_Reading + "~n~r"
				ls_Message = ls_Message + "  " + f_LanguageString('MAX', "Max") + ": "
				ls_Message = ls_Message + ls_Max
//				li_Return = MessageBox("Reading Out-Of-Spec", "Rec: " + String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
				ls_MB_String = f_LanguageString('REC:_###', "Rec: ###")
				ls_MB_String = StrTran(ls_MB_String, '###', String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row])) + '~n~r' + ls_Message
				li_Return = MessageBox(f_LanguageString('READING_OUT_OF_SPEC', "Reading Out-Of-Spec"), ls_MB_String, Question!, YesNo!)
			CASE 2
//				ls_Message = "Accept this reading?~n~r  Rd: "
//				ls_Message = ls_Message + ls_Reading
//				li_Return = MessageBox("Reading Out-of-Tolerance", "Rec: " + String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
				ls_Message = f_LanguageString('ACCEPT_THIS_READING?', "Accept this reading?") + '~n~r' + f_LanguageString('RD', "Rd") + ' '
				ls_Message = ls_Message + ls_Reading
				ls_MB_String = f_LanguageString('REC:_###', "Rec: ###")
				ls_MB_String = StrTran(ls_MB_String, '###', String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row])) + '~n~r' + ls_Message
				li_Return = MessageBox(f_LanguageString('READING_OUT_OF_TOLERANCE', "Reading Out-of-Tolerance"), ls_MB_String, Question!, YesNo!)
			CASE 3
//				ls_Message = "Accept this reading?~n~rMin: "
//				ls_Message = ls_Message + ls_Min + "~n~r"
//				ls_Message = ls_Message + "  Rd: "
//				ls_Message = ls_Message + ls_Reading + "~n~r"
//				ls_Message = ls_Message + "Max: "
//				ls_Message = ls_Message + ls_Max
				ls_Message = f_LanguageString('ACCEPT_THIS_READING?', "Accept this reading?") + '~n~r' + f_LanguageString('MIN', "Min") + ': '
				ls_Message = ls_Message + ls_Min + "~n~r"
				ls_Message = ls_Message + "  " + f_LanguageString('RD', "Rd") + ": "
				ls_Message = ls_Message + ls_Reading + "~n~r"
				ls_Message = ls_Message + "  " + f_LanguageString('MAX', "Max") + ": "
				ls_Message = ls_Message + ls_Max
//				li_Return = MessageBox("Reading OOS & OOT", "Rec: " + String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
				ls_MB_String = f_LanguageString('REC:_###', "Rec: ###")
				ls_MB_String = StrTran(ls_MB_String, '###', String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row])) + '~n~r' + ls_Message
				li_Return = MessageBox(f_LanguageString('READING_OOS_&_OOT', "Reading OOS & OOT"), ls_MB_String, Question!, YesNo!)
		END CHOOSE
		IF ( li_Return = 1 ) OR ( li_OOS + li_OOT = 0 ) THEN
			li_Return = wf_Evaluate_Alerts(TRUE)
			IF ( li_Return = 1 ) THEN
				li_OOS = li_OOS
				li_OOT = li_OOT / 2
			END IF
		END IF
	END IF
END IF

RETURN li_Return

//string ls_Return
//string ls_Min
//string ls_Max
//string ls_Tol
//integer li_Return
//string ls_Message
//boolean 	lb_Display
//integer li_Quick_Key_Exists
//string ls_emin, ls_emax, ls_etol, ls_erd
//boolean lb_Expression_OOS_OOT
//string ls_Station
//long ll_Row
//integer li_Less_Than
//integer li_Greater_Than
//
//li_Return = 1
//ll_Row = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()
//li_OOS = 0
//li_OOT = 0
//ls_Station = String(li_Sta)
//IF Empty(ls_Reading) THEN
//	ls_Reading = ''
//END IF
//ls_Emin = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_emin[ll_Row]
//IF Empty(ls_Emin) THEN
//	ls_Emin = ''
//ELSE
//	ls_Emin = StrTran(ls_Emin, "'", '"')
//	ls_Emin = f_Purge_Spaces(ls_Emin)
//END IF
//ls_Emax = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_emax[ll_Row]
//IF Empty(ls_Emax) THEN
//	ls_Emax = ''
//ELSE
//	ls_Emax = StrTran(ls_Emax, "'", '"')
//	ls_Emax = f_Purge_Spaces(ls_Emax)
//END IF
//ls_Etol = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_etol[ll_Row]
//IF Empty(ls_Etol) THEN
//	ls_Etol = ''
//ELSE
//	ls_Etol = StrTran(ls_Etol, "'", '"')
//	ls_Etol = f_Purge_Spaces(ls_Etol)
//END IF
//
//ls_erd = w_tour.tab_tour.tabpage_readings.dw_readings.GetItemString(ll_Row, "station_erd")
//
//ls_Emin = StrTran(Upper(ls_Emin), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//ls_Emax = StrTran(Upper(ls_Emax), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//ls_Etol = StrTran(Upper(ls_Etol), 'STA(' + ls_Station + ')', '"' + ls_Reading + '"')
//
////lb_Expression_OOS_OOT = NOT Empty(ls_emin) OR NOT Empty(ls_emax) OR NOT Empty(ls_etol) OR NOT Empty(ls_erd) 
////IF lb_Expression_OOS_OOT THEN
//	IF NOT Empty(ls_Reading) THEN
//		// Check for quick key OOS 
//		integer li_Check_OOS_For_Quick_Key
//		integer li_Row_Returned
//			
//		// The sub-select below is necessary because the normal SELECT returns zero even if there is no record
//		// and the SQLNRows started returning -11 for some reason
//			
//		SELECT spec_setting, 
//			  ( SELECT COUNT(*) FROM quick_keys WHERE ( tour = :li_Tour ) AND ( rev_no = :li_Rev_No ) AND ( sta = :li_Sta ) AND ( reading = :ls_Reading ) ) 
//		  INTO :li_Check_OOS_For_Quick_Key, :li_Row_Returned
//		  FROM quick_keys 
//		 WHERE ( tour = :li_Tour ) 
//           AND ( rev_no = :li_Rev_No ) 
//           AND ( sta = :li_Sta ) 
//           AND ( reading = :ls_Reading ) 
//		USING SQLCA ;
//
//		IF ( li_Check_OOS_For_Quick_Key = 0 ) AND ( li_Row_Returned > 0 ) THEN
//			li_OOS = 0
//			li_OOT = 0
//		ELSE
//			IF NOT Empty(ls_EMin) THEN
//				ls_Min = "Evaluate('" + ls_EMin + "', 0)"
//				ls_Min = w_tour.ids_evaluate.Describe(ls_Min)
//			ELSE
//				ls_Min = w_tour.tab_tour.tabpage_readings.dw_readings.Object.compute_min[ll_Row]
//			END IF
//			IF NOT Empty(ls_EMax) THEN
//				ls_Max = "Evaluate('" + ls_EMax + "', 0)"
//				ls_Max = w_tour.ids_evaluate.Describe(ls_Max)
//			ELSE
//				ls_Max = w_tour.tab_tour.tabpage_readings.dw_readings.Object.compute_max[ll_Row]
//			END IF
//			IF NOT Empty(ls_etol) THEN
//				ls_Tol = "Evaluate('" + ls_Etol + "', 0)"
//				ls_Tol = w_tour.ids_evaluate.Describe(ls_Tol)
//			ELSE
//				ls_Tol = w_tour.tab_tour.tabpage_readings.dw_readings.Object.compute_tol[ll_Row]
//			END IF
//			li_Less_Than = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_less_than[ll_Row]
//			li_Greater_Than = w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_greater_than[ll_Row]
//			li_OOS = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Check_OOS(ls_Reading, ls_Min, ls_Max, li_Less_Than, li_Greater_Than)
//			// The "OOT * 2" below is for the CASE below to 
//			// determine if OOS, OOT or both are present
//			li_OOT = w_tour.tab_tour.tabpage_readings.dw_readings.EVENT ue_Check_OOT(ll_Row, ls_Tol) * 2
//			li_Return = 1
//			CHOOSE CASE li_OOS + li_OOT
//				CASE 0
//					// No message, everything is good
//				CASE 1
//					ls_Message = "Accept this reading?~n~r Min: "
//					ls_Message = ls_Message + ls_Min + "~n~r"
//					ls_Message = ls_Message + "  Rd: "
//					ls_Message = ls_Message + ls_Reading + "~n~r"
//					ls_Message = ls_Message + "Max: "
//					ls_Message = ls_Message + ls_Max
//					li_Return = MessageBox("Reading Out-Of-Spec", "Sta: " + String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
//				CASE 2
//					ls_Message = "Accept this reading?~n~r  Rd: "
//					ls_Message = ls_Message + ls_Reading
//					li_Return = MessageBox("Reading Out-of-Tolerance", "Sta: " + String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
//				CASE 3
//					ls_Message = "Accept this reading?~n~rMin: "
//					ls_Message = ls_Message + ls_Min + "~n~r"
//					ls_Message = ls_Message + "  Rd: "
//					ls_Message = ls_Message + ls_Reading + "~n~r"
//					ls_Message = ls_Message + "Max: "
//					ls_Message = ls_Message + ls_Max
//					li_Return = MessageBox("Reading OOS & OOT", "Sta: " + String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.history_sta[ll_Row]) + "~n~r" + ls_Message, Question!, YesNo!)
//			END CHOOSE
//			IF ( li_Return = 1 ) OR ( li_OOS + li_OOT = 0 ) THEN
//				li_Return = wf_Evaluate_Alerts(TRUE)
//				IF ( li_Return = 1 ) THEN
//					li_OOS = li_OOS
//					li_OOT = li_OOT / 2
//				END IF
//			END IF
//		END IF
//	END IF
////END IF
//
//RETURN li_Return
end function

public function integer wf_evaluate_alerts (boolean ab_display_message);string ls_Tol
string ls_Min
string ls_Max
string ls_Spec
string ls_OOT
string ls_CD
string ls_SD
string ls_ND
string ls_Alert
string ls_Error
integer li_Count
integer li_Num_rows
integer li_Return
boolean lb_Alert
string ls_Ealert
string ls_Alert_Text
string ls_Alert_Description
string ls_Alert_Expression
long ll_Alert_Color
integer li_Alert_Id
string ls_Message
integer li_Count_2
string ls_Tour_Alert_Description

IF Empty(ls_Reading) THEN
	li_Return = 1
ELSE
	li_tour = gsu_tour_parameters[gi_Current_tour].Tour_Number
	li_Sta = gsu_tour_parameters[gi_Current_tour].Station
	li_Rev_No = gsu_tour_parameters[gi_Current_tour].Rev_No

	SELECT alert_description 
	  INTO :ls_Tour_Alert_Description
	  FROM tour 
	 WHERE ( tour = :li_Tour ) 
	   AND ( rev_no = :li_Rev_No ) ;
		
	IF Empty(ls_Tour_Alert_Description) THEN
		ls_Tour_Alert_Description = 'Alert'
	END IF

	dw_2.SetTransObject(SQLCA)
	li_Num_Rows = dw_2.Retrieve(li_Tour, li_Rev_No, li_Sta)
	ls_Tol = dw_1.Object.compute_tol[1]
	ls_Max = dw_1.Object.compute_max[1]
	ls_Min = dw_1.Object.compute_min[1]

	ls_Spec = String(li_OOS)
	CHOOSE CASE ls_Spec
		CASE '1'
			ls_Spec = 'YES'
		CASE '0'
			ls_Spec = 'NO'
	END CHOOSE
	ls_OOT = String(li_OOT/2)
	CHOOSE CASE ls_OOT
		CASE '1'
			ls_OOT = 'YES'
		CASE '0'
			ls_OOT = 'NO'
	END CHOOSE
	ls_CD = String(DateTime(ldt_DateTime), "mm-dd-yyyy hh:mm:ss")
	string ls_normal_start_time
	long ll_normal_start_day
	
	  SELECT normal_start_time, 
				normal_start_day 
		 INTO :ls_normal_start_time, 
				:ll_normal_start_day 
		 FROM shift_time 
		WHERE ( tour = :li_Tour ) 
		  AND ( rev_no = :li_rev_no ) 
		  AND ( shift_no = :li_shift_no ) ;
	
	ls_SD = String(ld_shift_date, date_format)
	ls_ND = String(RelativeDate(Date(ld_Shift_Date),  ll_normal_start_day  ),date_format)+" " + ls_normal_start_time
// This loop is because the current reading hasn't been punched into the database
	FOR li_Count = 1 TO li_Num_Rows
		ls_Ealert = dw_2.Object.alert_expression[li_Count]
		ls_Ealert = StrTran(ls_Ealert, "'", '"')
		ls_Ealert = f_Purge_Spaces(ls_Ealert)
		ls_Ealert = StrTran(Upper(ls_Ealert), 'STA(' + String(li_Sta) + ')', '"' + ls_Reading + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"ID")', '"' + guo_user.ID + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"NAME")', '"' + guo_user.Name + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"TOL")', '"' + ls_Tol + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"MAX")', '"' + ls_Max + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"MIN")', '"' + ls_Min + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"CD")', '"' + ls_CD + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"SD")', '"' + ls_SD + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"ND")', '"' + ls_ND + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"SPEC")', '"' + ls_Spec + '"')
		ls_Ealert = StrTran(Upper(ls_Ealert ), 'RDINFO(' + String(li_Sta) + ',0,"OOT")', '"' + ls_OOT + '"')
//		ls_Ealert = 'IF(' + ls_Ealert + ', "TRUE", "FALSE")'
		ls_Error = dw_2.Modify("compute_alert.expression='" + ls_Ealert + "'")
	NEXT
	li_Count_2 = 1
	FOR li_Count = 1 TO li_Num_Rows
		ls_Alert = dw_2.Object.compute_alert[li_Count]
		lb_Alert = ( Upper(ls_Alert) = 'TRUE' )
		IF lb_Alert THEN
			li_Alert_Id = dw_2.Object.alert_id[li_Count]
			ls_Alert_Description = dw_2.Object.alert_description[li_Count]
			ls_Alert_Expression = dw_2.Object.alert_expression[li_Count]
			ls_Alert_Text = dw_2.Object.alert_text[li_Count]
			ll_Alert_Color = dw_2.Object.alert_color[li_Count]
			IF ab_Display_Message THEN
				ls_Message = "Accept this reading?~n~r  Rd: "
				ls_Message = ls_Message + ls_Reading + "~n~r" + ls_Alert_Text
				OpenWithParm(w_alert_notify, String(li_Alert_Id) + '|' + ls_Reading + '|Alert')
				li_Return = ii_Alert_Notify
				ii_Alert_Notify = 0
				IF ( li_Return = 1 ) THEN
					iuo_alert[li_Count_2].tour = li_Tour
					iuo_alert[li_Count_2].rev_no = li_Rev_No
					iuo_alert[li_Count_2].dt = ld_Shift_Date
					iuo_alert[li_Count_2].shift_no = li_Shift_No
					iuo_alert[li_Count_2].sta = li_Sta
					iuo_alert[li_Count_2].reading_id = li_Reading_Id
					iuo_alert[li_Count_2].alert_id = li_alert_Id
					iuo_alert[li_Count_2].datetime = DateTime(Today(), Now())
					li_Count_2 ++
				ELSE
					EXIT
				END IF
			END IF
		ELSE
			li_Return = 1
		END IF
	NEXT
END IF

RETURN li_Return

//string ls_Temp
//string ls_Error
//integer li_Count
//integer li_Num_rows
//integer li_Row
//string ls_Sql
//integer li_Return
//string ls_Ealert
//boolean lb_Alert
//string ls_Alert_Text
//string ls_Alert_Description
//string ls_Alert_Expression
//long ll_Alert_Color
//integer li_Alert_Id
//string ls_Message
//integer li_Count_2
//string ls_Tour_Alert_Description
//datastore lds_temp
//
//IF Empty(ls_Reading) THEN
//	li_Return = 1
//ELSE
//	li_tour = gsu_tour_parameters[gi_Current_tour].Tour_Number
//	li_Sta = gsu_tour_parameters[gi_Current_tour].Station
//	li_Rev_No = gsu_tour_parameters[gi_Current_tour].Rev_No
//
//	SELECT alert_description 
//	  INTO :ls_Tour_Alert_Description
//	  FROM tour 
//	 WHERE ( tour = :li_Tour ) 
//	   AND ( rev_no = :li_Rev_No ) ;
//		
//	IF Empty(ls_Tour_Alert_Description) THEN
//		ls_Tour_Alert_Description = 'Alert'
//	END IF
//	
//	lds_temp = CREATE datastore
//	ls_Sql = " SELECT tour, &
//							rev_no, &
//							sta, &
//							alert_id, &
//							alert_order, &
//							alert_description, &
//							alert_expression, &
//							alert_text, &
//							alert_color &
//					 FROM alerts &
//					WHERE ( tour = " + String(li_tour) + " ) &
//					  AND ( rev_no = " + String(li_rev_no) + " ) &
//					  AND ( sta = " + String(li_sta) + " ) &
//				ORDER BY alert_order ASC "
//	
//	li_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
//	li_Count_2 = 1
//	FOR li_Count = 1 TO li_Num_Rows
//		ls_Ealert = lds_temp.GetItemString(li_Count, 7)
//		IF Empty(ls_Ealert) THEN
//			ls_Ealert = ''
//		ELSE
//			ls_Ealert = StrTran(ls_Ealert, "'", '"')
//			ls_Ealert = f_Purge_Spaces(ls_Ealert)
//			ls_Ealert = StrTran(Upper(ls_Ealert), 'STA(' + String(li_Sta) + ')', '"' + ls_Reading + '"')
////ls_Error = dw_1.Modify("compute_alert.expression='" + ls_Ealert + "'")
////ls_Temp = dw_1.Object.compute_alert[1]
////lb_Alert = ( UPPER(ls_Temp) = 'TRUE' )
//			ls_Ealert = "Evaluate('" + ls_Ealert + "', 0)"
////ls_Temp = w_tour.ids_evaluate.Describe(ls_Ealert)
//			lb_Alert = ( Upper(ls_Temp) = 'TRUE' )
////ls_Temp = dw_1.Describe(ls_Ealert)
////lb_Alert = ( Upper(ls_Temp) = 'TRUE' )
//		END IF
//		IF lb_Alert THEN
//			li_Alert_Id = lds_temp.GetItemNumber(li_Count, 4)
//			ls_Alert_Description = lds_temp.GetItemString(li_Count, 6)
//			ls_Alert_Expression = lds_temp.GetItemString(li_Count, 7)
//			ls_Alert_Text = lds_temp.GetItemString(li_Count, 8)
//			ll_Alert_Color = lds_temp.GetItemNumber(li_Count, 9)
//			IF ab_Display_Message THEN
//				ls_Message = "Accept this reading?~n~r  Rd: "
//				ls_Message = ls_Message + ls_Reading + "~n~r" + ls_Alert_Text
//				OpenWithParm(w_alert_notify, String(li_Alert_Id) + '|' + ls_Reading + '|Alert')
//				li_Return = ii_Alert_Notify
//				ii_Alert_Notify = 0
////				li_Return = MessageBox("Alert!", "Sta: " + String(li_Sta) + "~n~r" + ls_Message, Question!, YesNo!)
//				IF ( li_Return = 1 ) THEN
//					iuo_alert[li_Count_2].tour = li_Tour
//					iuo_alert[li_Count_2].rev_no = li_Rev_No
//					iuo_alert[li_Count_2].dt = ld_Shift_Date
//					iuo_alert[li_Count_2].shift_no = li_Shift_No
//					iuo_alert[li_Count_2].sta = li_Sta
//					iuo_alert[li_Count_2].reading_id = li_Reading_Id
//					iuo_alert[li_Count_2].alert_id = li_alert_Id
//					iuo_alert[li_Count_2].datetime = DateTime(Today(), Now())
//					li_Count_2 ++
//				ELSE
//					EXIT
//				END IF
//			END IF
//		ELSE
//			li_Return = 1
//		END IF
//	NEXT
//	DESTROY lds_temp
//END IF
//
//RETURN li_Return
end function

on w_multi_reading.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.dw_2=create dw_2
this.dw_1=create dw_1
this.ddlb_notes=create ddlb_notes
this.st_station_description=create st_station_description
this.st_notes=create st_notes
this.mle_notes=create mle_notes
this.em_date=create em_date
this.st_date=create st_date
this.ddlb_reading=create ddlb_reading
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.cb_timer=create cb_timer
this.st_multi_readings=create st_multi_readings
this.st_reading=create st_reading
this.pb_date=create pb_date
this.Control[]={this.dw_2,&
this.dw_1,&
this.ddlb_notes,&
this.st_station_description,&
this.st_notes,&
this.mle_notes,&
this.em_date,&
this.st_date,&
this.ddlb_reading,&
this.cb_cancel,&
this.cb_ok,&
this.cb_timer,&
this.st_multi_readings,&
this.st_reading,&
this.pb_date}
end on

on w_multi_reading.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.ddlb_notes)
destroy(this.st_station_description)
destroy(this.st_notes)
destroy(this.mle_notes)
destroy(this.em_date)
destroy(this.st_date)
destroy(this.ddlb_reading)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.cb_timer)
destroy(this.st_multi_readings)
destroy(this.st_reading)
destroy(this.pb_date)
end on

event open;guo_window.Post uf_Resize(w_multi_reading)
//guo_window.Post uf_Reposition(This)

string ls_Parm
long ll_Row

ls_Parm = Upper(Message.StringParm)
Message.StringParm = ''

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
cb_timer.Text = f_LanguageString('TIMER', 'Timer')
st_date.Text = f_LanguageString('DATE/TIME:', 'Date/Time:')
st_multi_readings.Text = f_LanguageString('MULTI-READINGS', 'Multi-Readings')
st_notes.Text = f_LanguageString('NOTE:', 'Note:')
st_reading.Text = f_LanguageString('READING:', 'Reading:')

//This.Y = 104
ib_New_Multi = ( ls_Parm = 'NEW' )
IF NOT ib_New_Multi THEN
	ib_Edit_Multi = ( MID(ls_Parm, 1, POS(ls_Parm, '_') - 1) = 'EDIT' )
	il_Row = w_tour.il_Multi_Row
END IF
ll_Row = w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()

li_Tour = gsu_tour_parameters[gi_Current_Tour].Tour_Number
li_Rev_No = gsu_tour_parameters[gi_Current_Tour].rev_no
ld_Shift_Date = gsu_tour_parameters[gi_Current_Tour].tour_date
li_Shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no
li_Sta = gsu_tour_parameters[gi_Current_Tour].station

//IF ( il_Row > 0 ) THEN
	TRY
		st_station_description.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row], st_station_description.Width, TRUE)
//		st_station_description.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[ll_Row], UnitsToPixels(st_station_description.Width, XUnitsToPixels!), TRUE)
	CATCH (runtimeerror er)
	END TRY
//ELSE
//	st_station_description.Text = ""
//END IF

// TODO: update when implementing the new shift stuff
em_date.SetMask(DateTimeMask!, Date_Format + ' hh:mm:ss')

This.EVENT ue_Load_Quick_Notes()
This.PostEvent('Post_Open')

end event

event timer;em_date.Text = MID(em_date.Text, 1, LEN(Date_Format)) + ' ' + String(Now(), 'hh:mm:ss')
//em_date.Text = String(Now(), Date_Format + ' hh:mm:ss')
end event

event close;gl_X = This.X
gl_Y = This.Y
//SetSIPPreferredState(Handle(This), SIPForceDown!)
w_tour.wf_Open_Tour_Lite()
w_tour.Visible = TRUE

end event

event activate;This.X = gl_X
This.Y = gl_Y
f_Release_Buttons()
end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type dw_2 from datawindow within w_multi_reading
integer x = 1554
integer y = 512
integer width = 475
integer height = 176
integer taborder = 100
string title = "none"
string dataobject = "d_alerts"
boolean livescroll = true
end type

type dw_1 from datawindow within w_multi_reading
integer x = 1554
integer y = 736
integer width = 494
integer height = 176
integer taborder = 70
string title = "none"
string dataobject = "d_multi_readings"
boolean livescroll = true
end type

type ddlb_notes from dropdownlistbox within w_multi_reading
integer x = 18
integer y = 496
integer width = 969
integer height = 320
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

event selectionchanged;string ls_Sql
string ls_Note_Temp
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
	ls_Note_Temp = TRIM(lds_temp.GetItemString(1, 1))
	IF NOT Empty(ls_Note_Temp) THEN
		ls_Current_Note = mle_notes.Text
		IF Empty(ls_Current_Note) THEN
			mle_notes.Text = MID(ls_Note_Temp, 1, 250)
		ELSE
			mle_notes.Text = MID(ls_Current_Note + " - " + ls_Note_Temp, 1, 250)
		END IF
	END IF
END IF

DESTROY lds_temp

mle_notes.SetFocus()
end event

type st_station_description from statictext within w_multi_reading
integer x = 18
integer y = 64
integer width = 969
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
boolean focusrectangle = false
end type

event rbuttondown;string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()]))

end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
string ls_MB_String

ls_MB_String = f_LanguageString('###_DESCRIPTION', "### Description")
ls_MB_String = StrTran(ls_MB_String, '###', gs_Station_Label)
MessageBox(ls_MB_String, String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[w_tour.tab_tour.tabpage_readings.dw_readings.GetRow()]))
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type st_notes from statictext within w_multi_reading
integer x = 18
integer y = 432
integer width = 969
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Note:"
boolean focusrectangle = false
end type

type mle_notes from multilineedit within w_multi_reading
integer x = 18
integer y = 592
integer width = 969
integer height = 352
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 250
boolean ignoredefaultbutton = true
end type

event rbuttondown;MessageBox(f_LanguageString('NOTE', 'Note'), This.Text)
end event

event getfocus;
end event

event losefocus;
end event

type em_date from editmask within w_multi_reading
integer x = 18
integer y = 192
integer width = 773
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datetimemask!
string mask = "mm/dd/yyyy hh:mm:ss"
boolean spin = true
end type

event getfocus;
end event

event losefocus;
end event

type st_date from statictext within w_multi_reading
integer x = 18
integer y = 128
integer width = 969
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Date/Time:"
boolean focusrectangle = false
end type

type ddlb_reading from dropdownlistbox within w_multi_reading
event ue_char_entered pbm_keydown
integer x = 18
integer y = 336
integer width = 969
integer height = 320
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean allowedit = true
boolean vscrollbar = true
integer limit = 40
end type

event ue_char_entered;integer li_Return
string ls_Temp_Reading
character lc_Char
long ll_Row

IF ( li_Return = 1 ) THEN
	ls_Temp_Reading = This.Text
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
		END CHOOSE
	END IF
	IF NOT Empty(lc_Char) THEN
		ls_Temp_Reading = ls_Temp_Reading + lc_Char
// TODO: Insert loop here to run through all of the items in the ddlb
//		ll_Row = ldwcTemp.Find(ls_Temp_Reading + '%', 1, ldwcTemp.RowCount())
		IF ( ll_Row > 0 ) THEN
// TODO: Change the code to properly select the row if it was found
//			ldwcTemp.SelectRow(ll_Row, TRUE)
		END IF
	END IF
END IF
end event

event rbuttondown;MessageBox(f_LanguageString('READING', 'Reading'), This.Text)
end event

event getfocus;
end event

event losefocus;
end event

type cb_cancel from commandbutton within w_multi_reading
integer x = 713
integer y = 960
integer width = 274
integer height = 80
integer taborder = 90
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

type cb_ok from commandbutton within w_multi_reading
integer x = 18
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
string text = "Ok"
boolean default = true
end type

event clicked;string ls_MB_String
integer li_Return
string ls_Date
string ls_Time

ls_User = guo_user.ID
ls_Date = MID(em_date.Text, 1, LEN(Date_Format))
ls_Time = MID(em_date.Text, LEN(Date_Format) + 1)
ldt_DateTime = DateTime(Date(ls_Date), Time(ls_Time))
ls_Note = mle_notes.Text
ls_Reading = ddlb_reading.Text

IF ib_Edit_Multi THEN
	li_Reading_Id = w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_reading_id[il_Row]
//	w_tour.wf_Refresh_Evaluate_DS_With_Values(li_Reading_Id)
	li_Return = wf_Show_Warnings()
	IF ( li_Return <> 2 ) THEN
		
		li_Reading_Id = w_tour.tab_tour.tabpage_multi.dw_multi.Object.history_reading_id[il_Row]

		UPDATE history 
			SET user_id = :ls_User, 
				 rd = :ls_Reading, 
				 cdt = :ldt_DateTime, 
				 notes = :ls_Note, 
				 spec = :li_OOS, 
				 tol = :li_OOT 
		 WHERE ( tour = :li_Tour ) 
			AND ( rev_no = :li_Rev_No ) 
			AND ( dt = :ld_Shift_Date ) 
			AND ( sta = :li_Sta ) 
			AND ( shift_no = :li_Shift_No ) 
			AND ( reading_id = :li_Reading_Id ) ;
		
		IF ( SQLCA.SQLCode = 0 ) THEN
//			COMMIT ;
			
			wf_Update_Alert_Acceptance()
		ELSE
			ROLLBACK ;
			ls_MB_String = f_LanguageString('THERE_WAS_A_PROBLEM_UPDATING_THE_MULTI-READING_IN_THE_DATABASE,_PLEASE_TRY_AGAIN.###', 'There was a problem updating the multi-reading in the database, please try again.~n~r###')
			ls_MB_String = StrTran(ls_MB_String, '###', SQLCA.SQLErrText)
			MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
		END IF
	END IF
ELSE // Copy or New

	SELECT MAX(reading_id ) + 1 
	  INTO :li_Reading_Id
	  FROM history 
	 WHERE ( tour = :li_Tour ) 
		AND ( sta = :li_Sta ) 
		AND ( dt = :ld_Shift_Date ) 
		AND ( shift_no = :li_Shift_No ) ;
	
//	w_tour.wf_Refresh_Evaluate_DS_With_Values(li_Reading_Id)
	li_Return = wf_Show_Warnings()
	
	IF ( li_Return <> 2 ) THEN
		INSERT INTO history 
				 ( tour, 
					rev_no, 
					dt, 
					sta, 
					shift_no, 
					reading_id, 
					user_id, 
					rd, 
					cdt, 
					notes, 
					spec, 
					tol, 
					scan ) 
		VALUES ( :li_tour, 
					:li_Rev_No, 
					:ld_Shift_Date, 
					:li_Sta, 
					:li_Shift_No, 
					:li_Reading_Id, 
					:ls_User, 
					:ls_Reading, 
					:ldt_DateTime, 
					:ls_Note, 
					:li_OOS, 
					:li_OOT, 
					0 ) ;
		
		IF ( SQLCA.SQLCode = 0 ) THEN
//			COMMIT ;
			wf_Update_Alert_Acceptance()
		ELSE
			ROLLBACK ;
			ls_MB_String = f_LanguageString('THERE_WAS_A_PROBLEM_ADDING_THE_MULTI-READING_TO_THE_DATABASE,_PLEASE_TRY_AGAIN.###', 'There was a problem adding the multi-reading to the database, please try again.~n~r###')
			ls_MB_String = StrTran(ls_MB_String, '###', SQLCA.SQLErrText)
			MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
		END IF
	END IF
END IF

IF ( li_Return <> 2 ) THEN
	Close(Parent)
END IF
end event

type cb_timer from commandbutton within w_multi_reading
integer x = 366
integer y = 960
integer width = 274
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Timer"
end type

event clicked;Timer(1, Parent)
end event

type st_multi_readings from statictext within w_multi_reading
integer x = 18
integer width = 969
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
string text = "Multi-Readings"
boolean focusrectangle = false
end type

type st_reading from statictext within w_multi_reading
integer x = 18
integer y = 272
integer width = 969
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Reading:"
boolean focusrectangle = false
end type

type pb_date from picturebutton within w_multi_reading
integer x = 805
integer y = 148
integer width = 183
integer height = 160
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "bitmaps\Calendar.png"
alignment htextalign = left!
end type

event clicked;string ls_Date

OpenwithParm(w_calendar, MID(em_date.Text, 1, LEN(Date_Format)))
ls_Date = Message.StringParm
Message.StringParm = ''
IF IsDate(ls_date) THEN
	em_date.Text = String(DateTime(Date(ls_Date), Now()), Date_Format + ' hh:mm:ss')
END IF

end event

