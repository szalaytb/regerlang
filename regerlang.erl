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
	   Button_convert = wxButton:new(F, ?wxID_ANY, [{label, "Convert"}, {pos, {900,60}}, {size, {150,50}}]),
     wxStaticText:new(F, ?wxID_ANY, "Link the file you wish to scan", [{pos, {100,60}}]),
	   wxStaticText:new(F, ?wxID_ANY, "Convert ASCII code to octal", [{pos, {400,60}}]),
     wxStaticText:new(F, ?wxID_ANY, "Type here your regular expression", [{pos, {160,140}}]),
			_ASCII = wxTextCtrl:new(F,
				?wxID_ANY,
				[{pos, {600,60}},{size, {100, 25}}
				]),
			_OCTAL = wxTextCtrl:new(F,
				?wxID_ANY,
				[{pos, {750,60}},{size, {100, 25}}
				]),
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

	wxButton:connect(Button_convert, command_button_clicked, [{callback,
		fun(Evt,Obj) ->
			{_,_} = {Evt,Obj},
			Number = list_to_integer(wxTextCtrl:getValue(_ASCII)),
			if Number < 8 -> Result = Number, wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 256 -> Result = [38,(Number-256) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 248 -> Result = [37,(Number-248) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 240 -> Result = [36,(Number-240) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 232 -> Result = [35,(Number-232) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 224 -> Result = [34,(Number-224) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 216 -> Result = [33,(Number-216) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 208 -> Result = [32,(Number-208) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 200 -> Result = [31,(Number-200) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 192 -> Result = [30,(Number-192) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 184 -> Result = [27,(Number-184) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 176 -> Result = [26,(Number-176) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 168 -> Result = [25,(Number-168) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 160 -> Result = [24,(Number-160) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 152 -> Result = [23,(Number-152) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 144 -> Result = [22,(Number-144) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 136 -> Result = [21,(Number-136) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 128 -> Result = [20,(Number-128) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 120 -> Result = [17,(Number-120) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 112 -> Result = [16,(Number-112) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 104 -> Result = [15,(Number-104) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 96 -> Result = [14,(Number-96) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 88 -> Result = [13,(Number-88) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 80 -> Result = [12,(Number-80) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 72 -> Result = [11,(Number-72) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 64 -> Result = [10,(Number-64) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 56 -> Result = [7,(Number-56) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 48 -> Result = [6,(Number-48) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 40 -> Result = [5,(Number-40) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 32 -> Result = [4,(Number-32) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 24 -> Result = [3,(Number-24) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 16 -> Result = [2,(Number-16) rem 8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])));
			Number >= 8 -> Result = [1,Number-8], wxTextCtrl:writeText(_OCTAL, lists:flatten(io_lib:format("~p",[Result])))
			end
		end
		}]),

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

