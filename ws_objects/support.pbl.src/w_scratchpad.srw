$PBExportHeader$w_scratchpad.srw
forward
global type w_scratchpad from window
end type
type cb_ok from commandbutton within w_scratchpad
end type
type st_scratchpad from statictext within w_scratchpad
end type
type mle_scratchpad from multilineedit within w_scratchpad
end type
end forward

global type w_scratchpad from window
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
st_scratchpad st_scratchpad
mle_scratchpad mle_scratchpad
end type
global w_scratchpad w_scratchpad

type variables

end variables

forward prototypes
public subroutine wf_write_file ()
public subroutine wf_read_file ()
end prototypes

event post_open();mle_scratchpad.SetFocus()
end event

public subroutine wf_write_file ();integer li_FileNum
integer li_Count
long ll_Return
string ls_Temp
long ll_Length
string ls_Path_And_File

ls_Path_And_File = GetCurrentDirectory() + "\" + gs_Scratchpad_File

li_FileNum = FileOpen(ls_Path_And_File, StreamMode!, Write!, Shared!, Replace!)
IF ( li_FileNum > 0 ) THEN
	ls_Temp = TRIM(mle_scratchpad.Text)
	ll_Return = FileWriteEX(li_FileNum, ls_Temp)
END IF
FileClose(li_FileNum)
end subroutine

public subroutine wf_read_file ();integer li_FileNum
blob b
string ls_Path_And_File

ls_Path_And_File = GetCurrentDirectory() + "\" + gs_Scratchpad_File
// open the file
li_FileNum = FileOpen(ls_Path_And_File, StreamMode!, Read!, LockRead!)
// Read the file
FileReadEX(li_FileNum, b)
FileClose(li_FileNum)
mle_scratchpad.Text = String(b)
end subroutine

on w_scratchpad.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.cb_ok=create cb_ok
this.st_scratchpad=create st_scratchpad
this.mle_scratchpad=create mle_scratchpad
this.Control[]={this.cb_ok,&
this.st_scratchpad,&
this.mle_scratchpad}
end on

on w_scratchpad.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_ok)
destroy(this.st_scratchpad)
destroy(this.mle_scratchpad)
end on

event open;guo_window.Post uf_Resize(w_scratchpad)
//guo_window.Post uf_Reposition(This)

//This.Height = Integer(This.Tag)

This.Title = gs_Window_Title

cb_ok.Text = f_LanguageString('OK', 'Ok')
st_scratchpad.Text = f_LanguageString('SCRATCH_PAD', 'Scratch Pad')

wf_Read_File()
This.PostEvent('Post_Open')
end event

event close;gl_X = This.X
gl_Y = This.Y
wf_Write_File()
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

type cb_ok from commandbutton within w_scratchpad
string tag = "960"
integer x = 416
integer y = 960
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
end type

event clicked;Close(Parent)
end event

type st_scratchpad from statictext within w_scratchpad
integer x = 18
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
string text = "Scratchpad"
boolean focusrectangle = false
end type

type mle_scratchpad from multilineedit within w_scratchpad
string tag = "884"
integer x = 27
integer y = 64
integer width = 1042
integer height = 884
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
end type

event getfocus;
end event

event losefocus;
end event

