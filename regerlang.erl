%% -*- coding: utf-8 -*-
%% @author Lilian
%% @doc @todo Add description to torso.


-module(regerlang).

-compile(export_all).

-include_lib("wx/include/wx.hrl").

-define(ABOUT,?wxID_ABOUT).

-define(EXIT,?wxID_EXIT).

main(_) ->
    start().
    
start() ->
     Wx=wx:new(),
     F=wxFrame:new(Wx, ?wxID_ANY, "Regerlang, parsing files with ease", [{size, {1100,600}}]),
     wxFrame:show(F),
     MenuBar = wxMenuBar:new(),
     Help = wxMenu:new(),
     Quit = wxMenu:new(),
     wxMenu:append(Help,?ABOUT,"About Regerlang"),
     wxMenu:append(Quit,?EXIT,"Quit Regerlang"),
     wxMenuBar:append(MenuBar,Help,"&Help"),
     wxMenuBar:append(MenuBar,Quit,"&Quit"),
     wxFrame:setMenuBar(F,MenuBar),
     wxFrame:createStatusBar(F),
     wxFrame:connect(F, command_menu_selected),
     io:fwrite("\n\nQuicly quit with command + Q on MacOS or alt + F4 on Windows and kill erlang with the corresponding command from linux terminal, for now...\n"),
     Button_regex = wxButton:new(F, ?wxID_ANY, [{label, "Regex to file"}, {pos,{0, 214}}, {size, {150, 50}}]),
     Button_file = wxButton:new(F, ?wxID_ANY, [{label, "ScanTheFile"}, {pos,{0, 314}}, {size, {150, 50}}]),
     Button_preview = wxButton:new(F, ?wxID_ANY, [{label, "Preview result"}, {pos, {0, 414}}, {size, {150,50}}]),
     wxStaticText:new(F, ?wxID_ANY, "Link the file you wish to scan", [{pos, {100,60}}]),
     wxStaticText:new(F, ?wxID_ANY, "Type here your regular expression", [{pos, {160,140}}]),
     EventText = wxTextCtrl:new(F, 
					  ?wxID_ANY, 
					  [{style, ?wxTE_MULTILINE},{pos, {160,160}},{size, {400, 200}}
					  ]),
     EventText2 = wxTextCtrl:new(F, 
					  ?wxID_ANY, 
					  [{style, ?wxTE_MULTILINE},{pos, {600,160}},{size, {400, 200}}
					  ]),
     Path = wxFilePickerCtrl:new(F,
					  ?wxID_ANY,
					  [{style, ?wxTE_MULTILINE},{pos, {100,80}}, {size, {100,50}}
					  ]),
	     
     wxButton:connect(Button_preview, command_button_clicked, [{callback,
	     fun(Evt, Obj) ->
			   {_,_} = {Evt, Obj},
			   {_, T} = file:read_file(wxFilePickerCtrl:getPath(Path)),
			   Result = re:run(T, wxTextCtrl:getValue(EventText),[global,{capture,all,list}]),
			   wxTextCtrl:writeText(EventText2, lists:flatten(io_lib:format("~p",[Result])))
			   end
	     }]),

    wxButton:connect(Button_regex, command_button_clicked, [{callback,
	     fun(Evt, Obj) ->
			   {_,_} = {Evt, Obj},
			   {_, T} = file:read_file(wxFilePickerCtrl:getPath(Path)),
			   Result = re:run(T, wxTextCtrl:getValue(EventText),[global,{capture,all,list}]),
			   file:write_file("erlangTest", io_lib:fwrite("~p.\n", [Result]))
			   %%wxTextCtrl:writeText(EventText2, T2)
			   end
	     }]),	     

     wxButton:connect(Button_file, command_button_clicked, [{callback,
	     fun(Evt, Obj) ->
			   {_,_} = {Evt, Obj},
			   {_, T} = file:read_file(wxFilePickerCtrl:getPath(Path)),
			   io:fwrite(T, [])
			   %%wxTextCtrl:writeText(EventText2, T)
			   end
	     }]),	     


     wxMenu:connect(Help, command_menu_selected, [{callback,
	     fun(Evt, Obj) ->
			   {_,_} = {Evt, Obj},
			       M = wxMessageDialog:new(F, "Regerlang is an erlang regular expression tester for files large and small made by Tibor Szalay."),
				    wxMessageDialog:showModal(M)
			   end
	     }]),

     wxMenu:connect(Quit, command_menu_selected, [{callback,
	     fun(Evt, Obj) ->
			   {_,_} = {Evt, Obj},
			       erlang:halt(0)
			   end
	     }]).
	     
%%     	 wxButton:connect(Button2, command_button_clicked, [{callback,
%%         fun(Evt, Obj) ->
%%			   {_,_} = {Evt, Obj}.
%%             end
%%         }]).

