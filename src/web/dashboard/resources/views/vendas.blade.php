@extends('layouts.app')

@section('pageTitle', 'Minhas vendas')

@section('head')
    <!-- Datatable -->
    <link rel="stylesheet" href="{{ url('vendors/dataTable/datatables.min.css') }}" type="text/css">
@endsection

@section('content')

<div class="page-header">
<meta name="_token" content="{{ csrf_token() }}">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="{{ url('/') }}">Inicio</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">Minhas vendas</li>
            </ol>
        </nav>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Total de Vendas concluídas</p>
                                    <h2 id="totalVendas" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/money_bag.png') }}" alt="Uma imagem impressionante">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-success d-inline-flex align-items-center mr-2">
                                <p id="mesAno" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Quantidade de vendas concluidas</p>
                                    <h2 id="quantidadeVendas" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/quanVendas.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p id="mesAnoQuantidadeVendas" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Total em descontos aplicados</p>
                                    <h2  id="totalDescontos" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/descontos.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-success d-inline-flex align-items-center mr-2">
                                <p id="lucrosUpdate" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Ticket médio</p>
                                    <h2 id="ticketmedio" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/ticket.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p id="saldosUpdate" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Tempo médio por atendimento</p>
                                    <h2 id="medioAtendimentos" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/tempo.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p id="updateFormasPagamento" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Quantidade de produtos vendidos</p>
                                    <h2 id="produtosVendidos" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/produtosVendidos.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p  id="updateTopProdutos" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Valor total vendas de vendas canceladas</p>
                                    <h2 id="totalVendasCanceladas" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/vendasCanceladas.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p id="saldosUpdate2" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Quantidade de vendas canceladas</p>
                                    <h2  id="quantidadeVendasCanceladas" class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/quantidadeCanceladas.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p id="updateFormasPagamento2" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between mb-3">
                                <div>
                                    <p class="text-muted">Quantidade de produtos cancelados</p>
                                    <h2 id="quantidadeProdutosCancelados"  class="font-weight-bold">....</h2>
                                </div>
                                <div>
                                <figure class="avatar">
                                      <img src="{{ url('assets/media/image/user/produtosCancelados.png') }}">
                                    </figure>
                                </div>
                            </div>
                            <div class="d-inline-flex align-items-center">
                                <span class="text-danger d-inline-flex align-items-center mr-2">
                                <p id="updateTopProdutos2" class="text-muted"></p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    
    <div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-md-flex mb-2 mb-sm-0 justify-content-between">
                        <h6 class="card-title">Meu histórico de lucros</h6>
                    </div>
                    <div id="graficoLucros"></div>
                </div>
            </div>
        </div>
        
        <div class="col-lg-4 col-md-12">
            <div class="card">

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

@section('script')

@endsection
