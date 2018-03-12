<?php 

class ExcelExport {

    public $db;

    function __construct($db) {
        $this->db = $db;
    }

    public function convertExcelFile($file) {

        $nombre_archivo = $file;
        $archivo = fopen($nombre_archivo,'r');

        # LEE ARCHIVO
        $i = 1;
        $arr_checkout = array();

        while ($linea = fgets($archivo)) {

            
            # 
            if ($i === 3) {

                $cell = explode(',', $linea);

                $periodo = explode(' ~ ', $cell[6]);
                $periodo_inicia = $periodo[0];
                $periodo_finaliza = $periodo[1];

                $fecha_actual = $cell[18];
            }

            # 
            if ($i === 4) {

                $cell = explode(',', $linea);

                $arr_dias = array();

                $date = explode('-', $periodo_inicia);
                $anio = $date[0];
                $mes = $date[1];

                foreach ($cell as $key => $value) {
                    if (trim($cell[$key]) !== '' && is_numeric($cell[$key])) {

                        array_push($arr_dias, $anio.'-'.$mes.'-'.$cell[$key]);
                    }
                }

                echo "<pre>";
                echo "Días a Importar"
                print_r($arr_dias);
                echo "</pre>";

            }

            # 
            if ($i >= 5) {

                echo "i%2 ".($i%2)."<br>";

                // LINEA IMPAR
                if ($i%2 === 1) {
                    $cell = explode(',', $linea);
                    $idlector = $cell[4];
                    $empleado = $cell[10];
                    $area = $cell[21];

                    /*
                    $queryPersona = "INSERT INTO persona(`idpersona`, `nombre`, `sexo_idsexo`, `ciudad_idciudad`) VALUES (NULL, '$empleado', 2, 1)"; 

                    $this->db->exec($queryPersona);
                    $lastInsertP = $this->db->lastInsertId();

                    if ($lastInsertP > 0){

                            $queryArea = "INSERT INTO area(idarea, nombre) VALUES (NULL, '$area')"; 
                           
                            $this->db->exec($queryArea);
                            $lastInsertA = $this->db->lastInsertId();
                            if ($lastInsertA > 0){

                                echo "<br>SI empleado <br>"

                                $queryEmpleado = "INSERT INTO empleado(idempleado, persona_idpersona, idlector, area_idarea) VALUES (NULL, $lastInsertP, $idlector, $lastInsertA)"; 
        
                                $this->db->exec($queryEmpleado);
                                $lastInsertE = $this->db->lastInsertId();
                                if ($lastInsertE > 0){

                                    echo "<br>SI empleado <br>";

                                } else {
                                    echo "<br>NO empleado <br>".$queryEmpleado."<br>";
                                }

                            } else {
                                echo "<br>NO area <br>".$queryArea."<br>";
                            }
                                
                    } else {
                        echo "<br>NO persona <br>".$queryPersona."<br>";
                    }
                    */

                    #
                    $query = "SELECT idempleado FROM `empleado` WHERE idlector = $idlector"; 

                    $consulta = $this->db->prepare( $query );
                    $consulta->execute();
                    $resultado = $consulta->fetchAll(PDO::FETCH_ASSOC);


                    if ($resultado[0]['idempleado']) {
                        $idempleado = $resultado[0]['idempleado'];

                    } 
                    /*
                    else {

                        
                        $queryP = "SELECT idpersona FROM `persona` WHERE nombre = '$empleado'"; 

                        $consultaP = $this->db->prepare( $queryP );
                        $consultaP->execute();
                        $resultadoP = $consultaP->fetchAll(PDO::FETCH_ASSOC);


                        if ($resultadoP[0]['idpersona']) {

                            $queryA = "SELECT idarea FROM `area` WHERE nombre = '$area'"; 
                            $consultaA = $this->db->prepare( $queryA );
                            $consultaA->execute();
                            $resultadoA = $consultaA->fetchAll(PDO::FETCH_ASSOC);
                            if ($resultadoA[0]['idarea']) {


                                $queryEmpleado = "INSERT INTO empleado(idempleado, persona_idpersona, idlector, area_idarea, si_user_idsi_user) VALUES (NULL, ".$resultadoP[0]['idpersona'].", $idlector, ".$resultadoA[0]['idarea'].", 1)"; 
        
                                echo "<br>EMPLEADO <br>".$queryEmpleado."<br>";
                                $this->db->exec($queryEmpleado);
                                $lastInsertE = $this->db->lastInsertId();
                                if ($lastInsertE > 0) {

                                    
                                    $idempleado = $lastInsertE;
                                    
                                    echo "<br>SI empleado <br>".$queryEmpleado."<br>";
                                } else {

                                    echo "<br>NO empleado <br>".$queryEmpleado."<br>";

                                }

                            }

                        }

                    }
                    */
                }

                // LINEA PAR
                if ($i%2 === 0) {
                    $cell = explode(',', $linea);

                    foreach ($cell as $key => $value) {
                        if (trim($cell[$key]) !== '') {

                            $arr_horas = str_split($cell[$key], 5);

                            array_push($arr_checkout, array('idempleado' => $idempleado, 'idlector' => $idlector, 'fecha' => $arr_dias[$key], 'horas' => $arr_horas));
                        }
                    }
                }
            }
            $i++;
        }

        foreach ($arr_checkout as $key => $value) {
            if ($arr_checkout[$key]['fecha'] !== '') {

                $estado = 1; // ENTRA
                foreach ($arr_checkout[$key]['horas'] as $keyHora => $valueHora) {

                    $query = "INSERT INTO `checkout` (`idcheckout`, `empleado_idempleado`, `fecha`, `horaEntra`, `checkoutestado_idcheckoutestado`) 
                    VALUES (NULL, '".$arr_checkout[$key]['idempleado']."', '".$arr_checkout[$key]['fecha']."', '".$arr_checkout[$key]['horas'][$keyHora]."', '$estado') ON DUPLICATE KEY UPDATE horaEntra = '".$arr_checkout[$key]['horas'][$keyHora]."', checkoutestado_idcheckoutestado = '$estado';";

                    $db = $this->db;
                    $db->exec($query);
                    $lastInsert = $db->lastInsertId();

                    if ($lastInsert > 0){
                        echo "<br>.<br>";
                    } else {
                        echo "<br>NO SE INSERTÓ EL REGISTRO:<br>".$query."<br>";
                    }

                    $estado = ($estado === 1) ? 2 : 1;
                }

            }
        }

        echo "<pre>";
        print_r($arr_checkout);
        echo "</pre>";

    }

}

