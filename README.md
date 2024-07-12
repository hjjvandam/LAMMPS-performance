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

| Job | Property             | DeePMD   | ReaxFF   | Tersoff  |
| --- | -------------------- | -------- | -------- | -------- |
| 0   | Total time (minutes) | 1:08     | 2:27     | 0:01     |
|     | Arithmetic           | 4.84e+09 | 2.20e+10 | 9.42e+08 |
|     | FLOPS (ops/second)   | 7.12e+07 | 1.50e+08 | 9.42e+08 |
|     | ns/day               | 13.964   | 6.454    | 539.156  |
| 1   | Total time (minutes) | 1:03     | 2:05     | 0:02     |
|     | ns/day               | 16.690   | 7.605    | 662.459  |
| 2   | Total time (minutes) | 1:29     | 2.05     | 0:02     |
|     | ns/day               | 13.164   | 8.520    | 657.614  |
| 3   | Total time (minutes) | 1:19     | 1:53     | 0:03     |
|     | ns/day               | 11.161   | 8.262    | 663.037

Using GPUs (NVIDIA A100-SXM4-80GB) we obtained the following timings.

| Job   | Property             | DeePMD |         | ReaxFF |        | Tersoff |         |
| ----- | -------------------- | ------ | ------- | ------ | ------ | ------- | ------- |
| #GPUs |                      | 1      | 4       | 1      | 4      | 1       | 4       |
| 1     | Total time (minutes) | 0:31   | 0:26    | 2:12   | 1:52   | 0:02    | 0:02    |
|       | ns/day               | 45.385 | 100.470 | 7.533  | 8.638  | 661.329 | 659.814 |
| 2     | Total time (minutes) | 0:21   | 0:32    | 1:55   | 2:10   | 0:02    | 0:11    |
|       | ns/day               | 76.172 | 61.702  | 8.333  | 7.287  | 662.341 | 87.173  |
| 3     | Total time (minutes) | 0:38   | 0:23    | 2:40   | 2:08   | 0:03    | 0:04    |
|       | ns/day               | 35.727 | 88.923  | 6.217  | 7.377  | 659.105 | 297.354 |


