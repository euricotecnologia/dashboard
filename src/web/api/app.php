<?php
  
  $conecta = mysqli_connect("ip do banco", "usuario do banco", "senha do banco","nome do banco") or print (mysqli_error($conecta)); 
   
  $email               =  $_POST["email"];
  $json                =  $_POST["json"];
  $query               =  "UPDATE CADASTRO_EMPRESA SET ULTIMA_ATUALIZACAO_APP = DATE_SUB(NOW(),INTERVAL 3 HOUR), JSON_APP = '$json' where  email ='$email'"; 
  $contatos            =  mysqli_query($conecta,$query);
 
   
  $registro = mysqli_affected_rows($conecta);
 
  mysqli_close($conecta);

  echo $registro; 



 
?>



 

