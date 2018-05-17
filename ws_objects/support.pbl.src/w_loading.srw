$PBExportHeader$w_loading.srw
forward
global type w_loading from window
end type
type lb_1 from listbox within w_loading
end type
type st_loading from statictext within w_loading
end type
type p_logo from picture within w_loading
end type
type mle_about from multilineedit within w_loading
end type
type ddlb_temp from dropdownlistbox within w_loading
end type
end forward

global type w_loading from window
integer width = 1463
integer height = 2080
boolean titlebar = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean contexthelp = true
lb_1 lb_1
st_loading st_loading
p_logo p_logo
mle_about mle_about
ddlb_temp ddlb_temp
end type
global w_loading w_loading

on w_loading.create
this.lb_1=create lb_1
this.st_loading=create st_loading
this.p_logo=create p_logo
this.mle_about=create mle_about
this.ddlb_temp=create ddlb_temp
this.Control[]={this.lb_1,&
this.st_loading,&
this.p_logo,&
this.mle_about,&
this.ddlb_temp}
end on

on w_loading.destroy
destroy(this.lb_1)
destroy(this.st_loading)
destroy(this.p_logo)
destroy(this.mle_about)
destroy(this.ddlb_temp)
end on

event open;//guo_window.uf_Resize(w_loading)
////guo_window.Post uf_Reposition(This)

This.Title = gs_Window_Title
st_loading.Text = f_DW_Language_Call_2('Loading ...')

end event

event close;gl_X = This.X
gl_Y = This.Y

end event

event deactivate;gl_X = This.X
gl_Y = This.Y

end event

event activate;This.X = gl_X
This.Y = gl_Y

end event

type lb_1 from listbox within w_loading
boolean visible = false
integer x = 494
integer y = 520
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_loading from statictext within w_loading
integer x = 55
integer y = 744
integer width = 1454
integer height = 320
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Loading ..."
alignment alignment = center!
boolean focusrectangle = false
end type

type p_logo from picture within w_loading
integer x = 247
integer y = 120
integer width = 965
integer height = 392
string picturename = "bitmaps\LogoCE.gif"
boolean focusrectangle = false
end type

type mle_about from multilineedit within w_loading
integer y = 712
integer width = 1454
integer height = 536
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean border = false
alignment alignment = center!
boolean displayonly = true
end type

type ddlb_temp from dropdownlistbox within w_loading
integer x = 311
integer y = 208
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

