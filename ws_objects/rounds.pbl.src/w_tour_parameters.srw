$PBExportHeader$w_tour_parameters.srw
forward
global type w_tour_parameters from window
end type
type rr_1 from roundrectangle within w_tour_parameters
end type
type st_rev_no_2 from statictext within w_tour_parameters
end type
type st_rev_no from statictext within w_tour_parameters
end type
type st_tour_group_2 from statictext within w_tour_parameters
end type
type st_tour_group from statictext within w_tour_parameters
end type
type mle_general_tour_notes from multilineedit within w_tour_parameters
end type
type st_general_tour_notes from statictext within w_tour_parameters
end type
type st_shift_time_2 from statictext within w_tour_parameters
end type
type st_tour_date_2 from statictext within w_tour_parameters
end type
type st_revision_2 from statictext within w_tour_parameters
end type
type st_procedure_2 from statictext within w_tour_parameters
end type
type st_shift_time from statictext within w_tour_parameters
end type
type cb_cancel from commandbutton within w_tour_parameters
end type
type cb_ok from commandbutton within w_tour_parameters
end type
type st_tour_date from statictext within w_tour_parameters
end type
type st_revision from statictext within w_tour_parameters
end type
type st_procedure from statictext within w_tour_parameters
end type
type st_tour_name from statictext within w_tour_parameters
end type
type st_label from statictext within w_tour_parameters
end type
type st_tour_name_2 from statictext within w_tour_parameters
end type
type ln_2 from line within w_tour_parameters
end type
type ln_3 from line within w_tour_parameters
end type
type ln_4 from line within w_tour_parameters
end type
type ln_5 from line within w_tour_parameters
end type
type ln_6 from line within w_tour_parameters
end type
type ln_7 from line within w_tour_parameters
end type
end forward

global type w_tour_parameters from window
integer width = 1458
integer height = 1880
boolean titlebar = true
string title = "eSOMS Rounds"
long backcolor = 32567268
string icon = "AppIcon!"
boolean contexthelp = true
rr_1 rr_1
st_rev_no_2 st_rev_no_2
st_rev_no st_rev_no
st_tour_group_2 st_tour_group_2
st_tour_group st_tour_group
mle_general_tour_notes mle_general_tour_notes
st_general_tour_notes st_general_tour_notes
st_shift_time_2 st_shift_time_2
st_tour_date_2 st_tour_date_2
st_revision_2 st_revision_2
st_procedure_2 st_procedure_2
st_shift_time st_shift_time
cb_cancel cb_cancel
cb_ok cb_ok
st_tour_date st_tour_date
st_revision st_revision
st_procedure st_procedure
st_tour_name st_tour_name
st_label st_label
st_tour_name_2 st_tour_name_2
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
end type
global w_tour_parameters w_tour_parameters

type variables
integer	ii_Tour
integer	ii_Window_To_Open // 1 w_tour
									// 2 w_select_tour
end variables

on w_tour_parameters.create
this.rr_1=create rr_1
this.st_rev_no_2=create st_rev_no_2
this.st_rev_no=create st_rev_no
this.st_tour_group_2=create st_tour_group_2
this.st_tour_group=create st_tour_group
this.mle_general_tour_notes=create mle_general_tour_notes
this.st_general_tour_notes=create st_general_tour_notes
this.st_shift_time_2=create st_shift_time_2
this.st_tour_date_2=create st_tour_date_2
this.st_revision_2=create st_revision_2
this.st_procedure_2=create st_procedure_2
this.st_shift_time=create st_shift_time
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_tour_date=create st_tour_date
this.st_revision=create st_revision
this.st_procedure=create st_procedure
this.st_tour_name=create st_tour_name
this.st_label=create st_label
this.st_tour_name_2=create st_tour_name_2
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.Control[]={this.rr_1,&
this.st_rev_no_2,&
this.st_rev_no,&
this.st_tour_group_2,&
this.st_tour_group,&
this.mle_general_tour_notes,&
this.st_general_tour_notes,&
this.st_shift_time_2,&
this.st_tour_date_2,&
this.st_revision_2,&
this.st_procedure_2,&
this.st_shift_time,&
this.cb_cancel,&
this.cb_ok,&
this.st_tour_date,&
this.st_revision,&
this.st_procedure,&
this.st_tour_name,&
this.st_label,&
this.st_tour_name_2,&
this.ln_2,&
this.ln_3,&
this.ln_4,&
this.ln_5,&
this.ln_6,&
this.ln_7}
end on

on w_tour_parameters.destroy
destroy(this.rr_1)
destroy(this.st_rev_no_2)
destroy(this.st_rev_no)
destroy(this.st_tour_group_2)
destroy(this.st_tour_group)
destroy(this.mle_general_tour_notes)
destroy(this.st_general_tour_notes)
destroy(this.st_shift_time_2)
destroy(this.st_tour_date_2)
destroy(this.st_revision_2)
destroy(this.st_procedure_2)
destroy(this.st_shift_time)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_tour_date)
destroy(this.st_revision)
destroy(this.st_procedure)
destroy(this.st_tour_name)
destroy(this.st_label)
destroy(this.st_tour_name_2)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
end on

event open;guo_window.Post uf_Resize(w_tour_parameters)
//guo_window.Post uf_Reposition(This)

string ls_Message
//string ls_Tour_Filename
integer li_Tour
date ld_Tour_Date
integer li_Shift_No
string ls_Shift_Desc
string ls_Tour_Group_Name
integer li_Num_Rows
integer li_Count
string ls_Tour_Name
string ls_Revision
string ls_Procedure_No
string ls_General_Tour_Notes 
integer li_Scanning_Required
integer li_Rev_No

ii_Tour = Message.DoubleParm
SetNull(Message.DoubleParm)

IF IsValid(w_select_tour) THEN
	ii_window_To_Open = 2
ELSEIF IsValid(w_tour) THEN
	ii_window_To_Open = 1
ELSE
	ii_window_To_Open = 3
END IF

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_general_tour_notes.Text = f_LanguageString('GENERAL_TOUR_NOTES:', 'General Tour Notes:')
st_label.Text = f_LanguageString('TOUR_PARAMETERS', 'Tour Parameters')
st_procedure.Text = f_LanguageString('PROCEDURE:', 'Procedure:')
st_rev_no.Text = f_LanguageString('REV_NO.:', 'Rev No.:')
st_revision.Text = f_LanguageString('REVISION:', 'Revision:')
st_shift_time.Text = f_LanguageString('SHIFT:', 'Shift:')
st_tour_date.Text = f_LanguageString('DATE:', 'Date:')
st_tour_group.Text = f_LanguageString('GROUP:', 'Group:')
st_tour_name.Text = f_LanguageString('TOUR:', 'Tour:')

IF ( ii_Tour = gi_Current_Tour ) THEN
	cb_cancel.Visible = FALSE
	cb_ok.X = (This.Width / 2) - (cb_ok.Width / 2)
ELSEIF ( ii_Tour = 0 ) THEN
	cb_ok.X = 201
	cb_cancel.Visible = TRUE
END IF

//ls_Tour_Filename = isu_tour_parameters.tour_filename
ld_Tour_Date = gsu_tour_parameters[gi_Current_Tour].tour_date
li_Shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no
li_Tour = gsu_tour_parameters[gi_Current_Tour].tour_number
li_Rev_No = gsu_tour_parameters[gi_Current_Tour].Rev_No

//// Remove the file extension
//ls_Tour_Filename = MID(ls_Tour_Filename, 1, LEN(ls_Tour_Filename) - 3)

	SELECT tour_group_name, 
			 tour_name, 
			 rev_desc, 
			 proc_no, 
			 general_tour_notes, 
			 scan 
	  INTO :ls_Tour_Group_Name, 
			 :ls_Tour_Name, 
			 :ls_Revision, 
			 :ls_Procedure_No, 
			 :ls_General_Tour_Notes, 
			 :li_Scanning_Required 
	  FROM tour, tour_group 
	 WHERE ( tour = :li_Tour ) 
	   AND ( rev_no = :li_Rev_No ) 
	   AND ( tour.tour_group = tour_group.tour_group ) 
	 USING SQLCA ;
			
	SELECT shift_desc 
	  INTO :ls_Shift_Desc 
	  FROM shift_time 
	 WHERE ( shift_no = :li_Shift_No ) 
	   AND ( tour = :li_Tour ) 
		AND ( rev_no = :li_Rev_No ) 
	 USING SQLCA ;
			
st_tour_group_2.Text = ls_Tour_Group_Name
st_tour_name_2.Text = STRTRAN(ls_Tour_Name, '&', '&&')
st_rev_no_2.Text = String(li_Rev_No)
st_procedure_2.Text = ls_Procedure_No
st_revision_2.Text = ls_Revision
st_tour_date_2.Text = String(ld_Tour_Date, Date_Format)
st_shift_time_2.Text = ls_Shift_Desc

mle_general_tour_notes.Text = ls_General_Tour_Notes
gsu_tour_parameters[gi_Current_Tour].Scanning_Required = ( li_Scanning_Required = 1 )

end event

event close;gl_X = This.X
gl_Y = This.Y
CHOOSE CASE ii_window_To_Open
	CASE 1 // w_tour
		w_tour.Visible = TRUE
	CASE 2 // w_select_tour
		IF NOT IsValid(w_tour) THEN
			gsu_tour_parameters[gi_Current_Tour].tour_number = -1
		ELSE
			gsu_tour_parameters[gi_Current_Tour].tour_number = w_main.wf_Get_Current_Item()
		END IF
		IF IsValid(w_select_tour) THEN
			w_select_tour.Visible = TRUE
		ELSE
			Open(w_select_tour)
		END IF
	CASE 3
		w_main.Visible = TRUE
END CHOOSE
end event

event activate;This.X = gl_X
This.Y = gl_Y
f_Release_Buttons()


end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type rr_1 from roundrectangle within w_tour_parameters
long linecolor = 32567268
integer linethickness = 4
long fillcolor = 16777215
integer x = 23
integer y = 84
integer width = 1403
integer height = 980
integer cornerheight = 40
integer cornerwidth = 46
end type

type st_rev_no_2 from statictext within w_tour_parameters
integer x = 562
integer y = 396
integer width = 645
integer height = 60
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;MessageBox(st_rev_no.Text, st_rev_no_2.Text)
end event

type st_rev_no from statictext within w_tour_parameters
integer x = 169
integer y = 396
integer width = 293
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Rev No.:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_tour_group_2 from statictext within w_tour_parameters
integer x = 562
integer y = 128
integer width = 645
integer height = 60
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;MessageBox(st_tour_group.Text, st_tour_group_2.Text)
end event

type st_tour_group from statictext within w_tour_parameters
integer x = 169
integer y = 128
integer width = 293
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Group:"
alignment alignment = right!
boolean focusrectangle = false
end type

type mle_general_tour_notes from multilineedit within w_tour_parameters
integer x = 23
integer y = 1144
integer width = 1403
integer height = 268
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_general_tour_notes from statictext within w_tour_parameters
integer x = 32
integer y = 1072
integer width = 1042
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 32567268
string text = "General Tour Notes:"
alignment alignment = Left!
boolean focusrectangle = false
end type

type st_shift_time_2 from statictext within w_tour_parameters
integer x = 562
integer y = 952
integer width = 645
integer height = 68
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;MessageBox(st_shift_time.Text, st_shift_time_2.Text)
end event

type st_tour_date_2 from statictext within w_tour_parameters
integer x = 562
integer y = 808
integer width = 645
integer height = 60
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;MessageBox(st_tour_date.Text, st_tour_date_2.Text)
end event

type st_revision_2 from statictext within w_tour_parameters
integer x = 562
integer y = 664
integer width = 645
integer height = 60
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;MessageBox(st_revision.Text, st_revision_2.Text)
end event

type st_procedure_2 from statictext within w_tour_parameters
integer x = 562
integer y = 532
integer width = 645
integer height = 60
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;MessageBox(st_procedure.Text, st_procedure_2.Text)
end event

type st_shift_time from statictext within w_tour_parameters
integer x = 169
integer y = 952
integer width = 293
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Shift:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_tour_parameters
integer x = 832
integer y = 1440
integer width = 347
integer height = 104
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;ii_Window_To_Open = 2 // w_select_tour
CLOSE(Parent)
end event

type cb_ok from commandbutton within w_tour_parameters
integer x = 325
integer y = 1440
integer width = 347
integer height = 104
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;//pointer l_pointer

IF IsValid(w_main) THEN
	gsu_tour_parameters[gi_Current_Tour].menu_number = gi_Current_Tour
	w_main.wf_Populate_Menu(gi_Current_Tour, st_tour_name_2.Text)
END IF

IF ( gsu_tour_parameters[gi_Current_Tour].menu_number = -1 ) THEN
	MessageBox(f_LanguageString('WARNING', "Warning"), f_LanguageString('TOO_MANY_TOURS_OPEN.__CLOSE_ONE_AND_TRY_AGAIN.', "Too many tours open.  Close one and try again."))
ELSE

	IF IsValid(w_tour) THEN
		IF ( ii_Tour = gi_Current_Tour ) THEN
			w_tour.wf_Open_Tour_Lite()
		ELSE
//			l_pointer = SetPointer(HourGlass!)
			w_tour.wf_Open_Tour()
//			SetPointer(l_pointer)
		END IF
	ELSE
		
		geon_mobile_awsex.of_clearlog()
//		l_pointer = SetPointer(HourGlass!)
		Open(w_tour)
//		SetPointer(l_pointer)
	END IF
	
	ii_Window_To_Open = 1 // w_tour
	CLOSE(Parent)
END IF

end event

type st_tour_date from statictext within w_tour_parameters
integer x = 169
integer y = 808
integer width = 293
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Date:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_revision from statictext within w_tour_parameters
integer x = 169
integer y = 664
integer width = 293
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Revision:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_procedure from statictext within w_tour_parameters
integer x = 155
integer y = 532
integer width = 306
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Procedure:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_tour_name from statictext within w_tour_parameters
integer x = 169
integer y = 264
integer width = 293
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Tour:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_label from statictext within w_tour_parameters
integer x = 27
integer y = 4
integer width = 1042
integer height = 68
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
long backcolor = 32567268
string text = "Tour Parameters"
boolean focusrectangle = false
end type

type st_tour_name_2 from statictext within w_tour_parameters
integer x = 562
integer y = 264
integer width = 645
integer height = 60
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean focusrectangle = false
end type

event clicked;MessageBox(st_tour_name.Text, st_tour_name_2.Text)
end event

type ln_2 from line within w_tour_parameters
long linecolor = 134217732
integer linethickness = 4
integer beginx = 27
integer beginy = 228
integer endx = 1422
integer endy = 228
end type

type ln_3 from line within w_tour_parameters
long linecolor = 134217732
integer linethickness = 4
integer beginx = 27
integer beginy = 364
integer endx = 1422
integer endy = 364
end type

type ln_4 from line within w_tour_parameters
long linecolor = 134217732
integer linethickness = 4
integer beginx = 27
integer beginy = 496
integer endx = 1422
integer endy = 496
end type

type ln_5 from line within w_tour_parameters
long linecolor = 134217732
integer linethickness = 4
integer beginx = 27
integer beginy = 632
integer endx = 1422
integer endy = 632
end type

type ln_6 from line within w_tour_parameters
long linecolor = 134217732
integer linethickness = 4
integer beginx = 27
integer beginy = 768
integer endx = 1422
integer endy = 768
end type

type ln_7 from line within w_tour_parameters
long linecolor = 134217732
integer linethickness = 4
integer beginx = 27
integer beginy = 908
integer endx = 1422
integer endy = 908
end type

