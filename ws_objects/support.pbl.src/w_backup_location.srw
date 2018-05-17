$PBExportHeader$w_backup_location.srw
forward
global type w_backup_location from window
end type
type st_location from statictext within w_backup_location
end type
type st_title from statictext within w_backup_location
end type
type cb_cancel from commandbutton within w_backup_location
end type
type cb_ok from commandbutton within w_backup_location
end type
type ddlb_1 from dropdownlistbox within w_backup_location
end type
end forward

global type w_backup_location from window
integer width = 1097
integer height = 1384
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
event post_open ( )
st_location st_location
st_title st_title
cb_cancel cb_cancel
cb_ok cb_ok
ddlb_1 ddlb_1
end type
global w_backup_location w_backup_location

event post_open();string lsa_Data[]
integer li_Count
string ls_Directory

ddlb_1.Reset()
ddlb_1.AddItem('')
f_GetFlashcards(lsa_Data)
FOR li_Count = 1 TO UpperBound(lsa_Data)
	ddlb_1.AddItem("\" + lsa_Data[li_Count])
NEXT

ls_Directory = ProfileString(GetCurrentDirectory() + "\eSOMS.ini", "Common", "BackupFolder", "")
ddlb_1.SelectItem(ls_Directory, 0)
end event

on w_backup_location.create
this.st_location=create st_location
this.st_title=create st_title
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.ddlb_1=create ddlb_1
this.Control[]={this.st_location,&
this.st_title,&
this.cb_cancel,&
this.cb_ok,&
this.ddlb_1}
end on

on w_backup_location.destroy
destroy(this.st_location)
destroy(this.st_title)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.ddlb_1)
end on

event open;guo_window.Post uf_Resize(w_backup_location)
//guo_window.Post uf_Reposition(This)

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_location.Text = f_LanguageString('LOCATION:', 'Location:')
st_title.Text = f_LanguageString('CHOOSE_BACKUP_DATA_LOCATION', 'Choose Backup Data Location')

This.Post Event Post_Open()
end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event close;gl_X = This.X
gl_Y = This.Y

//w_main.wf_Update_Restore_Menu()
end event

event activate;This.X = gl_X
This.Y = gl_Y

f_Release_Buttons()


end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type st_location from statictext within w_backup_location
integer x = 18
integer y = 80
integer width = 1024
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Location:"
boolean focusrectangle = false
end type

type st_title from statictext within w_backup_location
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
string text = "Choose Backup Data Location"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_backup_location
integer x = 567
integer y = 1056
integer width = 274
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CLOSE(Parent)

end event

type cb_ok from commandbutton within w_backup_location
integer x = 201
integer y = 1056
integer width = 274
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;string ls_Ini_File
string ls_Directory
integer li_FileNum
integer li_Return

// Make sure ini file exists first
ls_Ini_File = GetCurrentDirectory() + "\eSOMS.ini"
IF NOT FileExists(ls_Ini_File) THEN
	li_FileNum = FileOpen(ls_Ini_File)
	FileClose(li_FileNum)
END IF
ls_Directory = ddlb_1.Text
IF ( Right(ls_Directory, 1) = "\" ) THEN
	ls_Directory = MID(ls_Directory, 1, LEN(ls_Directory) - 1)
END IF

IF NOT Empty(ls_Directory) THEN
	IF DirectoryExists(ls_Directory) THEN
		li_Return = SetProfileString(ls_Ini_File, "Common", "BackupFolder", ls_Directory)
		CLOSE(Parent)
	ELSE
		MessageBox(f_LanguageString('ERROR_-_FOLDER_DOES_NOT_EXIST', "Error - Folder doesn't exist"), ls_Directory, Exclamation!)
	END IF
ELSE
	li_Return = SetProfileString(ls_Ini_File, "Common", "BackupFolder", "")
	CLOSE(Parent)
END IF
end event

type ddlb_1 from dropdownlistbox within w_backup_location
integer x = 18
integer y = 160
integer width = 1042
integer height = 352
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

