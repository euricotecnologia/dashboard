@extends('layouts.app')

@section('pageTitle', 'Vendas por usuário')

@section('head')
    <!-- Slick css -->
    <link rel="stylesheet" href="{{ url('vendors/slick/slick.css') }}" type="text/css">
    <link rel="stylesheet" href="{{ url('vendors/slick/slick-theme.css') }}" type="text/css">
@endsection

@section('content')
<div class="page-header justify-content-between">
<meta name="_token" content="{{ csrf_token() }}">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ url('/') }}">Inicio</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Vendas por usuários</li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div id="tabelaVendedores" class="row">
            <?php
           $arr              = $_SESSION['json'];
           $j                = json_decode($arr);
           $lucrosPresumidos = 'lucrosPresumidos'; 
           $relatorioVendas  = 'relatorioVendas';
           $vendasUsuarios   = 'vendasUsuarios';
           $data             =  $j->$lucrosPresumidos->$relatorioVendas->$vendasUsuarios; 
            ?>
                <?php foreach($data as $key=>$value): ?>   
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex">
                                <div>
                                    <figure class="avatar mr-3">
                                        <span ></span>
                                        <img src="{{ url('assets/media/image/user/usuario.png') }}">

                                    </figure>
                                </div>
                                <div>
                                    <a><?= $value->usuario; ?></a>
                                    <p class="text-muted">Usuário</p>
                                </div>
                            </div>
                            <div class="card border shadow-none">
                                <div class="card-body pt-2 pb-2 text-muted">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Total em vendas:</span>
                                            <span><?= 'R$ '.number_format($value->totalVendas, 2, ',', '.');  ?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Comissões:</span>
                                            <span><?= 'R$ '.number_format($value->comissoes, 2, ',', '.' ); ?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Quantidade de vendas:</span>
                                            <span><?= $value->quantidadeVendas; ?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Produtos vendidos:</span>
                                            <span><?= $value->quantidadeProdutos; ?></span>
                                        </li>
                                       
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Tempo médio de atendimento:</span>
                                            <span><?= $value->tempoAtendimento; ?></span>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
@endsection
@section('script')


    <!-- Apex chart -->
    <script src="{{ url('/vendors/charts/apex/apexcharts.min.js') }}"></script>

    <!-- Dashboard scripts -->
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
