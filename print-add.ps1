$yazici_list = Import-Csv C:\Users\Emin\Desktop\yazicilistesi.csv #Yazıcı listesinin bulunduğu konum
    foreach ($yazici in $yazici_list) {
            $marka=$($yazici.'MARKA')
            $model=$($yazici.'MODEL')
            $yaziciadi=$($yazici.'YAZICI ADI')
            $ipadresi=$($yazici.'IP ADRESİ')
            #Ilk once ip adresiminizi baglanti noktasi olarak ekliyoruz. Burada baglanti noktasini eklerken baglanti ismine ip adresinin aynisi ekledik
            #Ornek 192.168.100.1 ip adresinin adini 192.168.100.1 yaptik isterseniz farklida yapabilirsiniz daha onceden ayni baglanti noktasi varsa hata verebilir
            Add-PrinterPort -Name "$ipadresi" -PrinterHostAddress "$ipadresi"
            #Bu kisimda yazicilarin modellere gore ayrip farklı surucu sececegimiz alan
            if ($model -le 'WF-M5799') {
                #Bu kisimda Driver Name Kismina daha once yuklediniz driverin ismini yazmaniz gerekmektedir.
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