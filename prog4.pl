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


% Ch 22, ex 2
%maxlist(List, Max) -- List will have at least one value in it. -- hint, you may need an additional predicate.
% Base case, one item in list
maxlist([Max], Max).
% If head is greater than max
maxlist([Head | Tail], Max) :-
    maxlist(Tail, MaxTail),
    Head >= MaxTail,
    Max = Head.
% If head is not greater
maxlist([Head | Tail], Max) :-
    maxlist(Tail, Max),
    Max > Head.



%ordered(List) 
% Base case, singleton list
ordered([_]).
% Get first two elements, compare, then pass recursively 
ordered([First, Second | Tail]) :-
    First >= Second,
    ordered([Second | Tail]).


% Ch 22, ex 6
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

force_memberships([[_, A2, A3], [_, B2, B3], [_, C2, C3], [_, D2, D3], [_, E2, E3]]) :-
    locations(Locations),
    vacation_modes(VacationModes),
    member(A2, Locations), 
    member(B2, Locations), 
    member(C2, Locations), 
    member(D2, Locations), 
    member(E2, Locations), 
    member(A3, VacationModes),
    member(B3, VacationModes),
    member(C3, VacationModes),
    member(D3, VacationModes),
    member(E3, VacationModes).

force_differences([[_, A2, A3], [_, B2, B3], [_, C2, C3], [_, D2, D3], [_, E2, E3]]) :-
    A2\=B2,
    A2\=C2,
    A2\=D2,
    A2\=E2,
    B2\=C2,
    B2\=D2,
    B2\=E2,
    C2\=D2,
    C2\=E2,
    D2\=E2,
    A3\=B3,
    A3\=C3,
    A3\=D3,
    A3\=E3,
    B3\=C3,
    B3\=D3,
    B3\=E3,
    C3\=D3,
    C3\=E3,
    D3\=E3.

%add predicates for the logic puzzle
%HINTS:
% \= always fails if either argument is not yet bound to a value
% =:= requires that both sides be bound to values
% location(Locations),member(Loc1,Locations)   will force Loc1 to be one of the values from the list in the locations fact.

/*Jones no visit Alaska, Jones no travel in
Camper or Van. 
Couple who went to YLWSTN no travel in Camper or Van*/
hint1(AnswerList) :-
    locations(Locations),
    vacation_modes(VacationModes),
    member([jones, JonesLocation, JonesMode], AnswerList),
    member(JonesLocation, Locations),
    JonesLocation \= alaska,
    member(JonesMode, VacationModes),
    JonesMode \= pickup_camper,
    JonesMode \= van,
    member([YstoneCoup, yellowstone, YstoneCoupMode], AnswerList),
    YstoneCoup \= jones,
    member(YstoneCoupMode, VacationModes),
    YstoneCoupMode \= pickup_camper,
    YstoneCoupMode \= van.

/*Camper couple no visit Alaska
  Van couple no visit Alaska*/
hint2(AnswerList) :-
    locations(Locations),
    member([_, CamperLocation, pickup_camper], AnswerList),
    member(CamperLocation, Locations),
    CamperLocation \= alaska,
    member([_, VanLocation, van], AnswerList),
    member(VanLocation, Locations),
    VanLocation \= alaska.

/*Aldrich no Oregon, no camper*/
hint3(AnswerList) :-
    locations(Locations),
    vacation_modes(VacationModes),
    member([aldrich, AldrichLocation, AldrichMode], AnswerList),
    member(AldrichLocation, Locations),
    AldrichLocation \= oregon,
    member(AldrichMode, VacationModes),
    AldrichMode \= pickup_camper.

/*Van couple no visit NE*/
hint4(AnswerList) :-
    locations(Locations),
    member([_, VanLocation, van], AnswerList),
    member(VanLocation, Locations),
    VanLocation \= new_england.


/*Camper couple no visit Oregon*/
hint5(AnswerList) :-
    locations(Locations),
    member([_, CamperLocation, pickup_camper], AnswerList),
    member(CamperLocation, Locations),
    CamperLocation \= oregon.

/*Johnsons no Backpack
Johnsons no Van or Camper, no Alaska*/
hint6(AnswerList) :-
    locations(Locations),
    vacation_modes(VacationModes),
    member([johnson, JohnsonLocation, JohnsonMode], AnswerList),
    member(JohnsonLocation, Locations),
    JohnsonLocation \= alaska,
    member(JohnsonMode, VacationModes),
    JohnsonMode \= van,
    JohnsonMode \= pickup_camper,
    JohnsonMode \= backpacking.

/*Wilsons no Van or Camper*/
hint7(AnswerList) :-
    vacation_modes(VacationModes),
    member([wilson, _, WilsonMode], AnswerList),
    member(WilsonMode, VacationModes),
    WilsonMode \= van,
    WilsonMode \= pickup_camper.

/*Oregon couple no Cruise
  YStone couple no Cruise*/
hint8(AnswerList) :-
    vacation_modes(VacationModes),
    member([_, oregon, OregonMode], AnswerList),
    member([_, yellowstone, YstoneCoupMode], AnswerList),
    member(OregonMode, VacationModes),
    OregonMode \= cruise,
    member(YstoneCoupMode, VacationModes),
    YstoneCoupMode \= cruise.

/*Backpackers no Ystone*/
hint9(AnswerList) :-
    locations(Locations),
    member([_, BackpackLocation, backpacking], AnswerList),
    member(BackpackLocation, Locations),
    BackpackLocation \= yellowstone.

%solve_puzzle(AnswerList)
solve_puzzle(AnswerList) :-
    answer_form(AnswerList),
    hint1(AnswerList),
    hint2(AnswerList),
    hint3(AnswerList),
    hint4(AnswerList),
    hint5(AnswerList),
    hint6(AnswerList),
    hint7(AnswerList),
    hint8(AnswerList),
    hint9(AnswerList),
    force_memberships(AnswerList),
    force_differences(AnswerList).

%add your code after the call to answer_form (and before the period)