#!/bin/bash

while :
	do
	clear
	
	echo ""
	echo "Show All VMs. "
	echo "==================================="
	vim-cmd vmsvc/getallvms
	echo "#############################################"
	echo "#         Manage Snapshot                   #"
	echo "#  Select Number You want to.               #"
	echo "#  1. Create Snapshot                       #"
	echo "#  2. Delete Snapshot                       #"
	echo "#  3. Show Snapshot                         #"
	echo "#  4. Revert Snapshot                       #"
	echo "#===========================================#"
	echo "#  If you finish this shell, input (fin).   #"
	echo "#############################################"
	
	read key
	
	case $key in
		1 )
		echo "Input Target VM ID."
		read vmid
		echo ""
		
		echo "Starting Create Snapshot."
		echo "What is Snapshot Name ?"
		read SnapName
		echo ""
		
		echo "Input Description(Option)"
		read Description
		echo ""
		
		echo "Snapshot Memory of VM?(yes/no)"
		read memory_a
		echo ""
		case $memory_a in
			"yes" )
			memory=1;;
			"no" )
			memory="";;
		esac
		
		echo "Need quiesce point?(yes/no)"
		read quiesce_a
		echo ""
		case $quiesce_a in
			"yes" )
			quiesce=1;;
			"no" )
			quiesce="";;
		esac
		echo ""
		
		vim-cmd vmsvc/snapshot.create "$vmid" "$SnapName" "$Description" "$memory" "$quiesce"
		vim-cmd vmsvc/snapshot.get $vmid
		echo "press Enter key to continue..."
		read a1;;
		
		
	2 )
		echo "Input Target VM ID."
		read vmid
		echo ""
		
		echo "Input Target Snapshot ID. You can Delete with Children.(removeChirdren) ex. 1 removeChildren"
		echo "IF DELETE ALL, INPUT THIS(ALL)."
		read SnapID
		echo ""
		case $SnapID in
			"ALL" ) vim-cmd vmsvc/snapshot.removeall $vmid;;
			* )  vim-cmd vmsvc/snapshot.remove $vmid $SnapID;;
		esac
		echo ""
		
		vim-cmd vmsvc/snapshot.get $vmid
		echo "press Enter key to continue..."
		read a1;;
		
	3 )
		echo "Input Target VM ID."
		read vmid
		echo ""
		
		vim-cmd vmsvc/snapshot.get $vmid
		echo "press Enter key to continue..."
		read a1;;
		
	4 )
		echo "Input Target VM ID."
		read vmid
		echo ""
		
		echo "Input Target Snapshot ID."
		read SnapID
		echo ""
		
		echo "suppress poweroff(yes/no)"
		read sprs_a
		case $sprs_a in
			"yes" ) sprs=1;;
			"no" ) sprs="";;
		esac
		echo ""
		
		vim-cmd vmsvc/snapshot.revert $vmid $SnapID $sprs;;
		
	"fin" )
		echo ""
		echo " --- End This Shell. Bye !! --- "
		echo ""

		break;;

	esac
done

