$PBExportHeader$w_calendar_bk.srw
forward
global type w_calendar_bk from window
end type
type cb_clear from commandbutton within w_calendar_bk
end type
type cb_cancel from commandbutton within w_calendar_bk
end type
type cb_ok from commandbutton within w_calendar_bk
end type
type os_systemtime from structure within w_calendar_bk
end type
end forward

type os_systemtime from structure
	unsignedinteger		ui_wyear
	unsignedinteger		ui_wmonth
	unsignedinteger		ui_wdayofweek
	unsignedinteger		ui_wday
	unsignedinteger		ui_whour
	unsignedinteger		ui_wminute
	unsignedinteger		ui_wsecond
	unsignedinteger		ui_wmilliseconds
end type

global type w_calendar_bk from window
string tag = "1280"
integer width = 777
integer height = 800
boolean controlmenu = true
windowtype windowtype = response!
string icon = "AppIcon!"
boolean palettewindow = true
boolean contexthelp = true
boolean center = true
event post_open ( )
event type string ue_close_ce ( )
event ue_open_nt ( )
event ue_open_ce ( )
event type string ue_close_nt ( )
cb_clear cb_clear
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_calendar_bk w_calendar_bk

type prototypes
// WindowsCE definitions
Function long GetLastError() Library "Coredll.dll" alias for "GetLastError"

FUNCTION ulong CreateWindowEx( ulong dwExStyle, &
	readonly string ClassName, &
	readonly string WindowName, &
	long dwStyle, &
	long xPos, long yPos, long wwidth, long wheight, &
	ulong hwndParent, ulong hMenu, ulong hInstance, &
	ulong lParams ) &
	library "Coredll.dll" alias for "CreateWindowExW"

FUNCTION ulong SendMessageLong( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	ulong lParam ) &
	library "Coredll.dll" alias for "SendMessageW"

FUNCTION ulong SendMessagePtr( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	REF ulong lParam[] ) &
	library "Coredll.dll" alias for "SendMessageW"

FUNCTION ulong SendMessageSysTime( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	REF os_systemtime lpSysTime ) &
	library "Coredll.dll" alias for "SendMessageW"

FUNCTION ulong SetWindowPos( ulong hwnd, ulong hwndAfter, &
	ulong xPos, ulong yPos, ulong cX, ulong cY, &
	ulong wFlage ) &
	library "Coredll.dll"

FUNCTION boolean InitCommonControlsEx( ulong pInitCtrls[] ) library "commctrl.dll"

// WindowsNT definitions
Function long GetLastError_NT() Library "kernel32.dll" alias for "GetLastError"

FUNCTION ulong CreateWindowEx_NT( ulong dwExStyle, &
	readonly string ClassName, &
	readonly string WindowName, &
	ulong dwStyle, &
	ulong xPos, ulong yPos, ulong wwidth, ulong wheight, &
	ulong hwndParent, ulong hMenu, ulong hInstance, &
	ulong lParams ) &
	library "user32.dll" alias for "CreateWindowExW"

FUNCTION ulong SendMessageLong_NT( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	ulong lParam ) &
	library "user32.dll" alias for "SendMessageW"

FUNCTION ulong SendMessagePtr_NT( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	REF ulong lParam[] ) &
	library "user32.dll" alias for "SendMessageW"

FUNCTION ulong SendMessageSysTime_NT( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	REF os_systemtime lpSysTime ) &
	library "user32.dll" alias for "SendMessageW"

FUNCTION ulong SetWindowPos_NT( ulong hwnd, ulong hwndAfter, &
	ulong xPos, ulong yPos, ulong cX, ulong cY, &
	ulong wFlage ) &
	library "user32.dll" alias for "SetWindowPos"

FUNCTION boolean InitCommonControlsEx_NT( ulong pInitCtrls[] &
	) library "comctl32.dll" alias for "InitCommonControlsEx"

end prototypes

type variables
string	is_Window_Source

// HWND of the calendar control
ulong iul_hWnd

Boolean 	ib_cancel = False
Boolean 	ib_clear = False
String 	is_passed

CONSTANT ulong ICC_DATE_CLASSES	= 256		// 0x100

CONSTANT ulong WS_BORDER	= 8388608		// 0x0080 0000
CONSTANT ulong WS_CHILD		= 1073741824	// 0x4000 0000
CONSTANT ulong WS_VISIBLE	= 268435456		// 0x1000 0000

CONSTANT ulong SWP_NOSIZE			= 1		// SetWindowPos
CONSTANT ulong SWP_NOMOVE			= 2
CONSTANT ulong SWP_NOZORDER		= 4
CONSTANT ulong SWP_NOREDRAW		= 8
CONSTANT ulong SWP_NOACTIVATE		= 16
CONSTANT ulong SWP_FRAMECHANGED	= 32
CONSTANT ulong SWP_SHOWWINDOW		= 64
CONSTANT ulong SWP_HIDEWINDOW		= 128
CONSTANT ulong SWP_NOCOPYBITS		= 256		// 0x0100
CONSTANT ulong SWP_NOOWNERZORDER	= 512
CONSTANT ulong SWP_NOSENDCHANGING= 1024
CONSTANT ulong SWP_DRAWFRAME		= SWP_FRAMECHANGED
CONSTANT ulong SWP_NOREPOSITION	= SWP_NOOWNERZORDER
CONSTANT ulong SWP_DEFERERASE		= 8192	// 0x2000
CONSTANT ulong SWP_ASYNCWINDOWPOS= 16384

CONSTANT long HWND_TOP		= 0
CONSTANT long HWND_BOTTOM	= 1
CONSTANT long HWND_TOPMOST	= -1
CONSTANT long HWND_NOTOPMOST	= -2

// Month Calendar Messages
CONSTANT ulong MCM_GETCURSEL = 4097		// 0x1001
CONSTANT ulong MCM_SETCURSEL = 4098		// 0x1002
CONSTANT ulong MCM_GETMAXSELCOUNT = 4099
CONSTANT ulong MCM_SETMAXSELCOUNT = 4100
CONSTANT ulong MCM_GETSELRANGE   = 4101
CONSTANT ulong MCM_SETSELRANGE   = 4102
CONSTANT ulong MCM_GETMONTHRANGE = 4103
CONSTANT ulong MCM_SETDAYSTATE   = 4104
CONSTANT ulong MCM_GETMINREQRECT = 4105
CONSTANT ulong MCM_SETCOLOR  = 4106		// 0x100A
CONSTANT ulong MCM_GETCOLOR  = 4107		// 0x100A
CONSTANT ulong MCM_SETTODAY  = 4108
CONSTANT ulong MCM_GETTODAY  = 4109
CONSTANT ulong MCM_HITTEST   = 4110		// 0x100E

// Month Calendar MessageColor Attributes
// Same values for "SysMonthCal32" and "SysDateTimePick32"
CONSTANT ulong MCSC_BACKGROUND	= 0	// background color (between months)
CONSTANT ulong MCSC_TEXT			= 1	// dates within a month
CONSTANT ulong MCSC_TITLEBK		= 2	// background of the title
CONSTANT ulong MCSC_TITLETEXT		= 3	// text within the calendar's title
CONSTANT ulong MCSC_MONTHBK		= 4	// background of a month
CONSTANT ulong MCSC_TRAILINGTEXT	= 5	// text color of header & trailing days

constant ulong COLOR_MONTH = 12648447	// 0xC0ffff (muted yellow)

end variables

event type string ue_close_ce();// close event for WindowsCE
os_systemtime l_systime
Date ld_current

If ib_cancel Then
	Return "cancel"
Else
	If ib_clear Then
		Return "clear"
	Else
		// get currently selected date
		SendMessageSysTime(iul_hWnd, MCM_GETCURSEL, 0, l_systime)
		// combine parts into date variable
		ld_current = Date(l_systime.ui_wyear, &
								l_systime.ui_wmonth, &
								l_systime.ui_wday)
		// return date to calling script
		Return String(ld_current, Date_Format)
	End If
End If

end event

event ue_open_nt();// open event for WindowsNT
os_systemtime l_systime
Date ld_passed
ulong sizeRect[]
ulong aInitCtrls[2]
long ll_error

// initialize the CommonControls DLL
aInitCtrls[1] = 8		// structure size
aInitCtrls[2] = ICC_DATE_CLASSES

If InitCommonControlsEx_NT(aInitCtrls) Then
	// make the calendar control
	iul_hWnd = CreateWindowEx_NT(0, "SysMonthCal32", "", &
			WS_BORDER + WS_CHILD + WS_VISIBLE, &
			0, 0, 0, 0, Handle(this), 0, 0, 0)
	// if control created, then initialize
	If iul_hWnd <> 0 Then
		// set the calendar color
		SendMessageLong_NT(iul_hWnd, MCM_SETCOLOR, MCSC_MONTHBK, COLOR_MONTH)
		// and set the size to what the control requests
		sizeRect[] = {0,0,0,0}
		// what size does the control want...
		SendMessagePtr_NT(iul_hWnd, MCM_GETMINREQRECT, 0, sizeRect)
		// set the calendar control size
		SetWindowPos_NT(iul_hWnd, HWND_TOP, 0, 0, sizeRect[3], sizeRect[4], SWP_NOZORDER)
		// set the window (this) to that size (with borders etc)
		this.width  = PixelsToUnits(sizeRect[3], XPixelsToUnits!) + 28
		this.height = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + &
						(cb_ok.height + 140 /*- go_ac.of_get_menubar_height ()*/)
		// position the buttons
		cb_ok.y = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + 12
		cb_clear.y = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + 12
		cb_cancel.y = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + 12
		// set current date of control
		If Not IsNull(is_passed) Then
			If IsDate(is_passed) Then
				ld_passed = Date(is_passed)
				l_systime.ui_wyear = Year(ld_passed)
				l_systime.ui_wmonth = Month(ld_passed)
				l_systime.ui_wday = Day(ld_passed)
				SendMessageSysTime_NT(iul_hWnd, MCM_SETCURSEL, 0, l_systime)
			End If
		End If
	Else
		ll_error = GetLastError_NT()
		MessageBox("CreateWindowEx", "System error " + String(ll_error) + " occurred!")
		ib_cancel = True
		ib_clear  = False
		Close(this)
	End If
End If
end event

event ue_open_ce();// open event for WindowsCE
os_systemtime l_systime
Date ld_passed
ulong sizeRect[]
ulong aInitCtrls[2]
long ll_error

// initialize the CommonControls DLL
aInitCtrls[1] = 8		// structure size
aInitCtrls[2] = ICC_DATE_CLASSES

If InitCommonControlsEx(aInitCtrls) Then
	// make the calendar control
	iul_hWnd = CreateWindowEx(0, "SysMonthCal32", "", &
			WS_BORDER + WS_CHILD + WS_VISIBLE, &
			0, 0, 0, 0, Handle(this), 0, 0, 0)
	// if control created, then initialize
	If iul_hWnd <> 0 Then
		// set the calendar color
		SendMessageLong(iul_hWnd, MCM_SETCOLOR, MCSC_MONTHBK, COLOR_MONTH)
		// and set the size to what the control requests
		sizeRect[] = {0,0,0,0}
		// what size does the control want...
		SendMessagePtr(iul_hWnd, MCM_GETMINREQRECT, 0, sizeRect)
		// set the calendar control size
		SetWindowPos(iul_hWnd, HWND_TOP, 0, 0, sizeRect[3], sizeRect[4], SWP_NOZORDER)
		// set the window (this) to that size (with borders etc)
		this.width  = PixelsToUnits(sizeRect[3], XPixelsToUnits!) + 10
		this.height = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + &
			(cb_ok.height + 14)
		// position the buttons
		cb_ok.y = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + 4 
		cb_clear.y = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + 4
		cb_cancel.y = PixelsToUnits(sizeRect[4], YPixelsToUnits!) + 4
		// set current date of control
		If Not IsNull(is_passed) Then
			If IsDate(is_passed) Then
				ld_passed = Date(is_passed)
				l_systime.ui_wyear = Year(ld_passed)
				l_systime.ui_wmonth = Month(ld_passed)
				l_systime.ui_wday = Day(ld_passed)
				SendMessageSysTime(iul_hWnd, MCM_SETCURSEL, 0, l_systime)
			End If
		End If
	Else
		ll_error = GetLastError()
		MessageBox("CreateWindowEx", "System error " + String(ll_error) + " occurred!")
		ib_cancel = True
		ib_clear  = False
		Close(this)
	End If
End If

end event

event type string ue_close_nt();// open event for WindowsNT
os_systemtime l_systime
Date ld_current

If ib_cancel Then
	Return "cancel"
Else
	If ib_clear Then
		Return "clear"
	Else
		// get currently selected date
		SendMessageSysTime_NT(iul_hWnd, MCM_GETCURSEL, 0, l_systime)
		// combine parts into date variable
		ld_current = Date(l_systime.ui_wyear, &
								l_systime.ui_wmonth, &
								l_systime.ui_wday)
		// return date to calling script
		Return String(ld_current, Date_Format)
	End If
End If

end event

on w_calendar_bk.create
this.cb_clear=create cb_clear
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.Control[]={this.cb_clear,&
this.cb_cancel,&
this.cb_ok}
end on

on w_calendar_bk.destroy
destroy(this.cb_clear)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;is_Passed = Message.StringParm
Message.StringParm = ''

This.Y = 104

This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_clear.Text = f_LanguageString('CLEAR', 'Clear')
cb_ok.Text = f_LanguageString('OK', 'Ok')

IF gb_platform_is_ce THEN
	This.EVENT ue_Open_CE()
ELSE
	This.EVENT ue_Open_NT()
END IF
end event

event close;string ls_Return

IF gb_platform_is_ce THEN
	ls_Return = This.EVENT ue_Close_CE()
ELSE
	ls_Return = This.EVENT ue_Close_NT()
END IF

Message.StringParm = ls_Return

end event

event other;// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

event resize;cb_ok.X		= (This.Width / 2) - cb_ok.Width - 25
cb_cancel.X	= cb_ok.X + cb_ok.Width + 25
end event

event activate;This.X = gl_X + (w_main.Width - This.Width) / 2
This.Y = gl_Y + 104

f_Release_Buttons()


end event

type cb_clear from commandbutton within w_calendar_bk
string tag = "960"
boolean visible = false
integer x = 530
integer y = 480
integer width = 210
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;ib_cancel = False														// Set Cancel SW
ib_clear  = True														// Set Clear SW

Close(Parent)
end event

type cb_cancel from commandbutton within w_calendar_bk
string tag = "960"
integer x = 421
integer y = 480
integer width = 329
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;ib_cancel = True														// Set CANCEL SW
ib_clear  = False														// Set CLEAR SW

Close(Parent)
end event

type cb_ok from commandbutton within w_calendar_bk
string tag = "960"
integer x = 46
integer y = 480
integer width = 329
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

event clicked;ib_cancel = False														// Set Cancel SW
ib_clear  = False														// Set Clear SW

Close(Parent)
end event

