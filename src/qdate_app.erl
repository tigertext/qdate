% vim: ts=4 sw=4 et
% Copyright (c) 2013 Jesse Gumm
% See LICENSE for licensing information.

-module(qdate_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    Return = qdate_sup:start_link(),
    %% register a date format for 'YYYY-MM-DD HH-MiAM/PM'
    qdate:register_format(tt_date_format, "d/m/Y h:ia"),
    Return.

stop(_State) ->
    ok.
