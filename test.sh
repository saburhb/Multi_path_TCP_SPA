#!/bin/sh
rm -f file1.txt 
max=10
for i in `seq 2 $max`
do
	sysctl -w net.mptcp.mptcp_enabled=0
	echo  "MPTCP=0\n" | tee -a file1.txt
	iperf -c mptcp.info.ucl.ac.be -t 60 >> file1.txt
	echo  "****************************************************************************************************************************\n" | tee -a file1.txt
	sleep 10
	sysctl -w net.mptcp.mptcp_enabled=1
	echo  "MPTCP=1\n" | tee -a file1.txt
        iperf -c mptcp.info.ucl.ac.be -t 60 >> file1.txt
        echo  "****************************************************************************************************************************\n\n"  | tee -a file1.txt
done

