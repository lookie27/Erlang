-module(roulette).
-export([loop/0]).

% Doc = spawn(fun doctor:loop/0).
% Doc ! new.
% revolver ! {1-6}.

kill(Guess) ->
    Rand = rand:uniform(6),
    ShouldKill = Guess == Rand,
    if
        ShouldKill == true -> 
            io:format("bang. ~n"), exit({guess, Guess, random, Rand});
        true -> 
            io:format("click. ~n"), loop()
    end.


loop() -> 
    receive
        1 -> kill(1);
        2 -> kill(2);
        3 -> kill(3);
        4 -> kill(4);
        5 -> kill(5);
        6 -> kill(6)
    end.