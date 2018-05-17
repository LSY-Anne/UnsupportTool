$PBExportHeader$u_user.sru
forward
global type u_user from nonvisualobject
end type
end forward

global type u_user from nonvisualobject
end type
global u_user u_user

type variables
datastore	ids_user_info
datastore	ids_user_rights
string		ID
string		Name
boolean		ib_Logged_In
//transaction	gtrans_userlog
end variables

forward prototypes
public function long is_granted (string as_module_id, integer ai_security_right_id)
public subroutine set_user_name ()
public subroutine uf_reinitialize ()
public subroutine set_user_id ()
public function integer login (string as_login_id, string as_password)
public function long init (string as_user_id)
public subroutine reset ()
public function boolean uf_logged_in ()
end prototypes

public function long is_granted (string as_module_id, integer ai_security_right_id);long ll_Row
string ls_Find

ls_Find = "appl = '" + as_Module_Id + "' AND lnum = " + STRING(ai_security_right_id)

ll_Row = ids_user_rights.Find(ls_Find, 1, ids_user_rights.RowCount())

RETURN ll_Row
end function

public subroutine set_user_name ();string ls_User_Name
long ll_Row

ll_Row = ids_user_info.GetRow()
ls_User_Name = ids_user_info.Object.name[ll_Row]

This.Name = ls_User_Name
end subroutine

public subroutine uf_reinitialize ();integer li_Return

IF IsValid(ids_user_info) THEN
	li_Return = ids_user_info.SetTransObject(SQLCA)
END IF

IF IsValid(ids_user_rights) THEN
	li_Return = ids_user_rights.SetTransObject(SQLCA)
END IF
end subroutine

public subroutine set_user_id ();string ls_User_Id
long ll_Row

ll_Row = ids_user_info.GetRow()
ls_User_Id = TRIM(ids_user_info.Object.user_id[ll_Row])

This.ID = ls_User_Id
end subroutine

public function integer login (string as_login_id, string as_password);integer li_Return
string ls_Password
string ls_Password_DB
string ls_User_Id
boolean lb_case_sensitive

// Returns  for successful login
// Returns -1 for unsuccesful login

lb_case_sensitive = Upper(f_ProfileString('NOMUS','PasswordCaseSensitive', guo_user_settings.uf_LanguageString('NO', 'No'))) = Upper(guo_user_settings.uf_LanguageString('YES', 'Yes'))
IF NOT lb_case_sensitive THEN
	as_password = UPPER(as_password)
END IF

// Encrypt the password passed as a parameter
ls_Password = Trim(f_encrypt(as_Password))

SELECT RTRIM(user_id), 
       RTRIM(password) 
  INTO :ls_User_Id, 
       :ls_Password_DB
  FROM userlog 
 WHERE ( RTRIM(login_id) = RTRIM(:as_Login_Id) ) 
 USING SQLCA ;

IF ( SQLCA.SQLCode = 0 ) THEN
	IF (Empty(ls_Password) AND Empty(ls_Password_DB)) OR (ls_Password = ls_Password_DB) THEN 
		IF IsNull(ls_User_Id) OR ( ls_User_Id = "" ) THEN
			MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('INCORRECT_LOGIN_PARAMETERS', 'Incorrect login parameters'))
			// Commented out 2006-05-04, don't want to wipe out current user's info if unsuccessful
//			This.Reset()
			li_Return = -1
		ELSE
			li_Return = This.Init(ls_User_Id)
		END IF
	ELSE
		MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('INCORRECT_LOGIN_PARAMETERS', 'Incorrect login parameters'))
		// Commented out 2006-05-04, don't want to wipe out current user's info if unsuccessful
//		This.Reset()
		li_Return = -1
	END IF
ELSE
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('USER_NOT_FOUND', 'User not found'))
	li_Return = -1
END IF

RETURN li_Return
end function

public function long init (string as_user_id);integer li_Return
long ll_Row
long ll_Num_Rows

// Returns 1 for success
// Returns -1 for failure, user not found

IF NOT IsValid(ids_user_info) THEN
	ids_user_info = CREATE DataStore
END IF

IF NOT IsValid(ids_user_rights) THEN
	ids_user_rights = CREATE DataStore
END IF

ids_user_info.DataObject = 'ds_user_info'

li_Return = ids_user_info.SetTransObject(SQLCA)

ll_Num_Rows = ids_user_info.Retrieve(as_User_Id)

ROLLBACK USING SQLCA ;

CHOOSE CASE ll_Num_Rows
	CASE 0, -1
		li_Return = -1
		guo_user.Reset()
		ib_Logged_In = FALSE
	CASE ELSE
		ll_Row = ids_user_info.GetRow()
		ids_user_rights.DataObject	= 'ds_granted_rights_list'
		li_Return = ids_user_rights.SetTransObject(SQLCA)
		ll_Num_Rows = ids_user_rights.Retrieve(as_User_Id)
		ROLLBACK USING SQLCA ;
		Set_User_Name()
		Set_User_Id()
		li_Return = 1
		ib_Logged_In = TRUE
END CHOOSE

RETURN li_Return
end function

public subroutine reset ();integer li_Return
long ll_Row
long ll_Num_Rows

IF IsValid(ids_user_info) THEN
	ids_user_info.DataObject	= 'ds_user_info'
	ids_user_info.SetTransObject(SQLCA)
	ids_user_info.Reset()
END IF

IF IsValid(ids_user_rights) THEN
	ids_user_rights.DataObject	= 'ds_granted_rights_list'
	ids_user_rights.SetTransObject(SQLCA)
	ids_user_rights.Reset()
END IF

This.Name = ""
This.ID = ""
ib_Logged_In = FALSE
end subroutine

public function boolean uf_logged_in ();ib_Logged_In = ( This.Name <> '' )

RETURN ib_Logged_In
end function

on u_user.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_user.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;IF IsValid(ids_user_info) THEN
	ids_user_info.Reset()
	DESTROY ids_user_info
END IF
IF IsValid(ids_user_rights) THEN
	ids_user_rights.Reset()
	DESTROY ids_user_rights
END IF
end event

