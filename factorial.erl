-module(factorial).
-export([get_factorial/1]).

get_factorial(0) -> 1;
get_factorial(N) -> N * get_factorial(N - 1).