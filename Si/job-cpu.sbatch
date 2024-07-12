#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --gres=gpu:0
#SBATCH --account "csihpc"
#SBATCH --partition "csi"
#SBATCH --time 1:00:00

. /hpcgpfs01/work/csi/hvandam/spack/share/spack/setup-env.sh
spack load hpctoolkit@2024.01.1%gcc@8.5.0
. /hpcgpfs01/work/csi/hvandam/pydeepmd-3.11/bin/activate

export HPCRUN=hpcrun
export HPCSTRUCT=hpcstruct
export HPCPROF=hpcprof
export MYCWD=`pwd`

hostname
module list

cd ${MYCWD}/DeePMD
time $LAMMPS_COMMAND < input.lmp 2>&1 > output-cpu-2.lmp
#$HPCRUN -e gpu=nvidia $LAMMPS_COMMAND < input.lmp 2>&1 > output.lmp
#$HPCSTRUCT hpctoolkit-*-measurements-*
#$HPCPROF hpctoolkit-*-measurements-*

cd ${MYCWD}/ReaxFF
time $LAMMPS_COMMAND < input.lmp 2>&1 > output-cpu-2.lmp
#$HPCRUN -e gpu=nvidia $LAMMPS_COMMAND < input.lmp 2>&1 > output.lmp
#$HPCSTRUCT hpctoolkit-*-measurements-*
#$HPCPROF hpctoolkit-*-measurements-*

cd ${MYCWD}/Tersoff
time $LAMMPS_COMMAND < input.lmp 2>&1 > output-cpu-2.lmp
#$HPCRUN -e gpu=nvidia $LAMMPS_COMMAND < input.lmp 2>&1 > output.lmp
#$HPCSTRUCT hpctoolkit-*-measurements-*
#$HPCPROF hpctoolkit-*-measurements-*
