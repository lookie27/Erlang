-module(practice).
-export([get_number_of_words/1]).
-export([count_to_ten/0]).
-export([print_status/1]).
-export([get_value/2]).
-export([total_price/1]).
-export([tik_tac_toe_winner/1]).

get_number_of_words([]) -> 0;
get_number_of_words([_|Rest]) -> 1 + get_number_of_words(Rest).

count_to_ten() -> count_to_ten(1).
count_to_ten(10) -> 1;
count_to_ten(N) -> 1 + count_to_ten(N + 1).

print_status({error, Message}) -> string:concat("error:", Message);
print_status(success) -> "success".


% practice:get_value([{erlang, "is a functional language"}, {scala, "is an OO language"}], erlang).
print_value([{_, Value} | _]) -> Value.
get_value(List, Key) -> print_value(lists:filter(fun({Name, _}) -> Name == Key end, List )).

% practice:total_price([{pencil, 5, 25}, {paper, 100, 10}]).
total_price(List) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- List].

% [A, B, C, D, E, F, G, H, I]

row_winner(One, Two, Three) -> (One == Two) and (Two == Three).
tik_tac_toe_winner([One, Two, Three, Four, Five, Six, Seven, Eight, Nine]) -> row_winner(One, Two, Three) or row_winner(Four, Five, Six) or row_winner(Seven, Eight, Nine).