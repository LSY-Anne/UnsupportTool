$PBExportHeader$nvo_filetimeinfo_ce.sru
forward
global type nvo_filetimeinfo_ce from nonvisualobject
end type
type s_filetime from structure within nvo_filetimeinfo_ce
end type
type s_win32_find_data from structure within nvo_filetimeinfo_ce
end type
type s_systemtime from structure within nvo_filetimeinfo_ce
end type
type win32_file_attribute_data from structure within nvo_filetimeinfo_ce
end type
end forward

type s_filetime from structure
	unsignedlong		dwLowDateTime
	unsignedlong		dwHighDateTime
end type

type s_win32_find_data from structure 
    unsignedlong            dwfileattributes 
    s_filetime              ftcreationtime 
    s_filetime              ftlastaccesstime 
    s_filetime              ftlastwritetime 
    unsignedlong            nfilesizehigh 
    unsignedlong            nfilesizelow 
    unsignedlong            dwoid 
    character               cfilename[260] 
end type 

type s_systemtime from structure
	unsignedinteger		wYear
	unsignedinteger		wMonth
	unsignedinteger		wDayOfWeek
	unsignedinteger		wDay
	unsignedinteger		wHour
	unsignedinteger		wMinute
	unsignedinteger		wSecond
	unsignedinteger		wMilliseconds
end type

type win32_file_attribute_data from structure
	unsignedlong		dwFileAttributes
	s_filetime		ftCreationTime
	s_filetime		ftLastAccessTime
	s_filetime		ftLastWriteTime
	unsignedlong		nFileSizeHigh
	unsignedlong		nFileSizeLow
end type

global type nvo_filetimeinfo_ce from nonvisualobject autoinstantiate
end type

type prototypes
//FUNCTION boolean GetFileAttributesExA(ref string name,int k,ref WIN32_FILE_ATTRIBUTE_DATA attr) LIBRARY "COREDLL.dll"
FUNCTION boolean FileTimeToSystemTime(ref s_FILETIME dd,ref s_SYSTEMTIME s1) LIBRARY "COREDLL.dll"
FUNCTION boolean FileTimeToLocalFileTime(ref s_FILETIME d1,ref s_FILETIME d2) LIBRARY "COREDLL.dll"
FUNCTION UnsignedLong FindFirstFile_CE( REF string lpFileName, REF s_win32_find_data lpFindFileData ) library "coredll" alias for "FindFirstFileW" 
FUNCTION Boolean FindNextFile_CE( UnsignedLong hFindFile, REF s_win32_find_data lpFindFileData ) library "coredll" alias for "FindNextFileW" 

end prototypes

forward prototypes
public function integer getfilemoddate (readonly string szwhatfilename, ref string as_moddate)
end prototypes

public function integer getfilemoddate (readonly string szwhatfilename, ref string as_moddate);/*-------------------------------------------------------------­----------------- 
Function: public nvo_filetimeinfo.Getfilemoddate 
Returns: Integer 
Parameters: readonly String szwhatfilename 
reference String as_moddate 
Copyright ©2003 DTI - Philip Salgannik 
Date Created: 3/26/2003 
Description: 
---------------------------------------------------------------------------­----- 
Modifications: 
Date Author Comments 
---------------------------------------------------------------------------­---*/
s_win32_find_data fa
s_FILETIME fdt, fdt_local
s_SYSTEMTIME s_dt
ulong ul_return
boolean rtn
string sztmp

sztmp = szWhatFileName
ul_return = FindFirstFile_CE(sztmp,fa)

IF ( ul_return <= 0 ) THEN
	as_moddate = "Could not find the file."
	RETURN -1
END IF
fdt.dwLowDateTime = fa.ftLastWriteTime.dwlowdatetime
fdt.dwHighDateTime = fa.ftLastWriteTime.dwhighdatetime
IF NOT FileTimeToLocalFileTime(fdt, fdt_local) THEN
	as_moddate = "Could not convert to Local Time"
	RETURN -1
END IF
IF NOT FileTimeToSystemTime(fdt_local,s_dt) THEN
	as_moddate = "Could not convert to System Time"
	RETURN -1
END IF
as_moddate = string(datetime(date(s_dt.wyear,s_dt.wmonth,s_dt.wday), time(s_dt.whour,s_dt.wminute,s_dt.wsecond)),'yyyy-mm-dd hh:mm:ss')

RETURN 1
end function

on nvo_filetimeinfo_ce.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_filetimeinfo_ce.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

