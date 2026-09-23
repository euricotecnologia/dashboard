<?php


  
  $conecta = mysqli_connect("ip do banco", "usuario do banco", "senha do banco","nome do banco") or print (mysqli_error($conecta)); 
   
  $CNPJ                =  $_POST["CNPJ"];
  $razao_social        =  $_POST["razao_social"];
  $fantasia            =  $_POST["fantasia"];
  $proprietario        =  $_POST["proprietario"];
  $email               =  $_POST["email"];
  $pass                =  $_POST["pass"];
  $query               =  "INSERT INTO `CADASTRO_EMPRESA`(`CNPJ`, `razao_social`, `fanstasia`, `proprietario`, `email`, `pass`, `ULTIMA_ATUALIZACAO_APP`, `JSON_APP`) VALUES ('$CNPJ','$razao_social','$fantasia ','$proprietario','$email','$pass', DATE_SUB(NOW(),INTERVAL 3 HOUR),'')";
  $contatos            =  mysqli_query($conecta,$query);
   
  $registro = mysqli_affected_rows($conecta);
 
  mysqli_close($conecta);

  echo $registro; 


 
?>
