
# Roar Cluster Documentation:
You can find comprehensive information about the ICS-ACI User Guide at the following link: https://ics.psu.edu/computing-services/ics-aci-user-guide/

## 2-factor authentication:
The Roar cluster requires 2-factor authentication. You can learn more about it and how to set it up at this link: https://2fa.psu.edu/2fa/

## SSH to cluster:
To establish a secure shell (SSH) connection to the cluster, use the following command: 

`ssh user1@submit.aci.ics.psu.edu`

## SCP to cluster:
To securely copy (SCP) files to the cluster, use the following command: 

`scp submit-cluster-howto.zip user1@submit.aci.ics.psu.edu:~/submit-cluster-howto.zip`

## Trivial R script example: "sample.R"
Here is a simple example of an R script named "sample.R". This script generates a random sample of 100 numbers between 0 and 9 and writes the output to a file named "sampleResults.txt":
```
v = sample(x = 0:9, size = 100, replace = TRUE)
write(v, file = "sampleResults.txt")
```

## Sample PBS script
The following PBS script can be used to submit the sample.R script to the job queue
```
#PBS -l nodes=1:ppn=1
#PBS -l walltime=1:00:00
#PBS -l pmem=2gb
#PBS -j oe
cd $PBS_O_WORKDIR
echo " "
echo "Job started on `hostname` at `date`"
R --no-save --vanilla < sample.R
echo " "
echo "Job Ended at `date`"
```

## Command to submit PBS script to queue:
To submit a PBS script to the queue on the open queue, use the following command:
`qsub -k oe -A open -N aJobName sample.pbs`

To submit on the lab queue, use the following command:
`qsub -k oe -A mjf283_a_g_sc_default -N aJobName sample.pbs`

## Check execution status:
To check the status of your job, you can use the following commands:
```
qstat | grep userID
qstat | grep jkh597
```
The output will display the Job ID, Name, User, Time Use, Queue status, and more.

## Alternate method for checking execution status:
An alternate method to check the status of your job is to use the `showq` command followed by your user ID, like this: 
`showq | grep jkh597`

## Kill a job after it has been submitted:
If you need to terminate a job after it has been submitted, you can do so with the `qdel` command followed by the Job ID number: 
`qdel jobIdNumber`

## Check for available modules:
To check for available modules, you can use the `module spider` command. This command will list all available modules. If you want to search for a specific module, you can use `module spider` followed by the module name, like this: 
`module spider python`

## Load module:
To load a specific module, use the `module load` command followed by the module name, like this:
`module load python/3.6.8`


## Transition to Roar Collab in Fall 2023

You will need to request an account here:
https://accounts.aci.ics.psu.edu/users/

The user guide for Roar Collab can be found here:
https://www.icds.psu.edu/roar-collab-user-guide/

Whereas Roar used MOAB/Torque for job queuing, Roar Collab uses Slurm.  Required changes in job submission and submission scripts are described at the following two URLs.

The job submission process is documented here:

https://www.icds.psu.edu/running-batch-jobs-on-roar-collab/

A guide on converting PBS scripts to Slurm scripts can be found here:

https://www.icds.psu.edu/converting-moab-roar-submission-scripts-to-slurm-roar-collab/

