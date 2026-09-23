var baseUrl = "https://seusite.com.br/";



function logar() {
    document.getElementById("btLogar").innerText = "Aguarde...";
    document.getElementById("btLogar").disabled = true; 
    
    var parametros = [];
    parametros [0] = "login="+document.getElementById('login').value;
    parametros [1] = "&senha="+document.getElementById('senha').value;    
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST', baseUrl+"logar", true);
    xhr.setRequestHeader('X-CSRF-TOKEN', $('meta[name="_token"]').attr('content'));
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onloadend  = function () {
        resultado = this.responseText;
        resultado = resultado.trim();
        console.log(resultado);
       
          
        if (resultado == '401') {
            document.getElementById('senha').value = "" ;
            toastr.error('E-mail ou senha incorretos :(');
            document.getElementById("btLogar").disabled = false; 
            document.getElementById("btLogar").innerText = "Entrar";
            event.preventDefault();
        }


        if (resultado == '404') {
            document.getElementById('senha').value = "" ;
            toastr.warning('Não existe nenhum dado pra carregar :(');
            document.getElementById("btLogar").disabled = false;  
            document.getElementById("btLogar").innerText = "Entrar";
            event.preventDefault();
        }     
          

        if (resultado == '200') {
            window.location.href = baseUrl + "dashboard";
        }    
            event.preventDefault();
        }

        xhr.send(parametros.join(''));
        event.preventDefault();
    }




 function alterarSenha(){    
    var parametros = [];
    parametros [0] = "passAtual="+document.getElementById('senhaAtual').value;
    parametros [1] = "&passNova="+document.getElementById('novaSenha').value;    
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST', baseUrl+"alterpass", true);
    xhr.setRequestHeader('X-CSRF-TOKEN', $('meta[name="_token"]').attr('content'));
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onload = function () {
        resultado = this.responseText;
        resultado = resultado.trim();

        if (resultado == '401') {
            document.getElementById('senhaAtual').value = "" ;
            toastr.error('Oops sua senha está incorreta :(');
            event.preventDefault();
        }  
        
        if (resultado == '204') {
            document.getElementById('ConfirmaSenha').value = "" ;
            document.getElementById('novaSenha').value = "" ;

            toastr.error('Oops a nova senha está inválida :(');
            event.preventDefault();
        }  

        if (resultado == '200') {
            document.getElementById('ConfirmaSenha').value = "" ;
            document.getElementById('novaSenha').value = "" ;
            document.getElementById('senhaAtual').value = "" ;

            toastr.success('Tudo certinho, senha alterada :)');
            event.preventDefault();
        } 
       
    }

        xhr.send(parametros.join(''));
        event.preventDefault();   
 }   


 function recuperarSenha(){    
    document.getElementById("btLogar").innerText = "Aguarde...";
    document.getElementById("btLogar").disabled = true;  
    var parametros = [];
    parametros [0] = "email="+document.getElementById('email').value;
     
    var xhr = new XMLHttpRequest();
    xhr.open('POST', baseUrl+"recoverypass", true);
    xhr.setRequestHeader('X-CSRF-TOKEN', $('meta[name="_token"]').attr('content'));
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.onload = function () {
        resultado = this.responseText;
        resultado = resultado.trim();
        
        if (resultado == '200') {    
            document.getElementById("btLogar").disabled = false;  
            document.getElementById("btLogar").innerText = "Enviar senha";  
            swal("Tudo certinho", "Uma recuperação foi enviada para o E-mail informado","success").then(function() {
             window.location.href = baseUrl + "login";
         });
     }  

        if (resultado == '404') {    
            document.getElementById("btLogar").disabled = false;  
            document.getElementById("btLogar").innerText = "Enviar senha"; 
            toastr.error('Oops E-mail informado não existe por aqui :(');
            event.preventDefault();
         };
     }  

       
        xhr.send(parametros.join(''));
        event.preventDefault(); 
  
 }  



 function verficaSenha(){

   if (document.getElementById('ConfirmaSenha').value == document.getElementById('novaSenha').value){
       document.getElementById('mudaSenha').disabled=false;
   } else 
      {
        document.getElementById('mudaSenha').disabled=true;      
      }

   if (document.getElementById('novaSenha').value.length < 6)  {
    document.getElementById('mudaSenha').disabled=true;
   }
    
    if (document.getElementById('novaSenha').value.trim == '')
        {
            document.getElementById('mudaSenha').disabled=true;
        }
        
    if (document.getElementById('senhaAtual').value == document.getElementById('novaSenha').value) {
        document.getElementById('mudaSenha').disabled=true; 
    }   



};
















 




