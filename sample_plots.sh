# Preprocessing - mark best parallelisation settings for archer2
# hpcbench best "'run:Totals:ns/day'" -v "'slurm:slurm:nodes'" -v "'run:Totals:Number of atoms'" -v "'slurm:program'" -d "'/home/rob/benchout/archer'" -t "'meta:Best'"
# And for lammps on GH
# hpcbench best -v "'slurm:slurm:nodes'" -v "'run:Totals:Number of atoms'" -d "'/home/rob/benchout/bede/lammps'" "'run:Totals:ns/day'"

# QM
# ARCHER2
hpcbench bars -m meta:QM=Psi4 -x meta:basis -y Accounting:ElapsedRaw -l meta:Machine -d ~/benchout -o bars_test.pdf
hpcbench bars -m meta:QM=Psi4 -x meta:basis -y Accounting:AveRSS -l meta:Machine -d ~/benchout -o bars_test_mem.pdf

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

