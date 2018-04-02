is_con(L1, L2) :- 
        \+is_list(L1),
        \+is_list(L2),
        X is (L2 - L1),
        X < 2,
        X > 0.

connect(H, [], [H]) :- !.

connect(H, [S], R) :- \+is_list(S), \+is_con(H, S), R = [H,S], !.

connect(H, N, R):-
    [D|E] = N,
    % E \= [],
    is_list(D),
    [A|B] = D,
    is_con(H, A),
    R = [[H|B]|E].

connect(H, N, R):-
    [D|_] = N,
    % E \= [],
    is_list(D),
    [A|_] = D,
    \+is_con(H, A),
    R = [H|N].

connect(H, N, R):-
    [D|E] = N,
    % E \= [],
    \+is_list(D),
    A = D,
    B = E,
    is_con(H, A),
    R = [[H, A]|B].

connect(H, N, R):-
    [D|_] = N,
    % E \= [],
    \+is_list(D),
    A = D,
    % B = E,
    \+is_con(H, A),
    R = [H|N].


chop_up([], []).

chop_up([H|T], R) :- 
    chop_up(T, N),
    connect(H, N, R).






