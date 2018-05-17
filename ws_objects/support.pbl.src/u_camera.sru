$PBExportHeader$u_camera.sru
forward
global type u_camera from nonvisualobject
end type
type s_processinformation from structure within u_camera
end type
end forward

type s_processinformation from structure
	unsignedlong		hprocess
	unsignedlong		hthread
	unsignedlong		dwprocessid
	unsignedlong		dwthreadid
end type

global type u_camera from nonvisualobject
end type
global u_camera u_camera

type prototypes
FUNCTION BOOLEAN SetForegroundWindow( LONG HWND ) LIBRARY "coredll.dll"
FUNCTION boolean BringWindowToTop(ulong HWND) LIBRARY "coredll.dll"
FUNCTION boolean CloseWindow(ulong HWND) LIBRARY "coredll.dll"
FUNCTION boolean ShowWindow(ulong HWND, int nCmdShow) LIBRARY "coredll.dll"
Function Long CreateProcess (String lpApplicationName, String lpCommandLine, Long lpProcessAttributes, Long lpThreadAttributes, Long bInheritHandles, Long dwCreationFlags, Long lpEnvironment, Long lpCurrentDirectory, Long lpStartupInfo, Ref s_processinformation lpProcessInformation) Library "coredll.DLL" Alias for "CreateProcessW"
Function boolean TerminateProcess( uLong hProcess,  Long uExitCode) Library "coredll.DLL"
function long		WaitForSingleObject ( ulong ul_Notification, long lmillisecs ) library "coredll.dll"
function long		GetExitCodeProcess(ulong hProcess,ref ulong lpExitCode) LIBRARY "coredll.dll"
function boolean	CloseHandle(ulong h) library 'coredll.dll'

SUBROUTINE Get_OEMInfo() Library "eSOMS_Support.dll"
SUBROUTINE DW_Get_Version() Library "eSOMS_Support.dll"

FUNCTION long GetFirstCameraDriver(ref string camera) Library "eSOMS_Support.dll"
FUNCTION INT IsCameraPresent() Library "eSOMS_Support.dll"
FUNCTION long InitCapFilter() Library "eSOMS_Support.dll"
FUNCTION BOOLEAN Is_DW_Disabled() Library "eSOMS_Support.dll"
function boolean	SystemParametersInfo(int uiAction, int uiParam, ref string pvParam, int fWinIni) LIBRARY "coredll.dll" ALIAS for "SystemParametersInfoW" ;
SUBROUTINE Disable_DW() Library "eSOMS_Support.dll"
SUBROUTINE Enable_DW() Library "eSOMS_Support.dll"
SUBROUTINE DW_DeInitialize() Library "eSOMS_Support.dll" ALIAS FOR "DW_DeInitialize"
FUNCTION BOOLEAN DW_Initialized() Library "eSOMS_Support.dll" ALIAS FOR "DW_Initialized"
SUBROUTINE DW_Start() Library "eSOMS_Support.dll"
SUBROUTINE DW_Stop() Library "eSOMS_Support.dll"
FUNCTION LONG DW_Get_Status() Library "eSOMS_Support.dll"
FUNCTION ULONG StartCamera(ULONG HWND) Library "eSOMS_Support.dll"

end prototypes

type variables
string is_Filename
integer ii_Error
string is_OEMInfo
string is_DW_Version

end variables

forward prototypes
public subroutine uf_get_filename (string as_fullfilename)
public function unsignedlong uf_run_and_wait (string as_command, boolean ab_visible)
public function boolean uf_is_dw_enabled ()
public subroutine uf_get_oeminfo ()
public function string uf_showcamera (unsignedlong iu_handle)
public subroutine uf_get_dw_version ()
public function boolean uf_camera_dll_present ()
public function boolean uf_iscamerapresent ()
end prototypes

public subroutine uf_get_filename (string as_fullfilename);integer li_Last_Folder_Delimiter
integer li_Count
integer li_Length

li_Last_Folder_Delimiter = 0
li_Length = LEN(as_FullFilename)
FOR li_Count = 1 TO li_Length
	IF ( MID(as_FullFilename, li_Count, 1) = "\" ) THEN
		li_Last_Folder_Delimiter = li_Count
	END IF
NEXT

IF ( li_Last_Folder_Delimiter > 0 ) THEN
	is_Filename = MID(as_FullFilename, li_Last_Folder_Delimiter + 1)
ELSE
	is_Filename = ''
END IF


end subroutine

public function unsignedlong uf_run_and_wait (string as_command, boolean ab_visible);/*^^constant*/ long STARTF_USESHOWWINDOW = 1
/*^^constant*/ long CREATE_NEW_CONSOLE = 16
/*^^constant*/ long NORMAL_PRIORITY_CLASS = 32
/*^^constant*/ long INFINITE = -1
boolean lb_Return
long ll_Null, ll_CreationFlags, ll_Return
ulong lul_ProcessReturn
string ls_CurDir, ls_Null
s_Processinformation lstr_PI
any la_Null

SetNull(ll_Null)
SetNull(ls_Null)
SetNull(ls_CurDir)
SetNull(la_Null)

ll_CreationFlags = CREATE_NEW_CONSOLE// + NORMAL_PRIORITY_CLASS

ll_Return = CreateProcess (as_Command, as_Command, 0, 0, 0, 0, 0, 0, 0, lstr_PI)
ll_Return = WaitForSingleObject (lstr_PI.hProcess, INFINITE)
ll_Return = GetExitCodeProcess (lstr_PI.hProcess, lul_ProcessReturn)
CloseHandle(lstr_PI.hProcess)
CloseHandle(lstr_PI.hThread)

RETURN lul_ProcessReturn
end function

public function boolean uf_is_dw_enabled ();boolean lb_Temp

//f_debug('31')
TRY
//f_debug('32')
	lb_Temp = NOT Is_DW_Disabled()
//f_debug('33')
CATCH (runtimeerror er)
//f_debug('34')
	ii_Error = 1
	lb_Temp = TRUE
	MessageBox('uf_Is_DW_Enabled()', 'Is_DW_Disabled()')
END TRY
//f_debug('35')

RETURN lb_Temp
end function

public subroutine uf_get_oeminfo ();integer li_Return

ii_Error = 0
//f_debug('10')
li_Return = RegistrySet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'OEMInfo', RegString!, 'XXX')
//f_debug('11')
IF ( li_Return = 1 ) THEN
//f_debug('12')
	Get_OEMInfo()
//f_debug('13')
	li_Return = RegistryGet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'OEMInfo', RegString!, is_OEMInfo)
//f_debug('14')
	IF ( li_Return = 1 ) THEN
//f_debug('15')
		IF ( POS(UPPER(is_OEMInfo), 'MOTOROLA') > 0 ) THEN
			li_Return = RegistrySet('HKEY_LOCAL_MACHINE\System\Pictures\Camera\OEM', 'CamerApp', RegString!, '\windows\pimg.exe')
			li_Return = RegistryDelete('HKEY_LOCAL_MACHINE\System\Pictures\Camera\OEM', 'OEMCAMERACAPTUREDLL')
			
//			MessageBox('ls_OEMInfo', is_OEMInfo)
			
//			li_Return = RegistrySet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'DW_Version', RegString!, 'XXX')
////f_debug('16')
//			IF ( li_Return = 1 ) THEN
////f_debug('17')
//				TRY
////f_debug('18')
//					Get_DWVersion()
////f_debug('19')
//				CATCH (runtimeerror er1)
////f_debug('20')
//					ii_Error = 1
////					MessageBox('Error', 'uf_Get_OEMInfo()')
//				END TRY
////f_debug('21')
//				IF ( ii_Error <> 1 ) THEN
////f_debug('22')
//					li_Return = RegistryGet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'DW_Version', RegString!, is_DW_Version)
////f_debug('23')
//					IF ( li_Return = 1 ) THEN
////f_debug('24')
////						MessageBox('ls_DW_Version', ls_DW_Version)
//					END IF
//				ELSE
//f_debug('25')
					ii_Error = 0
					boolean lb_Temp
					lb_Temp = uf_Is_DW_Enabled()
//f_debug('26')
//				END IF
//			END IF
		END IF
	END IF
END IF

//string ls_pvParam
//ls_pvParam = SPACE(50)
//SystemParametersInfo(258, 50, ls_pvParam, 0)
//MessageBox('ls_pvParam', ls_pvParam)
//
//RETURN ls_OEMInfo
end subroutine

public function string uf_showcamera (unsignedlong iu_handle);boolean lb_Enable_DW_When_Complete
string ls_Folder
integer li_Return
string ls_PicturePathAndFilename
string ls_CameraPathAndFilename

ls_PicturePathAndFilename = ''

//f_debug('41')
li_Return = RegistrySet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'PicturePathAndFilename', RegString!, '')
//f_debug('42')
IF ( li_Return = 1 ) THEN
//f_debug('43')
	IF uf_Camera_DLL_Present() THEN //AND uf_Camera_EXE_Present(ls_CameraPathAndFilename) THEN
//f_debug('44')
		IF uf_Is_DW_Enabled() THEN
//f_debug('45')
			lb_Enable_DW_When_Complete = TRUE
			TRY
//f_debug('46')
				Disable_DW()
//f_debug('47')
			CATCH (runtimeerror er1)
//f_debug('48')
MessageBox('uf_ShowCamera()', 'Disable_DW()')
			END TRY
		END IF

		TRY
//f_debug('49')
			StartCamera(iu_handle)
//f_debug('49.1')
		CATCH (runtimeerror er2)
//f_debug('49.2')
MessageBox('uf_ShowCamera()', 'StartCamera(iu_handle)')
		END TRY

//		IF FileExists(ls_CameraPathAndFilename) THEN
//			li_Return = RegistrySet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'eSOMSWindowHandle', ReguLong!, iu_Handle)
//			IF ( li_Return = 1 ) THEN
//				RUN(ls_CameraPathAndFilename, Minimized!)
//			ELSE
//				MessageBox('Error', 'Unable to write eSOMSWindowHandle registry key')
//			END IF
//		END IF
		IF lb_Enable_DW_When_Complete THEN
			TRY
//f_debug('49.3')
				Enable_DW()
//f_debug('49.4')
			CATCH (runtimeerror er3)
MessageBox('uf_ShowCamera()', 'Enable_DW()')
//f_debug('49.5')
			END TRY
		END IF
	ELSE
		MessageBox('Error', 'Files not present')
	END IF
ELSE
	MessageBox('Error', 'Unable to write PicturePathAndFilename registry key')
END IF

RETURN ls_PicturePathAndFilename


//boolean lb_Enable_DW_When_Complete
//integer li_Return
//string ls_PicturePathAndFilename
//string ls_CameraPathAndFilename
//
//ls_PicturePathAndFilename = ''
//
//li_Return = RegistrySet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'PicturePathAndFilename', RegString!, '')
//IF ( li_Return = 1 ) THEN
//	IF uf_Camera_DLL_Present() AND uf_Camera_EXE_Present(ls_CameraPathAndFilename) THEN
//		IF uf_Is_DW_Enabled() THEN
//			lb_Enable_DW_When_Complete = TRUE
//			Disable_DW()
//		END IF
//////		ULONG u_Handle
////		ULONG ul_Result
//////		u_Handle = Handle(w_main)
////		ul_Result = StartCamera(iu_handle)
//		uf_Run_And_Wait(ls_CameraPathAndFilename, TRUE)
////		IF ( ul_Result = 0 ) THEN
//			li_Return = RegistryGet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'PicturePathAndFilename', RegString!, ls_PicturePathAndFilename)
//			IF ( li_Return = 1 ) THEN
//				IF ( LEN(ls_PicturePathAndFilename) > 0 ) THEN
//					// Hard-coded responses from CECamera.exe that I coded in
//					CHOOSE CASE ls_PicturePathAndFilename
//						CASE "CameraDisabled"
//							MessageBox('Error', 'Camera is disabled on device')
//							ls_PicturePathAndFilename = ''
//						CASE "CameraNotPresent"
//							MessageBox('Error', 'Camera is not present on device')
//							ls_PicturePathAndFilename = ''
//						CASE ELSE
//							IF ( FileExists(ls_PicturePathAndFilename) ) THEN
//								uf_Get_filename(ls_PicturePathAndFilename)
//	//							FileDelete(ls_PicturePathAndFilename)
//				//				IF FileDelete(ls_PicturePathAndFilename) THEN
//				//					MessageBox('Success - File Removed', '')
//				//				ELSE
//				//					MessageBox('Failure - File Not Removed', '')
//				//				END IF
//							ELSE
//								MessageBox('Error', 'File Not Found - ' + ls_PicturePathAndFilename)
//								ls_PicturePathAndFilename = ''
//							END IF
//					END CHOOSE
//				ELSE
//					MessageBox('Error', 'No picture is available')
//				END IF
//			ELSE
//				MessageBox('Error', 'Unable to read registry key')
//			END IF
////		END IF
//		IF lb_Enable_DW_When_Complete THEN
//			Enable_DW()
//		END IF
//	END IF
//ELSE
//	MessageBox('Error', 'Unable to write registry key')
//END IF
//
//RETURN ls_PicturePathAndFilename
end function

public subroutine uf_get_dw_version ();integer li_Return

ii_Error = 0
li_Return = RegistrySet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'DWVersion', RegString!, 'XXX')
IF ( li_Return = 1 ) THEN
	TRY
		DW_Get_Version()
	CATCH ( runtimeerror er)
		Messagebox('Error', 'uf_Get_DW_Version()')
	END TRY
	li_Return = RegistryGet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'DWVersion', RegString!, is_DW_Version)
END IF

end subroutine

public function boolean uf_camera_dll_present ();string ls_Folder
string ls_CameraPathAndFilename
long ll_Status

ls_Folder = GetCurrentDirectory()
ls_CameraPathAndFilename = '\windows\eSOMS_Support.DLL'
//ls_CameraPathAndFilename = ls_Folder + '\eSOMS_Camera.DLL'

RETURN FileExists(ls_CameraPathAndFilename)

end function

public function boolean uf_iscamerapresent ();int li_Return

li_Return = IsCameraPresent()
IF ( li_Return = 1 ) THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF
end function

on u_camera.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_camera.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

