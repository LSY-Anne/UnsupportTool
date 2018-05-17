$PBExportHeader$nvo_sync.sru
$PBExportComments$Non-visual object that controls dbmlsync
forward
global type nvo_sync from nonvisualobject
end type
end forward

global type nvo_sync from nonvisualobject
event type long ue_begin_sync ( readonly string user_name,  readonly string pub_names )
event type long ue_begin_download ( )
event type long ue_end_download ( long upsert_rows,  long delete_rows )
event type long ue_begin_upload ( )
event type long ue_begin_logscan ( long rescan_log )
event type long ue_end_logscan ( )
event type long ue_connect_mobilink ( )
event type long ue_disconnect_mobilink ( )
event type long ue_end_sync ( long status_code )
event type long ue_end_upload ( )
event type long ue_progress_info ( long progress_index,  long progress_max )
event type long ue_upload_ack ( long upload_status )
event type long ue_wait_for_upload_ack ( )
event type long ue_error_msg ( readonly string error_msg )
event type long ue_warning_msg ( readonly string warning_msg )
event type long ue_display_msg ( readonly string display_msg )
event type long ue_file_msg ( readonly string file_msg )
end type
global nvo_sync nvo_sync

type prototypes
FUNCTION long pb_run_dbmlsync(readonly string a_exe_name, readonly string a_is_publication_name, readonly string a_mluser_name, readonly string a_mlpassword, readonly string a_connect_string, readonly string a_is_additional_args, readonly string a_window_class_name ) SYSTEM LIBRARY "pkvm20.dll"
FUNCTION long pb_cancel_dbmlsync(readonly string a_window_class_name ) LIBRARY "pkvm20.dll" 
FUNCTION long pb_run_dbmlsync_25(readonly string a_exe_name, readonly string a_is_publication_name, readonly string a_mluser_name, readonly string a_mlpassword, readonly string a_connect_string, readonly string a_is_additional_args, readonly string a_window_class_name ) SYSTEM LIBRARY "pkvm25.dll" ALIAS FOR "pb_run_dbmlsync"
FUNCTION long pb_cancel_dbmlsync_25(readonly string a_window_class_name ) LIBRARY "pkvm25.dll" ALIAS FOR "pb_cancel_dbmlsync"
end prototypes

type variables
string ASA_REGPATH
constant string APP_REGPATH = "HKEY_CURRENT_USER\Software\Sybase\Adaptive Server Anywhere\9.0"
environment iEnv
window      i_syncwindow
string      is_publication_name
string      is_mluser
string      is_mlpassword
string		is_desktop_dsn 		= "remote"
string		is_ce_dsn				= "remote"
string		is_quiet					= "-Q "
string		is_app_window			= "YES"
string		is_logging				= ""
string      is_additional_args	= " "
string		is_extended_args		= "scn='on'"
string      is_sync_class_name
string		is_host					= ""  
string		is_port					= ""  
string		is_sync_object_bld	= "1" 
string		is_log_verbosity		= " -v "
end variables

forward prototypes
public function long uf_runsync_with_window (window a_syncwindow)
public function boolean uf_set_mluser_name (string a_mluser_name)
public function boolean uf_set_password (string a_password)
public function boolean uf_get_app_window_setting ()
public function boolean uf_generate_sync_class_name ()
public function boolean uf_decrypt_pw (ref string as_regpass)
public function boolean uf_encrypt_pw (ref string as_pw)
public function long uf_host_port_settings ()
public function integer determine_asa_regpath ()
public function long uf_cancelsync ()
public function long uf_runsync ()
end prototypes

event type long ue_begin_sync(readonly string user_name, readonly string pub_names);string luser, lpubs
if IsValid(i_syncwindow) then
	luser = user_name
	lpubs = pub_names
	i_syncwindow.event DYNAMIC TRIGGER ue_begin_sync(luser, lpubs)
end if
return 0
end event

event type long ue_begin_download();if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_begin_download()
end if
return 0
end event

event type long ue_end_download(long upsert_rows, long delete_rows);if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_end_download(upsert_rows, delete_rows)
end if
return 0
end event

event type long ue_begin_upload();if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_begin_upload()
end if
return 0
end event

event type long ue_begin_logscan(long rescan_log);if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_begin_logscan(rescan_log)
end if
return 0
end event

event type long ue_end_logscan();if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_end_logscan()
end if
return 0
end event

event type long ue_connect_mobilink();if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_connect_mobilink()
end if
return 0
end event

event type long ue_disconnect_mobilink();if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_disconnect_mobilink()
end if
return 0
end event

event type long ue_end_sync(long status_code);if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_end_sync(status_code)
end if
return 0
end event

event type long ue_end_upload();if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_end_upload()
end if
return 0
end event

event type long ue_progress_info(long progress_index, long progress_max);if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_progress_info(progress_index, progress_max)
end if
return 0
end event

event type long ue_upload_ack(long upload_status);if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_upload_ack(upload_status)
end if
return 0
end event

event type long ue_wait_for_upload_ack();if IsValid(i_syncwindow) then
	i_syncwindow.event DYNAMIC TRIGGER ue_wait_for_upload_ack()
end if
return 0
end event

event type long ue_error_msg(readonly string error_msg);string  lmsg
if IsValid(i_syncwindow) then
	lmsg = error_msg
	i_syncwindow.event DYNAMIC TRIGGER ue_error_msg(lmsg)
end if
return 0
end event

event type long ue_warning_msg(readonly string warning_msg);string  lmsg
if IsValid(i_syncwindow) then
	lmsg = warning_msg
	i_syncwindow.event DYNAMIC TRIGGER ue_warning_msg(lmsg)
end if
return 0
end event

event type long ue_display_msg(readonly string display_msg);string  lmsg
if IsValid(i_syncwindow) then
	lmsg = display_msg
	i_syncwindow.event DYNAMIC TRIGGER ue_display_msg(lmsg)
end if
return 0
end event

event type long ue_file_msg(readonly string file_msg);string  lmsg
if IsValid(i_syncwindow) then
	lmsg = file_msg
	i_syncwindow.event DYNAMIC TRIGGER ue_file_msg(lmsg)
end if
return 0
end event

public function long uf_runsync_with_window (window a_syncwindow);long   rc
if IsValid(a_syncwindow) then
	i_syncwindow = a_syncwindow
	rc = this.uf_runsync()
else
	rc = -1
	messagebox("Usage error", "Pass the name of the synchronization feedback window " + &
	"you wish to use.")
end if
return rc
end function

public function boolean uf_set_mluser_name (string a_mluser_name);is_mluser = a_mluser_name
return TRUE
end function

public function boolean uf_set_password (string a_password);is_mlpassword = a_password
return TRUE
end function

public function boolean uf_get_app_window_setting ();if upper(is_app_window) = 'YES' then
	return TRUE
else
	return FALSE
end if
end function

public function boolean uf_generate_sync_class_name ();// is_sync_class_name is an arbitrary window class name that we 
// will assign to the MobiLink synchronization process.  
// The general format we are using is:
// "pubname_user_sync"    Example:  "salesapi_50_sync"

long  idx
if IsNull(is_publication_name) then
	is_sync_class_name = "Defaultpub_" 
else
	idx = Pos(is_publication_name, ',', 1)
	if idx > 0 then
		is_sync_class_name = Left(is_publication_name, idx - 1) + "_"
	else	
		is_sync_class_name = is_publication_name + "_"
	end if
end if
if IsNull(is_mluser) then
	is_sync_class_name += "Defaultuser_sync" 
else
	is_sync_class_name += is_mluser + "_sync"
end if
return TRUE
end function

public function boolean uf_decrypt_pw (ref string as_regpass);// Simple decryption scheme. 
// Developers can make this arbitrarily complex as needed.
long	len, newlen, i, j 
char  lc_old[], lc_new[], lc_rand

len = Len(as_regpass)
newlen = len / 2
lc_old = as_regpass
j = len
for i = 1 to newlen
	lc_new[i] = lc_old[j]  	
	j -= 2
next
as_regpass = lc_new

return true
end function

public function boolean uf_encrypt_pw (ref string as_pw);// Simple encryption scheme for saving pw in registry.
// Developers can make this arbitrarily complex as needed.
long	len, i, j, random, randmax
char  lc_old[], lc_new[], lc_rand

randmax = 26
len = Len(as_pw)
lc_old = as_pw
j = len
len = len * 2
for i = 1 to len step 2
	random = Rand(randmax) + 96
	lc_new[i] = char(random)  	
	lc_new[i+1] = lc_old[j]
	j -= 1
next
as_pw = lc_new

return TRUE
end function

public function long uf_host_port_settings ();//  Append host and port settings to the is_extended_args variable according
//  to DBMLSYNC command line specifications:  ";adr='host=???;port=????' "
string ls_adr

ls_adr = ""
if is_host <> "" then
	ls_adr = "adr=~'host=" + is_host
end if
if is_port <> "" then
	if ls_adr = "" then
		ls_adr = "adr=~'port=" + is_port 
	else
		ls_adr += ";port=" + is_port
	end if
end if
if ls_adr <> "" then 
	ls_adr += "~'"
end if
if is_extended_args = "" then 
	is_extended_args = ls_adr
else
	is_extended_args += ";" + ls_adr
end if
return 0	
end function

public function integer determine_asa_regpath ();int		rc
string	ls_regkey
string	ls_work
constant string ASA9_REGPATH = "HKEY_CURRENT_USER\Software\Sybase\Adaptive Server Anywhere\9.0"
constant string ASA11_REGPATH = "HKEY_CURRENT_USER\Software\Sybase\SQL Anywhere\11.0"

rc = RegistryGet(ASA11_REGPATH, "Location", RegString!, ls_work)
if rc = 1 then
	ASA_REGPATH = ASA11_REGPATH
else
	rc = RegistryGet(ASA9_REGPATH, "Location", RegString!, ls_work)
	if rc = 1 then
		ASA_REGPATH = ASA9_REGPATH
	else
		rc = -1
	end if
end if
return rc
end function

public function long uf_cancelsync ();//  This function cancels the dbmlsync process that was 
//  previously launched using uf_runsync().  To communicate
//  with the dbmlsync process, uf_runsync() passed a 
//  "-wc window_class" command line argument which represents
//  a unique window class name that dbmlsync used to register
//  its window class.  pb_cancel_dbmlsync() uses FindWindow()
//  to obtain the window handle associated with the dbmlsync
//  process and posts a WM_CLOSE message to the window.
//***********************************************************
long rc
IF gb_SA11 THEN
	rc = pb_cancel_dbmlsync_25(is_sync_class_name)
ELSE
	rc = pb_cancel_dbmlsync(is_sync_class_name)
END IF
return rc
end function

public function long uf_runsync ();//  uf_runsync() calls a function in PKVMxxx.DLL named
//  pb_run_dbmlsync().  It launches a dbmlsync process 
//  using several new command line arguments that facilitate
//  inter-process communication. "-wc syc_class_name" registers
//  a unique window class for the dbmlsync process.  This 
//  allows the Pocket PB application to call uf_cancelsync()
//  at any time to programmatically cancel the dbmlsync
//  process while it is running. "-wh handle" passes a window
//  handle instantiated by pb_run_dbmlsync().  This window
//  recieves WM_COPYDATA messages from the dbmlsync process 
//  announcing each milestone reached.  pb_run_dbmlsync() then
//  triggers the following events in this user object corresponding
//  to each WM_COPYDATA message recieved:
//  long ue_begin_sync ( string user_name,  string pub_names)
//  long ue_begin_logscan ( long rescan_log )
//  long ue_progress_info ( long progress_index,  long progress_max )
//  long ue_end_logscan ( )
//  long ue_connect_mobilink ( )
//  long ue_begin_upload ( )
//  long ue_end_upload ( )
//  long ue_wait_for_upload_ack ( )
//  long ue_upload_ack ( long upload_status )
//  long ue_begin_download ( )
//  long ue_end_download ( long upsert_rows,  long delete_rows )
//  long ue_disconnect_mobilink( )
//  long ue_end_sync ( long status_code )
//  long ue_error_msg( string error_msg )
//  long ue_warning_msg( string warning_msg )
//  long ue_file_msg( string file_msg )
//  long ue_display_msg( string display_msg )
//
//  It is important to note that events are triggered (not posted)
//  so the dbmlsync process is delayed until the powerscript event
//  has finished running. 
//***********************************************************
string cmd, path
string exe_name
string connect_string, other_arguments
long    rc, idx

// ASA key
IF ( FileExists(GetCurrentDirectory() + "\dbmlsync.exe") AND gb_Platform_Is_CE ) OR NOT gb_Platform_Is_CE THEN
	Path = GetCurrentDirectory() + '\'
ELSE
	IF ( RegistryGet(ASA_REGPATH, "Location", path) = -1 ) THEN
//		MessageBox("Error", "Cannot find ASA path.")
		MessageBox(f_LanguageString('ERROR', "Error"), f_LanguageString('CANNOT_FIND_ASA_PATH.', "Cannot find ASA path."))
		RETURN -1
	ELSE
		path += '\'
	END IF
END IF

IF NOT gb_Platform_Is_CE THEN
	IF gb_SA11 THEN
		path = 'C:\Program Files\SQL Anywhere 11\bin32\'
	ELSE
		path = 'C:\Program Files\Sybase\SQL Anywhere 9\win32\'
	END IF
END IF
connect_string = " -c ~"eng=esoms;dbn=esoms;UID=dba;PWD=sql~""

exe_name = path + "dbmlsync.exe"
uf_generate_sync_class_name()

//if NOT IsNull(is_logging) and Len(is_logging) > 0 then
//	other_arguments += is_logging
//end if
//if NOT IsNull(is_additional_args) and Len(is_additional_args) > 0 then
//	other_arguments +=  is_additional_args
//end if
//if NOT IsNull(is_extended_args) and Len(is_extended_args) > 0 then
//	other_arguments += ' -e ~"' + is_extended_args + '~"'
//end if
//IF ( POS(other_arguments, '-x' ) = 0 ) THEN
//	other_arguments += ' -x '
//END IF

//-c "eng=esoms;dbn=esoms;UID=esoms;PWD=abc123" -x -e "sendcolumnnames=on" -n "rounds,common" -u "ml_607407004010407108000040056A0E9D"
//string ls_Message
//ls_Message = 'exe_name - ' + exe_name + ', is_publication_name - ' + is_publication_name + ', is_mluser - ' + is_mluser + ', is_mlpassword - ' + is_mlpassword + ', connect_string - ' + connect_string + ', other_arguments - ' + other_arguments + ', is_sync_class_name - ' + is_sync_class_name
//MessageBox('', ls_Message)
string ls_ML_Port

SELECT value_id 
  INTO :ls_ML_Port 
  FROM mobilink_settings 
 WHERE ( key_id = 'ml_host_port' ) ;

IF Empty(ls_ML_Port) THEN
	ls_ML_Port = '2439'
END IF

//other_arguments = is_additional_args + is_log_verbosity + is_logging + ' -pd dbmlsock9.dll ' + " -e ~"ADR='host=" + is_host + ";port=" + ls_ML_Port + "';sa=off;dbs=2m~" -x "
IF gb_sa11 THEN
	other_arguments = is_additional_args + is_log_verbosity + is_logging + " -e ~"ADR='host=" + is_host + ";port=" + ls_ML_Port + "';sa=off;dbs=2m~" -x "
	rc = pb_run_dbmlsync_25(exe_name, is_publication_name, is_mluser, is_mlpassword, connect_string, other_arguments, is_sync_class_name)
ELSE
	other_arguments = is_additional_args + is_log_verbosity + is_logging + ' -pd dbmlsock9.dll ' + " -e ~"ADR='host=" + is_host + ";port=" + ls_ML_Port + "';sa=off;dbs=2m~" -x "
	rc = pb_run_dbmlsync(exe_name, is_publication_name, is_mluser, is_mlpassword, connect_string, other_arguments, is_sync_class_name)
END IF
return  rc
end function

on nvo_sync.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_sync.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;string 	ls_regkey, ls_regvalue, ls_work, ls_default_value
integer  rc
decimal	ld_this_object_build, ld_registry_build
boolean	bUseRegistryValues
//------------------------------------------------------------------------------
//  The default values were initially set by the MobiLink synchronization wizard.
//  They represent the default assignments in "Declare Instance Variables".
//
//  If the end user is allowed to override default settings, then existing
//  registry values will ordinarily be retrieved and used during each
//  synchronization request. 
//
//  However, different behavior occurs under these two unique circumstances:
//  1)  No registry entry exists on the deployment device
//  2)  The is_sync_object_bld number is greater than the "Current Object Build"
//      setting in the windows registry.  
//  In these cases, new windows registry settings are created on the deployment
//  device using the instance variable declarations in this revision of the 
//  generated user object. 
//------------------------------------------------------------------------------
GetEnvironment(iEnv)

rc = determine_asa_regpath()

//if IsNumber(is_sync_object_bld) then
//	ld_this_object_build = Dec(is_sync_object_bld)
//	ls_regkey =  "Current Object Build"
//	rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//	if rc = 1 and IsNumber(ls_work) then
//		ld_registry_build = Dec(ls_work)
//	else
//		ld_registry_build = 0.00
//	end if	
//	
//	if ld_registry_build < ld_this_object_build then
//		// First time deployment of new revision - set "Current Object Build"
//		// to this revision of the wizard objects and override all registry values
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_sync_object_bld)				
//		bUseRegistryValues = FALSE
//	else
//		bUseRegistryValues = TRUE
//	end if				
//		
//	ls_regkey =  "Publication Name"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_publication_name = ls_work
//		end if
//	else
//		rc = -1
//	end if
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_publication_name)	
//	end if
//
//	ls_regkey =  "Desktop_DSN"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_desktop_dsn = ls_work
//		end if
//	else
//		rc = -1
//	end if
//	if rc <> 1 then	
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_desktop_dsn)
//	end if
//
//	ls_regkey =  "CE_DSN"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_ce_dsn = ls_work
//		end if	
//	else
//		rc = -1
//	end if
//	if rc <> 1 then		
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_ce_dsn)
//	end if
//
//	ls_regkey =  "Quiet"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_quiet = ls_work
//		end if	
//	else
//		rc = -1
//	end if
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_quiet)
//	end if
//
//	ls_regkey =  "App_Window"
//	if bUseRegistryValues then
//		rc	= RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)	
//		if rc = 1 then
//			is_app_window = ls_work
//		end if
//	else
//		rc = -1
//	end if
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_app_window)
//	end if
//	
//	ls_regkey =  "Logging"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_logging = ls_work
//		end if
//	else
//		rc = -1
//	end if
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_logging)
//	end if
//
//	ls_regkey =  "Additional_Args"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_additional_args = ls_work
//		end if
//	else
//		rc = -1
//	end if
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_additional_args)
//	end if
//
//	ls_regkey =  "Extended_Args"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_extended_args = ls_work
//		end if	
//	else
//		rc = -1
//	end if 
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_extended_args)
//	end if
//
//	ls_regkey =  "Host"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_host = ls_work
//		end if
//	else
//		rc = -1
//	end if
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_host)	
//	end if
//	
//	ls_regkey =  "Port"
//	if bUseRegistryValues then
//		rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//		if rc = 1 then
//			is_port = ls_work
//		end if
//	else
//		rc = -1
//	end if
//	if rc <> 1 then
//		rc = RegistrySet(APP_REGPATH, ls_regkey, RegString!, is_port)
//	end if
//
//	ls_regkey =  "MLUserName"
//	rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//	if rc = 1 then
//		is_mluser = ls_work
//	end if
//
//	ls_regkey =  "MLPassword"
//	rc = RegistryGet(APP_REGPATH, ls_regkey, RegString!, ls_work)
//	if rc = 1 then
//		if NOT IsNull(ls_work) and ls_work <> "" then
//			uf_decrypt_pw(ls_work)
//		end if
//		is_mlpassword = ls_work
//	end if
//end if
//
//uf_host_port_settings()
//return	
//	
end event

