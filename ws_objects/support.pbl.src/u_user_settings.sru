$PBExportHeader$u_user_settings.sru
forward
global type u_user_settings from nonvisualobject
end type
type us_dw_column_settings from structure within u_user_settings
end type
type us_hidden_columns from structure within u_user_settings
end type
end forward

type us_dw_column_settings from structure
	string		column_name
	integer		column_order
	integer		x_coordinate
	boolean		found
	integer		column_width
	integer		column_visible
	string		header_text
	string		db_name
end type

type us_hidden_columns from structure
	string		Hidden_Column_Name
	string		Text_Column_Name
	string		Text_Value
end type

global type u_user_settings from nonvisualobject autoinstantiate
end type

type variables
datastore	ids_user_settings
datastore	ids_language_settings
boolean		ib_No_Language
string		is_Required_Columns
end variables

forward prototypes
public function long uf_get_user_settings (string as_module_id, string as_key_id)
public function long uf_get_user_settings ()
public subroutine uf_reinitialize ()
public function string uf_replace_language_strings (string as_string, string as_parameters[])
public function string uf_replace_language_strings_2 (string as_string, string as_parameters[], string as_delimiters[])
public function string uf_replace_language_strings_3 (string as_string, string as_parameter, string as_delimiter)
public function string uf_languagestring (string as_default)
public function string uf_languagestring (string as_key, string as_default)
public function string uf_languagestring (string as_key, string as_default, string as_parameters[])
public function string uf_languagestring_2 (string as_default, string as_parameters, string as_delimiters)
public function string uf_languagestring_2 (string as_default, string as_parameters[], string as_delimiters[])
public function string uf_languagestring_2 (string as_key, string as_default, string as_parameters, string as_delimiters)
public function string uf_languagestring_2 (string as_key, string as_default, string as_parameters[], string as_delimiters[])
public function string uf_get_header_text_from_expression (string as_string_passed)
public subroutine uf_clean_up_header_text (ref string as_header_text)
public function long uf_get_language_settings ()
end prototypes

public function long uf_get_user_settings (string as_module_id, string as_key_id);// This will create the datastore modeled after ds_user_settings 
// and retrieve the data based on passed parameters

integer li_Error
long ll_Num_Rows
string ls_Sql, ls_Error

IF NOT IsValid(ids_user_settings) THEN
	ids_user_settings = CREATE datastore
END IF
ids_user_settings.DataObject = 'ds_user_settings'
li_Error = ids_user_settings.SetTransObject(SQLCA)
li_Error = ids_user_settings.SetFilter('')
ll_Num_Rows = ids_user_settings.Retrieve(as_Module_Id, as_Key_Id)
COMMIT USING SQLCA ;

RETURN ll_Num_Rows
end function

public function long uf_get_user_settings ();// This will create the datastore modeled after ds_user_settings 
// and retrieve the data based on passed parameters

integer li_Error
long ll_Num_Rows
string ls_Sql, ls_Error

IF NOT IsValid(ids_user_settings) THEN
	ids_user_settings = CREATE datastore
END IF
ids_user_settings.DataObject = 'ds_user_settings_2'
li_Error = ids_user_settings.SetTransObject(SQLCA)
li_Error = ids_user_settings.SetFilter('')
ll_Num_Rows = ids_user_settings.Retrieve()
COMMIT USING SQLCA ;

RETURN ll_Num_Rows
end function

public subroutine uf_reinitialize ();integer li_Return
IF IsValid(ids_user_settings) THEN
	li_Return = ids_user_settings.SetTransObject(SQLCA)
END IF
IF IsValid(ids_language_settings) THEN
	li_Return = ids_language_settings.SetTransObject(SQLCA)
END IF
end subroutine

public function string uf_replace_language_strings (string as_string, string as_parameters[]);integer li_Count
integer li_Num_Parameters
string ls_String
integer li_Position

li_Num_Parameters = UpperBound(as_Parameters)
ls_String = as_String
FOR li_Count = 1 TO li_Num_Parameters
	li_Position = POS(ls_String, '###')
	IF ( li_Position > 0 ) THEN
		ls_String = MID(ls_String, 1, li_Position - 1) + as_Parameters[li_Count] + MID(ls_String, li_Position + 3)
	END IF
NEXT

RETURN ls_String
end function

public function string uf_replace_language_strings_2 (string as_string, string as_parameters[], string as_delimiters[]);integer li_Count
integer li_Num_Parameters
integer li_Num_Delimiters
string ls_String
integer li_Position

li_Num_Parameters = UpperBound(as_Parameters)
li_Num_Delimiters = UpperBound(as_Delimiters)
IF ( li_Num_Parameters <> li_Num_Delimiters ) THEN
	Messagebox(f_DW_Language_Call_2('Error'), 'uf_Replace_Language_Strings_2~n~nParameters=' + String(li_Num_Parameters) + '~nDelimiters=' + String(li_Num_Delimiters) + '~n~n' + as_String, StopSign!)
	ls_String = as_String
ELSE
	ls_String = as_String
	FOR li_Count = 1 TO li_Num_Parameters
		li_Position = POS(ls_String, as_Delimiters[li_Count])
		IF ( li_Position > 0 ) THEN
			ls_String = MID(ls_String, 1, li_Position - 1) + as_Parameters[li_Count] + MID(ls_String, li_Position + LEN(as_Delimiters[li_Count]))
		END IF
	NEXT
END IF

RETURN ls_String
end function

public function string uf_replace_language_strings_3 (string as_string, string as_parameter, string as_delimiter);string ls_String
integer li_Position

ls_String = as_String
li_Position = POS(ls_String, as_Delimiter)
DO WHILE ( li_Position > 0 )
	ls_String = MID(ls_String, 1, li_Position - 1) + as_Parameter + MID(ls_String, li_Position + LEN(as_Delimiter))
	li_Position = POS(ls_String, as_Delimiter)
LOOP

RETURN ls_String
end function

public function string uf_languagestring (string as_default);string ls_Key
long ll_Num_Rows
string ls_Return
string ls_Find
long ll_Found_Row

ls_Return = as_Default
IF IsValid(guo_user_settings) THEN
	IF IsValid(ids_language_settings) THEN
		IF  ids_language_settings.rowcount() <> 0 THEN
			IF NOT guo_user_settings.ib_No_Language THEN
				// replace spaces with underscores
				ls_Key = Upper(StrTran(as_Default, ' ', '_'))
				// replace quotes with nothing
				ls_Key = Upper(StrTran(ls_Key, "'", ''))
	//			ls_Key = Upper(StrTran(ls_Key, '"', ''))
				ls_Find = " key = '" + ls_Key + "'"
				ll_Num_Rows = This.ids_language_settings.RowCount()
				ll_Found_Row = This.ids_language_settings.Find(ls_Find, 1, ll_Num_Rows + 1)
				IF ( ll_Found_Row > 0 ) THEN
					ls_Return = This.ids_language_settings.Object.value[ll_Found_Row]
				END IF
				/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
	//			IF IsNull(ls_Return) THEN
	//				ls_Return = ''
	//			END IF
				IF IsNull(ls_Return) or ls_Return = '' THEN
					ls_Return = as_default
				END IF
				/////////////////////////////////////////////////// Appeon End   ///////////////////////////////////////////////////
			END IF
		END IF
	END IF
END IF

RETURN gs_Test_Character + ls_Return + gs_Test_Character
end function

public function string uf_languagestring (string as_key, string as_default);long ll_Num_Rows
string ls_Return
string ls_Find
long ll_Found_Row

ls_Return = as_Default
IF IsValid(guo_user_settings) THEN
	IF IsValid(ids_language_settings) THEN
		IF NOT guo_user_settings.ib_No_Language THEN
			IF ( POS(as_Key,'~~T')>0 ) THEN
				as_Key = Upper(StrTran(as_Key, '~~T', '~~~T'))
			END IF
			// replace spaces with underscores
			as_Key = Upper(StrTran(as_Key, ' ', '_'))
			// replace quotes with nothing
			as_Key = Upper(StrTran(as_Key, "'", ''))
//			as_Key = Upper(StrTran(as_Key, '"', ''))
			ls_Find = " key = '" + as_Key + "'"
			ll_Num_Rows = This.ids_language_settings.RowCount()
			ll_Found_Row = This.ids_language_settings.Find(ls_Find, 1, ll_Num_Rows + 1)
			IF ( ll_Found_Row > 0 ) THEN
				ls_Return = This.ids_language_settings.Object.value[ll_Found_Row]
				IF ( POS(ls_Return,'~~t')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~t', '~t')
				END IF
				IF ( POS(ls_Return,'~~n')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~n', '~n')
				END IF
				IF ( POS(ls_Return,'~~r')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~r', '~r')
				END IF
			END IF
			IF IsNull(ls_Return) THEN
				ls_Return = ''
			END IF
		END IF
	END IF
END IF

RETURN gs_Test_Character + ls_Return + gs_Test_Character
end function

public function string uf_languagestring (string as_key, string as_default, string as_parameters[]);long ll_Num_Rows
string ls_Return
string ls_Find
long ll_Found_Row

ls_Return = as_Default
IF IsValid(guo_user_settings) THEN
	IF IsValid(ids_language_settings) THEN
		IF NOT guo_user_settings.ib_No_Language THEN
			// replace spaces with underscores
			as_Key = Upper(StrTran(as_Key, ' ', '_'))
			// replace quotes with nothing
			as_Key = Upper(StrTran(as_Key, "'", ''))
//			as_Key = Upper(StrTran(as_Key, '"', ''))
			ls_Find = " key = '" + as_Key + "'"
			ll_Num_Rows = This.ids_language_settings.RowCount()
			ll_Found_Row = This.ids_language_settings.Find(ls_Find, 1, ll_Num_Rows + 1)
			IF ( ll_Found_Row > 0 ) THEN
				ls_Return = This.ids_language_settings.Object.value[ll_Found_Row]
				IF ( POS(ls_Return,'~~t')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~t', '~t')
				END IF
				IF ( POS(ls_Return,'~~n')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~n', '~n')
				END IF
				IF ( POS(ls_Return,'~~r')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~r', '~r')
				END IF
			END IF
			IF IsNull(ls_Return) THEN
				ls_Return = ''
//			ELSE
//				ls_Return = This.uf_Replace_Language_Strings(ls_Return, as_Parameters)
			END IF
		END IF
	END IF
END IF

ls_Return = This.uf_Replace_Language_Strings(ls_Return, as_Parameters)

RETURN gs_Test_Character + ls_Return + gs_Test_Character
end function

public function string uf_languagestring_2 (string as_default, string as_parameters, string as_delimiters);long ll_Num_Rows
string ls_Return
string ls_Find
long ll_Found_Row
string ls_Key

ls_Return = as_Default
IF IsValid(guo_user_settings) THEN
	IF IsValid(ids_language_settings) THEN
		IF NOT guo_user_settings.ib_No_Language THEN
			// replace spaces with underscores
			ls_Key = Upper(StrTran(as_Default, ' ', '_'))
			// replace quotes with nothing
			ls_Key = Upper(StrTran(ls_Key, "'", ''))
//			ls_Key = Upper(StrTran(ls_Key, '"', ''))
			ls_Find = " key = '" + ls_Key + "'"
			ll_Num_Rows = This.ids_language_settings.RowCount()
			ll_Found_Row = This.ids_language_settings.Find(ls_Find, 1, ll_Num_Rows + 1)
			IF ( ll_Found_Row > 0 ) THEN
				ls_Return = This.ids_language_settings.Object.value[ll_Found_Row]
				IF ( POS(ls_Return,'~~t')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~t', '~t')
				END IF
				IF ( POS(ls_Return,'~~n')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~n', '~n')
				END IF
				IF ( POS(ls_Return,'~~r')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~r', '~r')
				END IF
			ELSE
				ls_Return = as_Default
			END IF
			IF IsNull(ls_Return) THEN
				ls_Return = ''
//			ELSE
//				ls_Return = This.uf_Replace_Language_Strings(ls_Return, as_Parameters)
			END IF
		END IF
	ELSE
		ls_Return = as_Default
	END IF
ELSE
	ls_Return = as_Default
END IF

ls_Return = This.uf_Replace_Language_Strings_3(ls_Return, as_Parameters, as_delimiters)

RETURN gs_Test_Character + ls_Return + gs_Test_Character
end function

public function string uf_languagestring_2 (string as_default, string as_parameters[], string as_delimiters[]);long ll_Num_Rows
string ls_Return
string ls_Find
long ll_Found_Row
string ls_Key

ls_Return = as_Default
IF IsValid(guo_user_settings) THEN
	IF IsValid(ids_language_settings) THEN
		IF NOT guo_user_settings.ib_No_Language THEN
			// replace spaces with underscores
			ls_Key = Upper(StrTran(as_Default, ' ', '_'))
			// replace quotes with nothing
			ls_Key = Upper(StrTran(ls_Key, "'", ''))
//			ls_Key = Upper(StrTran(ls_Key, '"', ''))
			ls_Find = " key = '" + ls_Key + "'"
			ll_Num_Rows = This.ids_language_settings.RowCount()
			ll_Found_Row = This.ids_language_settings.Find(ls_Find, 1, ll_Num_Rows + 1)
			IF ( ll_Found_Row > 0 ) THEN
				ls_Return = This.ids_language_settings.Object.value[ll_Found_Row]
				IF ( POS(ls_Return,'~~t')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~t', '~t')
				END IF
				IF ( POS(ls_Return,'~~n')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~n', '~n')
				END IF
				IF ( POS(ls_Return,'~~r')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~r', '~r')
				END IF
			ELSE
				ls_Return = as_Default
			END IF
			IF IsNull(ls_Return) THEN
				ls_Return = ''
//			ELSE
//				ls_Return = This.uf_Replace_Language_Strings(ls_Return, as_Parameters)
			END IF
		END IF
	ELSE
		ls_Return = as_Default
	END IF
ELSE
	ls_Return = as_Default
END IF

ls_Return = This.uf_Replace_Language_Strings_2(ls_Return, as_Parameters, as_delimiters)

RETURN gs_Test_Character + ls_Return + gs_Test_Character
end function

public function string uf_languagestring_2 (string as_key, string as_default, string as_parameters, string as_delimiters);long ll_Num_Rows
string ls_Return
string ls_Find
long ll_Found_Row
string ls_Key

ls_Return = as_Default
IF IsValid(guo_user_settings) THEN
	IF IsValid(ids_language_settings) THEN
		IF NOT guo_user_settings.ib_No_Language THEN
			ls_Key = as_key
			// replace spaces with underscores
			ls_Key = Upper(StrTran(ls_Key, ' ', '_'))
			// replace quotes with nothing
			ls_Key = Upper(StrTran(ls_Key, "'", ''))
//			ls_Key = Upper(StrTran(ls_Key, '"', ''))
			ls_Find = " key = '" + ls_Key + "'"
			ll_Num_Rows = This.ids_language_settings.RowCount()
			ll_Found_Row = This.ids_language_settings.Find(ls_Find, 1, ll_Num_Rows + 1)
			IF ( ll_Found_Row > 0 ) THEN
				ls_Return = This.ids_language_settings.Object.value[ll_Found_Row]
				IF ( POS(ls_Return,'~~t')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~t', '~t')
				END IF
				IF ( POS(ls_Return,'~~n')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~n', '~n')
				END IF
				IF ( POS(ls_Return,'~~r')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~r', '~r')
				END IF
			ELSE
				ls_Return = as_Default
			END IF
			IF IsNull(ls_Return) THEN
				ls_Return = ''
//			ELSE
//				ls_Return = This.uf_Replace_Language_Strings(ls_Return, as_Parameters)
			END IF
		END IF
	ELSE
		ls_Return = as_Default
	END IF
ELSE
	ls_Return = as_Default
END IF

ls_Return = This.uf_Replace_Language_Strings_3(ls_Return, as_Parameters, as_delimiters)

RETURN gs_Test_Character + ls_Return + gs_Test_Character
end function

public function string uf_languagestring_2 (string as_key, string as_default, string as_parameters[], string as_delimiters[]);string ls_Key
long ll_Num_Rows
string ls_Return
string ls_Find
long ll_Found_Row

ls_Return = as_Default
IF IsValid(guo_user_settings) THEN
	IF IsValid(ids_language_settings) THEN
		IF NOT guo_user_settings.ib_No_Language THEN
			// replace spaces with underscores
			ls_Key = Upper(StrTran(as_Key, ' ', '_'))
			// replace quotes with nothing
			ls_Key = Upper(StrTran(ls_Key, "'", ''))
//			ls_Key = Upper(StrTran(ls_Key, '"', ''))
			ls_Find = " key = '" + ls_Key + "'"
			ll_Num_Rows = This.ids_language_settings.RowCount()
			ll_Found_Row = This.ids_language_settings.Find(ls_Find, 1, ll_Num_Rows + 1)
			IF ( ll_Found_Row > 0 ) THEN
				ls_Return = This.ids_language_settings.Object.value[ll_Found_Row]
				IF ( POS(ls_Return,'~~t')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~t', '~t')
				END IF
				IF ( POS(ls_Return,'~~n')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~n', '~n')
				END IF
				IF ( POS(ls_Return,'~~r')>0 ) THEN
					ls_Return = StrTran(ls_Return, '~~r', '~r')
				END IF
			END IF
			IF IsNull(ls_Return) THEN
				ls_Return = ''
//			ELSE
//				ls_Return = This.uf_Replace_Language_Strings(ls_Return, as_Parameters)
			END IF
		END IF
	END IF
END IF

ls_Return = This.uf_Replace_Language_Strings_2(ls_Return, as_Parameters, as_delimiters)

RETURN gs_Test_Character + ls_Return + gs_Test_Character
end function

public function string uf_get_header_text_from_expression (string as_string_passed);integer li_Position
integer li_Position_Of_Closing_Parenthesis
string ls_Return
string ls_Expression
datastore lds_temp
string ls_result
string ls_expession
string ls_err
// a dummy minimal datastore definition
string ls_dsdef = 'release 6; datawindow() table(column=(type=char(255) name=a dbname="a") )'

ls_Return = as_String_Passed
li_Position = POS(as_String_Passed, '~t')
IF ( li_Position > 0 ) THEN
	li_Position_Of_Closing_Parenthesis = POS(as_String_Passed, ')')
	ls_Expression = MID(as_String_Passed, li_Position + 1, li_Position_Of_Closing_Parenthesis - li_Position)
	// Now evaluate the expression returned by ls_Return
	ls_Expression = StrTran(ls_Expression, '"', '~~"')
	ls_Expression = StrTran(ls_Expression, "'", "~~'")

	lds_temp = CREATE datastore
	lds_temp.Create(ls_dsdef, ls_err)
	lds_temp.InsertRow(0)
	
	IF Len(ls_err) > 0 THEN
		MessageBox("ds create", ls_err)
	ELSE
		ls_Return = lds_temp.Describe ( 'evaluate( " ' + ls_Expression + ' " ,1)' )
	END IF
	DESTROY lds_temp
END IF

RETURN ls_Return
end function

public subroutine uf_clean_up_header_text (ref string as_header_text);string ls_Char, as_Header_Text_2
integer li_Count, li_Char, li_Length, li_Length_2

as_Header_Text_2 = as_Header_Text
as_Header_Text = ''

//as_Header_Text_2 = uf_Get_Header_Text_From_Expression(as_Header_Text_2)

li_Length = Len(as_Header_Text_2)

FOR li_Count = 1 TO li_Length
	ls_Char = Left(as_Header_Text_2, 1)
	li_Char = Asc(ls_Char)
	CHOOSE CASE li_Char
		CASE 0 TO 9, 11 TO 31, 34
			as_Header_Text += ''
		CASE ELSE
			as_Header_Text += ls_Char
	END CHOOSE
	li_Length_2 = Len(as_Header_Text_2)
	IF ( li_Length_2 > 1 ) THEN
		as_Header_Text_2 = Mid(as_Header_Text_2, 2)
	END IF
NEXT
end subroutine

public function long uf_get_language_settings ();// This will create the datastore modeled after ds_user_settings 
// and retrieve the data based on passed parameters

long ll_Num_Rows

IF NOT IsValid(ids_language_settings) THEN
	ids_language_settings = CREATE datastore
END IF
ids_language_settings.DataObject = 'ds_language'

string ls_Filename
integer li_Return

if appeongetclienttype() ='PB' then
	ls_Filename = '\Program Files\Mobile eSOMS\language_mobile.ini'
else
	ls_Filename = appeongetcachedir() +  '\plugin\language_mobile.ini'
end if
IF FileExists(ls_Filename) THEN
	li_Return = ids_language_settings.ImportFile(Text!, ls_Filename)
//MessageBox('ImportFile', li_Return)
	li_Return = ids_language_settings.Sort()
	ll_Num_Rows = ids_language_settings.RowCount()
	ib_No_Language = FALSE
ELSE
	ib_No_Language = TRUE
END IF

RETURN ll_Num_Rows
end function

on u_user_settings.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_user_settings.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;IF IsValid(ids_user_settings) THEN
	ids_user_settings.Reset()
	DESTROY ids_user_settings
END IF
IF IsValid(ids_language_settings) THEN
	ids_language_settings.Reset()
	DESTROY ids_language_settings
END IF
end event

