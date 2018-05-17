$PBExportHeader$w_detail.srw
forward
global type w_detail from window
end type
type dw_detail from datawindow within w_detail
end type
type st_equipment_detail from statictext within w_detail
end type
type cb_ok from commandbutton within w_detail
end type
type mle_detail from multilineedit within w_detail
end type
end forward

global type w_detail from window
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
event ue_close_windows ( )
event ue_focus ( )
dw_detail dw_detail
st_equipment_detail st_equipment_detail
cb_ok cb_ok
mle_detail mle_detail
end type
global w_detail w_detail

type variables
string		is_Parent_Window
end variables

event ue_close_windows();IF ( IsValid(w_select_tour) ) THEN
	This.Show()
	w_select_tour.Visible = FALSE
	RETURN
END IF

IF ( IsValid(w_tour) ) THEN
	This.Show()
	w_tour.Visible = FALSE
	RETURN
END IF
end event

event ue_focus();mle_Detail.SetFocus()
end event

on w_detail.create
this.dw_detail=create dw_detail
this.st_equipment_detail=create st_equipment_detail
this.cb_ok=create cb_ok
this.mle_detail=create mle_detail
this.Control[]={this.dw_detail,&
this.st_equipment_detail,&
this.cb_ok,&
this.mle_detail}
end on

on w_detail.destroy
destroy(this.dw_detail)
destroy(this.st_equipment_detail)
destroy(this.cb_ok)
destroy(this.mle_detail)
end on

event open;guo_window.Post uf_Resize(w_detail)
//guo_window.Post uf_Reposition(This)

long ll_Row
string ls_Detail
string ls_Title
string ls_Arg_1
string ls_Arg_2
string ls_Arg_3
string ls_Arg_4
string ls_Arg_5

ls_Detail = Message.StringParm
Message.StringParm = ""

This.Title = gs_Window_Title

cb_ok.Text = f_LanguageString('OK', 'Ok')

//This.Event ue_Close_Windows()
This.PostEvent('ue_Focus')

ls_Title = MID(ls_Detail, 1, POS(ls_Detail, '|') - 1)
ls_Detail = MID(ls_Detail, POS(ls_Detail, '|') + 1)

CHOOSE CASE ls_Title
	CASE 'Equipment Detail'
		st_equipment_detail.Text = f_LanguageString('EQUIPMENT_DETAIL', 'Equipment Detail')
		mle_detail.Visible = FALSE
		dw_detail.Visible = TRUE
		f_Get_Equipment_Detail_DW(dw_detail, ls_Detail)
	CASE 'Tour Detail'
		st_equipment_detail.Text = f_LanguageString('TOUR_DETAIL', 'Tour Detail')
		mle_detail.Visible = FALSE
		dw_detail.Visible = TRUE
		IF Empty(ls_Detail) THEN
			f_Get_Tour_Detail_DW(dw_detail, gsu_tour_parameters[gi_Current_Tour].tour_number, gsu_tour_parameters[gi_Current_Tour].rev_no)
		ELSE
			string ls_Tour_No
			string ls_Rev_No
			ls_Tour_No = MID(ls_Detail, 1, POS(ls_Detail, '|') - 1)
			ls_Detail = MID(ls_Detail, POS(ls_Detail, '|') + 1)
			ls_Rev_No = ls_Detail
			f_Get_Tour_Detail_DW(dw_detail, Integer(ls_Tour_No), Integer(ls_Rev_No))
		END IF
		ll_Row = dw_detail.InsertRow(0)
	CASE 'Alert Detail'
		st_equipment_detail.Text = f_LanguageString('ALERT_DETAIL', 'Alert Detail')
		mle_detail.Visible = FALSE
		dw_detail.Visible = TRUE
		ls_Arg_1 = MID(ls_Detail, 1, POS(ls_Detail, '|') - 1)
		ls_Detail = MID(ls_Detail, POS(ls_Detail, '|') + 1)
		ls_Arg_2 = MID(ls_Detail, 1, POS(ls_Detail, '|') - 1)
		ls_Detail = MID(ls_Detail, POS(ls_Detail, '|') + 1)
		ls_Arg_3 = MID(ls_Detail, 1, POS(ls_Detail, '|') - 1)
		ls_Detail = MID(ls_Detail, POS(ls_Detail, '|') + 1)
		ls_Arg_4 = MID(ls_Detail, 1, POS(ls_Detail, '|') - 1)
		ls_Detail = MID(ls_Detail, POS(ls_Detail, '|') + 1)
		ls_Arg_5 = ls_Detail
		f_Get_Alert_Detail_DW(dw_detail, Integer(ls_Arg_1), Integer(ls_Arg_2), ls_Arg_3, ls_Arg_4, ls_Arg_5)
		ll_Row = dw_detail.InsertRow(0)
	CASE 'Long Instructions'
		st_equipment_detail.Text = f_LanguageString('LONG_INSTRUCTIONS', 'Long Instructions')
		mle_detail.Visible = TRUE
		dw_detail.Visible = FALSE
		mle_detail.Text = ls_Detail
//	CASE 'Long Instructions'
//		st_tour_detail.Visible = FALSE
//		st_equipment_detail.Visible = TRUE
//		st_equipment_detail.Text = ls_Title
//		mle_detail.Visible = FALSE
//		dw_detail.Visible = TRUE
//		dw_detail.SetRedraw(FALSE)
//		ll_Row = dw_detail.InsertRow(0)
//		dw_detail.Object.header[ll_Row] = ls_Detail
//		ll_Row = dw_detail.InsertRow(0)
//		dw_detail.SetRedraw(TRUE)
	CASE 'Note Detail'
		st_equipment_detail.Text = f_LanguageString('NOTE_DETAIL', 'Note Detail')
		mle_detail.Visible = TRUE
		dw_detail.Visible = FALSE
		mle_detail.Text = ls_Detail
//	CASE 'Note Detail'
//		st_tour_detail.Visible = TRUE
//		st_equipment_detail.Visible = FALSE
//		st_tour_detail.Text = ls_Title
//		mle_detail.Visible = FALSE
//		dw_detail.Visible = TRUE
//		dw_detail.SetRedraw(FALSE)
//		ll_Row = dw_detail.InsertRow(0)
//		dw_detail.Object.header[ll_Row] = ls_Detail
//		ll_Row = dw_detail.InsertRow(0)
//		dw_detail.SetRedraw(TRUE)
END CHOOSE

end event

event close;gl_X = This.X
gl_Y = This.Y

//IF ( IsValid(w_select_tour) ) THEN
//	w_select_tour.Visible = TRUE
//	RETURN
//END IF
//
//IF ( IsValid(w_tour) ) THEN
//	w_tour.Visible = TRUE
//	RETURN
//END IF


//CHOOSE CASE UPPER(is_Parent_Window)
//	CASE 'W_TOUR'
//		w_tour.wf_Open_Tour_Lite()
//	CASE 'W_SELECT_TOUR'
//		w_select_tour.Visible = TRUE
//END CHOOSE
end event

event activate;This.X = gl_X
This.Y = gl_Y
f_Release_Buttons()


end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type dw_detail from datawindow within w_detail
integer x = 27
integer y = 96
integer width = 1042
integer height = 992
integer taborder = 30
string title = "none"
string dataobject = "d_detail"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = StyleLowered!
end type

type st_equipment_detail from statictext within w_detail
integer x = 18
integer y = 8
integer width = 1042
integer height = 64
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Equipment Detail"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_detail
integer x = 416
integer y = 1104
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

event clicked;Close(Parent)
end event

type mle_detail from multilineedit within w_detail
integer x = 18
integer y = 96
integer width = 1042
integer height = 992
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean displayonly = true
end type

