$PBExportHeader$w_preferences_edit.srw
forward
global type w_preferences_edit from window
end type
type cb_ok from commandbutton within w_preferences_edit
end type
type mle_entry_text from multilineedit within w_preferences_edit
end type
type cb_cancel from commandbutton within w_preferences_edit
end type
type st_preferences from statictext within w_preferences_edit
end type
end forward

global type w_preferences_edit from window
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
cb_ok cb_ok
mle_entry_text mle_entry_text
cb_cancel cb_cancel
st_preferences st_preferences
end type
global w_preferences_edit w_preferences_edit

type variables
string	is_Window_Source
string	is_Replacement_Character_Left
string	is_Replacement_Character_Right
long		ll_Left_Char
long		ll_Right_Char
end variables

event post_open();mle_entry_text.SetFocus()


end event

on w_preferences_edit.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.cb_ok=create cb_ok
this.mle_entry_text=create mle_entry_text
this.cb_cancel=create cb_cancel
this.st_preferences=create st_preferences
this.Control[]={this.cb_ok,&
this.mle_entry_text,&
this.cb_cancel,&
this.st_preferences}
end on

on w_preferences_edit.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_ok)
destroy(this.mle_entry_text)
destroy(this.cb_cancel)
destroy(this.st_preferences)
end on

event open;guo_window.Post uf_Resize(w_preferences_edit)
//guo_window.Post uf_Reposition(This)

string ls_Entry_Text

ls_Entry_Text = Message.StringParm
Message.StringParm = ''

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_preferences.Text = f_LanguageString('PREFERENCE_EDIT:', 'Preference Edit:')

mle_entry_text.Text = ls_Entry_Text

This.PostEvent('Post_Open')
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

event close;gl_X = This.X
gl_Y = This.Y

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type cb_ok from commandbutton within w_preferences_edit
string tag = "960"
integer x = 270
integer y = 960
integer width = 274
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;CloseWithReturn(Parent, mle_entry_text.Text)
end event

type mle_entry_text from multilineedit within w_preferences_edit
event f2_key pbm_keydown
event select_text ( )
event ue_find_parameter ( integer li_direction )
string tag = "884"
integer x = 27
integer y = 64
integer width = 1042
integer height = 884
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
end type

event f2_key;ulong lul_wparam

lul_wparam = Integer(Message.WordParm)
SetNull(Message.WordParm)
	
This.EVENT ue_Find_Parameter(lul_wparam)
end event

event select_text();integer li_Return

li_Return = This.SelectText(ll_Left_Char, ll_Right_Char - ll_Left_Char + 1)

end event

event ue_find_parameter(integer li_direction);string ls_Text
long ll_Position, ll_Num_Chars, ll_Count
char lc_Current_Char
long ll_Left, ll_Right
integer li_Return

ll_Left_Char = -1
ll_Right_Char = -1
ls_Text = This.text
ll_Left = POS(ls_Text, is_Replacement_Character_Left)
ll_Right = POS(ls_Text, is_Replacement_Character_Right)
IF ( ll_Left > 0 ) AND ( ll_Right > 0 ) AND ( ll_Left < ll_Right ) THEN
	ll_Num_Chars = LEN(ls_Text)
	ll_Position = This.Position()
// If the currently selected item is a replacement parameter, 
// then increase the current position by one so as not to reselect it
	IF ( LEN(This.SelectedText()) > 0 ) THEN
		IF ( MID(ls_Text, ll_Position, 1) = is_Replacement_Character_Left ) THEN
			ll_Position = ll_Position + 1
		END IF
	END IF
	IF ( li_Direction = 37 ) THEN
		ll_Count = ll_Position
		DO WHILE 1 <= ll_Count
			lc_Current_Char = MID(ls_Text, ll_Count, 1)
			IF ( lc_Current_Char = is_Replacement_Character_Right ) THEN
				ll_Right_Char = ll_Count
			ELSEIF ( lc_Current_Char = is_Replacement_Character_Left ) AND ( ll_Right_Char > -1 ) THEN
				ll_Left_Char = ll_Count
				This.PostEvent('Select_Text')
				EXIT
			END IF
			IF ( ll_Count = 1 ) THEN
				ll_Count = ll_Num_Chars
			ELSE
				ll_Count = ll_Count - 1
			END IF
		LOOP
	ELSEIF ( li_Direction = 39 ) THEN
		IF ( (ll_Position - 1) = ll_Num_Chars ) THEN
			ll_Count = ll_Position - 1
		ELSE
			ll_Count = ll_Position
		END IF
		DO WHILE ll_Count <= ll_Num_Chars
			lc_Current_Char = MID(ls_Text, ll_Count, 1)
			IF ( lc_Current_Char = is_Replacement_Character_Left ) THEN
				ll_Left_Char = ll_Count
			ELSEIF ( lc_Current_Char = is_Replacement_Character_Right ) AND ( ll_Left_Char > -1 ) THEN
				ll_Right_Char = ll_Count
				This.PostEvent('Select_Text')
				EXIT
			END IF
			IF ( ll_Count = ll_Num_Chars ) THEN
				ll_Count = 1
			ELSE
				ll_Count = ll_Count + 1
			END IF
		LOOP
	END IF
END IF
end event

event getfocus;
end event

event losefocus;
end event

type cb_cancel from commandbutton within w_preferences_edit
string tag = "960"
integer x = 581
integer y = 960
integer width = 274
integer height = 80
integer taborder = 30
boolean bringtotop = true
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

type st_preferences from statictext within w_preferences_edit
integer x = 18
integer width = 1042
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
string text = "Preference Edit:"
boolean focusrectangle = false
end type

