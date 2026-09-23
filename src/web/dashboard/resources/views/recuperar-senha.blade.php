@extends('layouts.auth')

@section('content')

    <!-- logo -->
    <div id="logo">
        <img class="logo" src="{{ url('assets/media/image/logo.png') }}" alt="image">
    </div>
    <!-- ./ logo -->
    <h5>Recuperar senha</h5>
    <form onsubmit="recuperarSenha()" method="post" >
    <meta name="_token" content="{{ csrf_token() }}">
        <div class="form-group">
            <input id="email" type="email" class="form-control" placeholder="Insira seu E-mail" required autofocus>
        </div>
        <button id="btLogar" class="btn btn-primary btn-block" >
        <span id="carregar" ></span>
          Enviar senha
        </button>
        <hr>
        <p class="text-muted">Já tenho minha senha</p>
        <a href="{{ route('login') }}" class="btn btn-sm btn-outline-light ml-1">Entrar</a>
    </form>
@endsection
