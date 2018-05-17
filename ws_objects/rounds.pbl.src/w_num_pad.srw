$PBExportHeader$w_num_pad.srw
forward
global type w_num_pad from window
end type
type cb_10 from commandbutton within w_num_pad
end type
type em_1 from editmask within w_num_pad
end type
type cb_minus from commandbutton within w_num_pad
end type
type cb_0 from commandbutton within w_num_pad
end type
type cb_decimal from commandbutton within w_num_pad
end type
type cb_done from commandbutton within w_num_pad
end type
type cb_1 from commandbutton within w_num_pad
end type
type cb_2 from commandbutton within w_num_pad
end type
type cb_3 from commandbutton within w_num_pad
end type
type cb_cancel from commandbutton within w_num_pad
end type
type cb_4 from commandbutton within w_num_pad
end type
type cb_5 from commandbutton within w_num_pad
end type
type cb_6 from commandbutton within w_num_pad
end type
type cb_clear from commandbutton within w_num_pad
end type
type cb_7 from commandbutton within w_num_pad
end type
type cb_8 from commandbutton within w_num_pad
end type
type cb_9 from commandbutton within w_num_pad
end type
type cb_backspace from commandbutton within w_num_pad
end type
end forward

global type w_num_pad from window
integer y = 304
integer width = 1097
integer height = 1080
windowtype windowtype = response!
long backcolor = 32567268
string icon = "AppIcon!"
boolean center = true
cb_10 cb_10
em_1 em_1
cb_minus cb_minus
cb_0 cb_0
cb_decimal cb_decimal
cb_done cb_done
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_cancel cb_cancel
cb_4 cb_4
cb_5 cb_5
cb_6 cb_6
cb_clear cb_clear
cb_7 cb_7
cb_8 cb_8
cb_9 cb_9
cb_backspace cb_backspace
end type
global w_num_pad w_num_pad

type prototypes
Function long GetUserDefaultLCIDNT() Library "kernel32.dll"  alias for "GetUserDefaultLCID"
Function long GetSystemDefaultLCIDNT() Library "kernel32.dll"  alias for "GetSystemDefaultLCID"
Function long GetLocaleInfoNT(long al_Locale, long al_LCType,ref string ls_lpLCData, long ll_cchData) Library "kernel32.dll" alias for "GetLocaleInfoW"

end prototypes

type variables
string is_Decimal_Separator

end variables

forward prototypes
public subroutine wf_update_number (string as_number)
end prototypes

public subroutine wf_update_number (string as_number);string ls_Temp
integer li_Count
string ls_Entry_Left
string ls_Entry_Right
integer li_Length
integer li_Position
string ls_Entry
char lc_Order
string ls_Mask
integer li_Mask_Length
integer li_Entry_Length
integer li_Separator_Position

li_Position = em_1.Position()
ls_Mask = em_1.Mask
li_Mask_Length = LEN(ls_Mask)
ls_Entry = em_1.Text
li_Entry_Length = LEN(ls_Entry)
li_Separator_Position = 0
FOR li_Count = 1 TO li_Mask_Length
	ls_Temp = MID(ls_Mask, li_Count, 1)
	IF ( ls_Temp = '.' ) THEN
		li_Separator_Position = li_Count
		EXIT
	END IF
NEXT

lc_Order = 'L'
//em_1.GetData(ls_Entry)
IF ( lc_Order = 'R' ) THEN
	ls_Entry = MID(ls_Entry, 2)
	ls_Entry = ls_Entry + as_Number
ELSEIF ( lc_Order = 'L' ) THEN
	IF ( li_Separator_Position > 0 ) AND ( li_Position = li_Entry_Length ) AND ( li_Entry_Length = li_Mask_Length ) THEN
		ls_Entry = MID(ls_Entry, 1, li_Mask_Length - 1) + as_Number
	ELSE
		ls_Entry = TRIM(ls_Entry)
		li_Length = LEN(ls_Entry)
		IF ( li_Length + 1 = li_Position ) THEN
			ls_Entry += as_Number
		ELSE
			IF ( li_Position = li_Separator_Position ) THEN
				ls_Entry_Left = MID(ls_Entry, 1, li_Position)
				ls_Entry_Right = as_Number + MID(ls_Entry, li_Position + 2)
			ELSE
				ls_Entry_Left = MID(ls_Entry, 1, li_Position - 1)
				ls_Entry_Right = as_Number + MID(ls_Entry, li_Position + 1)
			END IF
			ls_Entry = ls_Entry_Left + ls_Entry_Right
		END IF
	END IF
END IF
ls_Entry = MID(ls_Entry, 1, li_Mask_Length)
em_1.Text = ls_Entry

IF ( li_Position = li_Separator_Position ) THEN
	em_1.SelectText(li_Position + 2, 0)
ELSE
	em_1.SelectText(li_Position + 1, 0)
END IF
em_1.Post SetFocus()
end subroutine

on w_num_pad.create
this.cb_10=create cb_10
this.em_1=create em_1
this.cb_minus=create cb_minus
this.cb_0=create cb_0
this.cb_decimal=create cb_decimal
this.cb_done=create cb_done
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_cancel=create cb_cancel
this.cb_4=create cb_4
this.cb_5=create cb_5
this.cb_6=create cb_6
this.cb_clear=create cb_clear
this.cb_7=create cb_7
this.cb_8=create cb_8
this.cb_9=create cb_9
this.cb_backspace=create cb_backspace
this.Control[]={this.cb_10,&
this.em_1,&
this.cb_minus,&
this.cb_0,&
this.cb_decimal,&
this.cb_done,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_cancel,&
this.cb_4,&
this.cb_5,&
this.cb_6,&
this.cb_clear,&
this.cb_7,&
this.cb_8,&
this.cb_9,&
this.cb_backspace}
end on

on w_num_pad.destroy
destroy(this.cb_10)
destroy(this.em_1)
destroy(this.cb_minus)
destroy(this.cb_0)
destroy(this.cb_decimal)
destroy(this.cb_done)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_cancel)
destroy(this.cb_4)
destroy(this.cb_5)
destroy(this.cb_6)
destroy(this.cb_clear)
destroy(this.cb_7)
destroy(this.cb_8)
destroy(this.cb_9)
destroy(this.cb_backspace)
end on

event open;string ls_Parm
string ls_Reading
string ls_Mask

ls_Parm = Message.StringParm
Message.StringParm = ''
ls_Reading = MID(ls_Parm, 1, POS(ls_Parm, '|') - 1)
ls_Mask = MID(ls_Parm, POS(ls_Parm, '|') + 1)

cb_backspace.Text = f_LanguageString('BS', 'BS')
cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_clear.Text = f_LanguageString('C', 'C')
cb_done.Text = f_LanguageString('DONE', 'Done')

cb_decimal.Text = guo_date_format.is_Decimal_Separator
cb_decimal.Tag = guo_date_format.is_Decimal_Separator

IF NOT Empty(ls_Mask) THEN
	em_1.SetMask(DecimalMask!, ls_Mask)
ELSE
	em_1.SetMask(StringMask!, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
END IF
IF NOT Empty(ls_Reading) THEN
	em_1.Text = ls_Reading
END IF
end event

event activate;This.X = gl_X + (w_main.Width - This.Width) / 2
This.Y = gl_Y + 104

end event

type cb_10 from commandbutton within w_num_pad
string tag = "E"
integer x = 754
integer y = 144
integer width = 155
integer height = 208
integer taborder = 120
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "E"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type em_1 from editmask within w_num_pad
integer x = 37
integer y = 32
integer width = 1024
integer height = 112
integer taborder = 10
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
alignment alignment = right!
boolean displayonly = true
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
end type

type cb_minus from commandbutton within w_num_pad
integer x = 37
integer y = 752
integer width = 238
integer height = 208
integer taborder = 140
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "-"
end type

event clicked;string ls_Entry

//IF Empty(em_1.Mask) THEN
	em_1.GetData(ls_Entry)
	em_1.Text = String(0 - dec(ls_Entry))
//END IF

//string ls_Entry
//
//ls_Entry = em_1.Text
//IF IsNumber(ls_Entry) THEN
//	ls_Entry = '-' + ls_Entry
//	em_1.Text = ls_Entry
//END IF
end event

type cb_0 from commandbutton within w_num_pad
string tag = "0"
integer x = 274
integer y = 752
integer width = 238
integer height = 208
integer taborder = 160
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "0"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_decimal from commandbutton within w_num_pad
string tag = "."
integer x = 512
integer y = 752
integer width = 238
integer height = 208
integer taborder = 30
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "."
end type

event clicked;string ls_Entry

ls_Entry = em_1.Text
IF ( POS(ls_Entry, is_Decimal_Separator) = 0 ) THEN
	wf_Update_Number(This.Tag)
END IF
end event

type cb_done from commandbutton within w_num_pad
integer x = 754
integer y = 752
integer width = 311
integer height = 208
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Done"
end type

event clicked;string ls_Entry

ls_Entry = em_1.Text
//MessageBox('entry - isnumber?', '"' + ls_Entry + '"' + ' - ' + String(IsNumber(ls_Entry)))
CloseWithReturn(Parent, em_1.Text)
end event

type cb_1 from commandbutton within w_num_pad
string tag = "1"
integer x = 37
integer y = 552
integer width = 238
integer height = 208
integer taborder = 90
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "1"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_2 from commandbutton within w_num_pad
string tag = "2"
integer x = 274
integer y = 552
integer width = 238
integer height = 208
integer taborder = 120
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "2"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_3 from commandbutton within w_num_pad
string tag = "3"
integer x = 512
integer y = 552
integer width = 238
integer height = 208
integer taborder = 150
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "3"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_cancel from commandbutton within w_num_pad
integer x = 754
integer y = 552
integer width = 311
integer height = 208
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;CloseWithReturn(Parent, '')
end event

type cb_4 from commandbutton within w_num_pad
string tag = "4"
integer x = 37
integer y = 352
integer width = 238
integer height = 208
integer taborder = 60
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "4"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_5 from commandbutton within w_num_pad
string tag = "5"
integer x = 274
integer y = 352
integer width = 238
integer height = 208
integer taborder = 50
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "5"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_6 from commandbutton within w_num_pad
string tag = "6"
integer x = 512
integer y = 352
integer width = 238
integer height = 208
integer taborder = 40
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "6"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_clear from commandbutton within w_num_pad
integer x = 754
integer y = 352
integer width = 311
integer height = 208
integer taborder = 100
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "C"
end type

event clicked;em_1.Text = ''
em_1.SelectText(1, 0)
em_1.Post SetFocus()
end event

type cb_7 from commandbutton within w_num_pad
string tag = "7"
integer x = 37
integer y = 144
integer width = 238
integer height = 208
integer taborder = 20
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "7"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_8 from commandbutton within w_num_pad
string tag = "8"
integer x = 274
integer y = 144
integer width = 238
integer height = 208
integer taborder = 80
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "8"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_9 from commandbutton within w_num_pad
string tag = "9"
integer x = 512
integer y = 144
integer width = 238
integer height = 208
integer taborder = 110
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "9"
end type

event clicked;wf_Update_Number(This.Tag)
end event

type cb_backspace from commandbutton within w_num_pad
integer x = 910
integer y = 144
integer width = 155
integer height = 208
integer taborder = 130
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "BS"
end type

event clicked;integer li_Position
string ls_Entry

li_Position = em_1.Position()

em_1.GetData(ls_Entry)
IF ( li_Position - 1 = LEN(ls_Entry) ) THEN
	ls_Entry = TRIM(ls_Entry)
//	ls_Entry = MID(ls_Entry, 1, LEN(ls_Entry) - 1)
	ls_Entry = MID(ls_Entry, 1, li_Position - 2)
	em_1.Text = ls_Entry
ELSE
	ls_Entry = MID(ls_Entry, 1, li_Position - 2) + MID(ls_Entry, li_Position)
	em_1.Text = ls_Entry
	li_Position = li_Position - 2
END IF

em_1.SelectText(li_Position + 1, 0)
em_1.Post SetFocus()
end event

