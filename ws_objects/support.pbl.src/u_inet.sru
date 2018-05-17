$PBExportHeader$u_inet.sru
forward
global type u_inet from inet
end type
end forward

global type u_inet from inet
end type
global u_inet u_inet

forward prototypes
public function integer test ()
end prototypes

public function integer test ();RETURN 1
end function

on u_inet.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_inet.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

