$PBExportHeader$u_module_specific.sru
forward
global type u_module_specific from nonvisualobject
end type
end forward

global type u_module_specific from nonvisualobject autoinstantiate
end type

forward prototypes
public subroutine f_open_select_window ()
public subroutine f_reset_open_on_handheld ()
public subroutine f_close_module_window ()
public subroutine f_display_module_window (boolean ab_value)
public subroutine f_open_module_window_lite ()
public subroutine f_update_tour_menu_text (ref mnu_tour m_tour)
public subroutine f_open_delete ()
public subroutine uf_open_object (integer ai_structure_element, mnu_main m_main)
public subroutine uf_open ()
public subroutine uf_menu_security (ref mnu_main m_main, boolean ab_enable)
public subroutine f_update_main_menu_text (ref mnu_main m_main)
end prototypes

public subroutine f_open_select_window ();Open(w_select_tour)
end subroutine

public subroutine f_reset_open_on_handheld ();UPDATE tour SET open_on_handheld = 0 USING SQLCA ;

COMMIT USING SQLCA ;

end subroutine

public subroutine f_close_module_window ();IF IsValid(w_tour) THEN
	CLOSE(w_tour)
END IF
end subroutine

public subroutine f_display_module_window (boolean ab_value);IF IsValid(w_tour) THEN
	w_tour.Visible = ab_Value
END IF
end subroutine

public subroutine f_open_module_window_lite ();w_tour.wf_Open_Tour_Lite()
w_tour.Visible = TRUE

end subroutine

public subroutine f_update_tour_menu_text (ref mnu_tour m_tour);//m_tour.m_data.m_abnormalequipment.Text = f_LanguageString('ABNORMAL_EQUIPMENT', 'Abnormal Equipment')
//m_tour.m_data.m_abnormalreadings.Text = f_LanguageString('VIEW_ABNORMAL_READINGS', 'View Abnormal Readings')
//m_tour.m_data.m_allreadings.Text = f_LanguageString('VIEW_ALL_READINGS', 'View All Readings')
//m_tour.m_file.m_close.Text = f_LanguageString('CLOSE', 'Close')
//m_tour.m_data.Text = f_LanguageString('DATA', 'Data')
//m_tour.m_file.Text = f_LanguageString('TOOLS', 'Tools')
//m_tour.m_data.m_gotofirst.Text = f_LanguageString('GO_TO_FIRST', 'Go To First')
//m_tour.m_data.m_gotolast.Text = f_LanguageString('GO_TO_LAST', 'Go To Last')
//m_tour.m_file.m_help.Text = f_LanguageString('HELP', 'Help')
//m_tour.m_file.m_main1.Text = f_LanguageString('MAIN', 'Main')
//m_tour.m_data.m_missedreadings.Text = f_LanguageString('VIEW_MISSED_READINGS', 'View Missed Readings')
//m_tour.m_file.m_preferences.Text = f_LanguageString('PREFERENCES', 'Preferences')
//m_tour.m_data.m_requiredreadings.Text = f_LanguageString('VIEW_REQUIRED_READINGS', 'View Required Readings')
//m_tour.m_data.m_scancode.Text = f_LanguageString('FIND_BY_SCAN_CODE', 'Find by Scan Code')
//m_tour.m_file.m_scratchpad.Text = f_LanguageString('SCRATCH_PAD', 'Scratch Pad')
//m_tour.m_file.m_testexpression.Text = f_LanguageString('TEST_EXPRESSION', 'Test Expression')
//m_tour.m_data.m_tourparameters.Text = f_LanguageString('TOUR_PARAMETERS', 'Tour Parameters')
//m_tour.m_data.m_unscannedreadings.Text = f_LanguageString('VIEW_UNSCANNED_READINGS', 'View Unscanned Readings')
//
//m_tour.m_file.m_testexpression.Visible = NOT gb_Platform_Is_CE

end subroutine

public subroutine f_open_delete ();Open(w_delete_tour)
end subroutine

public subroutine uf_open_object (integer ai_structure_element, mnu_main m_main);integer li_Count

gi_Current_Tour = ai_Structure_Element
IF m_main.m_window.Item[ai_Structure_Element].Checked THEN
//	w_tour.wf_Open_Tour_Lite()
	w_tour.wf_Open_Tour()
ELSE
	w_main.wf_Uncheck_Item()
	m_main.m_window.Item[ai_Structure_Element].Checked = TRUE
	
//	gi_Current_Tour = ai_Structure_Element
	IF NOT IsValid(w_tour) THEN
		OPEN(w_tour)
	ELSE
		w_tour.wf_Open_Tour()
	END IF
END IF
end subroutine

public subroutine uf_open ();Open(w_select_tour)
w_main.Visible = FALSE
end subroutine

public subroutine uf_menu_security (ref mnu_main m_main, boolean ab_enable);integer li_Count

m_main.m_file.m_download.Visible = gb_Using_ML
m_main.m_file.m_open.Enabled = ab_Enable
m_main.m_file.m_scratchpad.Enabled = ab_Enable
m_main.m_file.m_preferences.Enabled = ab_Enable

FOR li_Count = 1 TO 7
	IF ( gsu_tour_parameters[li_Count].tour_number <> -1 ) THEN
		m_main.m_window.Item[li_Count].Enabled = ab_Enable AND f_Check_User(gsu_tour_parameters[li_Count].tour_number, FALSE)
	ELSE
		m_main.m_window.Item[li_Count].Enabled = ab_Enable
	END IF
NEXT
end subroutine

public subroutine f_update_main_menu_text (ref mnu_main m_main);m_main.m_file.m_options.Text = f_LanguageString('OPTIONS', 'Options')
m_main.m_file.m_exit.Text = f_LanguageString('EXIT', 'Exit')
m_main.m_file.Text = f_LanguageString('TOOLS', 'Tools')
m_main.m_file.m_logout.Text = f_LanguageString('LOGIN_-_LOGOUT', 'Login - Logout')
m_main.m_file.m_open.Text = f_LanguageString('OPEN', 'Open')
m_main.m_file.m_preferences.Text = f_LanguageString('PREFERENCES', 'Preferences')
m_main.m_file.m_scratchpad.Text = f_LanguageString('SCRATCH_PAD', 'Scratch Pad')
m_main.m_file.m_download.Text = f_LanguageString('SYNCHRONIZE', 'Synchronize')
m_main.m_window.Text = f_LanguageString('WINDOW', 'Window')

end subroutine

on u_module_specific.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_module_specific.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

