$PBExportHeader$u_date_format.sru
forward
global type u_date_format from nonvisualobject
end type
end forward

global type u_date_format from nonvisualobject autoinstantiate
end type

type prototypes
Function long GetUserDefaultLCIDNT() Library "kernel32.dll"  alias for "GetUserDefaultLCID"
Function long GetSystemDefaultLCIDNT() Library "kernel32.dll"  alias for "GetSystemDefaultLCID"
Function long GetLocaleInfoNT(long al_Locale, long al_LCType,ref string ls_lpLCData, long ll_cchData) Library "kernel32.dll" alias for "GetLocaleInfoW"
end prototypes

type variables
string is_Decimal_Separator
string is_Date_Format
string is_Datetime_Format_With_Seconds
string is_Datetime_Format
string is_Time_Format							= 'HH:mm'
string is_Time_Format_With_Seconds		= 'HH:mm:ss'
string is_Long_Date_Format
string is_M_D
string is_MM_DD
string is_MM_YYYY
string is_DATE_SEPARATOR
string is_M_SEPARATOR_SPACE_D
end variables

forward prototypes
public function integer uf_stringcount (string ls_find, string ls_search)
public function string uf_get_m_d ()
public subroutine uf_get_date_time_format ()
end prototypes

public function integer uf_stringcount (string ls_find, string ls_search);int li_Pos, li_Count

li_Count	= 0
li_Pos	= Pos(ls_Search, ls_Find)

DO WHILE ( li_Pos > 0 )
	li_Count ++
	li_Pos = POS(ls_Search, ls_Find, li_Pos + 1)
LOOP

RETURN li_Count
end function

public function string uf_get_m_d ();integer li_Last_Y_Pos
integer li_First_Y_Pos
string ls_M_SEPARATOR_SPACE_D
string ls_M_D
string ls_M
string ls_D
string ls_Y
integer li_Pos_Y
integer li_Pos_M
integer li_Pos_D
integer li_Diff

ls_M_D = is_Date_Format
li_Pos_Y = POS(UPPER(ls_M_D), 'Y')
IF ( li_Pos_Y > 1 ) THEN
	// year does not lead date format
	ls_M_D = StrTran(ls_M_D, 'mm', 'm')
	ls_M_D = StrTran(ls_M_D, 'MM', 'M')
	ls_M_D = StrTran(ls_M_D, 'dd', 'd')
	ls_M_D = StrTran(ls_M_D, 'DD', 'D')
	
	ls_Y = MID(ls_M_D, POS(UPPER(ls_M_D), 'Y'))
	
	ls_M_D = MID(ls_M_D, 1, POS(UPPER(ls_M_D), 'Y') - 2)
	li_Pos_M = POS(UPPER(ls_M_D), 'M')
	li_Pos_D = POS(UPPER(ls_M_D), 'D')

	li_Diff = ABS(li_Pos_M - li_Pos_D)
	is_DATE_SEPARATOR = MID(ls_M_D, li_Diff, 1)
	ls_M = MID(ls_M_D, li_Pos_M, 1)
	ls_D = MID(ls_M_D, li_Pos_D, 1)

	IF ( li_Pos_M < li_Pos_D ) THEN //mm/dd
		ls_M_SEPARATOR_SPACE_D = ls_M + is_DATE_SEPARATOR + ' ' + ls_D
	ELSE //dd/mm
		ls_M_SEPARATOR_SPACE_D = ls_D + is_DATE_SEPARATOR + ' ' + ls_M
	END IF
	is_M_SEPARATOR_SPACE_D = ls_M_SEPARATOR_SPACE_D
	is_M_D = ls_M_D
	is_MM_YYYY = ls_M + ls_M + is_DATE_SEPARATOR + 'yyyy'
ELSE
	// year leads date format
	ls_M_D = StrTran(ls_M_D, 'mm', 'm')
	ls_M_D = StrTran(ls_M_D, 'MM', 'M')
	ls_M_D = StrTran(ls_M_D, 'dd', 'd')
	ls_M_D = StrTran(ls_M_D, 'DD', 'D')
	
	li_First_Y_Pos = POS(UPPER(ls_M_D), 'Y')
	integer li_Temp
	li_Temp = li_First_Y_Pos
	DO WHILE ( li_Temp > 0 )
		li_Last_Y_Pos = li_Temp
		li_Temp = POS(UPPER(ls_M_D), 'Y', li_Temp + 1)
	LOOP
	ls_Y = MID(ls_M_D, li_First_Y_Pos, li_Last_Y_Pos)

	ls_M_D = MID(ls_M_D, li_Last_Y_Pos + 2)
	li_Pos_M = POS(UPPER(ls_M_D), 'M')
	li_Pos_D = POS(UPPER(ls_M_D), 'D')

	li_Diff = ABS(li_Pos_M - li_Pos_D)
	is_DATE_SEPARATOR = MID(ls_M_D, li_Diff, 1)
	ls_M = MID(ls_M_D, li_Pos_M, 1)
	ls_D = MID(ls_M_D, li_Pos_D, 1)

	IF ( li_Pos_M < li_Pos_D ) THEN //mm/dd
		ls_M_SEPARATOR_SPACE_D = ls_M + is_DATE_SEPARATOR + ' ' + ls_D
	ELSE //dd/mm
		ls_M_SEPARATOR_SPACE_D = ls_D + is_DATE_SEPARATOR + ' ' + ls_M
	END IF
	is_M_SEPARATOR_SPACE_D = ls_M_SEPARATOR_SPACE_D
	is_M_D = ls_M_D
	is_MM_YYYY = ls_M + ls_M + is_DATE_SEPARATOR + 'yyyy'
END IF

RETURN ls_M_D
end function

public subroutine uf_get_date_time_format ();integer li_M
integer li_d
integer li_y
integer li_Returned_Length
integer li_Length
integer li_Seperator
string ls_Date_Format
//string ls_Time_Format
//string ls_Time_Separator

Constant long LOCALE_SLONGDATE = 32
Constant long LOCALE_SSHORTDATE = 31
Constant long LOCALE_STIMEFORMAT = 4099
Constant long LOCALE_STIME = 30
Constant long LOCALE_SDECIMAL = 14

is_Decimal_Separator = Space(255)
IF gb_platform_is_ce THEN
	li_Returned_Length = GetLocaleInfo(GetUserDefaultLCID(), LOCALE_SDECIMAL, is_Decimal_Separator, 255)
ELSE
	li_Returned_Length = GetLocaleInfoNT(GetUserDefaultLCIDNT(), LOCALE_SDECIMAL, is_Decimal_Separator, 255)
END IF
li_Returned_Length = LEN(is_Decimal_Separator)

IF gb_platform_is_ce THEN
	ls_Date_Format = Space(255)
	li_Returned_Length = GetLocaleInfo(GetUserDefaultLCID(), LOCALE_SSHORTDATE, ls_Date_Format, 255)
	li_Returned_Length = LEN(ls_Date_Format)
	
	li_M = uf_StringCount('M', ls_Date_Format)
	li_d = uf_StringCount('d', ls_Date_Format)
	li_y = uf_StringCount('y', ls_Date_Format)
	li_Seperator = 2
	
	li_Length = li_M + li_d + li_y + li_Seperator
	IF ( li_Returned_Length > li_Length ) THEN
		ls_Date_Format = MID(ls_Date_Format, 1, li_Returned_Length - ( li_Returned_Length - li_Length ))
	END IF
	
	//IF ( li_M <= 2 ) THEN
	//	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'M'), li_M, 'MM')
	//END IF
	
	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'M'), li_M, 'MM')
	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'd'), li_d, 'dd')
	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'y'), li_y, 'yyyy')
	
	is_Date_Format = ls_Date_Format
	is_Datetime_Format = ls_Date_Format + ' ' + is_Time_Format
	is_Datetime_Format_With_Seconds = ls_Date_Format + ' ' + is_Time_Format_With_Seconds
	
	ls_Date_Format = Space(255)
	li_Returned_Length = GetLocaleInfo(GetUserDefaultLCID(), LOCALE_SLONGDATE, ls_Date_Format, 255)
	is_Long_Date_Format = ls_Date_Format
	
	is_M_D = uf_Get_M_D()
	is_MM_DD = f_Get_Date_MM_DD()
ELSE
	ls_Date_Format = Space(255)
	li_Returned_Length = GetLocaleInfoNT(GetUserDefaultLCIDNT(), LOCALE_SSHORTDATE, ls_Date_Format, 255)
	
	li_Returned_Length = LEN(ls_Date_Format)
	
	li_M = uf_StringCount('M', ls_Date_Format)
	li_d = uf_StringCount('d', ls_Date_Format)
	li_y = uf_StringCount('y', ls_Date_Format)
	li_Seperator = 2
	
	li_Length = li_M + li_d + li_y + li_Seperator
	IF ( li_Returned_Length > li_Length ) THEN
		ls_Date_Format = MID(ls_Date_Format, 1, li_Returned_Length - ( li_Returned_Length - li_Length ))
	END IF
	
	//IF ( li_M <= 2 ) THEN
	//	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'M'), li_M, 'MM')
	//END IF
	
	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'M'), li_M, 'MM')
	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'd'), li_d, 'dd')
	ls_Date_Format = Replace(ls_Date_Format, POS(ls_Date_Format, 'y'), li_y, 'yyyy')
	
	is_Date_Format = ls_Date_Format
	is_Datetime_Format = ls_Date_Format + ' ' + is_Time_Format
	is_Datetime_Format_With_Seconds = ls_Date_Format + ' ' + is_Time_Format_With_Seconds
	
	ls_Date_Format = Space(255)
	li_Returned_Length = GetLocaleInfoNT(GetUserDefaultLCIDNT(), LOCALE_SLONGDATE, ls_Date_Format, 255)
	is_Long_Date_Format = ls_Date_Format
	
	is_M_D = uf_Get_M_D()
	is_MM_DD = f_Get_Date_MM_DD()
END IF
end subroutine

on u_date_format.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_date_format.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

