Primitive RabbitMQ benchmark
============================

Primitive benchmark to measure relative performance with different
erlang/rabbit versions and with different options. Only CPU-bound
things are measured.

Scenario is very simple: cluster of 3 nodes, a bunch of producers
publish to the 1st node, consumers read from the 2nd on. Only normal
operation: queues don't grow uncontrollably (so no RAM pressure and no
need to do disk swapping), no destructive operations (like killing
nodes) occurs during the test.

Despite this simplicity it still could show us what progress was made
in rabbitmq/erlang world. And also show the tremendous impact that
HA-queues have on performance )

Running
-------

Install `apt-cacher-ng` on local machine and run:

    APT_PROXY_URL=http://10.10.10.1:3142/ ./measure.sh

Without `apt-cacher-ng` VM provisioning will take substantially longer
and will also create unnecessary network load.

What changes between runs
-------------------------

- Different



