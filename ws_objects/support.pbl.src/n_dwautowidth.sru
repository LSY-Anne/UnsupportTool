$PBExportHeader$n_dwautowidth.sru
$PBExportComments$Performs autowidth on grid datawindow columns
forward
global type n_dwautowidth from nonvisualobject
end type
type os_size from structure within n_dwautowidth
end type
end forward

type os_size from structure
	long		cx
	long		cy
end type

global type n_dwautowidth from nonvisualobject autoinstantiate
end type

type prototypes
// WindowsNT!
Function ulong GetDC_NT( &
	ulong hWnd &
	) Library "user32.dll" Alias For "GetDC"
Function ulong SelectObject_NT( &
	ulong hdc, &
	ulong hWnd &
	) Library "gdi32.dll" Alias For "SelectObject"
Function boolean GetTextExtentExPoint_NT( &
	ulong hdc, &
	string lpszStr, &
	integer cchString, &
	integer nMaxExtent, &
	integer lpnFit, &
	integer alpDx, &
	ref os_size lpSize &
	) Library "gdi32.dll" Alias For "GetTextExtentExPointW"
Function long ReleaseDC_NT( &
	ulong hWnd, &
	ulong hdcr &
	) Library "user32.dll" Alias For "ReleaseDC"

// WindowsCE!
Function ulong GetDC_CE( &
	ulong hWnd &
	) Library "coredll.dll" Alias For "GetDC"
Function ulong SelectObject_CE( &
	ulong hdc, &
	ulong hWnd &
	) Library "coredll.dll" Alias For "SelectObject"
Function boolean GetTextExtentExPoint_CE( &
	ulong hdc, &
	string lpszStr, &
	integer cchString, &
	integer nMaxExtent, &
	integer lpnFit, &
	integer alpDx, &
	ref os_size lpSize &
	) Library "coredll.dll" Alias For "GetTextExtentExPointW"
Function long ReleaseDC_CE( &
	ulong hWnd, &
	ulong hdcr &
	) Library "coredll.dll" Alias For "ReleaseDC"

end prototypes

type variables
Window iw_parent
Datawindow idw_data
Integer ii_original[]

end variables

forward prototypes
public subroutine of_register (readonly window aw_parent, ref datawindow adw_datawindow)
public subroutine of_statictext_resize (ref statictext ast_text)
public function string of_resize_for_ellipsis (string as_value, integer ai_col_width)
public function long of_resize (string as_colname)
public subroutine of_resizeall ()
end prototypes

public subroutine of_register (readonly window aw_parent, ref datawindow adw_datawindow);// -----------------------------------------------------------------------------
// SCRIPT:     n_dwautowidth.of_register
//
// PURPOSE:    This function saves a reference to the window and datawindow
//             in instance variables for use in the of_resize function. It
//					also saves the initial width of all visible columns to use as
//					minimum width.
//
// CALLED BY:  Usually called from Constructor event of the datawindow, the
//					Open event of the window or right after setting the .DataObject
//					property of the dw control if you do that in script.
//
// ARGUMENTS:  aw_parent - Window that the datawindow is on
//					adw_datawindow - Datawindow whose columns will be resized
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  ----------  -----------------------------------------------------
// 05/10/2004  Roland S		Initial creation
// -----------------------------------------------------------------------------

Integer li_col, li_max

// save references to parent window and datawindow
iw_parent = aw_parent
idw_data = adw_datawindow

// record column original size
li_max = Integer(adw_datawindow.Object.DataWindow.Column.Count)
FOR li_col = 1 TO li_max
	ii_original[li_col] = Integer(adw_datawindow.Describe("#" + String(li_col) + ".Width"))
NEXT

end subroutine

public subroutine of_statictext_resize (ref statictext ast_text);// -----------------------------------------------------------------------------
// SCRIPT:     n_dwautowidth.of_statictext_resize
//
// PURPOSE:    This function will resize the referenced statictext
//					control to fit the text contained in it.
//
// CALLED BY:  After the text of the control is changed
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  ----------  -----------------------------------------------------
// 05/10/2004  Roland S		Initial creation
// -----------------------------------------------------------------------------

os_size lstr_Size
ULong lul_handle, lul_hDC, lul_hFont
String ls_value
Integer li_size
integer li_Fit

li_Fit = 0

// create device context for statictext
lul_Handle = Handle(ast_text)
If gb_Platform_Is_CE Then
//	lul_hDC = GetDC_CE(lul_Handle)
//Else
//	lul_hDC = GetDC_NT(lul_Handle)
End If

// get handle to the font used by statictext
lul_hFont = Send(lul_Handle, WM_GETFONT, 0, 0)

// Select it into the device context
If gb_Platform_Is_CE Then
//	SelectObject_CE(lul_hDC, lul_hFont)
//Else
//	SelectObject_NT(lul_hDC, lul_hFont)
End If

// determine text length
ls_value = Trim(ast_text.text)
If gb_Platform_Is_CE Then
//	GetTextExtentExPoint_CE(lul_hDC, ls_value, Len(ls_value), &
//									0, li_Fit, 0, lstr_Size)
//Else
//	GetTextExtentExPoint_NT(lul_hDC, ls_value, Len(ls_value), &
//									0, li_Fit, 0, lstr_Size)
End If

// convert length in pixels to PBUnits
li_size = PixelsToUnits(lstr_Size.cx, XPixelsToUnits!) + 8

// release the device context
If gb_Platform_Is_CE Then
//	ReleaseDC_CE(lul_Handle, lul_hDC)
//Else
//	ReleaseDC_NT(lul_Handle, lul_hDC)
End If

// resize the statictext
ast_text.width = li_size

end subroutine

public function string of_resize_for_ellipsis (string as_value, integer ai_col_width);ULong lul_Handle, lul_hDC, lul_hFont
Integer li_maxwidth, li_rc, li_size
String ls_modify
Boolean lb_Return
integer li_Fit
string ls_ellipsis_Value
string ls_Ellipsis_String
integer li_Num_Characters_To_Remove
StaticText lst_text
os_size lstr_Size

li_Fit = 0

li_rc = iw_parent.OpenUserObject(lst_text)
If li_rc = 1 Then
	// give static text same font properties as column
	lst_text.FaceName = 'Tahoma'
	lst_text.TextSize = Integer(gs_Font_Height_In_Pixels)
	lst_text.Weight = 400
	lst_text.Italic = False
	lst_text.FontCharSet = Ansi!
	lst_text.FontFamily = Swiss!
	lst_text.FontPitch = Variable!

	// create device context for statictext
	lul_Handle = Handle(lst_text)
	If gb_Platform_Is_CE Then
		lul_hDC = GetDC_CE(lul_Handle)
	Else
		lul_hDC = GetDC_NT(lul_Handle)
	End If
	// get handle to the font used by statictext
	lul_hFont = Send(lul_Handle, WM_GETFONT, 0, 0)
	// Select it into the device context
	If gb_Platform_Is_CE Then
		SelectObject_CE(lul_hDC, lul_hFont)
	Else
		SelectObject_NT(lul_hDC, lul_hFont)
	End If
	
	li_Num_Characters_To_Remove = 0
	li_maxwidth = PixelsToUnits(ai_Col_Width, XPixelsToUnits!)
	ls_Ellipsis_Value = as_Value
	IF NOT Empty(as_Value) THEN
		DO
			// determine text width
			If gb_Platform_Is_CE Then
				lb_Return = GetTextExtentExPoint_CE(lul_hDC, as_Value, &
									Len(ls_Ellipsis_Value), 0, 0, 0, lstr_Size)
			Else
				lb_Return = GetTextExtentExPoint_NT(lul_hDC, as_Value, &
									Len(ls_Ellipsis_Value), 0, 0, 0, lstr_Size)
			End If
			If Not lb_Return Then
				If gb_Platform_Is_CE Then
					ReleaseDC_CE(lul_Handle, lul_hDC)
				Else
					ReleaseDC_NT(lul_Handle, lul_hDC)
				End If
				iw_parent.CloseUserObject(lst_text)
				Return ls_Ellipsis_Value
			End If
			// convert length in pixels to PBUnits
			li_size = PixelsToUnits(lstr_Size.cx, XPixelsToUnits!)
			If ( li_size > li_maxwidth ) Then
				li_Num_Characters_To_Remove = li_Num_Characters_To_Remove + 1
				ls_Ellipsis_Value = LEFT(as_Value, LEN(as_Value) - li_Num_Characters_To_Remove)
			ELSE
				IF ( li_Num_Characters_To_Remove > 0 ) THEN
					ls_Ellipsis_String = LEFT(as_Value, LEN(as_Value) - (li_Num_Characters_To_Remove + 2)) + "..."
				END IF
			End If
		LOOP WHILE ( li_size > li_maxwidth )
	END IF

	// release the device context
	If gb_Platform_Is_CE Then
		ReleaseDC_CE(lul_Handle, lul_hDC)
	Else
		ReleaseDC_NT(lul_Handle, lul_hDC)
	End If
	// destroy statictext
	iw_parent.CloseUserObject(lst_text)
End If

Return ls_Ellipsis_Value
end function

public function long of_resize (string as_colname);// -----------------------------------------------------------------------------
// SCRIPT:     n_dwautowidth.of_resize
//
// PURPOSE:    This function will change the column width so that the longest
//             value will fit.  The minimum width is the initial width set in
//					the datawindow painter.
//
// CALLED BY:  Usually called from RetrieveEnd event of the datawindow or
//					just after inserting/modifying the values in the column.
//
// ARGUMENTS:  as_colname - Column to be resized
//
// RETURN:     Row containing the longest value
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  ----------  -----------------------------------------------------
// 05/10/2004  Roland S		Initial creation
// -----------------------------------------------------------------------------

Long ll_row, ll_max, ll_maxrow
ULong lul_Handle, lul_hDC, lul_hFont
Integer li_maxwidth, li_rc, li_size, li_colnbr
String ls_value, ls_format, ls_modify
Boolean lb_true
integer li_Fit
StaticText lst_text
os_size lstr_Size

li_Fit = 0

// get column number
li_colnbr  = Integer(idw_data.Describe(as_colname + ".ID"))
If li_colnbr = 0 Then Return 0

li_rc = iw_parent.OpenUserObject(lst_text)
If li_rc = 1 Then
	// get column format string
	ls_format = idw_data.Describe(as_colname + ".Format")
	// give static text same font properties as column
	lst_text.FaceName = idw_data.Describe(as_colname + ".Font.Face")
	lst_text.TextSize = Integer(idw_data.Describe(as_colname + ".Font.Height"))
	lst_text.Weight = Integer(idw_data.Describe(as_colname + ".Font.Weight"))
	// set italic property
	If idw_data.Describe(as_colname + ".Font.Italic") = "1" Then
		lst_text.Italic = True
	Else
		lst_text.Italic = False
	End If
	// set charset property
	CHOOSE CASE idw_data.Describe(as_colname + ".Font.CharSet")
		CASE "0"
			lst_text.FontCharSet = ANSI!
		CASE "2"
			lst_text.FontCharSet = Symbol!
		CASE "128"
			lst_text.FontCharSet = ShiftJIS!
		CASE "255"
			lst_text.FontCharSet = OEM!
		CASE ELSE
			lst_text.FontCharSet = DefaultCharSet!
	END CHOOSE
	// set family property
	CHOOSE CASE idw_data.Describe(as_colname + ".Font.Family")
		CASE "1"
			lst_text.FontFamily = Roman!
		CASE "2"
			lst_text.FontFamily = Swiss!
		CASE "3"
			lst_text.FontFamily = Modern!
		CASE "4"
			lst_text.FontFamily = Script!
		CASE "5"
			lst_text.FontFamily = Decorative!
		CASE ELSE
			lst_text.FontFamily = AnyFont!
	END CHOOSE
	// set pitch property
	CHOOSE CASE idw_data.Describe(as_colname + ".Font.Pitch")
		CASE "1"
			lst_text.FontPitch = Fixed!
		CASE "2"
			lst_text.FontPitch = Variable!
		CASE ELSE
			lst_text.FontPitch = Default!
	END CHOOSE
	// create device context for statictext
	lul_Handle = Handle(lst_text)
	If gb_Platform_Is_CE Then
		lul_hDC = GetDC_CE(lul_Handle)
	Else
		lul_hDC = GetDC_NT(lul_Handle)
	End If
	// get handle to the font used by statictext
	lul_hFont = Send(lul_Handle, WM_GETFONT, 0, 0)
	// Select it into the device context
	If gb_Platform_Is_CE Then
		SelectObject_CE(lul_hDC, lul_hFont)
	Else
		SelectObject_NT(lul_hDC, lul_hFont)
	End If
	// walk thru each row of datawindow
	ll_max = idw_data.RowCount()
	FOR ll_row = 1 TO ll_max
		// get value from datawindow
		ls_value = RightTrim(String(idw_data.object.data[ll_row, li_colnbr], ls_format))
		// determine text width
		If gb_Platform_Is_CE Then
			lb_true = GetTextExtentExPoint_CE(lul_hDC, ls_value, &
								Len(ls_value), 0, 0, 0, lstr_Size)
		Else
			lb_true = GetTextExtentExPoint_NT(lul_hDC, ls_value, &
								Len(ls_value), 0, 0, 0, lstr_Size)
		End If
		If Not lb_true Then
			If gb_Platform_Is_CE Then
				ReleaseDC_CE(lul_Handle, lul_hDC)
			Else
				ReleaseDC_NT(lul_Handle, lul_hDC)
			End If
			iw_parent.CloseUserObject(lst_text)
			Return -1
		End If
		// convert length in pixels to PBUnits
//		li_size = PixelsToUnits(lstr_Size.cx, XPixelsToUnits!)
		li_size = lstr_Size.cx
		If li_size > li_maxwidth Then
			li_maxwidth = li_size
			ll_maxrow = ll_row
		End If
	NEXT
	// release the device context
	If gb_Platform_Is_CE Then
		ReleaseDC_CE(lul_Handle, lul_hDC)
	Else
		ReleaseDC_NT(lul_Handle, lul_hDC)
	End If
	// modify the column width
	If li_maxwidth > ii_original[li_colnbr] Then
		ls_modify = as_colname + ".Width = " + String(li_maxwidth + 8)
	Else
		ls_modify = as_colname + ".Width = " + String(ii_original[li_colnbr])
	End If
	idw_data.Modify(ls_modify)
	// destroy statictext
	iw_parent.CloseUserObject(lst_text)
End If

Return ll_maxrow
end function

public subroutine of_resizeall ();// -----------------------------------------------------------------------------
// SCRIPT:     n_dwautowidth.of_resizeall
//
// PURPOSE:    This function will call the of_resize function for all
//					columns in the datawindow that are datatype 'char'.
//
// CALLED BY:  Usually called from RetrieveEnd event of the datawindow or
//					just after inserting/modifying the values in the column.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  ----------  -----------------------------------------------------
// 05/10/2004  Roland S		Initial creation
// -----------------------------------------------------------------------------

Integer li_col, li_max
String ls_name, ls_type

// process all 'char' columns
li_max = Integer(idw_data.Object.DataWindow.Column.Count)
For li_col = 1 TO li_max
	// process column if visible
	If idw_data.Describe("#" + String(li_col) + ".Visible") = "1" Then
		ls_type = idw_data.Describe("#" + String(li_col) + ".ColType")
		If Lower(Left(ls_type, 4)) = "char" Then
			// get columns name
			ls_name = idw_data.Describe("#" + String(li_col) + ".Name")
			// resize the column
			this.of_resize(ls_name)
		End If
	End If
Next

end subroutine

on n_dwautowidth.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dwautowidth.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

