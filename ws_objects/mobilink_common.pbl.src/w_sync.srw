$PBExportHeader$w_sync.srw
$PBExportComments$Window for running dbmlsync
forward
global type w_sync from window
end type
type st_phasebar from statictext within w_sync
end type
type hpb_progress from hprogressbar within w_sync
end type
type mle_status from multilineedit within w_sync
end type
type cb_ok from commandbutton within w_sync
end type
type cb_cancel from commandbutton within w_sync
end type
type st_title from statictext within w_sync
end type
end forward

global type w_sync from window
integer width = 1097
integer height = 1280
boolean maxbox = true
boolean contexthelp = true
boolean defaultsize = true
windowtype windowtype = response!
string icon = "AppIcon!"
event ue_postopen ( )
event type long ue_begin_sync ( readonly string user_name,  readonly string pub_names )
event type long ue_begin_logscan ( long rescan_log )
event type long ue_progress_info ( long progress_index,  long progress_max )
event type long ue_end_logscan ( )
event type long ue_connect_mobilink ( )
event type long ue_begin_upload ( )
event type long ue_end_upload ( )
event type long ue_wait_for_upload_ack ( )
event type long ue_upload_ack ( long upload_status )
event type long ue_begin_download ( )
event type long ue_end_download ( long upsert_rows,  long delete_rows )
event type long ue_end_sync ( long status_code )
event type long ue_disconnect_mobilink ( )
event ue_scroll_mle ( )
event type long ue_error_msg ( readonly string error_msg )
event type long ue_warning_msg ( readonly string warning_msg )
event type long ue_file_msg ( readonly string file_msg )
event type long ue_display_msg ( readonly string display_msg )
st_phasebar st_phasebar
hpb_progress hpb_progress
mle_status mle_status
cb_ok cb_ok
cb_cancel cb_cancel
st_title st_title
end type
global w_sync w_sync

type prototypes

end prototypes

type variables
nvo_sync				i_uosync
long   				i_RC

end variables

event ue_postopen();// multimodulesynch good
i_uosync.uf_set_mluser_name(gs_SerialNumber)
ROLLBACK USING SQLCA ;
hpb_progress.position = 0
st_phasebar.text = ""
cb_ok.enabled = FALSE
cb_cancel.enabled = TRUE
i_RC = i_uosync.uf_runsync_with_window(this)
SetPointer(Arrow!)
cb_ok.enabled = TRUE
cb_cancel.enabled = FALSE

if i_RC = -1 then
	mle_status.text += "~r~n" + f_LanguageString('ERROR_STARTING_DBMLSYNC.', 'Error starting dbmlsync.')
elseif i_RC = 0 then
	mle_status.text += "~r~n" + f_LanguageString('SYNCHRONIZATION_COMPLETED.', 'Synchronization completed.')
elseif IsNull(i_RC) then
	mle_status.text += "~r~n" + f_LanguageString('SYNCHRONIZATION_ERROR_-_NULL_RETURN_CODE.', 'Synchronization error - NULL return code.')
else	
	mle_status.text += "~r~n" + f_LanguageString('SYNCHRONIZATION_ERROR_', 'Synchronization error ') + string(i_RC) + "."
end if

this.event TRIGGER ue_scroll_mle()
// Test code below
//IF ( st_1.Text = 'Download Tours' ) THEN
//	i_RC = 1
//	w_select_from_asa.ib_Deadlock = TRUE
//END IF
IF ( i_rc = 0 ) THEN
	CloseWithReturn(This, i_RC)
ELSEIF w_select_from_asa.ib_Deadlock THEN
	CloseWithReturn(This, i_RC)
END IF
end event

event type long ue_begin_sync(readonly string user_name, readonly string pub_names);// multimodulesynch good
mle_status.SetRedraw(FALSE)
string ls_MB_String
ls_MB_String = f_LanguageString('BEGIN_SYNCHRONIZATION__USER:_$$$_PUB_NAMES:_###', 'Begin synchronization  User: $$$ Pub Names: ###')
ls_MB_String = StrTran(ls_MB_String, '$$$', user_name)
ls_MB_String = StrTran(ls_MB_String, '###', pub_names)
mle_status.text += ls_MB_String + '~r~n'
this.event TRIGGER ue_scroll_mle()

//f_update_sync_table('Begin sync', Datetime(Today(), Now()), 'sync')

return 0	
end event

event type long ue_begin_logscan(long rescan_log);// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('BEGIN_LOG_SCAN.__RESCAN_=_', 'Begin log scan.  Rescan = ') + string(rescan_log) + '.~r~n'
this.event TRIGGER ue_scroll_mle()	
st_phasebar.text = f_LanguageString('LOG_SCAN_PHASE', 'Log Scan Phase')
hpb_progress.SetRange(0,100)
hpb_progress.Position = 0

//f_update_sync_table('Begin logscan', Datetime(Today(), Now()), 'sync')

return 0	
end event

event type long ue_progress_info(long progress_index, long progress_max);// multimodulesynch good
hpb_progress.position = progress_index

return 0
end event

event type long ue_end_logscan();// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('END_LOG_SCAN.', 'End log scan.') + '~r~n'
this.event TRIGGER ue_scroll_mle()

//f_update_sync_table('End logscan', Datetime(Today(), Now()), 'sync')

return 0

end event

event type long ue_connect_mobilink();// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('CONNECT_MOBILINK.', 'Connect MobiLink.') + '~r~n'
this.event TRIGGER ue_scroll_mle()
st_phasebar.text = f_LanguageString('CONNECTING_TO_MOBILINK_SERVER', 'Connecting to MobiLink server')
hpb_progress.position = 0

//f_update_sync_table('Connect mobilink', Datetime(Today(), Now()), 'sync')

return 0


end event

event type long ue_begin_upload();// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('BEGIN_UPLOAD.', 'Begin upload.') + '~r~n'
this.event TRIGGER ue_scroll_mle()
hpb_progress.position = 0
st_phasebar.text = f_LanguageString('BEGIN_UPLOAD', 'Begin upload')

//f_update_sync_table('Begin upload', Datetime(Today(), Now()), 'sync')

return 0

end event

event type long ue_end_upload();// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('END_UPLOAD.', 'End upload.') + '~r~n'
this.event TRIGGER ue_scroll_mle()

//f_update_sync_table('End upload', Datetime(Today(), Now()), 'sync')

return 0

end event

event type long ue_wait_for_upload_ack();// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('WAITING_FOR_UPLOAD_ACKNOWLEDGEMENT.', 'Waiting for upload acknowledgement.') + '~r~n'
this.event TRIGGER ue_scroll_mle()

//f_update_sync_table('Wait for upload', Datetime(Today(), Now()), 'sync')

return 0

end event

event type long ue_upload_ack(long upload_status);// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('UPLOAD_ACKNOWLEDGED.__STATUS_=_', 'Upload acknowledged.  Status = ') + &
string(upload_status) + '.~r~n'
IF ( upload_status = 0 ) THEN
	mle_status.text += f_LanguageString('BUILDING_DOWNLOAD_STREAM…', 'Building download stream…') + '~r~n'
END IF
this.event TRIGGER ue_scroll_mle()
hpb_progress.position = 0
st_phasebar.text = ""

//f_update_sync_table('Upload ack', Datetime(Today(), Now()), 'sync')

return 0
end event

event type long ue_begin_download();// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('BEGIN_DOWNLOAD.', 'Begin download.') + '~r~n'
this.event TRIGGER ue_scroll_mle()
hpb_progress.position = 0
st_phasebar.text = f_LanguageString('DOWNLOAD_TO_REMOTE_DB', 'Download to remote DB')

//f_update_sync_table('Begin download', Datetime(Today(), Now()), 'sync')

return 0

end event

event type long ue_end_download(long upsert_rows, long delete_rows);// multimodulesynch good
mle_status.SetRedraw(FALSE)
string ls_MB_String
ls_MB_String = f_LanguageString('END_DOWNLOAD._INSERT/UPDATE_ROWS_=_%%%_DELETE_ROWS_=_###', 'End download. Insert/Update rows = %%% Delete rows = ###') + CHAR(13) + CHAR(10)
ls_MB_String = StrTran(ls_MB_String, '. Insert', '.~n~rInsert')
ls_MB_String = StrTran(ls_MB_String, ' Delete', '~n~rDelete')
ls_MB_String = StrTran(ls_MB_String, '%%%', string(upsert_rows))
ls_MB_String = StrTran(ls_MB_String, '###', string(delete_rows))
ls_MB_String = StrTran(ls_MB_String, '~~n~~r', CHAR(13) + CHAR(10))
mle_status.text += ls_MB_String
this.event TRIGGER ue_scroll_mle()
st_phasebar.text = ""

//f_update_sync_table('End download', Datetime(Today(), Now()), 'sync')

return 0

end event

event type long ue_end_sync(long status_code);// multimodulesynch good
mle_status.SetRedraw(FALSE)
string ls_MB_String
ls_MB_String = f_LanguageString('END_SYNCHRONIZATION.__STATUS_=_###', 'End Synchronization.  Status = ###')
ls_MB_String = StrTran(ls_MB_String, '###', string(status_code))
mle_status.text += ls_MB_String
this.event TRIGGER ue_scroll_mle()

//f_update_sync_table('End sync', Datetime(Today(), Now()), 'sync')

return 0

end event

event type long ue_disconnect_mobilink();// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += f_LanguageString('DISCONNECT_MOBILINK_SERVER.', 'Disconnect MobiLink server.') + '~r~n'

this.event TRIGGER ue_scroll_mle()

//f_update_sync_table('disconnect mobilink', Datetime(Today(), Now()), 'sync')

return 0

end event

event ue_scroll_mle();// multimodulesynch good
long numlines
numlines = mle_status.linecount()
if numlines > 8 then
	mle_status.scroll(numlines - 8)
end if
mle_status.SetRedraw(TRUE)
end event

event type long ue_error_msg(readonly string error_msg);// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += error_msg + '~r~n'
w_select_from_asa.ib_Deadlock = ( POS(UPPER(error_msg), 'DEADLOCK') > 0 )
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long ue_warning_msg(readonly string warning_msg);// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += warning_msg + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long ue_file_msg(readonly string file_msg);// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += file_msg + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long ue_display_msg(readonly string display_msg);// multimodulesynch good
mle_status.SetRedraw(FALSE)
mle_status.text += display_msg + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

on w_sync.create
this.st_phasebar=create st_phasebar
this.hpb_progress=create hpb_progress
this.mle_status=create mle_status
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.st_title=create st_title
this.Control[]={this.st_phasebar,&
this.hpb_progress,&
this.mle_status,&
this.cb_ok,&
this.cb_cancel,&
this.st_title}
end on

on w_sync.destroy
destroy(this.st_phasebar)
destroy(this.hpb_progress)
destroy(this.mle_status)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.st_title)
end on

event open;// multimodulesynch good
guo_window.Post uf_ReSize(w_sync)

integer li_Width

i_uosync = message.powerobjectparm

cb_cancel.Text = f_LanguageString('CANCEL', 'Cancel')
cb_ok.Text = f_LanguageString('OK', 'Ok')
st_title.Text = f_LanguageString('SYNCHRONIZE', 'Synchronize')

//st_title.Text = w_select_from_asa.st_label.Text
//li_Width = 100 + f_Get_TextBox_Width_From_String(st_title.Text, mle_status.Width, FALSE)
//st_title.Width = li_Width
if IsValid(i_uosync) then
	i_uosync.uf_set_mluser_name(gs_SerialNumber)
	this.event POST ue_postopen()
else
	cb_cancel.enabled = FALSE
	cb_OK.enabled = TRUE
	mle_status.text = 'Usage Error~r~n' + &
	'This window must be called using ~r~n' + &
	'OpenWithParm(w_sync, guo_sync)~r~n'
	SetPointer(Arrow!)
end if

end event

event other;// multimodulesynch good
// Respond to help from Start->Help menu of the device
IF ( message.Number = 83 ) THEN
	f_Display_Help(This.ClassName())
END IF
end event

type st_phasebar from statictext within w_sync
integer x = 18
integer y = 992
integer width = 1042
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean focusrectangle = false
end type

type hpb_progress from hprogressbar within w_sync
integer x = 18
integer y = 928
integer width = 1042
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 1
end type

type mle_status from multilineedit within w_sync
integer x = 18
integer y = 64
integer width = 1042
integer height = 848
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_ok from commandbutton within w_sync
integer x = 201
integer y = 1072
integer width = 274
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
boolean default = true
end type

event clicked;if i_RC <> 0 then
	i_uosync.uf_cancelsync()
end if
CloseWithReturn(parent, i_RC)
end event

type cb_cancel from commandbutton within w_sync
integer x = 567
integer y = 1072
integer width = 274
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;long rc

rc = i_uosync.uf_cancelsync()
if rc = 0 then
	mle_status.text += 'Synchronization Cancelled~r~n'
else
	mle_status.text += 'Cancel request failed.~r~n'
end if

end event

type st_title from statictext within w_sync
integer x = 18
integer width = 1042
integer height = 64
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 33554432
string text = "Synchronize"
boolean focusrectangle = false
end type

