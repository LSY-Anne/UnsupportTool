$PBExportHeader$u_window.sru
forward
global type u_window from nonvisualobject
end type
end forward

global type u_window from nonvisualobject autoinstantiate
end type

forward prototypes
public subroutine uf_resize (ref window a_w_passed)
end prototypes

public subroutine uf_resize (ref window a_w_passed);//IF gb_platform_is_ce THEN
//	a_w_passed.SetRedraw(FALSE)
//	int rc
//	long left = 0, top = 0, right = 0, bottom = 0
//	rc = GetDeskRect(left, top, right, bottom)
//	//IF ( a_w_passed.Classname() = 'w_loading' ) THEN
//	//	MessageBox('1', 'left = ' + string(left) + '~n~rtop = ' + string(top) + '~n~rright = ' + string(right) + '~n~rbottom = ' + string(bottom))
//	//	MessageBox('2', 'height = ' + string(a_w_passed.height) + '~n~rwidth = ' + string(a_w_passed.width))
//	//	MessageBox('3', 'height = ' + string(a_w_passed.height) + '~n~rwidth = ' + string(a_w_passed.width))
//	//END IF
//	IF ( a_w_passed.NTag > 0 ) THEN
//		a_w_passed.height = a_w_passed.NTag
//	ELSE
//		a_w_passed.height = PixelsToUnits(bottom, YPixelsToUnits!)
//	END IF
//	a_w_passed.width = PixelsToUnits(right, XPixelsToUnits!)
//	top = PixelsToUnits(top, YPixelsToUnits!)
//	a_w_passed.Y = top
//	//a_w_passed.BringToTop = TRUE
//	a_w_passed.SetRedraw(TRUE)
//END IF
end subroutine

on u_window.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_window.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

