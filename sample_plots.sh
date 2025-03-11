# Preprocessing - mark best parallelisation settings for archer2
# hpcbench best "'run:Totals:ns/day'" -v "'slurm:slurm:nodes'" -v "'run:Totals:Number of atoms'" -v "'slurm:program'" -d "'/home/rob/benchout/archer'" -t "'meta:Best'"
# And for lammps on GH
# hpcbench best -v "'slurm:slurm:nodes'" -v "'run:Totals:Number of atoms'" -d "'/home/rob/benchout/bede/lammps'" "'run:Totals:ns/day'"

# QM
# ARCHER2
hpcbench bars \
-m meta:QM=Psi4 \
-m meta:method=ccsd \
-x meta:set \
-y Accounting:ElapsedRaw \
-a def2-tzvpp:BEDE-GH=Segfault \
-a def2-tzvppd:ISAMBARD=Segfault \
-l meta:Machine \
-d ~/benchout \
--xaxislabel "'Basis set'" \
--yaxislabel "'Benchmark suite runtime (hours)'" \
--yscalefactor 0.000277777777778 \
-o bars_test.pdf

hpcbench bars -m meta:QM=Psi4 -x meta:basis -y Accounting:AveRSS -l meta:Machine -d ~/benchout -o bars_test_mem.pdf

# QM scaling

hpcbench scaling \
--matching "'meta:Machine=Archer2'" \
--matching "'meta:QM=Psi4'" \
--matching "'meta:method=ccsd'" \
--x "'meta:Memory'" \
--y "'Accounting:ElapsedRaw'" \
--l "'meta:set'" \
--directory "'/home/rob/benchout/archer/psi4'" \
--outside \
--xaxislabel "'Memory (GB)'" \
--yaxislabel "'Benchmark suite runtime (hours)'" \
--noysci \
--noxsci \
--yscalefactor 0.000277778 \
--outfile archer2_qm_ccsd.pdf

hpcbench scaling \
--matching "'meta:Machine=Archer2'" \
--matching "'meta:QM=Psi4'" \
--matching "'meta:method=scf'" \
--x "'meta:Memory'" \
--y "'Accounting:ElapsedRaw'" \
--l "'meta:set'" \
--directory "'/home/rob/benchout/archer/psi4'" \
--outside \
--outfile archer2_qm_scf.pdf

hpcbench scaling \
--matching "'meta:Machine=Archer2'" \
--matching "'meta:QM=Psi4'" \
--matching "'meta:method=mp2'" \
--x "'meta:Memory'" \
--y "'Accounting:ElapsedRaw'" \
--l "'meta:set'" \
--directory "'/home/rob/benchout/archer/psi4'" \
--outside \
--outfile archer2_qm_mp2.pdf

hpcbench scaling \
--matching "'meta:Machine=Archer2'" \
--matching "'meta:QM=Psi4'" \
--matching "'meta:method=hf'" \
--x "'meta:Memory'" \
--y "'Accounting:ElapsedRaw'" \
--l "'meta:set'" \
--directory "'/home/rob/benchout/archer/psi4'" \
--outside \
--outfile archer2_qm_hf.pdf

# MD

# Scaling system size on JADE
hpcbench scaling \
--matching "'meta:Machine=JADE2'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--outfile jade_nsday.pdf

# Power use with system size on JADE
hpcbench scaling \
--matching "'meta:Machine=JADE2'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--outfile jade_power.pdf

# Scaling on archer
hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'slurm:slurm:nodes=1'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout/archer'" \
--outside \
--noysci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--outfile archer_nsday.pdf

# Power on archer
hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'slurm:slurm:nodes=1'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout/archer'" \
--outside \
--outfile archer_power.pdf

# Scaling system size on GH
hpcbench scaling \
--matching "'meta:Machine=Grace Hopper Testbed'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--outfile gh_nsday.pdf

# Power use with system size on GH
hpcbench scaling \
--matching "'meta:Machine=Grace Hopper Testbed'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--outfile gh_power.pdf

# GH comparison with JADE2

hpcbench scaling \
--matching "'meta:PlotJadeGrace=yes'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:ns/day'" \
--l "'meta:JadeGraceComparison'" \
--directory "'/home/rob/benchout'" \
--outside \
--dash GH200 \
--noysci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--outfile jadevsgrace_nsday.pdf

hpcbench scaling \
--matching "'meta:PlotJadeGrace=yes'" \
--x "'run:Totals:Number of atoms'" \
--y "'run:Totals:J/ns'" \
--l "'meta:JadeGraceComparison'" \
--directory "'/home/rob/benchout'" \
--outside \
--dash GH200 \
--noysci \
--yscalefactor 0.00000027778 \
--yaxislabel "'Energy use in kWh/ns (lower is better)'" \
--outfile jadevsgrace_energy.pdf

# archer2 nodes comparison

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=20k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--outfile archer_20k_nsday.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=61k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--outfile archer_61k_nsday.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=465k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--outfile archer_465k_nsday.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=1400k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--outfile archer_1400k_nsday.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=3000k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Simulation speed in ns/day (higher is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--outfile archer_3000k_nsday.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=20k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Energy efficiency in kWh/ns (lower is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--yscalefactor 0.00000027778 \
--outfile archer_20k_power.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=61k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Energy efficiency in kWh/ns (lower is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--yscalefactor 0.00000027778 \
--outfile archer_61k_power.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=465k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Energy efficiency in kWh/ns (lower is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--yscalefactor 0.00000027778 \
--outfile archer_465k_power.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=1400k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Simulation efficiency in kWh/ns (lower is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--yscalefactor 0.00000027778 \
--outfile archer_1400k_power.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'meta:Best=yes'" \
--matching "'meta:Atoms=3000k'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:J/ns'" \
--l "'slurm:program'" \
--directory "'/home/rob/benchout'" \
--outside \
--noysci \
--noxsci \
--yaxislabel "'Simulation efficiency in kWh/ns (lower is better)'" \
--xaxislabel "'Number of HPC nodes used'" \
--yscalefactor 0.00000027778 \
--outfile archer_3000k_power.pdf \

# best threads
hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=GROMACS'" \
--matching "'run:Totals:Number of atoms=2997924.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile gromacs_optimal_threads_3000k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=GROMACS'" \
--matching "'run:Totals:Number of atoms=1403180.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile gromacs_optimal_threads_1400k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=GROMACS'" \
--matching "'run:Totals:Number of atoms=465399.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile gromacs_optimal_threads_465k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=GROMACS'" \
--matching "'run:Totals:Number of atoms=69866.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile gromacs_optimal_threads_61k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=GROMACS'" \
--matching "'run:Totals:Number of atoms=19605.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile gromacs_optimal_threads_20k.pdf




hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=namd2'" \
--matching "'run:Totals:Number of atoms=2997924.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile namd_optimal_threads_3000k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=namd2'" \
--matching "'run:Totals:Number of atoms=1403180.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile namd_optimal_threads_1400k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=namd2'" \
--matching "'run:Totals:Number of atoms=465399.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile namd_optimal_threads_465k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=namd2'" \
--matching "'run:Totals:Number of atoms=61153.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile namd_optimal_threads_61k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=LAMMPS'" \
--matching "'run:Totals:Number of atoms=19605.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile namd_optimal_threads_20k.pdf

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=LAMMPS'" \
--matching "'run:Totals:Number of atoms=2997924.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile lammps_optimal_threads_3000k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=LAMMPS'" \
--matching "'run:Totals:Number of atoms=1403180.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile lammps_optimal_threads_1400k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=LAMMPS'" \
--matching "'run:Totals:Number of atoms=465399.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile lammps_optimal_threads_465k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=LAMMPS'" \
--matching "'run:Totals:Number of atoms=61153.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile lammps_optimal_threads_61k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=LAMMPS'" \
--matching "'run:Totals:Number of atoms=19605.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
--small \
--outfile lammps_optimal_threads_20k.pdf

# memory

hpcbench bars \
-m meta:Memorycomparison=yes \
-x meta:Atoms \
-y accounting:MaxRss \
-l slurm:program \
-d ~/benchout \
--xaxislabel "'Number of atoms'" \
--yaxislabel "'Memory usage (GB)'" \
--yscalefactor 0.000001 \
-o md_archer_memory.pdf

hpcbench bars \
-m meta:GPUMemComparison=yes \
-x meta:Atoms \
-y meta:GPUMem \
-l slurm:program \
-d ~/benchout \
--xaxislabel "'Number of atoms'" \
--yaxislabel "'GPU memory usage (GB)'" \
--yscalefactor 0.000001 \
-o md_jade2_gpu_memory.pdf

# conservation of energy

hpcbench log -x thermo:Etot -y thermo:Etot -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=AMBER -t --small -o amber_lumi_energy.pdf --xaxislabel "'Simulation time (ratio)'" --yaxislabel "'Energy (kcal/mol)'"

hpcbench log -x "'thermo:Total Energy'" -y "'thermo:Total Energy'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=Gromacs -t --small -o gromacs_lumi_energy.pdf --xaxislabel "'Simulation time (ratio)'" --yaxislabel "'Energy (kcal/mol)'"

hpcbench log -x "'thermo:TOTAL'" -y "'thermo:TOTAL'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=NAMD -t --small -o namd_lumi_energy.pdf --xaxislabel "'Simulation time (ratio)'" --yaxislabel "'Energy (kcal/mol)'"

hpcbench log -x "'thermo:thermo:?:etotal'" -y "'thermo:thermo:?:etotal'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=LAMMPS -t --small -o lmp_lumi_energy.pdf --xaxislabel "'Simulation time (ratio)'" --yaxislabel "'Energy (kcal/mol)'"

hpcbench log -x "'thermo:Conserved En.'" -y "'thermo:Conserved En.'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=Gromacs -t --small -o gromacs_lumi_conserved_energy.pdf --xaxislabel "'Simulation time (ratio)'" --yaxislabel "'Energy (kcal/mol)'"

# Export fits

hpcbench fits \
-d "'/home/rob/benchout/jade2'" \
-m "'meta:Machine=JADE2'" \
-l "'slurm:program'" \
-x "'run:Totals:Number of atoms'" \
-y "'run:Totals:ns/day'" \
-y "'run:Totals:J/ns'" \
--hardcode \
--debug \
-o fits.json

hpcbench fits \
-d "'/home/rob/benchout/bede'" \
-m "'meta:Machine=Grace Hopper Testbed'" \
-l "'slurm:program'" \
-x "'run:Totals:Number of atoms'" \
-y "'run:Totals:ns/day'" \
-y "'run:Totals:J/ns'" \
--hardcode \
--debug \
-o fits.json

hpcbench fits \
-d "'/home/rob/benchout/lumi'" \
-m "'meta:Machine=LUMI-G'" \
-l "'slurm:program'" \
-x "'run:Totals:Number of atoms'" \
-y "'run:Totals:ns/day'" \
-y "'run:Totals:J/ns'" \
--hardcode \
--debug \
-o fits.json

hpcbench fits \
-d "'/home/rob/benchout/archer'" \
-m "'meta:Machine=ARCHER2'" \
-m "'meta:Best=yes'" \
-m "'slurm:slurm:nodes=1'" \
-l "'slurm:program'" \
-x "'run:Totals:Number of atoms'" \
-y "'run:Totals:ns/day'" \
-y "'run:Totals:J/ns'" \
--hardcode \
--debug \
-o fits.json
