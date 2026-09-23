@extends('layouts.app')

@section('pageTitle', 'Alterar senha')

@section('head')
    <!-- Datatable -->
    <link rel="stylesheet" href="{{ url('vendors/dataTable/datatables.min.css') }}" type="text/css">
@endsection

@section('content')

<div class="page-header">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ url('/') }}">Inicio</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Alterar minha senha</li>
            </ol>
        </nav>
    </div>

    <div class="row">
        <div class="col-md-8">
        <meta name="_token" content="{{ csrf_token() }}">
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <div class="card">
                        <div class="card-body">
                        <form onsubmit="alterarSenha()" method="post" >
                        <small id="emailHelp" class="form-text text-muted">É recomendavel usar uma senha forte que você não esteja usando em outro lugar
        </small>
        <br>
    <div class="form-group">
        <label for="exampleInputEmail1">Senha atual*</label>
        <input type="password" class="form-control" id="senhaAtual"
               aria-describedby="emailHelp" placeholder="">

    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Nova senha*</label>
        <input type="password" class="form-control" id="novaSenha" placeholder="">
    </div>

    <div class="form-group">
        <label for="exampleInputPassword1">Digite novamente*</label>
        <input type="password" onkeyup="verficaSenha();" class="form-control" id="ConfirmaSenha"
               placeholder="">
    </div>
    <button id="mudaSenha" disabled="disabled" type="submit" class="btn btn-primary">Salvar alterações</button>
</form>
                    
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    


    
@endsection

@section('script')
<script src="{{ url('/vendors/charts/apex/apexcharts.min.js') }}"></script>

<script src="{{ url('/assets/js/functions.js') }}"></script>
<script src="{{ url('/assets/js/examples/dashboard.js') }}"></script>


    <!-- To use theme colors with Javascript -->
    <div class="colors">
        <div class="bg-primary"></div>
        <div class="bg-primary-bright"></div>
        <div class="bg-secondary"></div>
        <div class="bg-secondary-bright"></div>
        <div class="bg-info"></div>
        <div class="bg-info-bright"></div>
        <div class="bg-success"></div>
        <div class="bg-success-bright"></div>
        <div class="bg-danger"></div>
        <div class="bg-danger-bright"></div>
        <div class="bg-warning"></div>
        <div class="bg-warning-bright"></div>
    </div>

@endsection


