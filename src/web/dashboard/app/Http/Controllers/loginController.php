<?php

namespace App\Http\Controllers;

include('apiController.php');

use Illuminate\Http\Request;

class dados_usuario
{
  public $email;
  public $senha;
}

class retorno
{
  public $json;
  public $update;
}

class loginController extends Controller
{


  public function logar()
  {
    session_start(); 
    $dados          =  new dados_usuario;
    $dados->email   =  $_POST["login"];
    $dados->senha   =  $_POST["senha"];
    $resultado      =  logando($dados->email,$dados->senha);
    json_encode($resultado);
    
    $data =  $resultado->RetornoDados;
    $data  = json_decode($data);
 
    if  ($resultado->RetornoDados == 'null' | $resultado->RetornoDados == '')
      {          
        echo '401';   
    } else
      {  
        if ($data->JSON_APP == "null" | $data->JSON_APP == "") 
           {
             echo '404';
           } else
               {
                $_SESSION['cnpj']             = formatarCNPJ($data->CNPJ);
                $_SESSION['email']            = $data->email;
                $_SESSION['json']             = $data->JSON_APP;
                $_SESSION['fantasia']         = $data->fanstasia; 
                $_SESSION['razao']            = $data->razao_social; 
                $_SESSION['ultimaAtualizao']  = $data->ULTIMA_ATUALIZACAO_APP;      
                $_SESSION['proprietario']     = $data->proprietario;  
                $_SESSION['pass']             = $data->pass;

                echo '200';
               }      
      }

      
  }



 public function alterPass()
 {
  session_start(); 
   $senhaAtual =  $_POST["passAtual"]; 
   $NovaSenha  = $_POST["passNova"]; 

   if ($senhaAtual  <> $_SESSION['pass']) {   
       echo '401'; // Senha invalida
   } else  
       {   
         if (trim($NovaSenha) <> null ){
            $resultado = alterarSenha(preg_replace('/[^0-9]/', '',$_SESSION['cnpj']), $NovaSenha);
             
            if ($resultado == 1){
              $_SESSION['pass'] = $NovaSenha;   
              echo '200';
            }else
             {
                echo '501';
             }
         } else 
             {
              echo '204';
             }
       }
 }
 

  public function refresh()
  { 
    session_start(); 
    $resultado      =  refresh($_SESSION['email']);
    
    json_encode($resultado);
    
    $data =  $resultado->RetornoDados;
    $data  = json_decode($data);
 
    if  ($resultado->RetornoDados == 'null' | $resultado->RetornoDados == '')
      {          
        echo '401';   
    } else
      {  
        if ($data->JSON_APP == "null" | $data->JSON_APP == "") 
           {
             echo '404';
           } else
               {
                $_SESSION['cnpj']             = formatarCNPJ($data->CNPJ);
                $_SESSION['email']            = $data->email;
                $_SESSION['json']             = $data->JSON_APP;
                $_SESSION['fantasia']         = $data->fanstasia; 
                $_SESSION['razao']            = $data->razao_social; 
                $_SESSION['ultimaAtualizao']  = $data->ULTIMA_ATUALIZACAO_APP;      
                $_SESSION['proprietario']     = $data->proprietario; 
                $_SESSION['pass']             = $data->pass;
                echo '200';
               }      
      }

  }

  public function index($page)
  {
    if (view()->exists($page)) {
      session_start();
      if (isset($_SESSION['cnpj'])) {
  
        return view($page);
      } else {
        return view('login');
      }
    } else {
      return view('404');
    }
  }

  public function dashboard()
  {
    return redirect('/dashboard');
  }


  public function sair()
  {
    session_start();
    session_destroy();
    return view('login');
  }

 public function recoverypass(){
   $email =  $_POST["email"];   
      
   $resultado = recuperaSenha($email);
  
   if ($resultado <> '1' ){    
       
       $resultado = $resultado;
       $email = file_get_contents('');
      
       if ($email == '200'  )  {
           echo '200';

       } else   
           {
             echo '501';
           }
   } else
      {
          echo '404';
      }
}


 public function data()
  {
    $dados          =  new retorno;  
    session_start();
    $dados->json     =  $_SESSION['json'];
    $dados->update   =  $_SESSION['ultimaAtualizao'];
   
    echo json_encode($dados);
  }





}



 








