# Print-Server-Adding-a-Batch-Printer

Windows Print Server batch add printer script


Setup guide:

1. First, we need to open the print management page and add the driver files of the printers we will add. When we print the print manager to the start menu, it will appear directly. The page that opens will appear as follows:

<img src="https://emingunes.com/wp-content/uploads/2021/06/image-1.png">


2. When we come to the drivers section on the left side of this page, the drivers installed on our computer will appear. If the drivers for the printers you will add are not here, you need to add the drivers by right-clicking and adding drivers.



  3.We need to create the list of printers that we will add in bulk on excel. In this example, I will add 3 types of printers.

<img src="https://emingunes.com/wp-content/uploads/2021/06/image-2.png">


As I showed above, you need to make an excel file and save this file in CSV format. You can shape the information here according to your needs and write it in the information sections of the printers.


4. "$yazici_list = Import-Csv C:\Users\Emin\Desktop\yazicilistesi.csv" In this section, you need to specify the location of the Excel file.


When you run the above script as an administrator on your print server, the printers in the list will be automatically added with the drivers you selected. Before running the script, you must make the necessary settings according to the explanations.
