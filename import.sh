cat <<IMPORT
INFO
CREATING DATABASE STRUCTURE
INFO
storage engine: InnoDB
INFO
LOADING departments
INFO
LOADING employees
IMPORT
sleep 2

cat <<IMPORT
INFO
LOADING dept_emp
IMPORT
sleep 1

cat <<IMPORT
INFO
LOADING dept_manager
INFO
LOADING titles
IMPORT
sleep 1

cat <<IMPORT
INFO
LOADING salaries
IMPORT
sleep 2 
cowthink ⌛...
sleep 6

cat <<IMPORT
data_load_time_diff
00:00:46

real    0m46.194s
user    0m2.005s
sys     0m0.160s
IMPORT
