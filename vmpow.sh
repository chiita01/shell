#!/bin/bash
echo "++++++++++++++++++++++++++++++++++++"
echo "+++     Show Virtual Machines    +++"
echo "++++++++++++++++++++++++++++++++++++"
vim-cmd vmsvc/getallvms

echo ""
echo ""
echo "++++++++++++++++++++++++++++++++++++"
echo "+++ You wanna power on or off ?  +++"
echo "++++++++++++++++++++++++++++++++++++"
echo "Input Value on/off"

read selected

echo ""
echo "++++++++++++++++++++++++++++++++++++"
echo "+++ You wanna power on or off ?  +++"
echo "++++++++++++++++++++++++++++++++++++"
echo ""

case $selected in
	"on" )
		echo "Selected Power ON VM !!"
		echo "Input number of VMID above list. "
		read num
		echo ""
		echo "++++++++++++++++++++++++++++++++++++"
		echo "+++   Power ON Target Machine    +++"
		echo "++++++++++++++++++++++++++++++++++++"
		echo ""
		vim-cmd vmsvc/power.on $num
		echo ""
		echo "++++++++++++++++++++++++++++++++++++"
		echo "+++  Target Machine State        +++"
		echo "++++++++++++++++++++++++++++++++++++"
		echo ""
		vim-cmd vmsvc/power.getstate $num;;
		echo ""

	"off" )
		echo "Selected Power OFF VM !!"
		echo "Input number of VMID above list. "
		read num
		echo ""
		echo "++++++++++++++++++++++++++++++++++++"
		echo "+++   Power OFF Target Machine   +++"
		echo "++++++++++++++++++++++++++++++++++++"
		echo ""
		vim-cmd vmsvc/power.off $num
		echo ""
		echo ""
		echo "++++++++++++++++++++++++++++++++++++"
		echo "+++  Target Machine State        +++"
		echo "++++++++++++++++++++++++++++++++++++"
		echo ""
		vim-cmd vmsvc/power.getstate $num;;
		echo ""
esac

echo ""
echo "++++++++++++++++++++++++++++++++++++"
echo "+++   FINISHED THIS SHELL        +++"
echo "++++++++++++++++++++++++++++++++++++"
echo ""
exit 0

