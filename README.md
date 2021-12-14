# Erlang

## What is?

* Developed in 1986 by Joe Armstrong
* Originally built for telecom applications

## Why use it?

* Built for Concurrency
   * What does that mean?
   * Don't most languages do concurrency?
* Built for Reliability
   * How is Erlang more reliable than Java or C#

### Concurrency
Erlang embraces the philosophy of lightweight processes, providing simple ways for the creation, management, and communication of processes in an application.

Erlang chose to use processes over threads to minimize the complexity of dealing with shared resources. 

Processes communicate via message passing. A Process reads messages off a thread pool and uses pattern matching to determine how to process it.

### Reliability
Erlang has traditional error checking, but you won't see as much error handling as a traditional fault-tolerant application. Erlang embraces the error and will rightfully, with honor, let itself ~~die~~ crash. Opting to spin up a new version of the process. Because everyone knows, the best way to deal with an error it to just pretend you never saw it.

Erlang also allows for the hot-swapping of code. Meaning you can replace parts of your code without stopping the process. This allows for significantly less downtime when fixing or upgrading the system.


## How to write it
##### That's a great question

### Comments
```
> % Start with a percent sign
>
```

### Statements
```
> 2 + 2
```

## **Lines end with a period**

### Statements (__corrected__)
```
> 2 + 2.
4

> 2 + 2.0.
4.0

> "string".
"string"
```

### Lists (look like arrays)
Lists can be any length
```
> [1, 2, 3].
[1, 2, 3]

> [84, 104, 105, 115, 32, 103, 101, 116, 115, 32, 114, 101, 97, 100, 32, 97, 115, 32, 97, 32, 115, 116, 114, 105, 110, 103 ].
"This gets read as a string"
```

### Variables 
```
> var = 5.
** exception error: no match of right hand side value 5
```
Erlang is trying to pattern match this statement. Variables start with a capital letter, because it is a proper language.

```
> Var = 5.
5

> Var.
5

> Var = 6.
** exception error: no match of right hand side value 6

> f(Var).
ok
> Var = 6.
6
```

### Atom (symbol)
The most primitive type of data element that can represent anything. You can tell this is a symbol and not a variable because unlike a variable, it starts with a lower case letter.
```
> thisIsASymbol.
thisIsASymbol

> ThisIsAVariable = thisIsASymbol.
thisIsASymbol

> ThisIsAVariable.
thisIsASymbol
```

### Tuples
Fixed length
```
> {a, b, c}.
{a, b, c}

> {language: "Erlang"}.
{language: "Erlang"}

> {language, {name, "Java"}, {name, "Erlang"}, {name, "C#"}}.
{language, {name,"Java"}, {name,"Erlang"}, {name,"C#"}}
```

### Pattern Matching
```
> Language = {language, {name, "Erlang"}, {goodAt, ["Concurrency", "Reliability", "Being cool"]}}.

> {language, {name, Name}, {goodAt, GoodAt}} = Language.
> Name.
"Erlang"
> GoodAt.
["Concurrency", "Reliability", "Being cool"]
```

### Pattern Matching cont.
```
> [Head | Tail] = [1, 2, 3].
> Head.
1
> Tail.
[2, 3]
> [A, B | Rest] = ["bob", "the", "builder", "is", "for", "adults", "too"].
> A.
"bob"
> B.
"the"
> Rest.
["builder", "is", "for", "adults", "too"]
```

### Bit Packing
```
> A = 1.
> B = 2.
> C = 3.
> All = <<A:1, B:2, C:2>>. (stored as 5 bits)

> <<X:1, Y:2, Z:2>> = All.
62> X.
1
63> Y.
2
64> Z.
3
```

### Functions
Contains module name, method name, and implementation. Must be compiled before used.

__output.erl__
```
-module(output).
-export([print/1]).

print(Anything) -> Anything.
```

Compile with
```
c(moduleName)

> c(output).
{ok,output}

> output:print("hi").
"hi"
```

Method names can be overloaded

__overloaded.erl__
```
-module(overloaded).
-export([number/1]).

number(one) -> 1;
number(two) -> 2;
number(three) -> 3.
```
```
> overloaded:number(one).
1
81> overloaded:number(two).
2
82> overloaded:number(three).
3
```