$PBExportHeader$w_testing_rights.srw
forward
global type w_testing_rights from window
end type
type cb_1 from commandbutton within w_testing_rights
end type
type ddlb_log from dropdownlistbox within w_testing_rights
end type
type st_app from statictext within w_testing_rights
end type
type st_rights from statictext within w_testing_rights
end type
type ddlb_user from dropdownlistbox within w_testing_rights
end type
type st_user from statictext within w_testing_rights
end type
type cb_cancel from commandbutton within w_testing_rights
end type
type dw_rights from datawindow within w_testing_rights
end type
type cb_ok from commandbutton within w_testing_rights
end type
type st_title from statictext within w_testing_rights
end type
end forward

global type w_testing_rights from window
string tag = "1280"
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
event ue_retrieve_users ( )
event ue_retrieve_logs ( )
event ue_retrieve_tours ( )
event ue_retrieve_steps ( )
cb_1 cb_1
ddlb_log ddlb_log
st_app st_app
st_rights st_rights
ddlb_user ddlb_user
st_user st_user
cb_cancel cb_cancel
dw_rights dw_rights
cb_ok cb_ok
st_title st_title
end type
global w_testing_rights w_testing_rights

type variables
datastore	ids_temp
end variables

event ue_retrieve_users();integer li_Remember
string ls_Current_User
integer li_Num_Rows
integer li_Count
string ls_Sql
string ls_User_Id
string ls_Name
integer li_Position

This.SetRedraw(FALSE)
ls_Current_User = guo_user.ID
IF Empty(ls_Current_User) THEN
	ls_Current_User = ''
END IF
ls_Sql = " &
	SELECT user_id, &
	       name &
	  FROM userlog &
	ORDER BY 1 "

ids_temp.Reset()
li_Num_Rows = f_Datastore_From_Sql(ls_Sql, ids_temp)
ddlb_user.Reset()

li_Num_Rows = ids_temp.RowCount()
FOR li_Count = 1 TO li_Num_Rows
	ls_User_Id = TRIM(ids_temp.GetItemString(li_Count, 1))
	ls_Name = TRIM(ids_temp.GetItemString(li_Count, 2))
	li_Position = ddlb_user.AddItem(ls_User_Id + ' - ' + ls_Name)
	IF ( ls_Current_User = ls_User_Id ) THEN
		li_Remember = li_Position
	END IF
NEXT
IF ( li_Remember > 0 ) THEN
	ddlb_user.selectitem(li_Remember)
END IF
This.SetRedraw(TRUE)

end event

event ue_retrieve_logs();integer li_Num_Rows
integer li_Count
string ls_Sql
string ls_Log_Id
string ls_Log_Title
integer li_Position
integer lia_Rights[]

This.SetRedraw(FALSE)

IF NOT gb_Testing_Rights_Opened THEN
//	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	DELETE FROM testing_rights 
	 WHERE ( appl = 'LOG' ) 
	 USING SQLCA ;
	
	COMMIT USING SQLCA ;

//	ls_Sql = 'START SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
END IF

lia_Rights[1] = 1
lia_Rights[2] = 15
lia_Rights[3] = 20
lia_Rights[4] = 21
lia_Rights[5] = 22
lia_Rights[6] = 23
lia_Rights[7] = 24
lia_Rights[8] = 25
lia_Rights[9] = 26
lia_Rights[10] = 28
lia_Rights[11] = 30
lia_Rights[12] = 31
lia_Rights[13] = 36
lia_Rights[14] = 37
lia_Rights[15] = 44
lia_Rights[16] = 45
lia_Rights[17] = 46
lia_Rights[18] = 47
lia_Rights[19] = 48
lia_Rights[20] = 49

FOR li_Count = 1 TO UpperBound(lia_Rights)

	INSERT INTO testing_rights 
			 ( appl, lnum ) 
	VALUES ( 'LOG', :lia_Rights[li_Count] ) 
	 USING SQLCA ;

	COMMIT USING SQLCA ;

NEXT

ls_Sql = " &
	SELECT log_id, &
	       log_title &
	  FROM log_list &
	ORDER BY 1 "

ids_temp.Reset()
li_Num_Rows = f_Datastore_From_Sql(ls_Sql, ids_temp)
ddlb_log.Reset()

li_Num_Rows = ids_temp.RowCount()
FOR li_Count = 1 TO li_Num_Rows
	ls_Log_Id = String(ids_temp.GetItemNumber(li_Count, 1))
	ls_Log_Title = ids_temp.GetItemString(li_Count, 2)
	li_Position = ddlb_log.AddItem(ls_Log_Id + ' - ' + ls_Log_Title)
NEXT
This.SetRedraw(TRUE)

end event

event ue_retrieve_tours();integer li_Num_Rows
integer li_Count
string ls_Sql
string ls_Log_Id
string ls_Log_Title
integer li_Position
integer lia_Rights[]

This.SetRedraw(FALSE)
//ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

DELETE FROM testing_rights 
 WHERE ( appl = 'OR' ) 
 USING SQLCA ;

//ls_Sql = 'START SYNCHRONIZATION DELETE'
//EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

COMMIT USING SQLCA ;

integer li_lnum
ls_Sql = " SELECT lnum FROM user_levels WHERE user_id = '" + guo_user.ID + "' AND appl LIKE 'OR%' "
li_Num_Rows = f_Datastore_FRom_Sql(ls_Sql, ids_temp)

//lia_Rights[1] = 13
//lia_Rights[2] = 20
//lia_Rights[3] = 22

FOR li_Count = 1 TO li_Num_Rows //UpperBound(lia_Rights)
	li_lnum = ids_temp.GetItemNumber(li_Count, 1)

	INSERT INTO testing_rights 
			 ( appl, lnum ) 
	VALUES ( 'OR', :li_lnum ) 
	 USING SQLCA ;

	COMMIT USING SQLCA ;

NEXT

ids_temp.Reset()

ls_Sql = " &
	SELECT DISTINCT &
	       tour, &
	       tour_name &
	  FROM tour &
	ORDER BY 1 "

ids_temp.Reset()
li_Num_Rows = f_Datastore_From_Sql(ls_Sql, ids_temp)
ddlb_log.Reset()

li_Num_Rows = ids_temp.RowCount()
FOR li_Count = 1 TO li_Num_Rows
	ls_Log_Id = String(ids_temp.GetItemNumber(li_Count, 1))
	ls_Log_Title = ids_temp.GetItemString(li_Count, 2)
	li_Position = ddlb_log.AddItem(ls_Log_Id + ' - ' + ls_Log_Title)
NEXT
This.SetRedraw(TRUE)

end event

event ue_retrieve_steps();integer li_Num_Rows
integer li_Count
string ls_Sql
string ls_Type_Id
string ls_Type_Description
integer li_Position
integer lia_Rights[]

This.SetRedraw(FALSE)

//ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

DELETE FROM testing_rights 
 WHERE ( appl = 'CC' ) 
 USING SQLCA ;

//ls_Sql = 'START SYNCHRONIZATION DELETE'
//EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

COMMIT USING SQLCA ;

lia_Rights[1] = 45
lia_Rights[2] = 46
lia_Rights[3] = 47
lia_Rights[4] = 48
lia_Rights[5] = 49
lia_Rights[6] = 50
lia_Rights[7] = 51
lia_Rights[8] = 52
lia_Rights[9] = 53
lia_Rights[10] = 54
lia_Rights[11] = 55
lia_Rights[12] = 56

FOR li_Count = 1 TO UpperBound(lia_Rights)

	INSERT INTO testing_rights 
			 ( appl, lnum ) 
	VALUES ( 'CC', :lia_Rights[li_Count] ) 
	 USING SQLCA ;

	COMMIT USING SQLCA ;

NEXT

ls_Sql = " &
	SELECT DISTINCT &
	       type_id, &
	       description &
	  FROM nccs_procedure_types &
	ORDER BY 1 "

ids_temp.Reset()
li_Num_Rows = f_Datastore_From_Sql(ls_Sql, ids_temp)
ddlb_log.Reset()

li_Num_Rows = ids_temp.RowCount()
FOR li_Count = 1 TO li_Num_Rows
	ls_Type_Id = TRIM(ids_temp.GetItemstring(li_Count, 1))
	ls_Type_Description = TRIM(ids_temp.GetItemString(li_Count, 2))
	li_Position = ddlb_log.AddItem(ls_Type_Id + ' - ' + ls_Type_Description)
NEXT
This.SetRedraw(TRUE)

end event

on w_testing_rights.create
this.cb_1=create cb_1
this.ddlb_log=create ddlb_log
this.st_app=create st_app
this.st_rights=create st_rights
this.ddlb_user=create ddlb_user
this.st_user=create st_user
this.cb_cancel=create cb_cancel
this.dw_rights=create dw_rights
this.cb_ok=create cb_ok
this.st_title=create st_title
this.Control[]={this.cb_1,&
this.ddlb_log,&
this.st_app,&
this.st_rights,&
this.ddlb_user,&
this.st_user,&
this.cb_cancel,&
this.dw_rights,&
this.cb_ok,&
this.st_title}
end on

on w_testing_rights.destroy
destroy(this.cb_1)
destroy(this.ddlb_log)
destroy(this.st_app)
destroy(this.st_rights)
destroy(this.ddlb_user)
destroy(this.st_user)
destroy(this.cb_cancel)
destroy(this.dw_rights)
destroy(this.cb_ok)
destroy(this.st_title)
end on

event open;guo_window.Post uf_Resize(w_testing_rights)
//guo_window.Post uf_Reposition(This)

This.Title = gs_Window_Title
ids_temp = CREATE datastore
This.EVENT ue_Retrieve_Users()
CHOOSE CASE gs_Window_Title
	CASE 'eSOMS Rounds'
		st_app.Text = 'Tour:'
		This.EVENT ue_Retrieve_Tours()
	CASE 'eSOMS Logs'
		st_app.Text = 'Log:'
		This.EVENT ue_Retrieve_Logs()
	CASE 'eSOMS Config'
		st_app.Text = 'Config:'
		This.EVENT ue_Retrieve_Steps()
	CASE ELSE
		Close(This)
END CHOOSE
gb_Testing_Rights_Opened = TRUE

end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event close;gb_Testing_Rights_Opened = FALSE
end event

event activate;f_Release_Buttons()


end event

type cb_1 from commandbutton within w_testing_rights
integer x = 32
integer y = 1072
integer width = 274
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Login"
boolean default = true
end type

event clicked;string ls_SQL
integer li_Count
integer li_Num_Rows
integer li_Lnum
integer li_Selected
string ls_Appl
string ls_User_Id
integer li_Temp

li_Num_Rows = dw_rights.RowCount()
IF ( li_Num_Rows > 0 ) THEN
	ls_User_Id = dw_rights.Object.user_id[1]
	ls_Appl = dw_rights.Object.appl[1]

//	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	DELETE FROM user_levels 
	 WHERE ( user_id = :ls_User_Id ) 
	   AND ( appl = :ls_Appl ) ;

//	ls_Sql = 'START SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	SELECT COUNT(*) INTO :li_Temp 
	  FROM user_levels 
	 WHERE ( user_id = :ls_User_Id ) 
	   AND ( appl = :ls_Appl ) ;

	FOR li_Count = 1 TO li_Num_Rows
		li_Selected = dw_rights.Object.selected[li_Count]
		li_Lnum = dw_rights.Object.lnum[li_Count]
		IF ( li_Selected = 1 ) THEN

			INSERT INTO user_levels 
					 ( user_id, 
					   appl, 
						lnum ) 
		   VALUES ( :ls_User_Id, 
						:ls_Appl, 
						:li_Lnum ) ;
			
		END IF
	NEXT
	
	COMMIT ;
	
	guo_user.Init(ls_User_Id)
END IF

dw_rights.EVENT ue_Retrieve()
end event

type ddlb_log from dropdownlistbox within w_testing_rights
integer x = 18
integer y = 296
integer width = 1042
integer height = 352
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

event selectionchanged;dw_rights.EVENT ue_Retrieve()
end event

type st_app from statictext within w_testing_rights
integer x = 18
integer y = 240
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Tour:"
boolean focusrectangle = false
end type

type st_rights from statictext within w_testing_rights
integer x = 18
integer y = 400
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Rights:"
boolean focusrectangle = false
end type

type ddlb_user from dropdownlistbox within w_testing_rights
integer x = 18
integer y = 128
integer width = 1042
integer height = 352
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

event selectionchanged;dw_rights.EVENT ue_Retrieve()
end event

type st_user from statictext within w_testing_rights
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
string text = "User:"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_testing_rights
integer x = 763
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

type dw_rights from datawindow within w_testing_rights
event ue_retrieve ( )
event ue_sort_dw ( string ls_search,  integer li_column,  string as_current_order )
string tag = "884"
integer x = 18
integer y = 464
integer width = 1042
integer height = 592
integer taborder = 10
string title = "none"
string dataobject = "d_testing_rights"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event ue_retrieve();integer li_Return
string ls_Sql
long ll_Num_Rows
string ls_User_Id
string ls_Appl
string ls_Length
string ls_Appl_2

ls_User_Id = ddlb_user.text
ls_User_Id = MID(ls_User_Id, 1, POS(ls_User_Id, ' - ') - 1)

CHOOSE CASE gs_Window_Title
	CASE 'eSOMS Rounds'
		ls_Appl = 'OR'
		ls_Length = '3'
		ls_Appl_2 = ddlb_log.text
		ls_Appl_2 = MID(ls_Appl_2, 1, POS(ls_Appl_2, ' - ') - 1)
	CASE 'eSOMS Logs'
		ls_Appl = 'LOG'
		ls_Length = '2'
		ls_Appl_2 = ddlb_log.text
		ls_Appl_2 = MID(ls_Appl_2, 1, POS(ls_Appl_2, ' - ') - 1)
	CASE ELSE
		Close(Parent)
END CHOOSE

//ls_Sql = " &
//	SELECT appl, &
//			 1 as selected, &
//			 lnum, &
//			 user_id &
//	  FROM user_levels &
//	 WHERE ( appl = '" + ls_Appl + "' + RIGHT(STRING('0', '" + ls_Appl_2 + "'), " + ls_Length + " ) ) &
//		AND ( user_id = '" + ls_User_Id + "' ) &
//	UNION &
//	SELECT '" + ls_Appl + "' + RIGHT(STRING('0', '" + ls_Appl_2 + "'), " + ls_Length + " ) AS appl, &
//			 0 as selected, &
//			 lnum, &
//			 '" + ls_User_Id + "' AS user_id &
//	  FROM testing_rights &
//	 WHERE ( testing_rights.appl = '" + ls_Appl + "' ) &
//		AND ( testing_rights.lnum NOT IN &
//			 ( SELECT user_levels.lnum &
//				  FROM user_levels &
//				 WHERE ( user_levels.appl = '" + ls_Appl + "' + RIGHT(STRING('0', '" + ls_Appl_2 + "'), " + ls_Length + " ) ) &
//					AND ( user_id = '" + ls_User_Id + "' ) ) ) &
//	ORDER BY lnum "

ls_Sql = " &
	SELECT appl, &
			 1 as selected, &
			 lnum, &
			 user_id &
	  FROM user_levels &
	 WHERE ( appl = STRING('" + ls_Appl + "', REPEAT('0', 3 - LENGTH('" + ls_Appl_2 + "')), " + ls_Appl_2 + " ) ) &
		AND ( user_id = '" + ls_User_Id + "' ) &
	UNION &
	SELECT STRING('" + ls_Appl + "', REPEAT('0', 3 - LENGTH('" + ls_Appl_2 + "')), " + ls_Appl_2 + " ) AS appl, &
			 0 as selected, &
			 lnum, &
			 '" + ls_User_Id + "' AS user_id &
	  FROM testing_rights &
	 WHERE ( testing_rights.appl = '" + ls_Appl + "' ) &
		AND ( testing_rights.lnum NOT IN &
			 ( SELECT user_levels.lnum &
				  FROM user_levels &
				 WHERE ( user_levels.appl = STRING('" + ls_Appl + "', REPEAT('0', 3 - LENGTH('" + ls_Appl_2 + "')), " + ls_Appl_2 + " ) ) &
					AND ( user_id = '" + ls_User_Id + "' ) ) ) &
	ORDER BY lnum "

IF NOT ( Empty(ls_User_Id) OR Empty(ls_Appl_2) ) THEN
	li_Return = This.SetTransObject(SQLCA)
	This.Object.Datawindow.Table.Select = ls_Sql
	ll_Num_Rows = This.Retrieve()
ELSE
	This.Reset()
END IF

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
	This.EVENT ue_Retrieve()
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
			This.ScrollToRow(row)
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

event rowfocuschanged;This.SetRedraw(TRUE)

end event

event rowfocuschanging;This.SetRedraw(FALSE)

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
			This.ScrollToRow(row)
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
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////
end event

type cb_ok from commandbutton within w_testing_rights
integer x = 398
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
string text = "Process"
boolean default = true
end type

event clicked;string ls_SQL
integer li_Count
integer li_Num_Rows
integer li_Lnum
integer li_Selected
string ls_Appl
string ls_User_Id
integer li_Temp

li_Num_Rows = dw_rights.RowCount()
IF ( li_Num_Rows > 0 ) THEN
	ls_User_Id = dw_rights.Object.user_id[1]
	ls_Appl = dw_rights.Object.appl[1]

//	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	DELETE FROM user_levels 
	 WHERE ( user_id = :ls_User_Id ) 
	   AND ( appl = :ls_Appl ) ;

//	ls_Sql = 'START SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	SELECT COUNT(*) INTO :li_Temp 
	  FROM user_levels 
	 WHERE ( user_id = :ls_User_Id ) 
	   AND ( appl = :ls_Appl ) ;

	FOR li_Count = 1 TO li_Num_Rows
		li_Selected = dw_rights.Object.selected[li_Count]
		li_Lnum = dw_rights.Object.lnum[li_Count]
		IF ( li_Selected = 1 ) THEN

			INSERT INTO user_levels 
					 ( user_id, 
					   appl, 
						lnum ) 
		   VALUES ( :ls_User_Id, 
						:ls_Appl, 
						:li_Lnum ) ;
			
		END IF
	NEXT
	
	COMMIT ;
	
	guo_user.Init(guo_user.ID)
END IF

dw_rights.EVENT ue_Retrieve()
end event

type st_title from statictext within w_testing_rights
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
string text = "Modify Rights:"
boolean focusrectangle = false
end type

