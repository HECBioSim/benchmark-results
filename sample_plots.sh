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
--yaxislabel "'Benchmark suite runtime (s)'" \
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
--yaxislabel "'Benchmark suite runtime (s)'" \
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
--outfile gromacs_optimal_threads_465k.pdf \

hpcbench scaling \
--matching "'meta:Machine=ARCHER2'" \
--matching "'slurm:program=GROMACS'" \
--matching "'run:Totals:Number of atoms=61153.0'" \
--x "'slurm:slurm:nodes'" \
--y "'run:Totals:ns/day'" \
--l "'slurm:slurm:cpus-per-task'" \
--directory "'/home/rob/benchout'" \
--outside \
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
--outfile lammps_optimal_threads_20k.pdf

hpcbench bars \
-m meta:Memorycomparison=yes \
-x meta:Atoms \
-y accounting:MaxRss \
-l slurm:program \
-d ~/benchout \
--xaxislabel "'Number of atoms'" \
--yaxislabel "'Memory usage (KB)'" \
-o md_archer_memory.pdf

hpcbench bars \
-m meta:GPUMemComparison=yes \
-x meta:Atoms \
-y meta:GPUMem \
-l slurm:program \
-d ~/benchout \
--xaxislabel "'Number of atoms'" \
--yaxislabel "'GPU memory usage (KB)'" \
-o md_jade2_gpu_memory.pdf

# conservation of energy

hpcbench log -x thermo:Etot -y thermo:Etot -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=AMBER -t -o amber_lumi_energy.pdf

hpcbench log -x "'thermo:Total Energy'" -y "'thermo:Total Energy'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=Gromacs -t -o gromacs_lumi_energy.pdf

hpcbench log -x "'thermo:TOTAL'" -y "'thermo:TOTAL'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=NAMD -t -o namd_lumi_energy.pdf

hpcbench log -x "'thermo:thermo:?:etotal'" -y "'thermo:thermo:?:etotal'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=LAMMPS -t -o lmp_lumi_energy.pdf

hpcbench log -x "'thermo:Conserved En.'" -y "'thermo:Conserved En.'" -l meta:Atoms -d /home/rob/benchout/lumi/ --outside --matching meta:MD=Gromacs -t -o gromacs_lumi_conserved_energy.pdf
