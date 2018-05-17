$PBExportHeader$u_ipaq_serial_number.sru
forward
global type u_ipaq_serial_number from nonvisualobject
end type
end forward

global type u_ipaq_serial_number from nonvisualobject autoinstantiate
end type

type prototypes
FUNCTION ulong GetUUID(string location, REF string uuid) LIBRARY "eSOMS_Support.dll"
end prototypes

forward prototypes
public function string f_get_uuid ()
end prototypes

public function string f_get_uuid ();ulong ul_size
string ls_IPAQ_Serial
string ls_Location

ls_IPAQ_Serial = SPACE(20)
ls_Location = '' //'Software\\TechAssist\\Mobile eSOMS'
// Case 51314 for ipaq devices not returning unique serial numbers with env.deviceid
IF NOT FileExists("\Windows\ipaqutil.dll") THEN
	ls_IPAQ_Serial = ''
ELSE	
	TRY 
		ul_size = GetUUID(ls_Location, ls_IPAQ_Serial)
	CATCH ( runtimeerror er )
		ls_IPAQ_Serial = ''
	END TRY
END IF

RETURN ls_IPAQ_Serial
end function

on u_ipaq_serial_number.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_ipaq_serial_number.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

