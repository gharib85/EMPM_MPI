source mpi_openmp_set.sh
# HFB code

echo "HF calculation" 
cd input
./HFB_DD > log_HFB

echo "F matrix calculation"
cd ../fmat
./fmat < input_space > log_fmat
echo "TDA calculation"
cd ../tda
./tda > log_TDA
cd ..

echo "1-phonon densities calculation"
./run_dens1.sh 

echo "Phonon interaction calculation"
./run_phon_int.sh    

echo "EMPM 2-phonon calculation"
./run_eqm2.sh

echo "EMPM 3-phonon calculation"
./run_eqm3.sh
