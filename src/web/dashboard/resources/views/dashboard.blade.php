@extends('layouts.app')

@section('head')
    <!-- Slick -->
    <link rel="stylesheet" href="{{ url('/vendors/slick/slick.css') }}" type="text/css">
    <link rel="stylesheet" href="{{ url('/vendors/slick/slick-theme.css') }}" type="text/css">

    <!-- Daterangepicker -->
    <link rel="stylesheet" href="{{ url('vendors/datepicker/daterangepicker.css') }}" type="text/css">

    <!-- DataTable -->
    <link rel="stylesheet" href="{{ url('vendors/dataTable/datatables.min.css') }}" type="text/css">
@endsection

@section('pageTitle', 'Dashboard')

@section('content')

    <div class="page-header">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ url('/') }}">Inicio</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col-md-12">
        <meta name="_token" content="{{ csrf_token() }}">

            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Minhas Vendas</p>
                                    <h2  id="totalVendas2" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                    <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/money_bag.png') }}" alt="Uma imagem impressionante">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-success d-inline-flex align-items-center mr-2">
                                <p  id="mesAno" class="text-muted">Mês atual</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Quantidade de vendas</p>
                                    <h2 id="quantidadeVendas2" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/quanVendas.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p  id="mesAnoQuantidadeVendas" class="text-muted">Mês atual</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Meus lucros</p>
                                    <h2 id="meusLucros2" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/lucros.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-success d-inline-flex align-items-center mr-2">
                                <p id="lucrosUpdate"  class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    
    <div class="row">
        <div class="col-lg-8 col-md-12">
        <div class="card">
        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <h6 class="card-title">Fluxo do caixa</h6>
                                </div>
                            <p  id="saldosUpdate" class="text-muted"></p>
                            <div class="row">
                                <div class="col-lg-3 col-md-4 col-sm-12">
                                    <div class="d-flex align-items-start">
                                        <i class="fa fa-circle text-primary mr-2"></i>
                                        <div>
                                            <h2 id="entradacaixaAtual" class="font-weight-bold line-height-18"></h2>
                                            <div class="text-muted">Entradas</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-12">
                                    <div class="d-flex align-items-start">
                                        <i class="fa fa-circle text-secondary mr-2"></i>
                                        <div>
                                            <h2 id="saidacaixaAtual"  class="font-weight-bold line-height-18">....</h2>
                                            <div class="text-muted">Saídas</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-12">
                                    <div class="d-flex align-items-start">
                                        <i class="fa fa-circle text-success mr-2"></i>
                                        <div>
                                            <h2 id="saldocaixaAtual" class="font-weight-bold line-height-18">....</h2>
                                            <div class="text-muted">Saldo</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="graficoCaixa"></div>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <h6 class="card-title">Formas de pagamento</h6>
                        <div>
                        </div>
                    </div>
                    <div id="graficoFormasPagamento"></div>
                    <div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item pl-0 pr-0">
                                <i class="fa fa-circle mr-1 text-secondary"></i>Crédito
                            </li>
                            <li class="list-group-item pl-0 pr-0">
                                <i class="fa fa-circle mr-1 text-warning"></i>Pix
                            </li>
                            <li class="list-group-item pl-0 pr-0">
                                <i class="fa fa-circle mr-1 text-info"></i>Dinheiro
                            </li>
                            <li class="list-group-item pl-0 pr-0">
                                <i class="fa fa-circle mr-1 text-success"></i>Débito
                            </li>
                            <li class="list-group-item pl-0 pr-0">
                                <i class="fa fa-circle mr-1 text-danger"></i>á Prazo
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-lg-8 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-md-flex mb-2 mb-sm-0 justify-content-between">
                        <h6 class="card-title">Notas Fiscais Emitidas</h6>
                    </div>
                    <div id="graficoNotasFiscais"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-12">
            <div class="card">
                <div class="card-body pb-0">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <h6 class="card-title mb-0">Top Produtos mais vendidos</h6>
                    </div>
                </div>
    
            </div>
        </div>
    </div>
@endsection

@section('script')

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
