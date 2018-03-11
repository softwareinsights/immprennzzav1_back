<?php


    echo "<pre>";
    print_r($_FILES);
    echo "</pre>";

    if ($_FILES['csvfile']) {

        include "excelexport.php";
        include "conexion.php";

        $fecha = $_POST['fecha'];
        define("OUTPUTFOLDER", "archivos");
        define("FILEOUTPUT", OUTPUTFOLDER."/$fecha.csv");


        # CARGA ARCHIVO A CARPETA
        if(count($_FILES)>0 && $_FILES['csvfile']['error']==0){
            move_uploaded_file($_FILES['csvfile']['tmp_name'], FILEOUTPUT);
        } else {
            echo "¡ERROR!";
            exit;
        }


        $ExcelExport = new ExcelExport($db);
        
        ### LEER EL ARCHIVO EXCEL
        $ExcelExport->convertExcelFile(FILEOUTPUT);
        

    }


?>






