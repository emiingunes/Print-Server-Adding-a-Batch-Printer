$yazici_list = Import-Csv C:\Users\Emin\Desktop\yazicilistesi.csv #Location of printer list
    foreach ($yazici in $yazici_list) {
            $marka=$($yazici.'MARKA')
            $model=$($yazici.'MODEL')
            $yaziciadi=$($yazici.'YAZICI ADI')
            $ipadresi=$($yazici.'IP ADRESI')
            #First we add our ip address as port. Here we add the same ip address to the connection name while adding the port
            #Example 192.168.100.1 We changed the name of the ip address to 192.168.100.1, you can do it differently if you want, it may give an error if there is the same port before
            Add-PrinterPort -Name "$ipadresi" -PrinterHostAddress "$ipadresi"
            #In this section, we select different drivers according to the models of the printers.
            if ($model -le 'WF-M5799') {
                #In this section, you need to write the name of the driver you have previously installed in the Driver Name Section.
                Add-Printer -Name $yaziciadi -DriverName "EPSON WF-M5799 Series" -PortName $ipadresi -Shared -ShareName $yaziciadi –Published
            }
            else {
                if ($model -le 'WF-C5790') {
                    Add-Printer -Name $yaziciadi -DriverName "EPSON WF-C5790 Series" -PortName $ipadresi -Shared -ShareName $yaziciadi –Published
                }
                else {
                    if ($model -le 'WF-M5299') {
                        Add-Printer -Name $yaziciadi -DriverName "EPSON WF-M5299 Series" -PortName $ipadresi -Shared -ShareName $yaziciadi –Published
                    }
                }
            }
    }
$userInput = Read-Host
