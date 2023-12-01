%program 4 for 327
% Grayson Newcomer and Aneel Gillan

%count_multiples(NumberList, Factor,Count)
% If head is a multiple
count_multiples([Head | Tail], Factor, Count) :-
    0 is Head mod Factor,
    count_multiples(Tail, Factor, RemainCount),
    Count is RemainCount + 1.

% Base case
count_multiples([], _, 0). 

% If head is not multiple
count_multiples([Head | Tail], Factor, Count) :- 
    not(0 is Head mod Factor),
    count_multiples(Tail, Factor, Count).

%count_multiples_tr(NumberList, Factor,Count)
count_multiples_tr(NumberList, Factor, Count) :- 
    count_multiples_tr(NumberList, Factor, Count, 0).

%count_multiples_tr(NumberList, Factor, Count, Total)
% Base case 
count_multiples_tr([], _, Total, Total).

% If a multiple
count_multiples_tr([Head | Tail], Factor, Count, Total) :-
    0 is Head mod Factor,
    NewTotal is Total + 1,
    count_multiples_tr(Tail, Factor, Count, NewTotal).

% If not a multiple
count_multiples_tr([Head | Tail], Factor, Count, Total) :-
    not(0 is Head mod Factor),
    count_multiples_tr(Tail, Factor, Count, Total).





%maxlist(List, Max) -- List will have at least one value in it. -- hint, you may need an additional predicate.


%ordered(List) 
% Base case, singleton list
ordered([_]).
% Get first two elements, compare, then pass recursively 
ordered([First, Second | Tail]) :-
    First >= Second,
    ordered([Second | Tail]).


%subsetsum(List,Sum,Subset)
% Base case, empty list
subsetsum([], 0, []).
% If Head could possibly be in subset
subsetsum([Head | Tail], Sum, [Head | Subset]) :-
    NewSum is Sum - Head,
    NewSum >= 0,   % Make sure NewSum is not negative
    subsetsum(Tail, NewSum, Subset).
% If Head could not be in subset
subsetsum([ _ | Tail], Sum, Subset) :-
    subsetsum(Tail, Sum, Subset).



locations([alaska, canada, new_england, oregon, yellowstone]).
vacation_modes([backpacking, camping, cruise, pickup_camper, van]).

%force the answer into the correct order and number of arguments
answer_form([[aldrich, _, _],  [harrison, _, _],  [johnson, _, _],  [jones, _, _],  [wilson, _, _]]).

%add predicates for the logic puzzle
%HINTS:
% \= always fails if either argument is not yet bound to a value
% =:= requires that both sides be bound to values
% location(Locations),member(Loc1,Locations)   will force Loc1 to be one of the values from the list in the locations fact.


%solve_puzzle(AnswerList)
solve_puzzle(AnswerList) :-
    answer_form(AnswerList).
%add your code after the call to answer_form (and before the period)
