$PBExportHeader$w_esoms_syncprogress.srw
$PBExportComments$Window for running dbmlsync
forward
global type w_esoms_syncprogress from window
end type
type st_phasebar from statictext within w_esoms_syncprogress
end type
type hpb_progress from hprogressbar within w_esoms_syncprogress
end type
type mle_status from multilineedit within w_esoms_syncprogress
end type
type cb_ok from commandbutton within w_esoms_syncprogress
end type
type cb_cancel from commandbutton within w_esoms_syncprogress
end type
end forward

global type w_esoms_syncprogress from window
integer width = 2327
integer height = 1728
boolean titlebar = true
string title = "MobiLink Synchronization Status"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_postopen ( )
event type long beginsync ( readonly string user_name,  readonly string pub_names )
event type long beginlogscan ( long rescan_log )
event type long progressindex ( long progress_index,  long progress_max )
event type long endlogscan ( )
event type long connectmobilink ( )
event type long beginupload ( )
event type long endupload ( )
event type long waitforuploadack ( )
event type long uploadack ( long upload_status )
event type long begindownload ( )
event type long enddownload ( long upsert_rows,  long delete_rows )
event type long endsync ( long status_code )
event type long disconnectmobilink ( )
event ue_scroll_mle ( )
event type long errormessage ( readonly string error_msg )
event type long warningmessage ( readonly string warning_msg )
event type long filemessage ( readonly string file_msg )
event type long displaymessage ( readonly string display_msg )
event type long syncpreview ( string cmdstring )
st_phasebar st_phasebar
hpb_progress hpb_progress
mle_status mle_status
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_esoms_syncprogress w_esoms_syncprogress

type prototypes

end prototypes

type variables
MLSync		i_uosync
long		i_RC

end variables

event ue_postopen();
string				thiswindowname

hpb_progress.position = 0
st_phasebar.text = ""

cb_ok.enabled = FALSE
cb_cancel.enabled = TRUE
thiswindowname = this.ClassName()
if thiswindowname = i_uosync.progresswindowname then
	i_uosync.WindowObject = this
	i_uosync.usewindow = TRUE
end if
i_RC = i_uosync.synchronize()
cb_ok.enabled = TRUE
cb_cancel.enabled = FALSE

if IsNull(i_RC) then
	mle_status.text += "~r~nSynchronization error - NULL return code."
elseif i_RC = 1 then
	mle_status.text += "~r~nSynchronization completed."	
elseif i_RC = 5 then
	mle_status.text += "~r~nSynchronization cancelled at user's request."	
else
	mle_status.text += "~r~nError " + string(i_RC) + ".  "
	choose case i_RC
		case 2
			mle_status.text += "Invalid file format.~r~n"
		case 3
			mle_status.text += "File not found, unable to open.~r~n"
		case 4
			mle_status.text += "Out of memory.~r~n"
		case 6
			mle_status.text += "Failed communications.~r~n"
		case 7
			mle_status.text += "Missing a required database name.~r~n"
		case 8
			mle_status.text += "Client/server protocol mismatch.~r~n"
		case 9
			mle_status.text += "Unable to connect to database server.~r~n"
		case 10
			mle_status.text += "Database server not running.~r~n"
		case 11
			mle_status.text += "Database server not found.~r~n"
		case 12
			mle_status.text += "Missing or bad encryption key.~r~n"
		case 13
			mle_status.text += "Server must be upgraded to run database.~r~n"
		case 14
			mle_status.text += "Database file invalid.~r~n"
		case 15
			mle_status.text += "Log file error.~r~n"
		case 16
			mle_status.text += "File in use.~r~n"
		case 17
			mle_status.text += "Fatal error or assertion occurred.~r~n"
		case 255
			mle_status.text += "Invalid parameters on the command line.~r~n"
	end choose
	mle_status.text += i_uosync.errortext
end if	
this.event TRIGGER ue_scroll_mle()
end event

event type long beginsync(readonly string user_name, readonly string pub_names);mle_status.SetRedraw(FALSE)
mle_status.text += 'Begin synchronization  User: ' + &
	user_name + '~r~nPub Names: ' + pub_names + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0	
end event

event type long beginlogscan(long rescan_log);mle_status.SetRedraw(FALSE)
if rescan_log = 0 then
	mle_status.text += 'Begin log scan.~r~n'
else
	mle_status.text += 'Rescanning log.~r~n'
end if
this.event TRIGGER ue_scroll_mle()	
st_phasebar.text = 'Log Scan Phase'	
hpb_progress.SetRange(0,100)
hpb_progress.Position = 0
return 0

end event

event type long progressindex(long progress_index, long progress_max);hpb_progress.position = progress_index

return 0
end event

event type long endlogscan();mle_status.SetRedraw(FALSE)
mle_status.text += 'End log scan.~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long connectmobilink();mle_status.SetRedraw(FALSE)
mle_status.text += 'Connect MobiLink.~r~n'
this.event TRIGGER ue_scroll_mle()
st_phasebar.text = 'Connecting to MobiLink server'
hpb_progress.position = 0
return 0

end event

event type long beginupload();mle_status.SetRedraw(FALSE)
mle_status.text += 'Begin upload.~r~n'
this.event TRIGGER ue_scroll_mle()
hpb_progress.position = 0
st_phasebar.text = 'Begin upload'
return 0

end event

event type long endupload();mle_status.SetRedraw(FALSE)
mle_status.text += 'End upload.~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long waitforuploadack();mle_status.SetRedraw(FALSE)
mle_status.text += 'Waiting for upload acknowledgement.~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long uploadack(long upload_status);mle_status.SetRedraw(FALSE)
mle_status.text += 'Upload acknowledged.  Status = ' + &
string(upload_status) + '.~r~n'
this.event TRIGGER ue_scroll_mle()
hpb_progress.position = 0
st_phasebar.text = ""
return 0

end event

event type long begindownload();mle_status.SetRedraw(FALSE)
mle_status.text += 'Begin download.~r~n'
this.event TRIGGER ue_scroll_mle()
hpb_progress.position = 0
st_phasebar.text = 'Download to remote DB'

return 0

end event

event type long enddownload(long upsert_rows, long delete_rows);mle_status.SetRedraw(FALSE)
mle_status.text += 'End download.~r~n' + &
'Insert/Update rows = ' + string(upsert_rows) + '~r~n' + &
'Delete rows = ' + string(delete_rows) + '~r~n'
this.event TRIGGER ue_scroll_mle()
st_phasebar.text = ""
return 0

end event

event type long endsync(long status_code);mle_status.SetRedraw(FALSE)
mle_status.text += 'End Synchronization.  ' + &
'Status = ' + string(status_code) + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long disconnectmobilink();mle_status.SetRedraw(FALSE)
mle_status.text += 'Disconnect MobiLink server.~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event ue_scroll_mle();long numlines
numlines = mle_status.linecount()
if numlines > 8 then
	mle_status.scroll(numlines - 8)
end if
mle_status.SetRedraw(TRUE)
end event

event type long errormessage(readonly string error_msg);mle_status.SetRedraw(FALSE)
mle_status.text += error_msg + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0


end event

event type long warningmessage(readonly string warning_msg);mle_status.SetRedraw(FALSE)
mle_status.text += warning_msg + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long filemessage(readonly string file_msg);mle_status.SetRedraw(FALSE)
mle_status.text += file_msg + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long displaymessage(readonly string display_msg);mle_status.SetRedraw(FALSE)
mle_status.text += display_msg + '~r~n'
this.event TRIGGER ue_scroll_mle()
return 0

end event

event type long syncpreview(string cmdstring);string		edit_msg
long 		idx

idx = pos(cmdstring, " -ds ")
if idx = 0 then
	idx = pos(cmdstring, " -uo ")
	if idx = 0 then 
		edit_msg += "Bidirectional! processing requested~r~n"
	else
		edit_msg += "UploadOnly! processing requested~r~n"
	end if
else	
	edit_msg += "DownloadOnly! processing requested~r~n"
end if
mle_status.text += 'Sync Preview: ' + edit_msg
this.event TRIGGER ue_scroll_mle()
return 0
end event

on w_esoms_syncprogress.create
this.st_phasebar=create st_phasebar
this.hpb_progress=create hpb_progress
this.mle_status=create mle_status
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.Control[]={this.st_phasebar,&
this.hpb_progress,&
this.mle_status,&
this.cb_ok,&
this.cb_cancel}
end on

on w_esoms_syncprogress.destroy
destroy(this.st_phasebar)
destroy(this.hpb_progress)
destroy(this.mle_status)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;i_uosync = message.powerobjectparm
if IsValid(i_uosync) and i_uosync.TypeOf() = MlSync! then
	this.event POST ue_postopen()
else
	cb_cancel.enabled = FALSE
	cb_OK.enabled = TRUE
	mle_status.text = 'Usage Error~r~n' + &
	'This window must be called using ~r~n' + &
	'OpenWithParm(w_esoms_syncprogress, instance_of_MLSync!)~r~n'
end if

end event

type st_phasebar from statictext within w_esoms_syncprogress
integer x = 73
integer y = 1344
integer width = 2158
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type hpb_progress from hprogressbar within w_esoms_syncprogress
integer x = 73
integer y = 1248
integer width = 2158
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 1
end type

type mle_status from multilineedit within w_esoms_syncprogress
integer x = 73
integer y = 64
integer width = 2158
integer height = 1088
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_ok from commandbutton within w_esoms_syncprogress
integer x = 585
integer y = 1472
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;if i_RC <> 0 then
	i_uosync.cancelsync()
end if

CloseWithReturn(parent, i_RC)
end event

type cb_cancel from commandbutton within w_esoms_syncprogress
integer x = 1353
integer y = 1472
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
end type

event clicked;long rc

rc = i_uosync.cancelsync()
if rc = 1 then
	mle_status.text += 'Synchronization Cancelled~r~n'
else
	mle_status.text += 'Cancel request failed.~r~n'
end if

end event

