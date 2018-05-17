$PBExportHeader$w_select_tour.srw
forward
global type w_select_tour from window
end type
type dw_tour_date from datawindow within w_select_tour
end type
type dw_shift_list from datawindow within w_select_tour
end type
type st_rev_no from statictext within w_select_tour
end type
type dw_tour from datawindow within w_select_tour
end type
type dw_tour_group from datawindow within w_select_tour
end type
type cb_cancel from commandbutton within w_select_tour
end type
type cb_ok from commandbutton within w_select_tour
end type
type ddlb_shift from dropdownlistbox within w_select_tour
end type
type st_shift from statictext within w_select_tour
end type
type st_tour_date from statictext within w_select_tour
end type
type st_tour from statictext within w_select_tour
end type
type st_label from statictext within w_select_tour
end type
end forward

global type w_select_tour from window
integer width = 1463
integer height = 1780
boolean titlebar = true
string title = "eSOMS Rounds"
long backcolor = 32567268
string icon = "AppIcon!"
boolean contexthelp = true
event set_date ( string as_date )
dw_tour_date dw_tour_date
dw_shift_list dw_shift_list
st_rev_no st_rev_no
dw_tour dw_tour
dw_tour_group dw_tour_group
cb_cancel cb_cancel
cb_ok cb_ok
ddlb_shift ddlb_shift
st_shift st_shift
st_tour_date st_tour_date
st_tour st_tour
st_label st_label
end type
global w_select_tour w_select_tour

type variables
integer		ii_Window_To_Open // 1 is w_main
										// 2 is w_tour_parameters
//u_pyrometer	uo_pyrometer
boolean ib_Initial_Open
end variables

forward prototypes
public function integer wf_warning (integer ai_tour, integer ai_rev_no, integer ai_shift_no)
public subroutine wf_get_closest_shift_original ()
public function string wf_get_closest_shift (integer li_tour, integer li_rev_no)
public function string wf_update_shift_date (integer li_shift_no, datawindowchild ldwc_temp, integer ai_modifier)
end prototypes

event set_date(string as_date);//em_tour_date.Text = as_Date
date ld_date
ld_date = date(as_Date)

 dw_tour_date.setitem(1,'tour_date', ld_date)

end event

public function integer wf_warning (integer ai_tour, integer ai_rev_no, integer ai_shift_no);string ls_MB_String
datetime ldt_Now
datetime ldt_Normal
date ld_Shift_Date
string ls_Normal_Start_Time
integer li_Normal_Start_Day
integer li_Return
long ll_Diff_In_Minutes
integer li_Warn_Range_Minutes
string ls_Warn_Text
string temp1, temp2

// This code came directly from Scott 12-13-2004
li_Return = 1

dw_tour_date.accepttext()
ld_Shift_Date =date(dw_tour_date.getitemdatetime(1,'tour_date'))
ldt_Now = DateTime(Today(), Now()) // current date/time

SELECT normal_start_time, 
       normal_start_day, 
       warn_range_minutes, 
       warn_text 
  INTO :ls_Normal_Start_Time, 
       :li_Normal_Start_Day, 
       :li_Warn_Range_Minutes, 
       :ls_Warn_Text 
  FROM shift_time 
 WHERE ( tour = :ai_Tour ) 
   AND ( rev_no = :ai_Rev_No ) 
   AND ( shift_no = :ai_Shift_No ) ;

ldt_Normal = DateTime(RelativeDate(ld_Shift_Date, li_Normal_Start_Day), Time(ls_Normal_Start_Time)) 
ll_Diff_In_Minutes =  ABS( SecondsAfterDateTime( ldt_Now, ldt_Normal ) / 60 )
IF ( ll_Diff_In_Minutes > li_Warn_Range_Minutes ) AND ( li_Warn_Range_Minutes > 0 ) THEN
	IF Empty(ls_Warn_Text) THEN
		ls_Warn_Text = f_LanguageString('NO_WARN_TEXT_PROVIDED', 'No warning text provided.  Selected time may not be correct.')
	END IF
	ls_MB_String = f_LanguageString('###CONTINUE?', '###Continue?')
	ls_MB_String = StrTran(ls_MB_String, '###', ls_Warn_Text + '~r~n')
	li_Return = MessageBox(f_LanguageString('WARNING', 'Warning'), ls_MB_String, Question!, YesNo!)
END IF

RETURN li_Return


//integer li_Return
//datetime ldt_Now
//datetime ldt_Normal
//date ld_Shift_Date
//string ls_Normal_Start_Time
//integer li_Normal_Start_Day
//long ll_Diff_In_Minutes
//integer li_Warn_Range_Minutes
//string ls_Warn_Text
//string temp1, temp2
//
//li_Return = 1
//
//ld_Shift_Date = Date(em_tour_date.Text) // date selected from dropdown
//ldt_Now = DateTime(Today(), Now()) // current date/time
//
//SELECT normal_start_time, 
//       normal_start_day, 
//		 warn_range_minutes, 
//		 warn_text 
//  INTO :ls_Normal_Start_Time, 
//		 :li_Normal_Start_Day, 
//		 :li_Warn_Range_Minutes, 
//		 :ls_Warn_Text 
//  FROM shift_time 
// WHERE ( tour = :ai_Tour ) 
//   AND ( rev_no = :ai_Rev_No ) 
//	AND ( shift_no = :ai_Shift_No ) ;
//
//ldt_Normal = DateTime(RelativeDate(ld_Shift_Date, li_Normal_Start_Day), Time(ls_Normal_Start_Time))
//
//temp1 = String(ldt_Now, 'MM-dd-yyyy hhmm')
//temp2 = String(ldt_Normal, 'MM-dd-yyyy hhmm')
//ll_Diff_In_Minutes = ABS(DtTm2Num(temp1) - DtTm2Num(temp2))
//
//IF ( ll_Diff_In_Minutes > li_Warn_Range_Minutes ) AND ( li_Warn_Range_Minutes > 0 ) THEN
//	li_Return = MessageBox('Warning', ls_Warn_Text + '~n~rContinue?', Question!, YesNo!)
//END IF
//
//RETURN li_Return
end function

public subroutine wf_get_closest_shift_original ();string ls_Current_Hour
string ls_Element
integer li_Num_Shifts
integer li_Count
integer li_Largest_Hour_Index
string ls_Possible_Shifts[]
string str_Largest_Shift_Hour

// Make the current hour two digits
ls_Current_Hour = String(Hour(Now()))
IF ( LEN(ls_Current_Hour) = 1 ) THEN
	ls_Current_Hour = "0" + ls_Current_Hour
END IF

str_Largest_Shift_Hour = "00"

//Get the number of shifts
li_Num_Shifts = ddlb_shift.TotalItems()

FOR li_Count = 1 TO li_Num_Shifts
	ls_Element = LeftTrim(ddlb_shift.Text(li_Count))
	ls_Element = MID(ls_Element, POS(ls_Element, ' ') + 1)
	IF ( POS(ls_Element, ' ') > 0 ) THEN
		ls_Element = MID(ls_Element, 1, POS(ls_Element, ' ') - 1)
	END IF
	IF IsTime(MID(ls_Element, POS(ls_Element, " ") + 1)) OR IsNumber(MID(ls_Element, POS(ls_Element, " ") + 1)) THEN
		// Currently the shift hours/descriptions in the listbox 
		// are preceded by their shift number
		IF ( MID(ls_Element, POS(ls_Element, " ") + 1, 2) < ls_Current_Hour ) THEN
			ls_Possible_Shifts[UpperBound(ls_Possible_Shifts) + 1] = MID(ls_Element, POS(ls_Element, " ") + 1, 2)
		ELSEIF ( MID(ls_Element, POS(ls_Element, " ") + 1, 2) = ls_Current_Hour ) THEN
			ddlb_shift.SelectItem(li_Count)
			ddlb_shift.EVENT SelectionChanged(li_Count)
			RETURN
		ELSE
		END IF
	END IF
	IF ( Integer(MID(ls_Element, POS(ls_Element, " ") + 1, 2)) > Integer(str_Largest_Shift_Hour) ) THEN
		li_Largest_Hour_Index = li_Count
	END IF
NEXT

IF ( UpperBound(ls_Possible_Shifts) = 0 ) THEN
	ddlb_shift.SelectItem(li_Largest_Hour_Index)
ELSE
	FOR li_Count = 1 TO UpperBound(ls_Possible_Shifts)
		IF ( Integer(ls_Possible_Shifts[li_Count]) > Integer(str_Largest_Shift_Hour) ) THEN
			str_Largest_Shift_Hour = ls_Possible_Shifts[li_Count]
		END IF
	NEXT
	FOR li_Count = 1 TO li_Num_Shifts
		ls_Element = LeftTrim(ddlb_shift.Text(li_Count))
		IF ( MID(ls_Element, POS(ls_Element, " ") + 1, 2) = str_Largest_Shift_Hour) THEN
			ddlb_shift.SelectItem(li_Count)
			ddlb_shift.EVENT SelectionChanged(li_Count)
			RETURN
		END IF
	NEXT
END IF
end subroutine

public function string wf_get_closest_shift (integer li_tour, integer li_rev_no);integer li_Row_Found
integer li_Num_Rows
datetime ldt_Temp_DT
datetime ldt_Current_DT
integer li_Element
string ls_Shift_Date
string ls_Shift_Description
string ls_Current_Hour
integer li_Num_Shifts
integer li_Count
datastore lds_temp

lds_temp = CREATE datastore
lds_temp.Dataobject = 'ds_shift_time_finder_for_bob'
lds_temp.SetTransObject(SQLCA)

// Make the current hour two digits
ls_Current_Hour = String(Hour(Now()))
IF ( LEN(ls_Current_Hour) = 1 ) THEN
	ls_Current_Hour = "0" + ls_Current_Hour
END IF
ldt_Current_DT = DateTime(Today(), Time(ls_Current_Hour + ':00'))

li_Num_Rows = lds_temp.Retrieve(li_Tour, li_Rev_No)
FOR li_Count = 1 TO li_Num_Rows
	ldt_Temp_DT = lds_temp.Object.search_date_shift[li_Count]
	IF ( ldt_Temp_DT = ldt_Current_DT ) THEN
		// Right on
		li_Row_Found = li_Count
		EXIT
	ELSEIF ( ldt_Temp_DT < ldt_Current_DT ) THEN
		li_Row_Found = li_Count
	ELSE
		EXIT
	END IF
NEXT
IF ( li_Row_Found > 0 ) THEN
	ls_Shift_Description = lds_temp.Object.shift_desc[li_Row_Found]
	ls_Shift_Date = String(lds_temp.Object.shift_date[li_Row_Found], date_format)
ELSE
	ls_Shift_Description = ''
	ls_Shift_Date = ''
END IF
dw_shift_list.Object.shift_desc[1] = ls_Shift_Description

RETURN ls_Shift_Date

//string ls_Shift_Date
//integer li_Shift_No
//string ls_Shift_Desc
//string ls_Temp
//integer li_Return
//datawindowchild ldwc_temp
//string ls_Current_Hour
//string ls_Element
//integer li_Num_Shifts
//integer li_Count
//integer li_Largest_Hour_Index
//string ls_Possible_Shifts[]
//string str_Largest_Shift_Hour
//
//// Make the current hour two digits
//ls_Current_Hour = String(Hour(Now()))
//IF ( LEN(ls_Current_Hour) = 1 ) THEN
//	ls_Current_Hour = "0" + ls_Current_Hour
//END IF
//
//str_Largest_Shift_Hour = "00"
//li_Return = dw_shift_list.GetChild('shift_desc', ldwc_temp)
//IF ( li_Return = 1 ) THEN
//	//Get the number of shifts
//	li_Num_Shifts = ldwc_temp.RowCount()
//	IF ( li_Num_Shifts = 1 ) THEN
//		ls_Shift_Desc = ldwc_temp.GetItemString(1, 'shift_desc')
//		li_Shift_No = ldwc_temp.GetItemNumber(1, 'shift_no')
//		dw_shift_list.Object.shift_desc[1] = ls_Shift_Desc
//		ls_Shift_Date = wf_Update_Shift_Date(li_Shift_No, ldwc_temp, 1)
//		RETURN ls_Shift_Date
//	ELSE		
//		FOR li_Count = 1 TO li_Num_Shifts
//			ls_Element = ldwc_temp.GetItemString(li_Count, 'normal_start_time')
//			IF IsTime(ls_Element) THEN
//				ls_Temp = MID(ls_Element, 1, 2)
//				IF ( ls_Temp < ls_Current_Hour ) THEN
//					ls_Possible_Shifts[UpperBound(ls_Possible_Shifts) + 1] = ls_Element
//				ELSEIF ( ls_Temp = ls_Current_Hour ) THEN
//					ls_Shift_Desc = ldwc_temp.GetItemString(li_Count, 'shift_desc')
//					li_Shift_No = ldwc_temp.GetItemNumber(li_Count, 'shift_no')
//					dw_shift_list.Object.shift_desc[1] = ls_Shift_Desc
//					ls_Shift_Date = wf_Update_Shift_Date(li_Shift_No, ldwc_temp, 0)
//					RETURN ls_Shift_Date
//				END IF
//			END IF
//			ls_Temp = MID(ls_Element, 1, 2)
//			IF ( Integer(ls_Temp) > Integer(str_Largest_Shift_Hour) ) THEN
//				str_Largest_Shift_Hour = ls_Temp
//				li_Largest_Hour_Index = li_Count
//			END IF
//		NEXT
//		IF ( li_Num_Shifts <= 0 ) AND ( li_Largest_Hour_Index = 0 ) THEN
//			li_Largest_Hour_Index = 1
//		END IF
//		IF ( UpperBound(ls_Possible_Shifts) = 0 ) THEN
//			ls_Shift_Desc = ldwc_temp.GetItemString(li_Largest_Hour_Index, 'shift_desc')
//			li_Shift_No = ldwc_temp.GetItemNumber(li_Largest_Hour_Index, 'shift_no')
//			dw_shift_list.Object.shift_desc[1] = ls_Shift_Desc
//			ls_Shift_Date = wf_Update_Shift_Date(li_Shift_No, ldwc_temp, 1)
//			RETURN ls_Shift_Date
//		ELSE
//			str_Largest_Shift_Hour = MID(ls_Possible_Shifts[1], 1, 2)
//			FOR li_Count = 1 TO UpperBound(ls_Possible_Shifts)
//				IF ( Integer(MID(ls_Possible_Shifts[li_Count], 1, 2)) > Integer(str_Largest_Shift_Hour) ) THEN
//					str_Largest_Shift_Hour = MID(ls_Possible_Shifts[li_Count], 1, 2)
//				END IF
//			NEXT
//			FOR li_Count = 1 TO li_Num_Shifts
//				ls_Element = ldwc_temp.GetItemString(li_Count, 'normal_start_time')
//				ls_Temp = MID(ls_Element, 1, 2)
//				IF ( ls_Temp = str_Largest_Shift_Hour) THEN
//					ls_Shift_Desc = ldwc_temp.GetItemString(li_Count, 'shift_desc')
//					li_Shift_No = ldwc_temp.GetItemNumber(li_Count, 'shift_no')
//					dw_shift_list.Object.shift_desc[1] = ls_Shift_Desc
//					ls_Shift_Date = wf_Update_Shift_Date(li_Shift_No, ldwc_temp, 0)
//					RETURN ls_Shift_Date
//				END IF
//			NEXT
//		END IF
//	END IF
//END IF
end function

public function string wf_update_shift_date (integer li_shift_no, datawindowchild ldwc_temp, integer ai_modifier);string ls_Shift_Date
//integer li_Warning_Minutes
integer li_Num_Rows
integer li_Normal_Start_Day
integer li_Return
integer li_Count
integer li_Row

li_Num_Rows = ldwc_temp.RowCount()
li_Row = ldwc_temp.Find(' shift_no = ' + String(li_Shift_No), 1, li_Num_Rows)
IF ( li_Row > 0 ) THEN
	li_Normal_Start_Day = ldwc_temp.GetItemNumber(li_Row, 'normal_start_day')
//	li_Warning_Minutes = ldwc_temp.GetItemNumber(li_Row, 'warn_range_minutes')
	ls_Shift_Date = String(RelativeDate(Today(), -li_Normal_Start_Day), date_format)
//	CHOOSE CASE li_Normal_Start_Day
//		CASE 0
//			// Do Nothing
//			ls_Shift_Date = String(Today(), 'mm/dd/yyyy')
//		CASE 1
//			ls_Shift_Date = String(RelativeDate(Today(), -1), 'mm/dd/yyyy')
//		CASE -1
//			// If < midnight and < first shift of the next day then use the current day
//			ls_Shift_Date = String(RelativeDate(Today(), 1), 'mm/dd/yyyy')
//	END CHOOSE
END IF

RETURN ls_Shift_Date
end function

on w_select_tour.create
this.dw_tour_date=create dw_tour_date
this.dw_shift_list=create dw_shift_list
this.st_rev_no=create st_rev_no
this.dw_tour=create dw_tour
this.dw_tour_group=create dw_tour_group
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.ddlb_shift=create ddlb_shift
this.st_shift=create st_shift
this.st_tour_date=create st_tour_date
this.st_tour=create st_tour
this.st_label=create st_label
this.Control[]={this.dw_tour_date,&
this.dw_shift_list,&
this.st_rev_no,&
this.dw_tour,&
this.dw_tour_group,&
this.cb_cancel,&
this.cb_ok,&
this.ddlb_shift,&
this.st_shift,&
this.st_tour_date,&
this.st_tour,&
this.st_label}
end on

on w_select_tour.destroy
destroy(this.dw_tour_date)
destroy(this.dw_shift_list)
destroy(this.st_rev_no)
destroy(this.dw_tour)
destroy(this.dw_tour_group)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.ddlb_shift)
destroy(this.st_shift)
destroy(this.st_tour_date)
destroy(this.st_tour)
destroy(this.st_label)
end on

event open;guo_window.Post uf_Resize(w_select_tour)
//guo_window.Post uf_Reposition(This)

ib_Initial_Open = TRUE

string ls_Date
boolean lb_Display_Revisions
long ll_Num_Rows
integer li_Return
integer li_Tour
integer li_Count
string ls_Tour
string ls_Tour_Group_Name
integer li_Tour_Group
string ls_Return

This.Title = gs_Window_Title

dw_tour_group.Object.tour_group_name_t.Text = f_LanguageString('GROUP', 'Group')
dw_tour.Object.rev_no_t.Text = f_LanguageString('REV', 'Rev')
dw_tour.Object.tour_name_t.Text = f_LanguageString('TOUR', 'Tour')

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_label.Text = f_LanguageString('OPEN_A_TOUR', 'Open a Tour')
st_rev_no.Text = f_LanguageString('REV', 'Rev')
st_shift.Text = f_LanguageString('SHIFT:', 'Shift:')
st_tour.Text = f_LanguageString('TOUR', 'Tour')
st_tour_date.Text = f_LanguageString('DATE:', 'Date:')


ii_Window_To_Open = 1 // w_main


if appeongetclienttype() = 'MOBILE' then
	dw_tour_date.modify("p_calendar.visible = 0")
end if
//em_tour_date.SetMask(DateMask!, Date_Format)

//dw_tour_date.Modify("tour_date.EditMask.Mask = '" + Date_Format + "'")

ls_Date = String(Today(), Date_Format)

Post Event Set_Date(ls_Date)

//ls_Date = String(Today(), Date_Format)
//em_tour_date.Text = ls_Date
//Messagebox('Date_Format', Date_Format)
//MessageBox('ls_Date', ls_Date)

//datastore ds_tours
//ds_tours = CREATE datastore
//ds_tours.DataObject = 'ds_tours'
//li_Return = ds_tours.SetTransObject(SQLCA)

li_Return = dw_tour_group.SetTransObject(SQLCA)
IF gb_Using_ML THEN
	dw_tour.SetFilter('( ( f_tour_is_granted( tour , 1) and rev_no = current_rev_no ) OR ( f_tour_is_granted( tour , 18)  and tour_is_revision > 0 ) ) AND f_tour_is_granted( tour , 33)')
ELSE
	dw_tour.SetFilter('')
END IF
ll_Num_Rows = dw_tour_group.Retrieve()
ROLLBACK USING SQLCA ;
IF ( ll_Num_Rows > 0 ) THEN
	dw_tour_group.ScrollToRow(1)
	dw_tour_group.SelectRow(1, TRUE)
END IF

//IF ( li_Return = 1 ) THEN
//	ll_Num_Rows = ds_tours.Retrieve()
//	FOR li_Count = 1 TO ll_Num_Rows
//		IF ( ls_Tour_Group_Name <> ds_tours.Object.tour_group_name[li_Count] ) THEN
//			ls_Tour_Group_Name = ds_tours.Object.tour_group_name[li_Count]
//			lb_tour_group.AddItem(TRIM(ls_Tour_Group_Name))
//		END IF
//	NEXT
//ELSE
//	MessageBox("Error", "Unable to load a list of available tour groups.", Exclamation!)
//	HALT CLOSE
//END IF
//
//DESTROY ds_tours
//
//lb_tour_group.SelectItem(1)
//lb_tour_group.EVENT SelectionChanged(1)

dw_tour_date.setfocus()
dw_tour_date.setcolumn("tour_date")

end event

event close;gl_X = This.X
gl_Y = This.Y

CHOOSE CASE ii_Window_To_Open
	CASE 1
		w_main.Visible = TRUE
	CASE 2
		IF IsValid(w_tour_parameters) THEN
			w_tour_parameters.Visible = TRUE
		ELSE
			Open(w_tour_parameters)
		END IF
END CHOOSE
end event

event activate;This.X = gl_X
This.Y = gl_Y

f_Release_Buttons()


end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type dw_tour_date from datawindow within w_select_tour
integer x = 535
integer y = 1096
integer width = 763
integer height = 128
integer taborder = 40
string title = "none"
string dataobject = "d_date"
boolean border = false
boolean livescroll = true
end type

event clicked;string ls_Date

if dwo.name = 'p_calendar' then
	
	dw_tour_date.accepttext()
	ls_Date = string( dw_tour_date.getitemdate(1,'tour_date'))
	
	OpenwithParm(w_calendar,ls_Date)
	ls_Date = Message.StringParm
	Message.StringParm = ''
	IF IsDate(ls_date) THEN
		w_select_tour.Post Event Set_Date(ls_Date)
	//	em_tour_date.Text = ls_Date//String(Date(ls_Date), Date_Format)
	END IF
	
end if

end event

type dw_shift_list from datawindow within w_select_tour
event retrieve ( integer li_tour,  integer li_rev_no )
integer x = 535
integer y = 1228
integer width = 590
integer height = 160
integer taborder = 30
string title = "none"
string dataobject = "d_shift_list"
boolean border = false
end type

event retrieve(integer li_tour, integer li_rev_no);integer li_Return
datawindowchild ldwc_temp

li_Return = This.SetTransObject(SQLCA)
//IF ( li_Return = 1 ) THEN
	li_Return = This.GetChild('shift_desc', ldwc_temp)
//	IF ( li_Return = 1 ) THEN
		li_Return = ldwc_temp.SetTransObject(SQLCA)
//		IF ( li_Return = 1 ) THEN
			li_Return = ldwc_temp.Retrieve(li_Tour, li_Rev_No)
//		END IF
//	END IF
//END IF
//
li_Return = This.InsertRow(0)

end event

type st_rev_no from statictext within w_select_tour
boolean visible = false
integer x = 27
integer y = 568
integer width = 146
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
string text = "Rev"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type dw_tour from datawindow within w_select_tour
integer x = 27
integer y = 620
integer width = 1403
integer height = 468
integer taborder = 30
string title = "none"
string dataobject = "d_tours"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
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

event rowfocuschanged;string ls_MB_String
string ls_Tour
integer li_Open_On_Handheld
string ls_Shift_Date
integer li_Tour
integer li_Rev_No
integer li_Num_Rows
integer li_Count
string ls_Shift_No
string ls_Shift_Desc

ddlb_shift.Reset()
IF ( currentrow > 0 ) THEN
	This.ScrolltoRow(currentrow)
	This.SelectRow(0, FALSE)
	This.SelectRow(currentrow, TRUE)
	li_Open_On_Handheld = This.Object.open_on_Handheld[currentrow]
	IF ( li_Open_On_Handheld = 1 ) THEN
		ls_Tour = This.Object.tour_name[currentrow]
		ls_MB_String = f_LanguageString('###_IS_ALREADY_OPEN.', '### is already open.')
		ls_MB_String = StrTran(ls_MB_String, '###', TRIM(ls_Tour))
//		MessageBox(st_label.Text, ls_MB_String)
		dw_shift_list.Reset()
		dw_shift_list.Enabled = FALSE
		cb_ok.Enabled = FALSE
		
		dw_tour_date.Reset()
		dw_tour_date.insertrow(0)
		dw_tour_date.Enabled = FALSE
		
	ELSE
		dw_shift_list.Enabled = TRUE
		cb_ok.Enabled = TRUE
		dw_tour_date.Enabled = TRUE
		
		li_Tour = This.Object.tour[currentrow]
		li_Rev_No = This.Object.rev_no[currentrow]
		
			SELECT COUNT(*) 
			  INTO :li_Num_Rows 
			  FROM shift_time 
			 WHERE ( tour = :li_tour ) 
				AND ( rev_no = :li_Rev_No )
			 USING SQLCA ;
			
		IF ( li_Num_Rows > 0 ) THEN
	//// TODO: use the normal_start_time, normal_start_day, warn_range_minutes and warn_text
	//// to keep the user from opening the wrong shift near shift change times around midnight, ...
	//		string ls_Sql
	//		long ll_Count
	//		long ll_Num_Rows
	//		datastore lds_temp
	//		
	//		lds_temp = CREATE datastore
	//		ls_Sql = " &
	//			SELECT shift_no, &
	//					 ISNULL(shift_desc, '') &
	//			  FROM shift_time &
	//			 WHERE ( tour = " + String(li_tour) + " ) &
	//		      AND ( rev_no = " + String(li_Rev_No) + " ) &
	//		 ORDER BY shift_no "
	//		 
	//		 ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
	//		 FOR ll_Count = 1 TO ll_Num_Rows
	//			ls_Shift_No = String(lds_temp.GetItemNumber(ll_Count, 1))
	//			ls_Shift_Desc = lds_temp.GetItemString(ll_Count, 2)
	//		
	//			ddlb_shift.AddITem(PadL(ls_Shift_No, 2) + " " + ls_Shift_Desc)
	//		 NEXT
	//		 DESTROY lds_temp
			dw_shift_list.Reset()
			dw_shift_list.EVENT Retrieve(li_Tour, li_Rev_No)
		END IF
		ls_Shift_Date = wf_Get_Closest_Shift(li_Tour, li_Rev_No)
		IF NOT Empty(ls_Shift_Date) THEN
			w_select_tour.Post Event Set_Date(ls_Shift_Date)
//			em_tour_date.Text = ls_Shift_Date
		END IF
	END IF
END IF
ROLLBACK USING SQLCA ;

//string ls_Shift_Date
//integer li_Tour
//integer li_Rev_No
//integer li_Num_Rows
//integer li_Count
//string ls_Shift_No
//string ls_Shift_Desc
//
//ddlb_shift.Reset()
//IF ( currentrow > 0 ) THEN
//	This.ScrolltoRow(currentrow)
//	This.SelectRow(0, FALSE)
//	This.SelectRow(currentrow, TRUE)
//	li_Tour = This.Object.tour[currentrow]
//	li_Rev_No = This.Object.rev_no[currentrow]
//	
//		SELECT COUNT(*) 
//		  INTO :li_Num_Rows 
//		  FROM shift_time 
//		 WHERE ( tour = :li_tour ) 
//		   AND ( rev_no = :li_Rev_No )
//		 USING SQLCA ;
//		
//	IF ( li_Num_Rows > 0 ) THEN
////// TODO: use the normal_start_time, normal_start_day, warn_range_minutes and warn_text
////// to keep the user from opening the wrong shift near shift change times around midnight, ...
////		string ls_Sql
////		long ll_Count
////		long ll_Num_Rows
////		datastore lds_temp
////		
////		lds_temp = CREATE datastore
////		ls_Sql = " &
////			SELECT shift_no, &
////					 ISNULL(shift_desc, '') &
////			  FROM shift_time &
////			 WHERE ( tour = " + String(li_tour) + " ) &
////		      AND ( rev_no = " + String(li_Rev_No) + " ) &
////		 ORDER BY shift_no "
////		 
////		 ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
////		 FOR ll_Count = 1 TO ll_Num_Rows
////			ls_Shift_No = String(lds_temp.GetItemNumber(ll_Count, 1))
////			ls_Shift_Desc = lds_temp.GetItemString(ll_Count, 2)
////		
////			ddlb_shift.AddITem(PadL(ls_Shift_No, 2) + " " + ls_Shift_Desc)
////		 NEXT
////		 DESTROY lds_temp
//		dw_shift_list.Reset()
//		dw_shift_list.EVENT Retrieve(li_Tour, li_Rev_No)
//	END IF
//	ls_Shift_Date = wf_Get_Closest_Shift(li_Tour, li_Rev_No)
//	IF NOT Empty(ls_Shift_Date) THEN
//		em_tour_date.Text = ls_Shift_Date
//	END IF
//END IF
//ROLLBACK USING SQLCA ;
//
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
/////////////////////////////////////////////////// Appeon End ///////////////////////////////////////////////////
end event

type dw_tour_group from datawindow within w_select_tour
integer x = 27
integer y = 100
integer width = 1403
integer height = 468
integer taborder = 20
string title = "none"
string dataobject = "d_tour_groups"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;string ls_Filter
integer li_Tour_Group
integer li_Num_Rows
integer li_Return
integer li_Count
boolean lb_Display_Revisions

IF ( This.RowCount() > 0 ) THEN
	lb_Display_Revisions = ( Upper(f_ProfileString(gs_module_id, "AllowRevisedTourDownload", "No")) = 'YES' )
	IF NOT lb_Display_Revisions THEN
		ls_Filter = ' ( active > 0 ) '
	ELSE
		ls_Filter = ' ( "a" = "a" ) '
	END IF
	This.SelectRow(0, FALSE)
	This.SelectRow(currentrow, TRUE)
	li_Tour_Group = This.Object.tour_group[currentrow]
	li_Return = dw_tour.SetTransObject(SQLCA)
	li_Return = dw_tour.Reset()
	li_Num_Rows = dw_tour.Retrieve(li_Tour_Group, guo_user.ID)

	ROLLBACK USING SQLCA ;

	IF ( li_Num_Rows > 0 ) THEN
		dw_tour.ScrollToRow(1)
		dw_tour.SelectRow(0, FALSE)
		dw_tour.SelectRow(1, TRUE)
	END IF
//	cb_ok.Enabled = ( li_Num_Rows > 0 )
END IF

//string ls_Filter
//integer li_Tour_Group
//integer li_Num_Rows
//integer li_Return
//integer li_Count
//boolean lb_Display_Revisions
//
//IF ( This.RowCount() > 0 ) THEN
//	lb_Display_Revisions = ( Upper(f_ProfileString(gs_module_id, "AllowRevisedTourDownload", "No")) = 'YES' )
//	IF NOT lb_Display_Revisions THEN
//		ls_Filter = ' ( active > 0 ) '
//	ELSE
//		ls_Filter = ' ( "a" = "a" ) '
//	END IF
//	This.SelectRow(0, FALSE)
//	This.SelectRow(currentrow, TRUE)
//	li_Tour_Group = This.Object.tour_group[currentrow]
//	li_Return = dw_tour.SetTransObject(SQLCA)
//	li_Return = dw_tour.Reset()
//	FOR li_Count = 1 TO 10
//		IF ( gsu_tour_parameters[li_Count].tour_number <> -1 ) THEN
//			ls_Filter = ls_Filter + " AND tour <> " + String(gsu_tour_parameters[li_Count].tour_number)
//		END IF
//	NEXT
////	ls_Filter = Mid(ls_Filter, 5)
//	li_Return = dw_tour.SetFilter(ls_Filter)
//
//	li_Num_Rows = dw_tour.Retrieve(li_Tour_Group, guo_user.ID)
//	ROLLBACK USING SQLCA ;
//	IF ( li_Num_Rows > 0 ) THEN
//		dw_tour.ScrollToRow(1)
//		dw_tour.SelectRow(0, FALSE)
//		dw_tour.SelectRow(1, TRUE)
//	END IF
//	cb_ok.Enabled = ( li_Num_Rows > 0 )
//END IF
end event

type cb_cancel from commandbutton within w_select_tour
integer x = 768
integer y = 1408
integer width = 347
integer height = 104
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

event clicked;ii_Window_To_Open = 1 // w_main
CLOSE(Parent)
end event

type cb_ok from commandbutton within w_select_tour
integer x = 338
integer y = 1408
integer width = 347
integer height = 104
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

event clicked;string ls_MB_String
integer li_Shift_No
integer li_Row
date ld_Date
integer li_Count
integer li_Tour_Number
integer li_Tour_Rev_No
boolean lb_No_Tours
boolean lb_No_Date
boolean lb_Invalid_Date
boolean lb_No_Shift
string ls_Tour_Type_Id
string ls_Shift_Chosen

dw_tour_date.accepttext()
ld_Date = date(dw_tour_date.getitemdatetime(1,'tour_date'))
lb_No_Tours = (dw_tour.RowCount() <= 0)
lb_No_Date = isnull(ld_Date)

lb_Invalid_Date = false

li_row = dw_shift_list.getrow()

ls_Shift_Chosen = string(dw_shift_list.GetItemnumber(li_row, 'shift_no'))

li_Shift_No = long(ls_Shift_Chosen)
lb_No_Shift = Empty(ls_Shift_Chosen)
//lb_No_Shift = (ddlb_shift.FindItem(ddlb_shift.Text, 0) <= 0)

IF lb_No_Tours OR lb_No_Date OR lb_No_Shift THEN
	MessageBox(f_LanguageString('WARNING', 'Warning'), f_LanguageString('ENTRIES_ARE_INCOMPLETE_SELECT_A_TOUR,_A_TOUR_DATE_AND_A_SHIFT.', 'Entries are incomplete: select a tour, a tour date and a shift.'))
ELSE
	li_Tour_Number = dw_tour.Object.tour[dw_tour.GetRow()]
	IF f_Check_User(li_Tour_Number, TRUE)  THEN
//	IF ( guo_user.Is_Granted('OR' + f_PadL(String(li_Tour_Number), 3, '0'), 20) > 0 ) THEN
		li_Tour_Rev_No = dw_tour.Object.rev_no[dw_tour.GetRow()]
		ls_Tour_Type_Id = dw_tour.Object.tour_type_id[dw_tour.GetRow()]
		li_Count = f_Tour_Already_Open(li_Tour_Number, li_Tour_Rev_No)
		IF ( li_Count < 0 ) THEN
			integer li_Applicable_Stations
			integer li_DOM
			integer li_DOW
//			integer li_Shift
			string ls_DOM
			string ls_DOW
			string ls_Shift
			string ls_Sql
			long ll_Num_Rows
			datastore lds_temp
				
			lds_temp = CREATE datastore
				
			li_DOW = DayNumber(ld_Date)
			li_DOM = Day(ld_Date)

//			ls_Shift_Chosen = LeftTrim(ddlb_shift.Text)
//			li_Shift = Integer(MID(ls_Shift_Chosen, 1, POS(ls_Shift_Chosen, " ") - 1))

			ls_Sql = " &
				SELECT COUNT(*) &
				  FROM station a, shift_time b, appl_shift_times c &
				 WHERE ( a.tour = " + String(li_Tour_Number) + " ) &
					AND ( a.rev_no = " + String(li_Tour_Rev_No) + " ) &
					AND ( b.tour = a.tour ) &
					AND ( b.rev_no = a.rev_no ) &
					AND ( b.shift_no = " + String(li_Shift_No) + " ) &
					AND ( c.tour = b.tour ) &
					AND ( c.rev_no = b.rev_no ) &
					AND ( c.shift_no = b.shift_no ) &
					AND ( c.sta = a.sta ) &
					AND ( c.shift_appl = 1 ) "
				
			ls_DOW = Fill("_", li_DOW - 1) + "X%"
			ls_DOM = Fill("_", li_DOM - 1) + "X%"
					 
			ls_Sql = ls_Sql + " AND ( ( a.appldow LIKE '" + ls_DOW + "' ) OR ( a.appldom LIKE '" + ls_DOM + "' ) ) "
			ll_Num_Rows = f_Datastore_From_Sql(ls_Sql, lds_temp)
			IF ( ll_Num_Rows > 0 ) THEN
				li_Applicable_Stations = lds_temp.GetItemNumber(1, 1)
				DESTROY lds_temp
				IF ( li_Applicable_Stations <= 0 ) THEN
					MessageBox(f_LanguageString('WARNING', 'Warning'), f_LanguageString('THERE_ARE_NO_APPLICABLE_STATIONS_FOR_THIS_TOUR.', 'There are no applicable stations for this tour.'), Exclamation!)
					RETURN
				END IF
			END IF
			gi_Current_Tour = ABS(li_Count)
			gsu_tour_parameters[gi_Current_Tour].tour_filename = TRIM(dw_tour.Object.tour_name[dw_tour.GetRow()])
			gsu_tour_parameters[gi_Current_Tour].tour_date = ld_Date
			gsu_tour_parameters[gi_Current_Tour].shift_no = li_Shift_No //Integer(LeftTrim(MID(ddlb_shift.Text, 1, POS(ddlb_shift.Text, " ") - 1)))
			gsu_tour_parameters[gi_Current_Tour].tour_number = li_Tour_Number
			gsu_tour_parameters[gi_Current_Tour].rev_no = li_Tour_Rev_No
			gsu_tour_parameters[gi_Current_Tour].tour_type_id = ls_Tour_Type_Id
			gsu_tour_parameters[gi_Current_Tour].selectedtab = 1

			SELECT shift_time.normal_start_time, 
					 shift_time.normal_start_day, 
					 tour.alert_description
			  INTO :gsu_tour_parameters[gi_Current_Tour].normal_start_time, 
					 :gsu_tour_parameters[gi_Current_Tour].normal_start_day, 
					 :gsu_tour_parameters[gi_Current_Tour].tour_alert_description 
			  FROM shift_time, tour 
			 WHERE ( shift_time.tour = :gsu_tour_parameters[gi_Current_tour].Tour_Number ) 
				AND ( shift_time.rev_no = :gsu_tour_parameters[gi_Current_tour].rev_no ) 
				AND ( shift_no = :gsu_tour_parameters[gi_Current_tour].shift_no ) 
				AND ( shift_time.tour = tour.tour ) 
				AND ( shift_time.rev_no = tour.rev_no ) ;

			IF Empty(gsu_tour_parameters[gi_Current_tour].Tour_Alert_Description) THEN
				gsu_tour_parameters[gi_Current_tour].Tour_Alert_Description = 'Alert'
			END IF
			IF ( wf_Warning(li_Tour_Number, li_Tour_Rev_No, li_Shift_No) = 1 ) THEN
				ii_Window_To_Open = 2 // w_tour_parameters
				Close(Parent)
			ELSE
				gsu_tour_parameters[gi_Current_Tour].tour_number = -1
			END IF
			//w_select_tour.Visible = FALSE
		ELSEIF ( li_Count = 0 ) THEN
//			MessageBox("Warning", "Too many tours open.  Close one and try again.", Exclamation!)
			MessageBox(f_LanguageString('WARNING', "Warning"), f_LanguageString('TOO_MANY_TOURS_OPEN.__CLOSE_ONE_AND_TRY_AGAIN.', "Too many tours open.  Close one and try again."), Exclamation!)
		ELSE
			ii_Window_To_Open = 2 // w_tour_parameters
			Close(Parent)
			//w_select_tour.Visible = FALSE
		END IF
//	ELSE
//		MessageBox('Warning', 'You do not have the proper security right to open this tour.')
	END IF
END IF
end event

type ddlb_shift from dropdownlistbox within w_select_tour
boolean visible = false
integer x = 535
integer y = 1204
integer width = 471
integer height = 416
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
end type

event selectionchanged;string ls_Normal_Start_Time
integer li_Normal_Start_Day
integer li_Tour
integer li_Rev_No
integer li_Row
string ls_Shift_Chosen
integer li_Shift_No
date ld_Shift_Date
date ld_Current_Date

ld_Current_Date = Today()
li_Row = dw_tour.GetRow()
IF ( li_Row > 0 ) THEN
	ls_Shift_Chosen = LeftTrim(ddlb_shift.Text)
	li_Shift_No = Integer(MID(ls_Shift_Chosen, 1, POS(ls_Shift_Chosen, " ") - 1))
	li_Tour = dw_tour.Object.tour[li_Row]
	li_Rev_No = dw_tour.Object.rev_no[li_Row]
	
	//MessageBox('ls_Shift_Chosen - ' + ls_Shift_Chosen, 'li_Shift_No - ' + String(li_Shift_No))
	
	SELECT normal_start_time, 
			 normal_start_day 
	  INTO :ls_Normal_Start_Time, 
			 :li_Normal_Start_Day 
	  FROM shift_time 
	 WHERE ( tour = :li_Tour ) 
		AND ( rev_no = :li_Rev_No ) 
		AND ( shift_no = :li_Shift_No ) ;

	ld_Shift_Date = RelativeDate(ld_Current_Date, -li_Normal_Start_Day)
	w_select_tour.Post Event Set_Date(String(ld_Shift_Date, date_format))
//	em_tour_date.Text = String(ld_Shift_Date, date_format)
END IF
end event

type st_shift from statictext within w_select_tour
integer x = 238
integer y = 1256
integer width = 279
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32567268
string text = "Shift:"
alignment alignment = right!
long bordercolor = 32567268
boolean focusrectangle = false
end type

type st_tour_date from statictext within w_select_tour
integer x = 229
integer y = 1116
integer width = 288
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32567268
string text = "Date:"
alignment alignment = right!
long bordercolor = 32567268
boolean focusrectangle = false
end type

type st_tour from statictext within w_select_tour
boolean visible = false
integer x = 165
integer y = 568
integer width = 1266
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12632256
string text = " Tour"
boolean border = true
boolean focusrectangle = false
end type

type st_label from statictext within w_select_tour
integer x = 27
integer y = 8
integer width = 1042
integer height = 84
integer taborder = 10
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
string text = " Open a Tour"
long bordercolor = 32567268
boolean focusrectangle = false
end type

