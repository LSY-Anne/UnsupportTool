$PBExportHeader$nvo_esoms_mlsync.sru
$PBExportComments$Non-visual object that controls dbmlsync
forward
global type nvo_esoms_mlsync from mlsync
end type
end forward

global type nvo_esoms_mlsync from mlsync
string additionalopts// = ""
string datasource// = "esoms"
string dbpass// = "sql"
string dbuser// = "dba"
string extendedopts// = ""
string host// = "SOMSWIN7"  
string logopts// = " -v+"
string port// = "2439"
string progresswindowname// = "w_esoms_syncprogress"
string publication// = "clearances,clearances_common,common,config,config_common,logs,logs_common,ml_clearances,ml_config,ml_logs,ml_rounds,rounds,rounds_common"
string logfilename// = "dbmlsync.txt"
string syncregistrykey = "Software\Sybase\PowerBuilder\12.0\rounds"
// 
long objectrevision = 1
long mlserverversion = 11
boolean downloadonly// = FALSE
boolean uploadonly// = FALSE
boolean usewindow// = TRUE
boolean uselogfile// = TRUE

end type
global nvo_esoms_mlsync nvo_esoms_mlsync

type variables
w_esoms_syncprogress		i_syncwindow
// uploadackstatus argument values for the uploadack event
CONSTANT long  StatCommitted = 0
CONSTANT long  StatFailed = 1
CONSTANT long  StatRetry = 248
end variables

on nvo_esoms_mlsync.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_esoms_mlsync.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event begindownload;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER begindownload()
end if
end event

event enddownload;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER enddownload(upsert_rows, delete_rows)
end if
end event

event beginupload;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER beginupload()
end if
end event

event endupload;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER endupload()
end if
end event

event beginlogscan;if IsValid(i_syncwindow) then
	long	lrescan
	if rescanlog then
		lrescan = 1
	else
		lrescan = 0
	end if
	i_syncwindow.event TRIGGER beginlogscan(lrescan)
end if
end event

event endlogscan;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER endlogscan()
end if
end event

event connectmobilink;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER connectmobilink()
end if
end event

event disconnectmobilink;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER disconnectmobilink()
end if
end event

event uploadack;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER uploadack(uploadackstatus)
end if
end event

event waitforuploadack;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER waitforuploadack()
end if
end event

event errormessage;string  lmsg
if IsValid(i_syncwindow) then
	lmsg = errmsg
	i_syncwindow.event TRIGGER errormessage(lmsg)
end if
end event

event warningmessage;string  lmsg
if IsValid(i_syncwindow) then
	lmsg = warnmsg
	i_syncwindow.event TRIGGER warningmessage(lmsg)
end if
end event

event displaymessage;string  lmsg
if IsValid(i_syncwindow) then
	lmsg = infomsg
	i_syncwindow.event TRIGGER displaymessage(lmsg)
end if
end event

event filemessage;string  lmsg
if IsValid(i_syncwindow) then
	lmsg = filemsg
	i_syncwindow.event TRIGGER filemessage(lmsg)
end if
end event

event progressindex;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER progressindex(progress_idx, progress_max)
end if
end event

event constructor;//------------------------------------------------------------------------------
//  If the end user is allowed to override default settings, then existing
//  registry values will ordinarily be retrieved and used during each
//  synchronization request. 
//
//  However, different behavior occurs under these two unique circumstances:
//  1)  No registry entry exists on the deployment device
//  2)  The "ObjectRevision" setting in the windows registry is less then the
//      ObjectRevision property in this MLSync object. 
//  In these cases, new windows registry settings are created on the deployment
//  device using the property values in this revision.
//------------------------------------------------------------------------------
long		rc = 1
long		RegistryRevision

if this.ObjectRevision > 0 and this.SyncRegistryKey <> "" then 
	RegistryRevision = this.GetObjectRevisionFromRegistry()
	if RegistryRevision < this.ObjectRevision then
		rc = this.SetSyncRegistryProperties()
	else
		rc = this.GetSyncRegistryProperties()
	end if
end if
return rc
end event

event beginsync;string	luser, lpubs

if IsValid(i_syncwindow) then
	luser = mlusername
	lpubs = pubs
	i_syncwindow.event TRIGGER beginsync(luser, lpubs)
end if

end event

event endsync;if IsValid(i_syncwindow) then
	i_syncwindow.event TRIGGER endsync(rc)
end if

end event

event syncpreview;string	winobjecttype, cmdstring
if IsValid(i_syncwindow) = FALSE then
	if IsValid(this.windowobject) then
		winobjecttype = this.windowobject.ClassName()
		if winobjecttype = this.progresswindowname then
			i_syncwindow = this.windowobject
		end if
	end if
end if
if IsValid(i_syncwindow) then
	cmdstring = command_string
	i_syncwindow.event TRIGGER syncpreview(cmdstring)
end if
end event

