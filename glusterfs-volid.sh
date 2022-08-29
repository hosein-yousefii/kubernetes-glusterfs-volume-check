#!/bin/bash

# Find Glusterfs volume id related to persistent volume.
# Check Glusterfs volume existance.
# MAINTAINER: Hosein Yousefi <yousefi.hosein.o@gmail.com>


echo
case $1 in

	checkfile)

		for i in `cat $2|sort`
		do
			if [[ ! `kubectl get pv $j -o json|grep path|awk '{print $NF}'|sed 's/\"//g'|grep $i` ]]
			then
				echo $i is not used in kubernetes
			fi
		done
		echo
		;;

	checkinput)
		
		read -p "please enter your glusterfs volume id: " vol_id
                if [[ ! `kubectl get pv $j -o json|grep path|awk '{print $NF}'|sed 's/\"//g'|grep $vol_id` ]]
                then
	                echo $vol_id is not used in kubernetes
			exit 1
		else
			echo $vol_id is used in kubernetes
			exit 0
                fi
		echo
		;;
	help)

		echo """
		Usage:

		This script Find Glusterfs volume id related to persistent volume in kubernetes also, Check Glusterfs volume existance in kubernetes.
		MAINTAINER: Hosein Yousefi <yousefi.hosein.o@gmail.com>


		./glusterfs-volid.sh [checkfile <filename>] [checkinput] [help] [list]

		
		OPTIONS:

		checkfile <file name>	This will check volume id which is in "file" and 
					compare them to kubernetes persistence volume, and 
					find which of one is not in kubernetes.

		checkinput		This is same with checkfile but, it prompts you to enter the volume id you want to check.

		help 			This will show help.



		SAMPLE:

		# create a file named "vol-id.txt" include your glusterfs volumeid
		
		vol_0a75ae1eefae88fd2bc558a5e410497e
		vol_0bd0a59c875146e2404f56bede659057
		vol_2590ed2423ef1c6b4cd6bbab109bed6d
		vol_40f31ad542c0586fe317468228373e57
		vol_585c1a1ae83657fe8b5f2c7f269d4887
		vol_589feb415a037a0185d083fe53f82a66
		vol_74a9a54a2cab260dea0d1b950c53747e
		vol_74fd5d3e1e95a5ad35ad0b0f829a2bbe
		vol_9904e49b1c646d5e9d63eb6ad623ef95
		vol_b74c156abdf5d08446eeb47eb7a11f17
		vol_bb74d02f1607dd74511d50cd8ffc9d79
		vol_bbf0a1982958ed5e7eec5371ce55474a
		vol_c3425eec3cbb70e1cc6e67d9d67199dc
		vol_c78df149fb5a509f82d916a3278ce025
		vol_ef812e1fabb89b57972b2a3f9c2b82bf


		./glusterfs-volid.sh checkfile vol-id.txt



		# input a glusterfs volume id

		./glusterfs-volid.sh checkinput
		please enter your glusterfs volume id: vol_c78df149fb5a509f82d916a3278ce025
		vol_c78df149fb5a509f82d916a3278ce025 is not used in kubernetes

		"""
		;;

	list)
		echo
		printf "%-53s %-33s %-25s %-15s \n" "PVC" "PV" "STORAGECLASS" "STORAGECLASS_VOL_ID"
		echo "__________________________________________________________________________________________________________________________________________________"
		num=0
		for i in `kubectl get pvc|awk '{print $1}'|grep -v NAME`
		do
			PVC=$i
			num=`expr $num + 1`

		       	for j in `kubectl get pvc $i|awk '{print $3}'|tail -1`
			do
				STORAGECLASS_VOL_ID=`kubectl get pv $j -o json|grep path|awk '{print $NF}'`
				PV=`kubectl get pv $j|awk '{print $6}'|tail -1`
				STORAGECLASS=`kubectl get pv $j|awk '{print $7}'|tail -1`
		
				printf "%-0s %-40s %-45s %-15s %-20s \n" "${num}-" "${PVC}" "${PV}" "${STORAGECLASS}" "${STORAGECLASS_VOL_ID}"
				echo 
			done
		done

		;;

	*)

		echo """
                Usage:

                This script Find Glusterfs volume id related to persistent volume in kubernetes also, Check Glusterfs volume existance in kubernetes.
                MAINTAINER: Hosein Yousefi <yousefi.hosein.o@gmail.com>


                ./glusterfs-volid.sh [checkfile <filename>] [checkinput] [help] [list]


                OPTIONS:

                checkfile <file name>   This will check volume id which is in "file" and 
					compare them to kubernetes persistence volume, and 
					find which of one is not in kubernetes.

                checkinput              This is same with checkfile but, it prompts you to enter the volume id you want to check.

                help                    This will show help.



                SAMPLE:

                # create a file named "vol-id.txt" include your glusterfs volumeid
		
                vol_0a75ae1eefae88fd2bc558a5e410497e
                vol_0bd0a59c875146e2404f56bede659057
                vol_2590ed2423ef1c6b4cd6bbab109bed6d
                vol_40f31ad542c0586fe317468228373e57
                vol_585c1a1ae83657fe8b5f2c7f269d4887
                vol_589feb415a037a0185d083fe53f82a66
                vol_74a9a54a2cab260dea0d1b950c53747e
                vol_74fd5d3e1e95a5ad35ad0b0f829a2bbe
                vol_9904e49b1c646d5e9d63eb6ad623ef95
                vol_b74c156abdf5d08446eeb47eb7a11f17
                vol_bb74d02f1607dd74511d50cd8ffc9d79
                vol_bbf0a1982958ed5e7eec5371ce55474a
                vol_c3425eec3cbb70e1cc6e67d9d67199dc
                vol_c78df149fb5a509f82d916a3278ce025
                vol_ef812e1fabb89b57972b2a3f9c2b82bf


                ./glusterfs-volid.sh checkfile vol-id.txt



                # input a glusterfs volume id

                ./glusterfs-volid.sh checkinput
                please enter your glusterfs volume id: vol_c78df149fb5a509f82d916a3278ce025
                vol_c78df149fb5a509f82d916a3278ce025 is not used in kubernetes

        """
		;;
esac
