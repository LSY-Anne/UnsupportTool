$PBExportHeader$w_options.srw
forward
global type w_options from window
end type
type rb_testing_preferences from radiobutton within w_options
end type
type rb_testing_rights from radiobutton within w_options
end type
type rb_delete_object from radiobutton within w_options
end type
type rb_restore_database from radiobutton within w_options
end type
type rb_backup_database from radiobutton within w_options
end type
type rb_backup_file_location from radiobutton within w_options
end type
type cb_ok from commandbutton within w_options
end type
type cb_cancel from commandbutton within w_options
end type
type st_options from statictext within w_options
end type
type ln_1 from line within w_options
end type
end forward

global type w_options from window
integer width = 1097
integer height = 1280
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
rb_testing_preferences rb_testing_preferences
rb_testing_rights rb_testing_rights
rb_delete_object rb_delete_object
rb_restore_database rb_restore_database
rb_backup_database rb_backup_database
rb_backup_file_location rb_backup_file_location
cb_ok cb_ok
cb_cancel cb_cancel
st_options st_options
ln_1 ln_1
end type
global w_options w_options

type variables

end variables

forward prototypes
public subroutine wf_update_restore_menu ()
public subroutine wf_update_security (boolean ab_enable)
end prototypes

public subroutine wf_update_restore_menu ();string ls_Directory
boolean lb_File_Exists

ls_Directory = ProfileString(gs_Ini_File, "Common", "BackupFolder", '')
lb_File_Exists = FileExists(ls_Directory + '\esoms.db')
rb_restore_database.Enabled = NOT gb_Using_ML AND lb_File_Exists AND rb_backup_file_location.Enabled AND NOT Empty(ls_Directory) //AND ( guo_user.Is_Granted(gs_Module_Id, 13) > 0 )
rb_backup_database.Enabled = NOT gb_Using_ML AND rb_backup_file_location.Enabled AND NOT Empty(ls_Directory)

end subroutine

public subroutine wf_update_security (boolean ab_enable);integer li_Count

rb_delete_object.Enabled = ab_Enable
rb_backup_file_location.Enabled = NOT gb_Using_ML// AND ab_Enable
wf_Update_Restore_Menu()


end subroutine

on w_options.create
this.rb_testing_preferences=create rb_testing_preferences
this.rb_testing_rights=create rb_testing_rights
this.rb_delete_object=create rb_delete_object
this.rb_restore_database=create rb_restore_database
this.rb_backup_database=create rb_backup_database
this.rb_backup_file_location=create rb_backup_file_location
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_options=create st_options
this.ln_1=create ln_1
this.Control[]={this.rb_testing_preferences,&
this.rb_testing_rights,&
this.rb_delete_object,&
this.rb_restore_database,&
this.rb_backup_database,&
this.rb_backup_file_location,&
this.cb_ok,&
this.cb_cancel,&
this.st_options,&
this.ln_1}
end on

on w_options.destroy
destroy(this.rb_testing_preferences)
destroy(this.rb_testing_rights)
destroy(this.rb_delete_object)
destroy(this.rb_restore_database)
destroy(this.rb_backup_database)
destroy(this.rb_backup_file_location)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_options)
destroy(this.ln_1)
end on

event open;guo_window.Post uf_Resize(w_options)

integer li_Return
integer li_Num_Rows

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_options.Text = f_LanguageString('OPTIONS', 'Options')

rb_backup_file_location.Text = f_LanguageString('BACKUP_FILE_LOCATION', 'Backup File Location')
rb_backup_database.Text = f_LanguageString('BACKUP_DATABASE', 'Backup Database')
rb_restore_database.Text = f_LanguageString('RESTORE_DATABASE', 'Restore Database')
rb_testing_preferences.Text = f_LanguageString('TESTING_-_PREFERENCES', 'Testing - Preferences')
rb_testing_rights.Text = f_LanguageString('TESTING_-_RIGHTS', 'Testing - Rights')

// Comment out for testing only
rb_testing_preferences.Visible = FALSE
// rb_testing_rights still needs work!!!!
rb_testing_rights.Visible = FALSE

CHOOSE CASE gs_Module_Id
	CASE 'NCCS'
		rb_delete_object.Text = f_LanguageString('DELETE_STEP', 'Delete Step')
	CASE 'NCS'
		rb_delete_object.Text = f_LanguageString('DELETE_SECTION', 'Delete Section')
	CASE 'NLOGS'
		rb_delete_object.Text = f_LanguageString('DELETE_LOG', 'Delete Log')
	CASE 'NPTS'
		rb_delete_object.Text = f_LanguageString('DELETE_TOUR', 'Delete Tour')
	CASE ELSE
		// Leave alone as Delete ###
END CHOOSE

wf_Update_Security(guo_user.ib_Logged_In)




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

type rb_testing_preferences from radiobutton within w_options
integer x = 18
integer y = 912
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Testing - Preferences"
end type

type rb_testing_rights from radiobutton within w_options
integer x = 18
integer y = 832
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Testing - Rights"
end type

type rb_delete_object from radiobutton within w_options
integer x = 18
integer y = 408
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Delete ###"
end type

type rb_restore_database from radiobutton within w_options
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
string text = "Restore Backup"
end type

type rb_backup_database from radiobutton within w_options
integer x = 18
integer y = 160
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Backup Database"
end type

type rb_backup_file_location from radiobutton within w_options
integer x = 18
integer y = 80
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Backup File Location"
end type

type cb_ok from commandbutton within w_options
integer x = 201
integer y = 1072
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
string text = "Ok"
boolean default = true
end type

event clicked;integer li_Return
	
IF rb_testing_preferences.Checked THEN
	Open(w_testing_preferences)
ELSEIF rb_testing_rights.Checked THEN
	Open(w_testing_rights)
ELSEIF rb_delete_object.Checked THEN
	guo_module_specific.f_Open_Delete()
ELSEIF rb_restore_database.Checked THEN
	IF ( w_main.wf_Count_Open_Items() > 0 ) THEN
		CHOOSE CASE gs_module_id
			CASE 'NCS'
				MessageBox(f_LanguageString('OPEN_SECTIONS', 'Open Sections'), f_LanguageString('CLOSE_ANY_OPEN_SECTIONS_BEFORE_CONTINUING', 'Close any open sections before continuing'))
			CASE 'NCCS'
				MessageBox(f_LanguageString('OPEN_STEPS', 'Open Steps'), f_LanguageString('CLOSE_ANY_OPEN_STEPS_BEFORE_CONTINUING', 'Close any open steps before continuing'))
			CASE 'NLOGS'
				MessageBox(f_LanguageString('OPEN_LOGS', 'Open Logs'), f_LanguageString('CLOSE_ANY_OPEN_LOGS_BEFORE_CONTINUING', 'Close any open logs before continuing'))
			CASE 'NPTS'
				MessageBox(f_LanguageString('OPEN_TOURS', 'Open Tours'), f_LanguageString('CLOSE_ANY_OPEN_TOURS_BEFORE_CONTINUING', 'Close any open tours before continuing'))
		END CHOOSE
	ELSE
		f_Global_Restore()
	END IF
ELSEIF rb_backup_database.Checked THEN
	li_Return = MessageBox(f_LanguageString('BACKUP_DATABASE?', 'Backup Database?'), f_LanguageString('ARE_YOU_SURE_YOU_WANT_TO_BACKUP_THE_DATABASE?', 'Are you sure you want to backup the database?'), Question!, Yesno!)
	IF ( li_Return = 1 ) THEN
		w_main.EVENT Timer()
	END IF
ELSEIF rb_backup_file_location.Checked THEN
	Open(w_backup_location)
	wf_Update_Restore_menu( )
END IF

Close(Parent)
end event

type cb_cancel from commandbutton within w_options
integer x = 567
integer y = 1072
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

type st_options from statictext within w_options
integer x = 18
integer width = 1061
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
string text = "Options"
boolean focusrectangle = false
end type

type ln_1 from line within w_options
long linecolor = 33554432
integer linethickness = 4
integer beginx = 18
integer beginy = 352
integer endx = 1024
integer endy = 352
end type

