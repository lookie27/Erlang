#Erlang

##What is?

* Developed in 1986 by Joe Armstrong
* Originally built for telecom applications

##Why use it?

* Built for Concurrency
   * What does that mean?
   * Don't most languages do concurrency?
* Built for Reliability
   * How is Erlang more reliable than Java or C#

###Concurrency
Erlang embraces the philosophy of lightweight processes, providing simple ways for the creation, management, and communication of processes in an application.

Erlang chose to use processes over threads to minimize the complexity of dealing with shared resources. 

Processes communicate via message passing. A Process reads messages off a thread pool and uses pattern matching to determine how to process it.

###Reliability
Erlang has traditional error checking, but you won't see as much error handling as a traditional fault-tolerant application. Erlang embraces the error and will rightfully, with honor, let itself ~~die~~ crash. Opting to spin up a new version of the process. Because everyone knows, the best way to deal with an error it to just pretend you never saw it.

Erlang also allows for the hot-swapping of code. Meaning you can replace parts of your code without stopping the process. This allows for significantly less downtime when fixing or upgrading the system.