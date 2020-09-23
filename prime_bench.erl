-module(bench).
-export([bench/0]).

%% 素数(false)の数をカウント
count_false(0, C, Flags) ->
    0;
count_false(Count, C, Flags) ->
    if
        element(C, Flags) -> count_false(Count - 1, C + 1, Flags);
        true -> 1 + count_false(Count - 1, C + 1, Flags)
    end.

%% n倍は素数でないので true で埋める
loops2(0, S, S2, Flags) ->
    Flags;
loops2(Count, S, S2, Flags) ->
    Flags2 = setelement(S2, Flags, true),
    loops2(Count - 1, S, S2 + S, Flags2).

%% S が素数かを判定
loops(0, S, Size, Flags) ->
    Flags;
loops(Count, S, Size, Flags) ->
    if
        not element(S, Flags) ->
            Flags2 = loops2(trunc((Size - S * 2 + 1) / S), S, S * 2, Flags),
            loops(Count - 1, S + 1, Size, Flags2);
        true ->
            loops(Count - 1, S + 1, Size, Flags)
    end.

%% Count 回繰り返す
loopc(0, Size, Flags) ->
    Flags;
loopc(Count, Size, Flags) ->
    Flags2 = erlang:make_tuple(Size, false),
    Flags3 = loops(Size - 2, 2, Size, Flags2),
    loopc(Count - 1, Size, Flags3).

prime_bench() ->
    Format = "~p~n",
    Size = 1000000,
    Count = 1,
    Flags = loopc(Count, Size, false),
    C = count_false(Size - 1, 2, Flags),
    io:format(Format, [C]).
    %io:format(Format, [Flags]).

bench() ->
    prime_bench(),
    init:stop() .

