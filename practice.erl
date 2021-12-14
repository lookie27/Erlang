-module(practice).
-export([get_number_of_words/1]).
-export([count_to_ten/0]).
-export([print_status/1]).

get_number_of_words([]) -> 0;
get_number_of_words([_|Rest]) -> 1 + get_number_of_words(Rest).

count_to_ten() -> count_to_ten(1).
count_to_ten(10) -> 1;
count_to_ten(N) -> 1 + count_to_ten(N + 1).

print_status({error, Message}) -> string:concat("error:", Message);
print_status(success) -> "success".