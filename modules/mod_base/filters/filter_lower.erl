%% @author Marc Worrell <marc@worrell.nl>
%% @copyright 2010 Marc Worrell
%% @doc 'lower' filter, translate to lowercase

%% Copyright 2010 Marc Worrell
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%%     http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(filter_lower).
-export([lower/2]).


lower(undefined, _Context) ->
    undefined;
lower(Input, _Context) when is_list(Input) or is_binary(Input) ->
    try
        z_string:to_lower(Input)
    catch
        _:_ ->
            z_string:to_lower(z_string:sanitize_utf8(Input))
    end;
lower(Input, Context) ->
    lower(erlydtl_runtime:to_list(Input, Context), Context).



