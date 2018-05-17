$PBExportHeader$w_abnormal_equipment.srw
forward
global type w_abnormal_equipment from window
end type
type em_date from editmask within w_abnormal_equipment
end type
type st_date from statictext within w_abnormal_equipment
end type
type cbx_oos from checkbox within w_abnormal_equipment
end type
type sle_config from singlelineedit within w_abnormal_equipment
end type
type st_config from statictext within w_abnormal_equipment
end type
type em_equip_operator_id from editmask within w_abnormal_equipment
end type
type mle_notes from multilineedit within w_abnormal_equipment
end type
type st_notes from statictext within w_abnormal_equipment
end type
type st_equipment from statictext within w_abnormal_equipment
end type
type cb_cancel from commandbutton within w_abnormal_equipment
end type
type cb_ok from commandbutton within w_abnormal_equipment
end type
type st_abnormal_equipment from statictext within w_abnormal_equipment
end type
type pb_date from picturebutton within w_abnormal_equipment
end type
end forward

global type w_abnormal_equipment from window
string tag = "1280"
integer width = 1097
integer height = 1280
boolean titlebar = true
string menuname = "mnu_blank"
boolean controlmenu = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
boolean contexthelp = true
event post_open ( )
em_date em_date
st_date st_date
cbx_oos cbx_oos
sle_config sle_config
st_config st_config
em_equip_operator_id em_equip_operator_id
mle_notes mle_notes
st_notes st_notes
st_equipment st_equipment
cb_cancel cb_cancel
cb_ok cb_ok
st_abnormal_equipment st_abnormal_equipment
pb_date pb_date
end type
global w_abnormal_equipment w_abnormal_equipment

type variables
boolean		ib_Edit_Multi
boolean		ib_New_Multi
datetime		idt_CDT

end variables

event post_open();/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
//Appeon comment
//w_abnormal_equipment_dw.Visible = FALSE
/////////////////////////////////////////////////// Appeon End   ///////////////////////////////////////////////////

em_equip_operator_id.SetFocus()
end event

on w_abnormal_equipment.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.em_date=create em_date
this.st_date=create st_date
this.cbx_oos=create cbx_oos
this.sle_config=create sle_config
this.st_config=create st_config
this.em_equip_operator_id=create em_equip_operator_id
this.mle_notes=create mle_notes
this.st_notes=create st_notes
this.st_equipment=create st_equipment
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_abnormal_equipment=create st_abnormal_equipment
this.pb_date=create pb_date
this.Control[]={this.em_date,&
this.st_date,&
this.cbx_oos,&
this.sle_config,&
this.st_config,&
this.em_equip_operator_id,&
this.mle_notes,&
this.st_notes,&
this.st_equipment,&
this.cb_cancel,&
this.cb_ok,&
this.st_abnormal_equipment,&
this.pb_date}
end on

on w_abnormal_equipment.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.em_date)
destroy(this.st_date)
destroy(this.cbx_oos)
destroy(this.sle_config)
destroy(this.st_config)
destroy(this.em_equip_operator_id)
destroy(this.mle_notes)
destroy(this.st_notes)
destroy(this.st_equipment)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_abnormal_equipment)
destroy(this.pb_date)
end on

event open;guo_window.Post uf_Resize(w_abnormal_equipment)
//guo_window.Post uf_Reposition(This)

string ls_Equipment_Mask
string ls_Equip_Operator_Id
string ls_Notes
string ls_Config
integer li_OOS
string ls_Parm
long ll_Row

ls_Parm = Upper(Message.StringParm)
Message.StringParm = ''

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
cbx_oos.Text = f_LanguageString('OOS', 'OOS')
st_abnormal_equipment.Text = f_LanguageString('ABNORMAL_EQUIPMENT', 'Abnormal Equipment')
st_config.Text = f_LanguageString('CONFIGURATION:', 'Configuration:')
st_date.Text = f_LanguageString('DATE/TIME:', 'Date/Time:')
st_equipment.Text = f_LanguageString('EQUIPMENT:', 'Equipment:')
st_notes.Text = f_LanguageString('NOTES:', 'Notes:')

ls_Equipment_Mask = f_ProfileString('NEDBS', 'EquipmentOperatorIDMask', '')

em_equip_operator_id.SetMask(StringMask!, ls_Equipment_Mask)

em_date.SetMask(DateTimeMask!, Date_Format + ' hh:mm:ss')
em_date.Text = String(DateTime(Today(), Now()), Date_Format + ' hh:mm:ss')

ib_New_Multi = ( ls_Parm = 'NEW' )
IF NOT ib_New_Multi THEN
	ll_Row = w_abnormal_equipment_dw.dw_abnormal_equipment.GetRow()
	
	ls_Equip_Operator_Id = w_abnormal_equipment_dw.dw_abnormal_equipment.Object.equip_operator_id[ll_Row]
	ls_Notes = w_abnormal_equipment_dw.dw_abnormal_equipment.Object.notes[ll_Row]
	ls_Config = w_abnormal_equipment_dw.dw_abnormal_equipment.Object.config[ll_Row]
	li_OOS = w_abnormal_equipment_dw.dw_abnormal_equipment.Object.oos[ll_Row]
	idt_CDT = w_abnormal_equipment_dw.dw_abnormal_equipment.Object.cdt[ll_Row]
	em_date.Text = String(idt_CDT, Date_Format + ' hh:mm:ss')

	ib_Edit_Multi = ( MID(ls_Parm, 1, POS(ls_Parm, '_') - 1) = 'EDIT' )
	sle_config.Text = ls_Config
	em_equip_operator_id.Text = ls_Equip_Operator_Id
	mle_notes.Text = ls_Notes
	cbx_oos.Checked = ( li_OOS = 1 )
END IF

This.PostEvent('Post_Open')
end event

event close;gl_X = This.X
gl_Y = This.Y

w_abnormal_equipment_dw.dw_abnormal_equipment.Event ue_Retrieve()
w_abnormal_equipment_dw.Visible = TRUE

end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event activate;This.X = gl_X
This.Y = gl_Y

f_Release_Buttons()

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type em_date from editmask within w_abnormal_equipment
integer x = 27
integer y = 128
integer width = 859
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = datetimemask!
string mask = "[date] [time]"
end type

event getfocus;
end event

event losefocus;
end event

type st_date from statictext within w_abnormal_equipment
integer x = 27
integer y = 64
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
string text = "Date/Time:"
boolean focusrectangle = false
end type

type cbx_oos from checkbox within w_abnormal_equipment
integer x = 18
integer y = 864
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
string text = "OOS"
end type

type sle_config from singlelineedit within w_abnormal_equipment
integer x = 27
integer y = 448
integer width = 1042
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
integer limit = 255
end type

event getfocus;
end event

event losefocus;
end event

type st_config from statictext within w_abnormal_equipment
integer x = 27
integer y = 384
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
string text = "Configuration:"
boolean focusrectangle = false
end type

type em_equip_operator_id from editmask within w_abnormal_equipment
integer x = 27
integer y = 288
integer width = 1042
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
maskdatatype maskdatatype = stringmask!
string mask = "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
end type

event getfocus;
end event

event losefocus;
end event

type mle_notes from multilineedit within w_abnormal_equipment
integer x = 27
integer y = 608
integer width = 1042
integer height = 240
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 255
end type

event getfocus;
end event

event losefocus;
end event

type st_notes from statictext within w_abnormal_equipment
integer x = 27
integer y = 544
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
string text = "Notes:"
boolean focusrectangle = false
end type

type st_equipment from statictext within w_abnormal_equipment
integer x = 27
integer y = 224
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
string text = "Equipment:"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_abnormal_equipment
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

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_abnormal_equipment
integer x = 201
integer y = 960
integer width = 274
integer height = 80
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
string ls_Sql
string ls_Equip_Operator_Id
string ls_Config
string ls_Notes
integer li_OOS
datetime ldt_temp
integer li_Count = 0

ls_Equip_Operator_Id = em_equip_operator_id.Text
ls_Config = sle_config.Text
ls_Notes = mle_notes.Text
IF cbx_oos.Checked THEN
	li_OOS = 1
ELSE
	li_OOS = 0
END IF
ldt_Temp = DateTime(Date(MID(em_date.Text, 1, LEN(Date_Format))), Time(MID(em_date.Text, LEN(Date_Format) + 1)))
integer li_Found_Duplicate

SELECT COUNT(*) INTO :li_Found_Duplicate FROM abnormal_equipment WHERE ( cdt = :ldt_temp ) ;

IF ( li_Found_Duplicate > 0 ) THEN
	DO WHILE ( li_Found_Duplicate > 0 )
		IF ( Time(ldt_Temp) = Time('23:59:59') ) THEN
			ldt_Temp = DateTime(RelativeDate(Date(ldt_Temp), 1), Time('00:00:00'))
		ELSE
			ldt_Temp = DateTime(Date(ldt_Temp), RelativeTime(Time(ldt_Temp), 1))
		END IF
		
		SELECT COUNT(*) INTO :li_Found_Duplicate FROM abnormal_equipment WHERE ( cdt = :ldt_temp ) ;
		
	LOOP
END IF
IF ib_Edit_Multi THEN
//	ls_Sql = 'STOP SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;
	
	  DELETE FROM abnormal_equipment 
	   WHERE ( cdt = :idt_CDT ) 
	   USING SQLCA ;
	
//	ls_Sql = 'START SYNCHRONIZATION DELETE'
//	EXECUTE IMMEDIATE :ls_Sql USING SQLCA ;

	INSERT INTO abnormal_equipment 
			 ( cdt, 
			   equip_operator_id, 
				config, 
				notes, 
				oos ) 
	VALUES ( :ldt_temp, 
	         :ls_Equip_Operator_Id, 
				:ls_Config, 
				:ls_Notes, 
				:li_OOS ) 
	USING SQLCA ;
	
	IF ( SQLCA.SQLCode = 0 ) THEN
		COMMIT ;
	ELSE
		ls_MB_String = f_LanguageString('ABNORMAL_EQUIPMENT_WAS_NOT_SAVED_DUE_TO_AN_ERROR._###', 'Abnormal Equipment was not saved due to an error. ###')
		ls_MB_String = StrTran(ls_MB_String, '###', '~n~r' + SQLCA.SQLErrText)
		MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
		ROLLBACK ;
	END IF
ELSE // Copy or New
	
	INSERT INTO abnormal_equipment 
			 ( cdt, 
			   equip_operator_id, 
				config, 
				notes, 
				oos ) 
	VALUES ( :ldt_temp, 
	         :ls_Equip_Operator_Id, 
				:ls_Config, 
				:ls_Notes, 
				:li_OOS ) 
	USING SQLCA ;
	
	IF ( SQLCA.SQLCode = 0 ) THEN
		COMMIT ;
	ELSE
		ls_MB_String = f_LanguageString('ABNORMAL_EQUIPMENT_WAS_NOT_SAVED_DUE_TO_AN_ERROR._###', 'Abnormal Equipment was not saved due to an error. ###')
		ls_MB_String = StrTran(ls_MB_String, '###', '~n~r' + SQLCA.SQLErrText)
		MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
		ROLLBACK ;
	END IF
END IF

Close(Parent)
end event

type st_abnormal_equipment from statictext within w_abnormal_equipment
integer x = 27
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
string text = "Abnormal Equipment"
boolean focusrectangle = false
end type

type pb_date from picturebutton within w_abnormal_equipment
integer x = 887
integer y = 96
integer width = 183
integer height = 160
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "bitmaps\calendar.png"
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

