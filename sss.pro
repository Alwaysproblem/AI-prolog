is_con(L1, L2) :- 
        \+is_list(L1),
        \+is_list(L2),
        X is (L2 - L1),
        abs_c(X, D),
        D =< 2.

abs_c(A, B):-
    A<0, B is 0 - A.

abs_c(A, A) :-
    A > 0.

pd([], []).

pd([H|T], R) :- 
    pd(T, N),
    connect(H, N, R).

connect(H, [], [H]) :- !.

connect(H, [S], R) :- \+is_list(S), \+is_con(H, S), R = [H,S].

% connect(H, N, R):-
%     [D|E] = N,
%     E \= [],
%     is_list(D),
%     [A|B] = D,
%     is_con(H, A),
%     R = [[H|B]|E].

% connect(H, N, R):-
%     [D|E] = N,
%     E \= [],
%     is_list(D),
%     [A|B] = D,
%     \+is_con(H, A),
%     R = [H|N].

% connect(H, N, R):-
%     [D|E] = N,
%     E \= [],
%     \+is_list(D),
%     A = D,
%     B = E,
%     is_con(H, A),
%     R = [[H, A]|B].

% connect(H, N, R):-
%     [D|E] = N,
%     E \= [],
%     \+is_list(D),
%     A = D,
%     B = E,
%     \+is_con(H, A),
%     R = [H|N].

connect(H, N, R):-
    [D|E] = N,
    (
        is_list(D) -> 
            [A|B] = D, 
            (
                is_con(H, A) -> 
                R = [[H|B]|E]; 
                R = [H|N]
            );
            A = D,
            B = E,
            (
                is_con(H, A) -> 
                R = [[H, A]|B];
                R = [H|N]
            )
    ).




