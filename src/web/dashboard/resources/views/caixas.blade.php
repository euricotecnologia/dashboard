@extends('layouts.app')

@section('pageTitle', 'Caixas Abertos')

@section('head')
    <!-- Range slider -->
    <link rel="stylesheet" href="{{ url('vendors/range-slider/css/ion.rangeSlider.min.css') }}" type="text/css">
@endsection

@section('content')
<div class="page-header justify-content-between">
<meta name="_token" content="{{ csrf_token() }}">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ url('/') }}">Inicio</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Caixas abertos</li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
            <?php
           $arr              = $_SESSION['json'];
           $j                = json_decode($arr);
           $caixasAbertos    = 'caixasAbertos'; 
           $data             =  $j->$caixasAbertos; 
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
                                            <span>Hora abertura:</span>
                                            <span><?= $value->horaAbertura; ?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Data abertura:</span>
                                            <span><?= $value->dataAbertura;?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Saldo inicial:</span>
                                            <span><?= 'R$ '.number_format($value->saldoInicial, 2, ',', '.' );?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Saldo atual:</span>
                                            <span><?= 'R$ '.number_format($value->saldoAtual, 2, ',', '.' );?></span>
                                        </li>
                                       
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Entradas:</span>
                                            <span><?= 'R$ '.number_format($value->Entradas, 2, ',', '.' );?></span>
                                        </li>
                                       
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Saidas:</span>
                                            <span><?= 'R$ '.number_format($value->saidas, 2, ',', '.' );?></span>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="card border shadow-none">
                                <div class="card-body pt-2 pb-2 text-muted">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Dinheiro:</span>
                                            <span><?= 'R$ '.number_format($value->dinheiro, 2, ',', '.' );?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Crédito:</span>
                                            <span><?= 'R$ '.number_format($value->credito, 2, ',', '.' );?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Débito:</span>
                                            <span><?= 'R$ '.number_format($value->debito, 2, ',', '.' );?></span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Pix:</span>
                                            <span><?= 'R$ '.number_format($value->cheque, 2, ',', '.' );?></span>
                                        </li>
                                       
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Convenio:</span>
                                            <span><?= 'R$ '.number_format($value->convenio, 2, ',', '.' );?></span>
                                        </li>
                                       
                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>Refeição:</span>
                                            <span><?= 'R$ '.number_format($value->vRefeicao, 2, ',', '.' );?></span>
                                        </li>

                                        <li class="list-group-item d-flex justify-content-between pl-0 pr-0">
                                            <span>á prazo:</span>
                                            <span><?= 'R$ '.number_format($value->vCombustivel, 2, ',', '.' );?></span>
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

   
    <script src="{{ url('/assets/js/examples/dashboard.js') }}"></script>


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

