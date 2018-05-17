$PBExportHeader$w_documents.srw
forward
global type w_documents from window
end type
type pb_signature from picturebutton within w_documents
end type
type st_signature from statictext within w_documents
end type
type st_station_description from statictext within w_documents
end type
type pb_browse from picturebutton within w_documents
end type
type mle_description from multilineedit within w_documents
end type
type st_description from statictext within w_documents
end type
type st_filename from statictext within w_documents
end type
type cb_cancel from commandbutton within w_documents
end type
type cb_ok from commandbutton within w_documents
end type
type st_documents from statictext within w_documents
end type
type cbx_associate from checkbox within w_documents
end type
type mle_filename from multilineedit within w_documents
end type
end forward

global type w_documents from window
string tag = "1280"
integer width = 1097
integer height = 1280
string menuname = "mnu_blank"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
string icon = "AppIcon!"
boolean palettewindow = true
boolean contexthelp = true
event ue_copy_doc ( )
event ue_edit_doc ( )
event post_open ( )
event ue_message pbm_custom03
pb_signature pb_signature
st_signature st_signature
st_station_description st_station_description
pb_browse pb_browse
mle_description mle_description
st_description st_description
st_filename st_filename
cb_cancel cb_cancel
cb_ok cb_ok
st_documents st_documents
cbx_associate cbx_associate
mle_filename mle_filename
end type
global w_documents w_documents

type variables
u_camera		iuo_camera
//date			ld_Shift_Date
integer		li_Tour
integer		li_Sta
integer		li_Rev_No
integer		li_Shift_No
date			ld_shift_date

string		ls_Description
string		ls_Filename
integer		li_Reading_Id
integer		li_Document_Number
integer		li_Document_Order
integer		li_Document_Type
blob			lb_Document_Blob
integer		li_Associate_With_Tour

boolean		ib_Edit_Doc
boolean		ib_New_Doc

integer		il_Row
string		is_FullName
end variables

event ue_copy_doc();li_Document_Number 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_number[il_Row]
li_Document_Order	 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_order[il_Row]
li_Document_Type	 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_type[il_Row]
ls_Description		 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_description[il_Row]
ls_Filename			 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_filename[il_Row]
li_Associate_With_Tour	= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.associate_with_tour[il_Row]

gs_Last_Documents_Folder = '\Temp\'
w_tour.tab_tour.tabpage_documents.dw_perf_docs.EVENT ue_Extract_Document(FALSE)

mle_description.Text = ls_Description
mle_filename.Text = ls_Filename
mle_filename.enabled = FALSE
cbx_associate.Checked = ( li_Associate_With_Tour = 1 )
end event

event ue_edit_doc();li_Document_Number 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_number[il_Row]
li_Document_Order	 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_order[il_Row]
li_Document_Type	 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_type[il_Row]
ls_Description		 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_description[il_Row]
ls_Filename			 		= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.document_filename[il_Row]
li_Associate_With_Tour	= w_tour.tab_tour.tabpage_documents.dw_perf_docs.Object.associate_with_tour[il_Row]

mle_description.Text = ls_Description
mle_filename.Text = ls_Filename
cbx_associate.Checked = ( li_Associate_With_Tour = 1 )
end event

event post_open();//w_tour.Hide()

IF ib_Edit_Doc THEN
	This.EVENT ue_Edit_Doc()
ELSEIF ib_New_Doc THEN
	// Normal window open
ELSE
	This.EVENT ue_Copy_Doc()
END IF
//IF gb_Auto_SIP THEN
//	SetSIPPreferredState(Handle(w_tour), SIPup!)
//ELSE
//	SetSIPPreferredState(Handle(w_tour), SIPdown!)
//END IF
end event

event ue_message;CHOOSE CASE lparam
	CASE 1
		string ls_PicturePathAndFilename
		integer li_Return
		li_Return = RegistryGet('HKEY_LOCAL_MACHINE\Software\Techassist\Mobile eSOMS', 'PicturePathAndFilename', RegString!, ls_PicturePathAndFilename)
		IF ( li_Return = 1 ) THEN
			IF ( LEN(ls_PicturePathAndFilename) > 0 ) THEN
				// Hard-coded responses from CECamera.exe that I coded in
				CHOOSE CASE ls_PicturePathAndFilename
					CASE "CameraDisabled"
						MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('CAMERA_IS_DISABLED', 'Camera is disabled'))
						ls_PicturePathAndFilename = ''
					CASE "CameraNotPresent"
						MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('CAMERA_IS_NOT_PRESENT', 'Camera is not present'))
						ls_PicturePathAndFilename = ''
					CASE ELSE
						IF ( FileExists(ls_PicturePathAndFilename) ) THEN
							iuo_camera.uf_Get_Filename(ls_PicturePathAndFilename)
							IF NOT Empty(ls_PicturePathAndFilename) THEN
								is_FullName = ls_PicturePathAndFilename
								gs_Last_Documents_Folder = StrTran(is_FullName, iuo_camera.is_FileName, '')
								mle_filename.Text = iuo_camera.is_FileName
								IF Empty(mle_description.Text) THEN
									mle_description.Text = iuo_camera.is_FileName//ls_PicturePathAndFilename
								END IF
								cb_ok.PostEvent("Clicked")
							END IF
						ELSE
							MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('FILE_NOT_FOUND', 'File Not Found') + ' - ' + ls_PicturePathAndFilename)
							ls_PicturePathAndFilename = ''
						END IF
				END CHOOSE
			ELSE
				MessageBox('Error 1', 'No picture is available')
			END IF
		ELSE
			MessageBox('Error 2', 'No picture is available')
		END IF
	CASE ELSE
		MessageBox('Message Number ' + String(lparam), 'This message number has not been implemented yet')
END CHOOSE

end event

on w_documents.create
if this.MenuName = "mnu_blank" then this.MenuID = create mnu_blank
this.pb_signature=create pb_signature
this.st_signature=create st_signature
this.st_station_description=create st_station_description
this.pb_browse=create pb_browse
this.mle_description=create mle_description
this.st_description=create st_description
this.st_filename=create st_filename
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_documents=create st_documents
this.cbx_associate=create cbx_associate
this.mle_filename=create mle_filename
this.Control[]={this.pb_signature,&
this.st_signature,&
this.st_station_description,&
this.pb_browse,&
this.mle_description,&
this.st_description,&
this.st_filename,&
this.cb_cancel,&
this.cb_ok,&
this.st_documents,&
this.cbx_associate,&
this.mle_filename}
end on

on w_documents.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.pb_signature)
destroy(this.st_signature)
destroy(this.st_station_description)
destroy(this.pb_browse)
destroy(this.mle_description)
destroy(this.st_description)
destroy(this.st_filename)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_documents)
destroy(this.cbx_associate)
destroy(this.mle_filename)
end on

event open;guo_window.Post uf_Resize(w_documents)

boolean lb_Allow_Signatures
string ls_Parm
string ls_Error

ls_Parm = Upper(Message.StringParm)
Message.StringParm = ''

// vvv *** Camera Code
iuo_camera = CREATE u_camera
string ls_Camera
boolean lb_Camera_Present
ls_Camera = SPACE(255)
TRY
	iuo_camera.GetFirstCameraDriver(ls_Camera)
CATCH ( runtimeerror er1 )
	ls_Error = er1.Text
	// ignore error
END TRY
lb_Camera_Present = ( TRIM(ls_Camera) = 'CAM1:' )
//MessageBox('camera', ls_Camera)
//lb_Allow_Signatures = ( Upper(f_ProfileString(gs_Module_Id, 'Allow_Signatures', 'No')) = 'YES' )
//pb_signature.Visible = lb_Allow_Signatures
//st_signature.Visible = lb_Allow_Signatures
//st_signature.Text = f_LanguageString(':SIGNATURE', ':Signature')
IF lb_Camera_Present THEN
	pb_signature.picturename = 'bitmaps\CECamera.gif'
	st_signature.Text = f_LanguageString(':CAMERA', ':Camera')
END IF
pb_signature.Visible = lb_Camera_Present
st_signature.Visible = lb_Camera_Present
// ^^ *** Camera Code

cbx_associate.Visible = FALSE
This.Title = gs_Window_Title

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
cbx_associate.Text = f_LanguageString('ASSOCIATE_WITH_ALL_RECORDS?', 'Associate with all records?')
st_description.Text = f_LanguageString('DESCRIPTION:', 'Description:')
st_documents.Text = f_LanguageString('DOCUMENTS', 'Documents')
st_filename.Text = f_LanguageString('FILENAME:', 'Filename:')

//IF IsSIPVisible() THEN
//	This.EVENT SipUp(0)
//END IF

//This.Y = 104
//This.Height = 1280

ib_New_Doc = ( ls_Parm = 'NEW' )
IF NOT ib_New_Doc THEN
	ib_Edit_Doc = ( MID(ls_Parm, 1, POS(ls_Parm, '_') - 1) = 'EDIT' )
	il_Row = w_tour.il_Document_Row
END IF

li_Tour = gsu_tour_parameters[gi_Current_Tour].Tour_Number
li_Rev_No = gsu_tour_parameters[gi_Current_Tour].rev_no
ld_Shift_Date = gsu_tour_parameters[gi_Current_Tour].tour_date
li_Shift_No = gsu_tour_parameters[gi_Current_Tour].shift_no
li_Sta = gsu_tour_parameters[gi_Current_Tour].station
li_Reading_Id = 0

IF ( il_Row > 0 ) THEN
	TRY
		st_station_description.Text = f_Ellipsis(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[il_Row], st_station_description.Width, TRUE)
	CATCH (runtimeerror er)
		ls_Error = er.Text
	END TRY
ELSE
	st_station_description.Text = ""
END IF

This.PostEvent('Post_Open')

end event

event close;gl_X = This.X
gl_Y = This.Y
//SetSIPPreferredState(Handle(This), SIPForceDown!)
guo_module_specific.f_Open_Module_Window_Lite()
//w_tour.wf_Open_Tour_Lite()
DESTROY iuo_camera

end event

event activate;This.X = gl_X
This.Y = gl_Y
f_Release_Buttons()
end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

type pb_signature from picturebutton within w_documents
string tag = "544"
integer x = 530
integer y = 544
integer width = 110
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Custom082!"
alignment htextalign = left!
end type

event clicked;// vvv *** Camera Code
IF iuo_camera.uf_Camera_DLL_Present() THEN
	iuo_camera.uf_Get_OEMInfo()
	iuo_camera.uf_Get_DW_Version()
	iuo_camera.uf_ShowCamera(Handle(w_documents))
END IF
// ^^ *** Camera Code

////f_debug('open')
//IF NOT IsValid(iuo_camera) THEN
//	iuo_camera = CREATE u_camera
//	//f_debug('0.0')
//	iuo_camera.DW_Initialized()
//	//f_debug('0.1')
//END IF
////f_debug('0.2')
//// vvv *** Camera Code
//IF iuo_camera.uf_Camera_DLL_Present() THEN
////f_debug('1')
//	string ls_Temp
//	iuo_camera.uf_Get_OEMInfo()
//	iuo_camera.uf_Get_DW_Version()
////f_debug('2')
//	IF ( iuo_camera.ii_Error = 0 ) THEN
//		iuo_camera.uf_ShowCamera(Handle(w_documents))
////f_debug('3')
//	ELSE
//		This.Visible = FALSE
//		st_signature.Visible = FALSE
//		iuo_camera.DW_deinitialize( )
////f_debug('4')
//		DESTROY iuo_camera
//	END IF
////f_debug('5')
//ELSE
//// ^^ *** Camera Code
//	integer li_Return
//	Open(w_signature)
//	li_Return = Message.DoubleParm
//	
//	IF ( li_Return = 1 ) THEN
//		is_FullName = '\Temp\Signature.sig'
//		mle_filename.Text = 'Signature.sig'
//	ELSE
//		MessageBox(f_LanguageString('CANCELLED', 'Cancelled'), f_LanguageString('THE_USER_CANCELLED_THE_SIGNATURE_PROCESS.', 'The user cancelled the signature process.'))
//	END IF
//END IF
//
end event

type st_signature from statictext within w_documents
string tag = "576"
integer x = 658
integer y = 576
integer width = 411
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = ":Signature"
boolean focusrectangle = false
end type

type st_station_description from statictext within w_documents
integer x = 27
integer y = 64
integer width = 1042
integer height = 56
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
string text = "sdfg sdfg sdfg sdf gdsfg dsfg dsfg dssdfg sdfg sdfg sdfg sdfg sdfg sdfg dsfg dsfg "
boolean focusrectangle = false
end type

event rbuttondown;MessageBox(gs_Station_Label + " Description", String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[il_Row]))

end event

event clicked;/////////////////////////////////////////////////// Appeon Begin ///////////////////////////////////////////////////
MessageBox(gs_Station_Label + " Description", String(w_tour.tab_tour.tabpage_readings.dw_readings.Object.station_description[il_Row]))
///////////////////////////////////////////////////  Appeon End  ///////////////////////////////////////////////////

end event

type pb_browse from picturebutton within w_documents
string tag = "544"
integer x = 402
integer y = 544
integer width = 110
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "Custom050!"
alignment htextalign = left!
end type

event clicked;integer li_Return
string ls_FullName
string ls_CurrentDir

ls_CurrentDir = GetCurrentDirectory()

li_Return = GetFileopenName('Open', ls_FullName, ls_FileName)

IF ( li_Return = 1 ) THEN
	is_FullName = ls_FullName
	gs_Last_Documents_Folder = StrTran(is_FullName, ls_FileName, '')
	mle_filename.Text = ls_FileName
END IF

li_Return = ChangeDirectory(ls_CurrentDir)
mle_filename.SetFocus()
//IF gb_Auto_SIP THEN
//	SetSIPPreferredState(Handle(w_tour), SIPup!)
//ELSE
//	SetSIPPreferredState(Handle(w_tour), SIPup!)
//	SetSIPPreferredState(Handle(w_tour), SIPdown!)
//END IF

end event

type mle_description from multilineedit within w_documents
string tag = "304"
integer x = 27
integer y = 176
integer width = 1042
integer height = 304
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 250
boolean ignoredefaultbutton = true
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

type st_description from statictext within w_documents
integer x = 27
integer y = 112
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Description:"
boolean focusrectangle = false
end type

type st_filename from statictext within w_documents
string tag = "576"
integer x = 18
integer y = 576
integer width = 384
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Filename:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_documents
string tag = "960"
integer x = 567
integer y = 960
integer width = 274
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
boolean cancel = true
end type

event clicked;Close(Parent)
end event

type cb_ok from commandbutton within w_documents
string tag = "960"
integer x = 201
integer y = 960
integer width = 274
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ok"
boolean default = true
end type

event clicked;string ls_MB_String
integer li_Return
integer li_Station
pointer l_pointer

ls_Filename = mle_filename.Text
ls_Description = mle_description.Text
li_Station = li_Sta
IF cbx_associate.Checked THEN
	li_Associate_With_Tour = 1
ELSE
	li_Associate_With_Tour = 0
END IF

IF Empty(is_FullName) THEN
	is_FullName = gs_Last_Documents_Folder + ls_Filename
END IF
//IF ( POS(is_FullName, '\') = 0 ) THEN
//	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('THIS_FILE_HAS_NO_FOLDER_NAME_SPECIFIED,_YOU_WILL_HAVE_TO_BROWSE_FOR_THIS_FILE.', 'This file has no folder name specified, you will have to Browse for this file.'))
//	li_Return = -1
//ELSE
IF Empty(ls_FileName) THEN
	MessageBox(f_LanguageString('ERROR', 'Error'), f_LanguageString('YOU_MUST_SELECT_A_FILE.', 'You must select a file.'))
	li_Return = -1
//ELSEIF NOT FileExists(is_FullName) THEN
//	ls_MB_String = f_LanguageString('THE_FILE_###_DOES_NOT_EXIST,_PLEASE_TRY_BROWSING_FOR_IT.', "The file '###' does not exist, please try 'Browsing' for it.")
//	ls_MB_String = StrTran(ls_MB_String, '###', is_FullName)
//	MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
//	li_Return = -1
ELSE
	l_pointer = SetPointer(HourGlass!)
	IF ib_Edit_Doc THEN
		
		UPDATE tour_documents 
			SET document_filename = :ls_Filename, 
				 document_description = :ls_Description, 
				 associate_with_tour = :li_Associate_With_Tour 
		 WHERE ( dt = :ld_Shift_Date ) 
			AND ( tour = :li_Tour ) 
			AND ( sta = :li_Station ) 
			AND ( shift_no = :li_Shift_No ) 
			AND ( reading_id = :li_Reading_Id ) 
			AND ( document_number = :li_Document_Number ) 
			AND ( document_type = 1 ) 
		 USING SQLCA ;
			
		IF ( SQLCA.SQLCode = 0 ) THEN
			// Update the blob here
			li_Return = f_File_To_Blob(is_FullName, 0, li_Document_Number, li_Station)
			IF ( li_Return = 1 ) THEN
				COMMIT ;
			END IF
		ELSE
			ls_MB_String = f_LanguageString('THERE_WAS_A_PROBLEM_UPDATING_THE_PERFORMANCE_DOCUMENT_IN_THE_DATABASE,_PLEASE_TRY_AGAIN.###', "There was a problem updating the performance document in the database, please try again.~n~r~n~r###")
			ls_MB_String = StrTran(ls_MB_String, '###', is_FullName)
			MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
			ROLLBACK ;
		END IF
	ELSE // Copy or New
	
		SELECT ISNULL(MAX(document_number), 0) + 1 
		  INTO :li_Document_Number 
		  FROM tour_documents 
		 WHERE ( dt = :ld_Shift_Date ) 
			AND ( tour = :li_Tour ) 
			AND ( sta = :li_Station ) 
			AND ( shift_no = :li_Shift_No ) 
			AND ( reading_id = :li_Reading_Id ) 
			AND ( document_type = 1 ) 
		 USING SQLCA ;
		
		li_Document_Order = li_Document_Number

		INSERT INTO tour_documents 
				 ( tour, 
					rev_no, 
					dt, 
					sta, 
					shift_no, 
					reading_id, 
					document_number, 
					document_order, 
					document_type, 
					document_description, 
					document_filename, 
					associate_with_tour ) 
		VALUES ( :li_tour, 
					:li_Rev_No, 
					:ld_Shift_Date, 
					:li_Station, 
					:li_Shift_No, 
					:li_Reading_Id, 
					:li_Document_Number, 
					:li_Document_Order, 
					1, 
					:ls_Description, 
					:ls_Filename, 
					:li_Associate_With_Tour ) 
		USING SQLCA ;
		
		IF ( SQLCA.SQLCode = 0 ) THEN
			li_Return = f_File_To_Blob(is_FullName, 0, li_Document_Number, li_Station)
			IF ( li_Return = 1 ) THEN
				COMMIT ;
			ELSE
				ROLLBACK ;
			END IF
		ELSE
			ls_MB_String = f_LanguageString('THERE_WAS_A_PROBLEM_ADDING_THE_PERFORMANCE_DOCUMENT_TO_THE_DATABASE,_PLEASE_TRY_AGAIN.###', "There was a problem adding the performance document to the database, please try again.~n~r~n~r###")
			ls_MB_String = StrTran(ls_MB_String, '###', is_FullName)
			MessageBox(f_LanguageString('ERROR', 'Error'), ls_MB_String)
			ROLLBACK ;
		END IF
	END IF
	SetPointer(l_pointer)
END IF

IF ( li_Return <> -1 ) THEN
	Close(Parent)
END IF
end event

type st_documents from statictext within w_documents
integer x = 18
integer width = 1042
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Documents"
boolean focusrectangle = false
end type

type cbx_associate from checkbox within w_documents
string tag = "480"
integer x = 27
integer y = 480
integer width = 1042
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Associate with all records?"
end type

type mle_filename from multilineedit within w_documents
string tag = "640"
integer x = 18
integer y = 656
integer width = 1042
integer height = 288
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
boolean ignoredefaultbutton = true
end type

event getfocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipUp!)
//END IF
end event

event losefocus;//IF gb_Auto_SIP AND This.Visible THEN
//	SetSIPPreferredState(Handle(This), SipDown!)
//END IF
end event

