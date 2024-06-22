# LAMMPS-performance

Comparison of LAMMPS performance characteristics between different force field implementations.

In a project we are using LAMMPS with neural network potentials as implemented in DeePMD. 
When running molecular dynamics with this setup we get only a handful of ns/day from
our trajectories. Normally one should be able to get hundreds of ns/day. Here we
are addressing the questions:

1. How big a difference is there between the performance of different force fields?
2. Are there any obvious deficiencies in any of the implementations?

Initially we compare the DeePMD neural network potentials, Tersoff potentials and ReaxFF.
The implementations of these options are very different, but functionally these
force fields are similar in that they allow bonds to be broken and formed. This functionality
is key to our project objectives.

Using CPUs (Intel(R) Xeon(R) Gold 6336Y CPU @ 2.40GHz, model 106) we obtained the following
timings.

| Property             | DeePMD   | ReaxFF   | Tersoff  |
| -------------------- | -------- | -------- | -------- |
| Total time (minutes) | 1:08     | 2:27     | 0:01     |
| Arithmetic           | 4.84e+09 | 2.20e+10 | 9.42e+08 |
| FLOPS (ops/second)   | 7.12e+07 | 1.50e+08 | 9.42e+08 |
| ns/day               | 13.964   | 6.454    | 539.156  |




