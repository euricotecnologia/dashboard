<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Seja bem vindo(a)</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="{{ url('assets/media/image/favicon.png') }}"/>

    <!-- Plugin styles -->
    <link rel="stylesheet" href="{{ url('vendors/bundle.css') }}" type="text/css">

    @yield('head')

    <!-- App styles -->
    <link rel="stylesheet" href="{{ url('assets/css/app.min.css') }}" type="text/css">
</head>
<body @if (trim($__env->yieldContent('bodyClass'))) class="@yield('bodyClass')" @endif>

<!-- begin::preloader-->
<div class="preloader">
    <div class="preloader-icon"></div>
</div>
<!-- end::preloader -->

<!-- BEGIN: Sidebar Group -->
<div class="sidebar-group">

    <!-- BEGIN: User Menu -->
    <div class="sidebar" id="user-menu">
        <div class="py-4 text-center" >
            <figure class="avatar avatar-lg mb-3 border-0">
                <img src="{{ url('assets/media/image/user/women_avatar1.jpg') }}" class="rounded-circle" alt="image">
            </figure>
            <h5 class="d-flex align-items-center justify-content-center">{{$_SESSION['proprietario']}}</h5>
            <div>
                <strong> </strong>
            </div>
        </div>
        <div class="card mb-0 card-body ">
            <div class="mb-4">
                <div class="list-group list-group-flush">
                    <a  class="list-group-item p-l-r-0">{{$_SESSION['cnpj']}}</a>
                    <a  class="list-group-item p-l-r-0 d-flex">{{$_SESSION['razao']}}</a>
                    <a  class="list-group-item p-l-r-0 d-flex">{{$_SESSION['email']}}</a>
                    <a href="{{ route('alterar') }}" class="list-group-item p-l-r-0 d-flex">Alterar senha</a>


                    <a href="{{ route('sair') }}" class="list-group-item p-l-r-0 text-danger">Sair</a>
                </div>
            </div>
 
            <div class="mb-4">
                <h6>Estamos nas redes :)</h6>
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a href="https://seusite.com.br/" class="btn btn-sm btn-floating btn-facebook">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="https://seusite.com.br/" class="btn btn-sm btn-floating btn-instagram">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="https://seusite.com.br/" class="btn btn-sm btn-floating btn-dribbble">
                            <i class="fa fa-dribbble"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a href="https://api.whatsapp.com/send?phone=55999999999&text=Olá, preciso de suporte." class="btn btn-sm btn-floating btn-whatsapp">
                            <i class="fa fa-whatsapp"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


</div>
<!-- END: Sidebar Group -->

<!-- begin::main -->
<div class="layout-wrapper">
<meta name="_token" content="{{ csrf_token() }}">

    <!-- begin::header -->
    <div class="header d-print-none">

        <div class="header-left">
            <div class="navigation-toggler">
                <a href="#" data-action="navigation-toggler">
                    <i data-feather="menu"></i>
                </a>
            </div>
            <div class="header-logo">
                <a href="{{ url('/') }}">
                    <img class="logo" src="{{ url('assets/media/image/logo.png') }}" alt="logo">
                </a>
            </div>
        </div>

        <div class="header-body">
       
            <div class="header-body-left">
                <div class="page-title">
                    <h4>@yield('pageTitle')</h4>
                </div>
            </div>
            <div class="header-body-right">

                <ul class="navbar-nav">


                <li class="nav-item">
                <button type="button" id="updater" class="btn btn-outline-success">Atualizar informações</button>     
                 </li>

                    <!-- begin::header fullscreen -->
                    <li  class="nav-item dropdown">
                        <a href="#" class="nav-link" title="Fullscreen" data-toggle="fullscreen">
                            <i class="maximize" data-feather="maximize"></i>
                            <i class="minimize" data-feather="minimize"></i>
                        </a>
                    </li>
                    <!-- end::header fullscreen -->


           
                    <!-- begin::user menu -->
                    <li class="nav-item dropdown">
                        <a href="#" class="nav-link" title="User menu" data-sidebar-target="#user-menu">
                            <span class="mr-2 d-sm-inline d-none">{{$_SESSION['fantasia']}}</span>
                            <figure class="avatar avatar-sm">
                                <img src="{{ url('assets/media/image/user/women_avatar1.jpg') }}" class="rounded-circle"
                                     alt="avatar">
                            </figure>
                        </a>
                    </li>
                    <!-- end::user menu -->

                </ul>

                <!-- begin::mobile header toggler -->
                <ul class="navbar-nav d-flex align-items-center">
                    <li class="nav-item header-toggler">
                        <a href="#" class="nav-link">
                            <i data-feather="arrow-down"></i>
                        </a>
                    </li>
                </ul>
                <!-- end::mobile header toggler -->
            </div>
        </div>

    </div>
    <!-- end::header -->

    <div class="content-wrapper">
        <!-- begin::navigation -->
        <div class="navigation">
            <div class="navigation-menu-body">
                <div class="navigation-menu-group">
                    <div id="ecommerce">
                        <ul>
                            <li class="navigation-divider d-flex align-items-center">
                                
                                      
                            <img src="{{ url('assets/media/image/user/timer.png') }}">
                                      <i  id="ultimoUpdate1"class="mr-2">....</i> 

                            </li>
                            <li>
                                <a  @if(!request()->segment(1) || request()->segment(1) == 'dashboard') class="active"
                                   @endif href="{{ route('dashboard') }}">Dashboard</a></li>
                            <li>
                                <a @if(request()->segment(1) == 'pagar') class="active"
                                   @endif href="{{ route('pagar') }}">Contas á pagar</a></li>
                            <li>
                                <a @if(request()->segment(1) == 'receber') class="active"
                                   @endif href="{{ route('receber') }}">Contas á receber</a></li>
                            <li>
                                <a @if(request()->segment(1) == 'caixas') class="active"
                                   @endif href="{{ route('caixas') }}">Caixas Abertos</a></li>

                                   <li>
                                <a @if(request()->segment(1) == 'vendas') class="active"
                                   @endif href="{{ route('vendas') }}">Minhas vendas</a></li>

                            <li>
                                <a   @if(request()->segment(1) == 'vendedores') class="active"
                                   @endif href="{{ route('vendedores') }}">Vendedores</a></li>

                            <li>
                                <a  style="display: none;"   @if(request()->segment(1) == 'alterar') class="active"
                                   @endif href="{{ route('alterar') }}"></a></li>

       
                            <li class="navigation-divider"></li>
                            <li>
                                <a  class="d-flex align-items-start">
                                    <div>
                                        <figure  class="avatar mr-3">
                                        <img src="{{ url('assets/media/image/user/cliente.png') }}">         
                                </span>
                                        </figure>
                                    </div>
                                    <div>
                                        <h6>Clientes</h6>
                                        <h4 id="numeroClientes" class="mb-0 font-weight-bold">....</h4>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a  class="d-flex align-items-start">
                                    <div>
                                    <figure  class="avatar mr-3">
                                        <img src="{{ url('assets/media/image/user/produtos.png') }}">         
                                </span>
                                        </figure>
                                    </div>
                                    <div>
                                        <h6>Produtos</h6>
                                        <h4 id="numeroProdutos" class="mb-0">....</h4>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a  class="d-flex align-items-start">
                                    <div>
                                    <figure  class="avatar mr-3">
                                        <img src="{{ url('assets/media/image/user/fornecedor.png') }}">         
                                </span>
                                        </figure>
                                    </div>
                                    <div>
                                        <h6>Fornecedores</h6>
                                        <h4 id="numeroFornecedores" class="mb-0">....</h4>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a  class="d-flex align-items-start">
                                    <div>
                                    <figure  class="avatar mr-3">
                                        <img src="{{ url('assets/media/image/user/usuarios.png') }}">         
                                </span>
                                        </figure>
                                    </div>
                                    <div>
                                        <h6>Usuários</h6>
                                        <h4 id="numeroUsuarios" class="mb-0">....</h4>
                                    </div>
                                </a>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
        </div>
        <!-- end::navigation -->

        <div class="content-body">

            <div class="content">

                @yield('content')
                
            </div>

            <!-- begin::footer -->
            <footer class="content-footer">
                <div>© {{ date('Y') }} <a target="_blank">seusite.com.br</a></div>
                <div>
                    <nav class="nav">
                        <a href="https://seusite.com.br/" class="nav-link">Fale conosco</a>
                        <a href="https://seusite.com.br/" class="nav-link">Precisa de ajuda ?</a>
                    </nav>
                </div>
            </footer>
            <!-- end::footer -->

        </div>

    </div>

</div>
<!-- end::main -->

<!-- Plugin scripts -->
<script src="{{ url('vendors/bundle.js') }}"></script>


@yield('script')

<!-- App scripts -->
<script src="{{ url('assets/js/app.min.js') }}"></script>
<script src="{{ url('assets/js/functions.js') }}"></script>
<script src="{{ url('assets/js/moment.min.js') }}"></script>

</body>
</html>
