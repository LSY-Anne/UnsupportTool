$PBExportHeader$w_date_pick.srw
forward
global type w_date_pick from window
end type
type st_error_3 from statictext within w_date_pick
end type
type st_error_2 from statictext within w_date_pick
end type
type st_error_1 from statictext within w_date_pick
end type
end forward

global type w_date_pick from window
integer y = 100
integer width = 891
integer height = 484
boolean titlebar = true
string title = "Select A Date"
boolean controlmenu = true
boolean maxbox = true
windowtype windowtype = response!
string icon = "Information!"
boolean center = true
st_error_3 st_error_3
st_error_2 st_error_2
st_error_1 st_error_1
end type
global w_date_pick w_date_pick

type prototypes
// Win32 definitions
FUNCTION ulong CreateWindowEx( ulong dwExStyle, &
	readonly string ClassName, &
	readonly string WindowName, &
	long dwStyle, &
	long xPos, long yPos, long wwidth, long wheight, &
	ulong hwndParent, ulong hMenu, ulong hInstance, &
	ulong lParams ) &
	library "Coredll.dll" alias for "CreateWindowExW"
//	library "user32.dll" alias for "CreateWindowExW"

//FUNCTION ulong BringWindowToTop( ulong hwnd ) library "user32.dll"
FUNCTION ulong BringWindowToTop( ulong hwnd ) library "Coredll.dll"
		
FUNCTION ulong SendMessageStr( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	readonly string lParam ) &
	library "Coredll.dll" alias for "SendMessageW"
//	library "user32.dll" alias for "SendMessageW"
		
FUNCTION ulong SendMessageLong( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	ulong lParam ) &
	library "Coredll.dll" alias for "SendMessageW"
//	library "user32.dll" alias for "SendMessageW"

FUNCTION ulong SendMessagePtr( ulong hwnd, &
	ulong wMsg, ulong wParam, &
	REF ulong lParam[] ) &
	library "Coredll.dll" alias for "SendMessageW"
//	library "user32.dll" alias for "SendMessageW"

FUNCTION ulong SetWindowPos( ulong hwnd, ulong hwndAfter, &
	ulong xPos, ulong yPos, ulong cX, ulong cY, &
	ulong wFlage ) &
	library "Coredll.dll"
//	library "user32.dll"

//FUNCTION ulong InitCommonControlsEx( REF ulong pInitCtrls[2] )  library "comctl32.dll"
FUNCTION ulong InitCommonControlsEx( ulong pInitCtrls[] )  library "commctrl.dll"


end prototypes

type variables
// HWND of the calendar control
ulong g_hwndCal

CONSTANT ulong ICC_DATE_CLASSES	= 256		// 0x100


CONSTANT ulong WS_BORDER	= 8388608		// 0x0080 0000
CONSTANT ulong WS_CHILD		= 1073741824	// 0x4000 0000
CONSTANT ulong WS_VISIBLE	= 268435456		// 0x1000 0000
CONSTANT ulong WS_SYSMENU	= 2147483648	// 0x8000 0000
CONSTANT ulong WS_CAPTION	= 3221225472	// 0xC000 0000

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

on w_date_pick.create
this.st_error_3=create st_error_3
this.st_error_2=create st_error_2
this.st_error_1=create st_error_1
this.Control[]={this.st_error_3,&
this.st_error_2,&
this.st_error_1}
end on

on w_date_pick.destroy
destroy(this.st_error_3)
destroy(this.st_error_2)
destroy(this.st_error_1)
end on

event open;// Use the date picker control
string ClassName = "SysMonthCal32"			// pretty calendar control
//string ClassName = "SysDateTimePick32"	// date time picker

long lret
ulong sizeRect[]
ulong xPBUnits, yPBUnits

// PDA & Desktop have different titlebar concepts
//ulong HeightTitleBar = 0		//  PDA=0 (IOW - not in my window)
ulong HeightTitleBar = 26		// desktop=26 (IOW - in my window)

// Initialize the new CommonControls DLL
ulong aInitCtrls[2]
aInitCtrls[1] = 8		// structure size
aInitCtrls[2] = ICC_DATE_CLASSES

This.Title = f_LanguageString('SELECT_A_DATE', 'Select A Date')

lret = InitCommonControlsEx( aInitCtrls )

if lret = 0 then
	return 0
end if

// make the calendar control
g_hwndCal = CreateWindowEx( 0, ClassName, "", &
		WS_BORDER + WS_CHILD + WS_VISIBLE, &
		0,0,0,0, &
		Handle(this), 0, 0, 0 )

// If really created, then initialize the control
if g_hwndCal <> 0 then
	// Set the calendar color
	SendMessageLong( g_hwndCal, MCM_SETCOLOR, MCSC_MONTHBK, COLOR_MONTH )

	// And set the size to what the control requests
	sizeRect[1] = 0
	sizeRect[2] = 0
	sizeRect[3] = 0
	sizeRect[4] = 0

	// what does the control want...
	SendMessagePtr( g_hwndCal, MCM_GETMINREQRECT, 0, sizeRect )

	// set the calendar control size too
	SetWindowPos( g_hwndCal, HWND_TOP, 0, 0, sizeRect[3], sizeRect[4], SWP_NOZORDER )
	
	// Set the PARENT window (this) to that size (with borders etc)
	this.width  = PixelsToUnits( sizeRect[3], XPixelsToUnits! )

// TODO: compensate for VGA screens
//	this.height = PixelsToUnits( sizeRect[4] + HeightTitleBar + 17, YPixelsToUnits! )
	this.height = PixelsToUnits( sizeRect[4] + HeightTitleBar, YPixelsToUnits! )
//MessageBox('1.1', 'sizeRect[3] = ' + String(sizeRect[3]) + '~nsizeRect[4] = ' + String(sizeRect[4]))

	// The background of the response window
	// contains possible error reasons.
	st_error_1.visible = FALSE
	st_error_2.visible = FALSE
	st_error_3.visible = FALSE
end if
end event

event close;// get the date currently selected
// The SYSTEM_TIME structure is 16 bytes
// Parse the data by hand...

//typedef struct  _SYSTEMTIME
//    {
//    WORD wYear;
//    WORD wMonth;
//    WORD wDayOfWeek;
//    WORD wDay;
//    WORD wHour;
//    WORD wMinute;
//    WORD wSecond;
//    WORD wMilliseconds;
//    }	SYSTEMTIME;

ulong aSystemTime[]
aSystemTime[1] = 0
aSystemTime[2] = 0
aSystemTime[3] = 0
aSystemTime[4] = 0

int Year
int Month
int DayOfMonth
int DayOfWeek
date myDate

// The user selected...
SendMessagePtr( g_hwndCal, MCM_GETCURSEL, 0, aSystemTime )

// and pluck out the data
Year  = IntLow(  aSystemTime[1] )
Month = IntHigh( aSystemTime[1] )
DayOfWeek  = IntLow(  aSystemTime[2] )
DayOfMonth = IntHigh( aSystemTime[2] )

myDate = Date( Year, Month, DayOfMonth )

//MessageBox( "Date Picker", "Year= "+String(Year) + &
//				"~nMonth= " + String(Month) + &
//				"~nDay= " + String(DayOfMonth) + &
//				"~nDayOfWeek= " + String(DayOfWeek) + &
//				"~nstr=" + String( myDate ) &
//				)

// Set the values someplace for later use
//message.PowerObjectParm = myDate
message.StringParm = String( myDate )


end event

event other;//// Respond to help from Start->Help menu of the device
//IF ( message.Number = 83 ) THEN
//	f_Display_Help()
//END IF
end event

event activate;f_Release_Buttons()


end event

type st_error_3 from statictext within w_date_pick
integer x = 37
integer y = 192
integer width = 987
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "or CreateWindowEX"
boolean focusrectangle = false
end type

type st_error_2 from statictext within w_date_pick
integer x = 37
integer y = 128
integer width = 987
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Init Common Controls"
boolean focusrectangle = false
end type

type st_error_1 from statictext within w_date_pick
integer x = 37
integer y = 64
integer width = 987
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "Initialization Failure !!!"
boolean focusrectangle = false
end type

