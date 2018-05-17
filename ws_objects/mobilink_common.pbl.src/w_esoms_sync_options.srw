$PBExportHeader$w_esoms_sync_options.srw
forward
global type w_esoms_sync_options from window
end type
type cb_cancel from commandbutton within w_esoms_sync_options
end type
type cb_ok from commandbutton within w_esoms_sync_options
end type
type tab_1 from tab within w_esoms_sync_options
end type
type tabpage_subscribe from userobject within tab_1
end type
type st_authparms from statictext within tabpage_subscribe
end type
type sle_authparms from singlelineedit within tabpage_subscribe
end type
type st_1 from statictext within tabpage_subscribe
end type
type sle_pub from singlelineedit within tabpage_subscribe
end type
type st_pub from statictext within tabpage_subscribe
end type
type sle_mlpass from singlelineedit within tabpage_subscribe
end type
type st_mlpass from statictext within tabpage_subscribe
end type
type sle_mluser from singlelineedit within tabpage_subscribe
end type
type st_mluser from statictext within tabpage_subscribe
end type
type tabpage_subscribe from userobject within tab_1
st_authparms st_authparms
sle_authparms sle_authparms
st_1 st_1
sle_pub sle_pub
st_pub st_pub
sle_mlpass sle_mlpass
st_mlpass st_mlpass
sle_mluser sle_mluser
st_mluser st_mluser
end type
type tabpage_asa from userobject within tab_1
end type
type st_3 from statictext within tabpage_asa
end type
type sle_encrypt from singlelineedit within tabpage_asa
end type
type sle_dbpass from singlelineedit within tabpage_asa
end type
type sle_dbuser from singlelineedit within tabpage_asa
end type
type st_encrypt from statictext within tabpage_asa
end type
type st_dbpass from statictext within tabpage_asa
end type
type st_dbuser from statictext within tabpage_asa
end type
type st_2 from statictext within tabpage_asa
end type
type sle_dsn from singlelineedit within tabpage_asa
end type
type tabpage_asa from userobject within tab_1
st_3 st_3
sle_encrypt sle_encrypt
sle_dbpass sle_dbpass
sle_dbuser sle_dbuser
st_encrypt st_encrypt
st_dbpass st_dbpass
st_dbuser st_dbuser
st_2 st_2
sle_dsn sle_dsn
end type
type tabpage_mlserver from userobject within tab_1
end type
type ddlb_phases from dropdownlistbox within tabpage_mlserver
end type
type st_4 from statictext within tabpage_mlserver
end type
type st_mlserve from statictext within tabpage_mlserver
end type
type sle_port from singlelineedit within tabpage_mlserver
end type
type sle_host from singlelineedit within tabpage_mlserver
end type
type st_port from statictext within tabpage_mlserver
end type
type st_host from statictext within tabpage_mlserver
end type
type tabpage_mlserver from userobject within tab_1
ddlb_phases ddlb_phases
st_4 st_4
st_mlserve st_mlserve
sle_port sle_port
sle_host sle_host
st_port st_port
st_host st_host
end type
type tabpage_runtime from userobject within tab_1
end type
type cb_helpext from commandbutton within tabpage_runtime
end type
type cb_helpopt from commandbutton within tabpage_runtime
end type
type sle_logfile from singlelineedit within tabpage_runtime
end type
type st_logfile from statictext within tabpage_runtime
end type
type cbx_uselogfile from checkbox within tabpage_runtime
end type
type rb_nowin from radiobutton within tabpage_runtime
end type
type rb_appwin from radiobutton within tabpage_runtime
end type
type sle_additional from singlelineedit within tabpage_runtime
end type
type st_additional from statictext within tabpage_runtime
end type
type sle_extended from singlelineedit within tabpage_runtime
end type
type sle_logging from singlelineedit within tabpage_runtime
end type
type st_extended from statictext within tabpage_runtime
end type
type st_logging from statictext within tabpage_runtime
end type
type gb_1 from groupbox within tabpage_runtime
end type
type tabpage_runtime from userobject within tab_1
cb_helpext cb_helpext
cb_helpopt cb_helpopt
sle_logfile sle_logfile
st_logfile st_logfile
cbx_uselogfile cbx_uselogfile
rb_nowin rb_nowin
rb_appwin rb_appwin
sle_additional sle_additional
st_additional st_additional
sle_extended sle_extended
sle_logging sle_logging
st_extended st_extended
st_logging st_logging
gb_1 gb_1
end type
type tab_1 from tab within w_esoms_sync_options
tabpage_subscribe tabpage_subscribe
tabpage_asa tabpage_asa
tabpage_mlserver tabpage_mlserver
tabpage_runtime tabpage_runtime
end type
end forward

global type w_esoms_sync_options from window
integer width = 2382
integer height = 1468
boolean titlebar = true
string title = "MobiLink Synchronization Properties"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event type boolean ue_postopen ( )
cb_cancel cb_cancel
cb_ok cb_ok
tab_1 tab_1
end type
global w_esoms_sync_options w_esoms_sync_options

type variables
string		iApp_RegPath
mlsync		i_uosync
string		is_quiet
boolean		ib_SaveSub, ib_SaveServer, ib_SaveRun, ib_SaveASA
SyncParm	i_parms

end variables

forward prototypes
public function long wf_trysaving ()
public function long wf_savesettings (ref string as_errmsg)
end prototypes

event type boolean ue_postopen();tab_1.tabpage_subscribe.sle_pub.text = i_uosync.publication
tab_1.tabpage_subscribe.sle_mluser.text = i_uosync.mluser
tab_1.tabpage_subscribe.sle_mlpass.text = i_uosync.mlpass
tab_1.tabpage_subscribe.sle_authparms.text = i_uosync.authenticateparms
tab_1.tabpage_asa.sle_dsn.text = i_uosync.datasource
tab_1.tabpage_asa.sle_dbuser.text = i_uosync.dbuser
tab_1.tabpage_asa.sle_dbpass.text = i_uosync.dbpass
tab_1.tabpage_asa.sle_encrypt.text = i_uosync.encryptionkey
tab_1.tabpage_mlserver.sle_host.text = i_uosync.host
tab_1.tabpage_mlserver.sle_port.text = i_uosync.port
tab_1.tabpage_runtime.sle_additional.text = i_uosync.additionalopts
tab_1.tabpage_runtime.sle_extended.text = i_uosync.extendedopts
tab_1.tabpage_runtime.sle_logging.text = i_uosync.logopts
tab_1.tabpage_runtime.cbx_uselogfile.checked = i_uosync.uselogfile
tab_1.tabpage_runtime.sle_logfile.text = i_uosync.logfilename
tab_1.tabpage_runtime.sle_logfile.enabled = tab_1.tabpage_runtime.cbx_uselogfile.checked

if i_uosync.processoption = uploadonly! then
		tab_1.tabpage_mlserver.ddlb_phases.SelectItem(3)
elseif i_uosync.processoption = downloadonly! then	
	tab_1.tabpage_mlserver.ddlb_phases.SelectItem(2)
else
	tab_1.tabpage_mlserver.ddlb_phases.SelectItem(1)
end if
if i_uosync.usewindow then
	tab_1.tabpage_runtime.rb_appwin.checked = TRUE
else
	tab_1.tabpage_runtime.rb_nowin.checked = TRUE
	if i_uosync.progresswindowname = "" then
		tab_1.tabpage_runtime.gb_1.visible = FALSE		
		tab_1.tabpage_runtime.rb_appwin.visible = FALSE
		tab_1.tabpage_runtime.rb_nowin.visible = FALSE		
	end if
end if
ib_SaveSub  = FALSE
ib_SaveServer = FALSE
ib_SaveASA = FALSE
ib_SaveRun  = FALSE
return TRUE
end event

public function long wf_trysaving ();long  	lRC
string   errmsg 

lRC = 1
if ib_SaveSub or ib_SaveRun or ib_SaveServer or ib_SaveASA then
	lRC =	wf_SaveSettings(errmsg)		
	if lRC = -1 then
		messagebox("Registry error", errmsg)
	end if
end if
return lRC

end function

public function long wf_savesettings (ref string as_errmsg);long	lRC

lRC = 1
i_uosync.publication = tab_1.tabpage_subscribe.sle_pub.text
i_uosync.mluser = tab_1.tabpage_subscribe.sle_mluser.text
i_uosync.mlpass = tab_1.tabpage_subscribe.sle_mlpass.text
i_uosync.authenticateparms = tab_1.tabpage_subscribe.sle_authparms.text
i_uosync.datasource = tab_1.tabpage_asa.sle_dsn.text
i_uosync.dbuser = tab_1.tabpage_asa.sle_dbuser.text
i_uosync.dbpass = tab_1.tabpage_asa.sle_dbpass.text
i_uosync.encryptionkey = tab_1.tabpage_asa.sle_encrypt.text
i_uosync.host = tab_1.tabpage_mlserver.sle_host.text
i_uosync.port = tab_1.tabpage_mlserver.sle_port.text
i_uosync.additionalopts = tab_1.tabpage_runtime.sle_additional.text
i_uosync.extendedopts = tab_1.tabpage_runtime.sle_extended.text
i_uosync.logopts = tab_1.tabpage_runtime.sle_logging.text
i_uosync.logfilename = tab_1.tabpage_runtime.sle_logfile.text
i_uosync.uselogfile = tab_1.tabpage_runtime.cbx_uselogfile.checked
i_uosync.UseWindow = tab_1.tabpage_runtime.rb_appwin.checked
if tab_1.tabpage_mlserver.ddlb_phases.text = "DownloadOnly!" then
	i_uosync.processoption = downloadonly!
elseif tab_1.tabpage_mlserver.ddlb_phases.text = "UploadOnly!" then
	i_uosync.processoption = uploadonly!
else
	i_uosync.processoption = bidirectional!
end if


if i_uosync.ObjectRevision > 0 and i_uosync.SyncRegistryKey <> "" then
	lRc = i_uosync.SetSyncRegistryProperties()
end if
return lRC
end function

on w_esoms_sync_options.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.tab_1=create tab_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.tab_1}
end on

on w_esoms_sync_options.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.tab_1)
end on

event open;string   errCaption = "Usage Error"
string   badparm = "When invoking this window, use OpenWithParm and pass an instance" + &
	"of MLSync."

if IsValid(message.powerobjectparm) and &
	message.powerobjectparm.TypeOf() = MLSync! then
	i_uosync = message.powerobjectparm
	this.event POST ue_postopen()
else
		messagebox(errCaption, badparm)	
		cb_ok.enabled = FALSE	
end if
end event

event close;wf_trysaving()

end event

type cb_cancel from commandbutton within w_esoms_sync_options
integer x = 1390
integer y = 1184
integer width = 329
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancel"
end type

event clicked;//  returncode 100 indicates that the user hit CANCEL
ib_SaveSub    = FALSE
ib_SaveServer = FALSE
ib_SaveRun    = FALSE
ib_SaveASA    = FALSE

i_parms.returncode = 100
closeWithReturn(parent, i_parms)


end event

type cb_ok from commandbutton within w_esoms_sync_options
integer x = 658
integer y = 1184
integer width = 329
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;//  This response window passes back the MobiLink user name
//  and password in the i_parms structure.  Also a return code
//  of zero to indicate that the user hit OK.
//
i_parms.mluser = tab_1.tabpage_subscribe.sle_mluser.text
i_parms.mlpass = tab_1.tabpage_subscribe.sle_mlpass.text
i_parms.authenticateparms = tab_1.tabpage_subscribe.sle_authparms.text
i_parms.dbuser = tab_1.tabpage_asa.sle_dbuser.text
i_parms.dbpass = tab_1.tabpage_asa.sle_dbpass.text
i_parms.encryptionkey = tab_1.tabpage_asa.sle_encrypt.text
i_parms.returncode = 0
closeWithReturn(parent, i_parms)

end event

type tab_1 from tab within w_esoms_sync_options
integer width = 2304
integer height = 1152
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean pictureonright = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_subscribe tabpage_subscribe
tabpage_asa tabpage_asa
tabpage_mlserver tabpage_mlserver
tabpage_runtime tabpage_runtime
end type

on tab_1.create
this.tabpage_subscribe=create tabpage_subscribe
this.tabpage_asa=create tabpage_asa
this.tabpage_mlserver=create tabpage_mlserver
this.tabpage_runtime=create tabpage_runtime
this.Control[]={this.tabpage_subscribe,&
this.tabpage_asa,&
this.tabpage_mlserver,&
this.tabpage_runtime}
end on

on tab_1.destroy
destroy(this.tabpage_subscribe)
destroy(this.tabpage_asa)
destroy(this.tabpage_mlserver)
destroy(this.tabpage_runtime)
end on

type tabpage_subscribe from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2267
integer height = 1032
long backcolor = 67108864
string text = "Subscriptions"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_authparms st_authparms
sle_authparms sle_authparms
st_1 st_1
sle_pub sle_pub
st_pub st_pub
sle_mlpass sle_mlpass
st_mlpass st_mlpass
sle_mluser sle_mluser
st_mluser st_mluser
end type

on tabpage_subscribe.create
this.st_authparms=create st_authparms
this.sle_authparms=create sle_authparms
this.st_1=create st_1
this.sle_pub=create sle_pub
this.st_pub=create st_pub
this.sle_mlpass=create sle_mlpass
this.st_mlpass=create st_mlpass
this.sle_mluser=create sle_mluser
this.st_mluser=create st_mluser
this.Control[]={this.st_authparms,&
this.sle_authparms,&
this.st_1,&
this.sle_pub,&
this.st_pub,&
this.sle_mlpass,&
this.st_mlpass,&
this.sle_mluser,&
this.st_mluser}
end on

on tabpage_subscribe.destroy
destroy(this.st_authparms)
destroy(this.sle_authparms)
destroy(this.st_1)
destroy(this.sle_pub)
destroy(this.st_pub)
destroy(this.sle_mlpass)
destroy(this.st_mlpass)
destroy(this.sle_mluser)
destroy(this.st_mluser)
end on

type st_authparms from statictext within tabpage_subscribe
integer x = 37
integer y = 784
integer width = 302
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Authenticate Parms:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_authparms from singlelineedit within tabpage_subscribe
integer x = 421
integer y = 784
integer width = 1682
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveSub = TRUE
end event

type st_1 from statictext within tabpage_subscribe
integer x = 55
integer y = 48
integer width = 2048
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "These values will be used to generate command line arguments for the MobiLink client."
boolean focusrectangle = false
end type

type sle_pub from singlelineedit within tabpage_subscribe
integer x = 421
integer y = 208
integer width = 1682
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveSub = TRUE

end event

type st_pub from statictext within tabpage_subscribe
integer x = 18
integer y = 224
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Publication(s):"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_mlpass from singlelineedit within tabpage_subscribe
integer x = 421
integer y = 592
integer width = 1682
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveSub = TRUE

end event

type st_mlpass from statictext within tabpage_subscribe
integer x = 18
integer y = 612
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "MLPassword:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_mluser from singlelineedit within tabpage_subscribe
integer x = 421
integer y = 400
integer width = 1682
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveSub = TRUE

end event

type st_mluser from statictext within tabpage_subscribe
integer x = 18
integer y = 416
integer width = 329
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "MLUser:"
alignment alignment = right!
boolean focusrectangle = false
end type

type tabpage_asa from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 2267
integer height = 1032
long backcolor = 67108864
string text = "SQL Anywhere"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_3 st_3
sle_encrypt sle_encrypt
sle_dbpass sle_dbpass
sle_dbuser sle_dbuser
st_encrypt st_encrypt
st_dbpass st_dbpass
st_dbuser st_dbuser
st_2 st_2
sle_dsn sle_dsn
end type

on tabpage_asa.create
this.st_3=create st_3
this.sle_encrypt=create sle_encrypt
this.sle_dbpass=create sle_dbpass
this.sle_dbuser=create sle_dbuser
this.st_encrypt=create st_encrypt
this.st_dbpass=create st_dbpass
this.st_dbuser=create st_dbuser
this.st_2=create st_2
this.sle_dsn=create sle_dsn
this.Control[]={this.st_3,&
this.sle_encrypt,&
this.sle_dbpass,&
this.sle_dbuser,&
this.st_encrypt,&
this.st_dbpass,&
this.st_dbuser,&
this.st_2,&
this.sle_dsn}
end on

on tabpage_asa.destroy
destroy(this.st_3)
destroy(this.sle_encrypt)
destroy(this.sle_dbpass)
destroy(this.sle_dbuser)
destroy(this.st_encrypt)
destroy(this.st_dbpass)
destroy(this.st_dbuser)
destroy(this.st_2)
destroy(this.sle_dsn)
end on

type st_3 from statictext within tabpage_asa
integer x = 128
integer y = 48
integer width = 2011
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Values to connect to the remote SQL Anywhere database"
boolean focusrectangle = false
end type

type sle_encrypt from singlelineedit within tabpage_asa
integer x = 384
integer y = 784
integer width = 1719
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveASA = TRUE
end event

type sle_dbpass from singlelineedit within tabpage_asa
integer x = 384
integer y = 592
integer width = 1719
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveASA = TRUE
end event

type sle_dbuser from singlelineedit within tabpage_asa
integer x = 384
integer y = 396
integer width = 1719
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveASA = TRUE
end event

type st_encrypt from statictext within tabpage_asa
integer x = 18
integer y = 792
integer width = 261
integer height = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Encryption Key:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_dbpass from statictext within tabpage_asa
integer x = 18
integer y = 624
integer width = 261
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBPass:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_dbuser from statictext within tabpage_asa
integer x = 18
integer y = 432
integer width = 261
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DBUser:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_asa
integer x = 18
integer y = 244
integer width = 261
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DSN:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_dsn from singlelineedit within tabpage_asa
integer x = 384
integer y = 220
integer width = 1719
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveASA = TRUE
end event

type tabpage_mlserver from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2267
integer height = 1032
long backcolor = 67108864
string text = "ML Server"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ddlb_phases ddlb_phases
st_4 st_4
st_mlserve st_mlserve
sle_port sle_port
sle_host sle_host
st_port st_port
st_host st_host
end type

on tabpage_mlserver.create
this.ddlb_phases=create ddlb_phases
this.st_4=create st_4
this.st_mlserve=create st_mlserve
this.sle_port=create sle_port
this.sle_host=create sle_host
this.st_port=create st_port
this.st_host=create st_host
this.Control[]={this.ddlb_phases,&
this.st_4,&
this.st_mlserve,&
this.sle_port,&
this.sle_host,&
this.st_port,&
this.st_host}
end on

on tabpage_mlserver.destroy
destroy(this.ddlb_phases)
destroy(this.st_4)
destroy(this.st_mlserve)
destroy(this.sle_port)
destroy(this.sle_host)
destroy(this.st_port)
destroy(this.st_host)
end on

type ddlb_phases from dropdownlistbox within tabpage_mlserver
integer x = 201
integer y = 588
integer width = 841
integer height = 288
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Bidirectional!","DownloadOnly!","UploadOnly!"}
borderstyle borderstyle = StyleLowered!
end type

event selectionchanged;ib_SaveServer = TRUE
end event

type st_4 from statictext within tabpage_mlserver
integer x = 55
integer y = 496
integer width = 2048
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choose which MobiLink processing phases you wish to perform."
boolean focusrectangle = false
end type

type st_mlserve from statictext within tabpage_mlserver
integer x = 55
integer y = 48
integer width = 2048
integer height = 128
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "These settings will override the default host and port associated with each subscription.  "
boolean focusrectangle = false
end type

type sle_port from singlelineedit within tabpage_mlserver
integer x = 201
integer y = 336
integer width = 1792
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveServer = TRUE
end event

type sle_host from singlelineedit within tabpage_mlserver
integer x = 201
integer y = 176
integer width = 1792
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveServer = TRUE
end event

type st_port from statictext within tabpage_mlserver
integer x = 55
integer y = 368
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Port"
boolean focusrectangle = false
end type

type st_host from statictext within tabpage_mlserver
integer x = 55
integer y = 208
integer width = 151
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Host"
boolean focusrectangle = false
end type

type tabpage_runtime from userobject within tab_1
integer x = 18
integer y = 16
integer width = 2267
integer height = 1032
long backcolor = 67108864
string text = "Settings"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_helpext cb_helpext
cb_helpopt cb_helpopt
sle_logfile sle_logfile
st_logfile st_logfile
cbx_uselogfile cbx_uselogfile
rb_nowin rb_nowin
rb_appwin rb_appwin
sle_additional sle_additional
st_additional st_additional
sle_extended sle_extended
sle_logging sle_logging
st_extended st_extended
st_logging st_logging
gb_1 gb_1
end type

on tabpage_runtime.create
this.cb_helpext=create cb_helpext
this.cb_helpopt=create cb_helpopt
this.sle_logfile=create sle_logfile
this.st_logfile=create st_logfile
this.cbx_uselogfile=create cbx_uselogfile
this.rb_nowin=create rb_nowin
this.rb_appwin=create rb_appwin
this.sle_additional=create sle_additional
this.st_additional=create st_additional
this.sle_extended=create sle_extended
this.sle_logging=create sle_logging
this.st_extended=create st_extended
this.st_logging=create st_logging
this.gb_1=create gb_1
this.Control[]={this.cb_helpext,&
this.cb_helpopt,&
this.sle_logfile,&
this.st_logfile,&
this.cbx_uselogfile,&
this.rb_nowin,&
this.rb_appwin,&
this.sle_additional,&
this.st_additional,&
this.sle_extended,&
this.sle_logging,&
this.st_extended,&
this.st_logging,&
this.gb_1}
end on

on tabpage_runtime.destroy
destroy(this.cb_helpext)
destroy(this.cb_helpopt)
destroy(this.sle_logfile)
destroy(this.st_logfile)
destroy(this.cbx_uselogfile)
destroy(this.rb_nowin)
destroy(this.rb_appwin)
destroy(this.sle_additional)
destroy(this.st_additional)
destroy(this.sle_extended)
destroy(this.sle_logging)
destroy(this.st_extended)
destroy(this.st_logging)
destroy(this.gb_1)
end on

type cb_helpext from commandbutton within tabpage_runtime
integer x = 2098
integer y = 592
integer width = 82
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "?"
end type

event clicked;string		sCmd
sCmd = i_uosync.GetDbmlsyncPath()
if len(sCmd) > 0 then
	sCmd += ' -l'
	run(sCmd, NORMAL!)
end if
end event

type cb_helpopt from commandbutton within tabpage_runtime
integer x = 2098
integer y = 424
integer width = 82
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "?"
end type

event clicked;string		sCmd

sCmd = i_uosync.GetDbmlsyncPath()
if len(sCmd) > 0 then
	sCmd += " ?"
	run(sCmd, Normal!)
end if
end event

type sle_logfile from singlelineedit within tabpage_runtime
integer x = 302
integer y = 124
integer width = 1751
integer height = 96
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveRun = TRUE
end event

type st_logfile from statictext within tabpage_runtime
integer x = 18
integer y = 160
integer width = 251
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Log File:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_uselogfile from checkbox within tabpage_runtime
integer x = 73
integer y = 16
integer width = 494
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Use Log File"
end type

event clicked;ib_SaveRun = TRUE
tab_1.tabpage_runtime.sle_logfile.enabled = this.checked
end event

type rb_nowin from radiobutton within tabpage_runtime
integer x = 311
integer y = 884
integer width = 850
integer height = 80
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Do not display"
end type

event clicked;ib_SaveRun = TRUE
end event

type rb_appwin from radiobutton within tabpage_runtime
integer x = 311
integer y = 792
integer width = 974
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Display if available"
end type

event clicked;ib_SaveRun = TRUE
end event

type sle_additional from singlelineedit within tabpage_runtime
integer x = 302
integer y = 424
integer width = 1751
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveRun = TRUE
end event

type st_additional from statictext within tabpage_runtime
integer x = 18
integer y = 444
integer width = 251
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Additional:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_extended from singlelineedit within tabpage_runtime
integer x = 302
integer y = 592
integer width = 1751
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveRun = TRUE
end event

type sle_logging from singlelineedit within tabpage_runtime
integer x = 302
integer y = 260
integer width = 1751
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_SaveRun = TRUE
end event

type st_extended from statictext within tabpage_runtime
integer x = 18
integer y = 616
integer width = 251
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Extended:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_logging from statictext within tabpage_runtime
integer x = 18
integer y = 292
integer width = 251
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logging:"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within tabpage_runtime
integer x = 55
integer y = 720
integer width = 2121
integer height = 288
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Progress Window"
end type

