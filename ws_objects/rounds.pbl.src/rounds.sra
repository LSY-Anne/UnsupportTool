$PBExportHeader$rounds.sra
$PBExportComments$Generated Application Object
forward
global type rounds from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
long					gl_X
long					gl_Y
string					gs_Current_Version = 'Desktop POC 3.9'
string					gs_Temp_Folder
string					gs_Computer_Name
u_window				guo_window
string					gs_Test_Character
u_date_format		guo_date_format
string					gs_Language_Test_Character = ''

boolean				gb_SA11
integer				gi_eSOMS_TZ_Offset
u_module_specific	guo_module_specific
boolean				gb_Copy_Notes_Forward
string					gs_Hardware_Button_Action
boolean				gb_Install_esoms_db_cab
string					gs_Serialnumber
boolean				gb_No_Scan_Loop
boolean				gb_Find_By_Scan
string					gs_ASA_Folder = '\Program Files\ASA9'
boolean				gb_Testing_Preferences_Opened
boolean				gb_Testing_Rights_Opened
constant ulong		PBM_CUSTOM01 = 1024
constant ulong		PBM_CUSTOM02 = 1025
constant ulong		PBM_CUSTOM03 = 1026
//nvo_esoms_mlsync	guo_sync
//nvo_sync				guo_sync
transaction			SQLMain
string					gs_ml_server
boolean				gb_Include_Equip_In_Scan
boolean				gb_Using_ML
boolean				gb_Force_Find_By_Scan
boolean				gb_RequireNoteAfterScanSkip
boolean				gb_AllowEditNoteInWindow
boolean				gb_AllowLeadingAndTrailingCRLFInNotes
string					gs_Scratchpad_File = 'ScratchPad.txt'
string					gs_Module_Id = 'NPTS'
string					gs_Module_Name = 'Operator Rounds'
string					gs_Window_Title = 'eSOMS Rounds'

// 02/22 Modification to handle changing the shift date in the tour selection screen to handle normal_start_time
// 02/26 Modification to handle scanning - rewrote scan code
// 02/27 Modification of PREV() function to handle the forced ll_Back + 1 when the station is only allowed on shifts in the future for the same date
// 02/27 Modification of RDINFO() function to handle the forced ll_Back + 1 when the station is only allowed on shifts in the future for the same date
// 03/28 Added ML upload of scratchpad files
// 04/20 Find by scancode call didn't check for "CANCEL" being returned
// 04/24 Modification of the RDINFO function to handle the comparison of the shift date as a DATE and not a DATETIME
// 05/16 Modification of the ue_Navigate_To_Row event in order to accommodate auto navigating to the Notes tab for calculated readings that are OOS and the AUTO_DISPLAY_NOTES_ON_OOS preference is on
// 06/15 Modification of the RDINFO function yet again, this time if no rows are returned fromthe datastore it bombed, checking rows now
// 06/20 Modification of the scan screen - added a preference to handle defaulting the Skip button to ENTER or not
// 06/28 Modification of the PREV function, if no rows are returned fromthe datastore it bombed, checking rows now
// 08/23 Created f_Scancode and added a test for the w_scanning window to avoid an odd issue where using red/green buttons on Symbol MC90000 series resulted in code AFTER the open call to be run 
// 08/24 Modified DTTM2NUM() function to strip colons from the time because of an incompatibility with the RDINFO(~, "CD") function passing a time with colons
// 10/24 Added icon to represent a station being scanned
// 11/06 Modified code to handle auto SIP properly with SetRuntimeProperty
// 01/07/08 For Modified ML connection to use DoBroadcast=none to avoid using cached asasrv.ini file
// 01/21 Added two prefs - one to ignore eapp in list tab to improve performance on that tab and 
//			one to prompt for unscanned readings (also added menu option for same)
// 02/14 Recompile from 01/21 in order to create a new setup for Mark Cranville from OPG
// 02/20/08 Added capability to open HTTP: URLs as documents - Bill House added document_type = 3
// 02/22/08 Recompile/sign for deployment to CPCHEM
// 02/29/08 Modified tour selection to show open tours, display them with yellow background, disable shift/date inputs and 
//          messagebox that the tour is already open
// 04/04/08 Modified w_select_from_asa window's wf_Set_System_Time() FX to take into account TZ difference between server and handheld by 
//          creating new ML function fn_Get_eSOMS_Date(~)
// 04/10/08 Modified ML sync to take into account TZ differences - requires latest esoms.db
// 04/18/08 Modified ML synch to skip initial upload - was unnecessary
// 04/22/08 Modified scan event becasue if scan looked at equipment ids and the station had a scancode and its equipment ID was blank
//          then the scan prompt would not appear - logic error.  Also added explicit call to update tabpages in the scan event
//          because immediately after a filter by unscanned is called, the first station did NOT display the scan icon if it was properly scanned
// 04/23/08 Modified selection window to make the shift list dw sort by shift_no - due to Scott email through Dustin.Presley@sce.com
// 04/24/08 For Scott/SCE added a preference gb_Force_Find_By_Scan to allow jumping to any station when scanning is required
//          rather than only validating the current station's scancode
// 04/25/08 Added another preference "RequireNoteAfterScanSkip" to force note tab to display if skipping a scan
// 04/30/08 Modified ue_Update_Tab_Pages and related events/functions to avoid retrieving from
//          the database to determine documents, alerts, multi-readings and storing coutns in extra
//          columns of dw_readings = much faster processing.  Also placed SetRedraws a little better
//          to help the screen redrawing when navigating stations = much faster processing.
// 05/01/08 Modified save to preferences to auto-enable navigation preference if a hardware key is selected
// 05/01/08 Added w_edit_note to allow opening note by itself to edit.  Also added preference to allow this.
//          Also modified tabpage_notes to resize current/previous notes depending on if current note has focus
//          to maximize space for viewing current note.  Also added pref to strip leading/trailing CRLFs in the notes to 
//          make display easier on the notes tab and to prevent issues where Enter was pressed inadvertantly adding CRLFs to the note.
// 05/19/08 Recompile
// 06/26/08 Corrected a couple minor issues as well as the Tool->Scratchpad menu item mistakenly opening preferences
// 06/30/08 Modified synch to use a single synch rather than a separate UL followed by a DL, corrected in ML scripts
//          via download_delete_cursor scripts
// 07/01/08 Tweaked ML download to allow for 2M download buffer size to speed the download
// 07/21/08 Added gb_Alternate_Locked_List_View for SCE to allow alternate/locked List View
// 07/29/08 Added numpad popup triggered by button on tour screen
// 08/21/08 Modified the entire application to replace any/all text objects with text derived from a UNICODE language.ini 
//          file to support other languages.
// 09/10/08 Modified issue when using masks that the data would not be saved immediately when using masks and then moving to non-masked fields
//          Email from Rob Rinish PPL 9/9/08
// 09/17/08 Corrected ue_update_reading event that used the wrong "row" variable - "ll_Row" was used but the passed "row" should have been used
// 09/18/08 Corrected two places that were incorrectly displaying the name of the function f_LanguageString() rather than the value returned from the function
// 09/22/08 Recompiled for TVA Nuc because of the w_tour/Data menu items showing "Unique ID" rather than the proper labels
// 09/24/08 Modified ue_Save_Edit_Mask_Data() event to prevent saving decimal point when no entry was made when records have a mask like "##.##"
// 09/24/08 Recompile
// 10/01/08 Modified tour.general_tour_notes to a LONG VARCHAR from a VARCHAR(4000) to match the consolidated database
//          This REQURIES an updated esoms.db with version 4.00.00.07 to run
// 10/02/08 Made simple change to major issue.  When filtering data and expressions are run, the STA() function did a Find()
//          for the affected station and would always return 'Reading Not Found' because the stat may have been filtered out.
//          Corrected with addition of SELECT if the row is NOT in the current dw which will evaluate properly
//          WHEW!!!
// 10/03/08 Removed the capability to check/disable the Filter menu items on w_tour because of the issues appearing along with the language
//          update for the menu items - I cannot get them to work together so I am abandoning the check/disable.  The user has a display 
//          of what the current filter is on the RD tab anyway
// 10-04-08 Had to monkey with w_tour open to display an intermediate "Loading" screen in order to get the mnu_tour to update language properly
//          as well as even display initially in certain circumstances
// 10-13-08 Corrected alert tabpage color - mistakenly looking at history_multi_count rather than history_alert_count
// 10-14-08 Calculated readings allowed modification - corrected
// 10-17-08 Removed previous_rd column use and checked DB for previous reading in the f_Check_If_Reading_Changed() function
//				Also, modified editchanged to immediately set history_oos & history_oot to 0 if the reading is blanked out
// 11-13-08 My birthday - yay!  Corrected navigation off last station with preference to view missed readings set to yes
//          it would filter by missed readigns and then attempt to navigate to a row that no longer existed in teh datawindow due to the filtering
// 11-24-08 Modified w_tour_select to handle "." formatted dates
// 12-17-08 Modified the handling of masked data - in f_Unmask_Data() and w_tour.tab_tour.tabpage_readings.dw_readings.ue_retrieve() event
//          Re-branded to 4.00.00
// 01-15-09 Re-branded to 4.0.07
// 01-21-09 Corrected ue_insert_new_shift because the SQL for reading_requried used the "scan" table name - a copy/paste error
// 01-22-09 Modified w_num_pad to use the handheld's regional setting for Decimal Symbol
// 01-27-09 Modified ue_check_oos in dw_readings to correct error with less_than / greater_than being checked for the wrong min/max checks
// 02-19-09 Made mods to DOY, DOM, DAYOFWEEK & SECONDIDFF functions to accommodate localized date on devices
// 2009-02-23 - CQ00184639 - corrected DTTM2NUM & NUM2DTTM to properly handle localized environments
//            - Corrected hourdiff to match desktop to properly handle localized environments
// 2009-03-03 - Modified ue_Save_Edit_Mask_Data() event of dw_readings to set the lb_Modified variable
//              in order to bypass the f_Check_If_Reading_Changed() function because the ue_Save_Edit_Mask_Data()
//              event saves it to the db and the f_Check_If_Reading_Changed() function will always return FALSE for editmasks
// 2009-03-18 - Modified alerts tab to derive the station number rather than relay on the global tour_parameters structure
//              during a tour close when the first station has alerts and the last evaluated station has a reading expression
// 2009-05-19 - Modified to support a second hardware button.

Constant string				gs_Compile_Date = ''
Constant string				gs_Required_PK_Version = '2.5.2.1273'
Constant string				gs_Required_ML_ASA_Version = '9.0.2.3274'
Constant string				gs_Required_ASA_Version = '9.0.1 (1751)'
Constant string				gs_Required_Schema_Version = '4.00.00.13'

string				gs_Current_PK_Version
string				gs_Current_ASA_Version
string				gs_Current_Schema_Version
string				gs_Current_DB_Version

integer				gi_Automatic_Backup_Timing
boolean				gb_Is_VGA
string				gs_Station_Label
boolean				gb_Use_Ellipsis
boolean				gb_TourClosePromptForTourDelete

integer				gi_Debug_File
boolean				gb_Display_Hidden_Records
environment			g_env
boolean				gb_Final_Close

u_user				guo_user
u_user_settings	guo_user_settings
string				gs_Scratchpad_Text
boolean				gb_Platform_Is_CE
string				date_format
string				time_format
string				gs_INI_FILE
string				gs_Font_Height_In_Pixels = '13'
boolean				gb_Use_Navigation_Arrows
integer				gi_Hardware_Button

Constant integer 	APPKEY1 = 193 // Hex C1
Constant integer 	APPKEY2 = 194 // Hex C2
Constant integer 	APPKEY3 = 195 // Hex C3
Constant integer 	APPKEY4 = 196 // Hex C4
Constant integer 	APPKEY5 = 197 // Hex C5
Constant integer 	APPKEY6 = 198 // Hex C6

Constant integer 	LEFT_ARROWKEY = 37
Constant integer 	UP_ARROWKEY = 38
Constant integer 	RIGHT_ARROWKEY = 39
Constant integer 	DOWN_ARROWKEY = 40
Constant integer 	ACTIONKEY = 134

//Constant long LOCALE_SSHORTDATE = 31
Constant long WM_SETTINGCHANGE = 26
Constant long HWND_BROADCAST = 65535

Constant Integer	WM_GETFONT = 49

boolean				gb_Tour_Opened
long					gl_Last_Applicable_Station
s_tour_parameters	gsu_tour_parameters[10]
s_equip_detail		gsu_equip_detail[]
integer				gi_Current_Tour
datastore			gds_equip_detail

boolean				gb_Auto_SIP
boolean				gb_Allow_Note_Files

string				gs_Last_Documents_Folder
boolean				gb_Alternate_Locked_List_View
datastore			ads_types

//2009-05-19
string				gs_Hardware_Button_2_Action
integer				gi_Hardware_Button_2

//Appeon add - 2013-07-04
eon_mobile_awsex geon_mobile_awsex
boolean gb_connect = false
end variables

global type rounds from application
string appname = "rounds"
end type
global rounds rounds

type prototypes
FUNCTION ulong GetTempPath(ulong nBufferLength, ref string lpBuffer) LIBRARY "kernel32" ALIAS FOR "GetTempPathA;Ansi"
FUNCTION ulong GetLongPathName( REF String lpszShortPath, REF String lpszLongPath, ULong cchBuffer ) LIBRARY "kernel32.dll" ALIAS FOR "GetLongPathNameA;Ansi"

// WindowsNT!
FUNCTION ulong GetDC_NT(ulong hWnd) Library "user32.dll" ALIAS FOR "GetDC"
FUNCTION ulong SelectObject_NT(ulong hdc, ulong hWnd) Library "gdi32.dll" ALIAS FOR "SelectObject"
FUNCTION boolean GetTextExtentExPoint_NT(ulong hdc, string lpszStr, integer cchString, integer nMaxExtent, integer lpnFit, integer alpDx, REF os_size lpSize) Library "gdi32.dll" ALIAS FOR "GetTextExtentExPointW"
FUNCTION long ReleaseDC_NT(ulong hWnd, ulong hdcr) Library "user32.dll" ALIAS FOR "ReleaseDC"
function boolean GetClientRect_NT(long hWnd, ref os_RECT lpRect) LIBRARY "USER32.DLL" ALIAS FOR "GetClientRect"
FUNCTION unsignedlong FindWindow_NT( long ClassName, string WindowName ) LIBRARY "user32.dll"  ALIAS FOR "FindWindowW"
FUNCTION boolean SetFileAttributes_NT(REF string filename, ulong attrib) LIBRARY "KERNEL32.DLL"  ALIAS FOR "SetFileAttributesW"
FUNCTION Long GetLastError_NT() ALIAS FOR "GetLastError" LIBRARY "Kernel32.DLL"
FUNCTION long ShellExecuteA (ulong hwnd,string lpOperation,string lpFile, string lpParameters,  string lpDirectory, long nShowCmd ) LIBRARY 'shell32.dll'

// WindowsCE!
FUNCTION Long GlobalMemoryStatus(REF LONG bStatus []) Library "Coredll" 
FUNCTION boolean GetDiskFreeSpaceEx(string lpDirectoryName, REF s_ulongs lpFreeBytesAvailable, REF s_ulongs lpTotalNumberOfBytes, REF s_ulongs lpTotalNumberOfFreeBytes) Library "coredll.dll" ALIAS FOR "GetDiskFreeSpaceExW"
FUNCTION long GetLocaleInfo(long Locale, long LCType, REF string lpLCData, long cchData) Library "Coredll.dll" ALIAS FOR "GetLocaleInfoW"
FUNCTION long GetSystemDefaultLCID() Library "Coredll.dll" ALIAS FOR "GetSystemDefaultLCID" 
FUNCTION long GetUserDefaultLCID() Library "Coredll.dll" ALIAS FOR "GetUserDefaultLCID" 
FUNCTION long SetLocaleInfo(long Locale, long LCType, string lpLCData) Library "Coredll.dll" ALIAS FOR "SetLocaleInfoW" 
FUNCTION Boolean SHSetAppKeyWndAssoc (Long bVk, Long hwnd) LIBRARY "aygshell.dll" 
FUNCTION BOOLEAN EnableHardwareKeyboard ( BOOLEAN bEnable ) LIBRARY "coredll.dll" 
FUNCTION int fnBatteryStatus() LIBRARY "eSOMS_Support.dll"
FUNCTION string fnGetIPAddress() LIBRARY "eSOMS_Support.dll"
FUNCTION ulong fnSetSystemTime(string lpSystemTime) LIBRARY "eSOMS_Support.dll"
FUNCTION ulong GetDC_CE(ulong hWnd) Library "coredll.dll" ALIAS FOR "GetDC"
FUNCTION ulong SelectObject_CE(ulong hdc, ulong hWnd) Library "coredll.dll" ALIAS FOR "SelectObject"
FUNCTION boolean GetTextExtentExPoint_CE(ulong hdc, string lpszStr, integer cchString, integer nMaxExtent, integer lpnFit, integer alpDx, REF os_size lpSize) Library "coredll.dll" ALIAS FOR "GetTextExtentExPointW"
function boolean GetClientRect_CE(long hWnd, ref os_RECT lpRect) LIBRARY "COREDLL.DLL" ALIAS FOR "GetClientRect"
FUNCTION long ReleaseDC_CE(ulong hWnd, ulong hdcr ) Library "coredll.dll" ALIAS FOR "ReleaseDC"
FUNCTION unsignedlong FindWindow_CE(long  ClassName, string WindowName ) LIBRARY "coredll.dll" ALIAS FOR "FindWindowW"
FUNCTION boolean SetFileAttributes_CE(REF string filename, ulong attrib) LIBRARY "CoreDll.DLL"  ALIAS FOR "SetFileAttributesW"
FUNCTION Long GetLastError_CE() ALIAS FOR "GetLastError" LIBRARY "Coredll"
FUNCTION uLong FindFirstFlashCard( REF char lpFindFlashData[560]) Library "note_prj.dll"
FUNCTION uLong FindNextFlashCard( uLong handle, REF char lpFindFlashData[560]) Library "note_prj.dll"
FUNCTION integer fnGetStorageCards2(string filename) LIBRARY "eSOMS_Support.dll"
// External FUNCTIONs for new SIP handling
FUNCTION integer SetRuntimeProperty(READONLY string PropertyName, boolean fValue ) system library "PKVM20.DLL" ALIAS FOR "fnSetRuntimeProperty"
FUNCTION integer SetRuntimeProperty_25(READONLY string PropertyName, boolean fValue ) system library "PKVM25.DLL" ALIAS FOR "fnSetRuntimeProperty"
FUNCTION ulong GetUUID(string location, REF string uuid) LIBRARY "eSOMS_Support.dll"

end prototypes

type variables

end variables

on rounds.create
appname="rounds"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on rounds.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;integer li_Count

/*
guo_user_settings.uf_get_language_settings( )
gs_Window_Title = f_DW_Language_Call_2(gs_Window_Title)
gs_Module_Name = f_DW_Language_Call_2(gs_Module_Name)

*/
f_Global_Open()
gl_Last_Applicable_Station = 0

FOR li_Count = 1 TO 7
	gsu_tour_parameters[li_Count].tour_number = -1
NEXT

/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////

geon_mobile_awsex = create eon_mobile_awsex

//leon_mobile_awsex.of_setassistivetouchbtnvisible(1) // Sets the assistive touch bar is visible.
geon_mobile_awsex.of_setwindowlisticonvisible(0)	// Sets window list icon is invisible
geon_mobile_awsex.of_setapporientation(1)			// Sets application orientation to portrait
geon_mobile_awsex.of_setapprotationlock(1)			// Locks the screen orientation of Appeon WorkSpace
geon_mobile_awsex.of_settitlebarvisible(0)				// Sets  the Appeon WorkSpace title bar is invisible. 
/////////////////////////////////////////////////// Appeon End  ///////////////////////////////////////////////////

//OPEN(w_splash)

guo_user = CREATE u_user

IF NOT IsValid(guo_user) THEN
	MessageBox("Error", "Unable to create user object")
	HALT CLOSE
ELSE
	Open(w_main)
//	Close(This)
END IF

end event

event systemerror;MessageBox('System Error', error.Text)
end event

event close;DESTROY guo_user
end event

