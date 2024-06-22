#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=48
#SBATCH --ntasks-per-node=48
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:4
#SBATCH --account "csihpc"
#SBATCH --partition "csi"
#SBATCH --time 1:00:00

export HPCRUN=/hpcgpfs01/work/csi/hvandam/linux-almalinux8-icelake/gcc-12.3.0/hpctoolkit-2024.01.1-34i3cp4o2a5lbgahvlk6fxnb5w7yyogf/bin/hpcrun
export HPCSTRUCT=/hpcgpfs01/work/csi/hvandam/linux-almalinux8-icelake/gcc-12.3.0/hpctoolkit-2024.01.1-34i3cp4o2a5lbgahvlk6fxnb5w7yyogf/bin/hpcstruct
export HPCPROF=/hpcgpfs01/work/csi/hvandam/linux-almalinux8-icelake/gcc-12.3.0/hpctoolkit-2024.01.1-34i3cp4o2a5lbgahvlk6fxnb5w7yyogf/bin/hpcprof
export MYCWD=`pwd`

cd ${MYCWD}/DeePMD
$HPCRUN -e gpu=nvidia $LAMMPS_COMMAND < input.lmp
$HPCSTRUCT $LAMMPS_COMMAND
$HPCPROF lammps-measurements

cd ${MYCWD}/ReaxFF
$HPCRUN -e gpu=nvidia $LAMMPS_COMMAND < input.lmp
$HPCSTRUCT $LAMMPS_COMMAND
$HPCPROF lammps-measurements

cd ${MYCWD}/Tersoff
$HPCRUN -e gpu=nvidia $LAMMPS_COMMAND < input.lmp
$HPCSTRUCT $LAMMPS_COMMAND
$HPCPROF lammps-measurements
