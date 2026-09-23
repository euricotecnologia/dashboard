@extends('layouts.auth')

@section('content')


<!-- Styles -->
        <style>
             body {
                min-height: 100vh;
                background-color: #243949;
                color: #fff;
                background-image: url("https://uploaddeimagens.com.br/images/004/088/177/original/fundo1.jpg?1667441418");
            }
            .navbar-default {
                background-color: transparent;
                border: none;
            }
            .navbar-static-top {
                margin-bottom: 19px;
            }
            .navbar-default .navbar-nav>li>a {
                color: #fff;
                font-weight: 600;
                font-size: 15px
            }
            .navbar-default .navbar-nav>li>a:hover{
                color: #ccc;
            }
            .navbar-default .navbar-brand {
                color: #ccc;
            }
        </style>

    <!-- logo -->
    <div id="logo">
        <img class="logo" src="{{ url('assets/media/image/logo.png') }}" alt="image">
        <img class="logo-dark" src="{{ url('assets/media/image/logo-dark.png') }}" alt="image">
    </div>
    <!-- ./ logo -->
   <br>
   <br>

    <!-- form -->
    <form id="relizaLogin" onsubmit="logar()" method="post">
    <meta name="_token" content="{{ csrf_token() }}">
        <div class="form-group">
            <input id="login" type="email" class="form-control" placeholder="Seu E-mail" required autofocus>
        </div>
        <div class="form-group">
            <input id="senha" type="password" class="form-control" placeholder="Sua senha" required>
        </div>
        <div class="form-group d-flex justify-content-between">    
        </div>
        <button id="btLogar" class="btn btn-primary btn-block" >
        <span id="carregar" ></span>
          Entrar
        </button>

        <hr>
        <p class="text-muted">Esqueceu a senha?</p>
        <a href="{{ route('recuperar-senha') }}" class="btn btn-outline-light btn-sm">Recuperar senha</a>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <p class="text-muted">seusite.com.br</p>
    </form>
    <!-- ./ form -->

@endsection
