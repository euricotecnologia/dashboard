<?php

class dadosLogin
{
  public $Fantasia;
  public $Razao;
  public $cnpj;
  public $email;
  public $json;
  public $ultimaAtualizacao;
  public $pass;
}

class retornoLogin
{
  public $RetornoDados;
}



use Illuminate\Http\Request;

function logando($login, $senha)
{
  $dados = new retornoLogin;
 

  $conecta = mysqli_connect("localhost", "usuario do banco", "senha do banco","nome do banco") 
  or print (mysqli_error($conecta));

  $query               =  "SELECT pass,CNPJ,razao_social,fanstasia,email,JSON_APP,ULTIMA_ATUALIZACAO_APP,proprietario FROM CADASTRO_EMPRESA WHERE email = '$login' and pass = '$senha'";
  $verifica_cliente    =  mysqli_query($conecta,$query) or print (mysqli_error($conecta));
  $dados->RetornoDados =  mysqli_fetch_assoc($verifica_cliente);
  mysqli_close($conecta);

  $dados->RetornoDados =  json_encode($dados->RetornoDados);
  return $dados;
}



function alterarSenha($cnpj,$novaSenha){
  $conecta = mysqli_connect("localhost", "usuario do banco", "senha do banco","nome do banco") 
  or print (mysqli_error($conecta));

  $query     =  "UPDATE CADASTRO_EMPRESA SET pass = '$novaSenha' WHERE  CNPJ = '$cnpj'";
  $altera    =  mysqli_query($conecta,$query) or print (mysqli_error($conecta));
  $registro  = mysqli_affected_rows($conecta);
  mysqli_close($conecta);

  return $registro; 

}


function refresh ($cnpj) 
{
  $dados = new retornoLogin;
  $conecta = mysqli_connect("localhost", "usuario do banco", "senha do banco","nome do banco") 
  or print (mysqli_error($conecta));

  $query               =  "SELECT CNPJ,razao_social,fanstasia,email,JSON_APP,ULTIMA_ATUALIZACAO_APP,proprietario,pass FROM CADASTRO_EMPRESA WHERE email = '$cnpj'";
  $verifica_cliente    =  mysqli_query($conecta,$query) or print (mysqli_error($conecta));
  $dados->RetornoDados =  mysqli_fetch_assoc($verifica_cliente);
  mysqli_close($conecta);

  $dados->RetornoDados =  json_encode($dados->RetornoDados);
  return $dados;

}


function recuperaSenha ($email){

  $conecta = mysqli_connect("localhost", "usuario do banco", "senha do banco","nome do banco") 
  or print (mysqli_error($conecta));

  $query               =  "SELECT pass FROM CADASTRO_EMPRESA WHERE email = '$email'";
  $verifica_cliente    =  mysqli_query($conecta,$query) or print (mysqli_error($conecta));
  $senha               =  mysqli_fetch_assoc($verifica_cliente);
  $registro  = mysqli_affected_rows($conecta);
  mysqli_close($conecta);


  if ($registro >0){
    return $senha['pass'];
    
  } else 
     {
       return "1";
     }
}

function formatarCNPJ($value)
{
  $cnpj_cpf = preg_replace("/\D/", '', $value);

  if (strlen($cnpj_cpf) === 11) {
    return preg_replace("/(\d{3})(\d{3})(\d{3})(\d{2})/", "\$1.\$2.\$3-\$4", $cnpj_cpf);
  }

  return preg_replace("/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/", "\$1.\$2.\$3/\$4-\$5", $cnpj_cpf);
}










