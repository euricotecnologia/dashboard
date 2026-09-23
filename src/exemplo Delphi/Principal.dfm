object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sincronizador - DeashBoard'
  ClientHeight = 522
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 522
    Align = alClient
    BevelOuter = bvNone
    Color = 16119285
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 951
    ExplicitHeight = 630
    object imageAcerto: TImage
      Left = -31
      Top = 27
      Width = 23
      Height = 25
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000014
        0000001408060000008D891D0D0000001974455874536F667477617265004164
        6F626520496D616765526561647971C9653C000002DB4944415478DAAC545D48
        1451143EF7CECFEECEB46E9A42D916BE842D0405A61508055114263D55448441
        2405154441FF7F5094F4F31091652F22415014848961D063592E1265C66A64E4
        EE0699893BEECCCECCDE99E6CE32A3EBAEBA0F1D986576CEF93EBE7BCE770FC0
        7F0E345BF2E6F00B5FC7DFF05ADD3496D3FF2CC2916D25ABDF9D58B25D2998B0
        31D28CBECAD1601AC8FE14D18F12308AA7E619C0633C669B79C4DE0F09C1684B
        E521736A1E4F27EC9787B74E18A95749A25E984E46837E530CED34ADA1B5332A
        A4CA68814452ED2698B8B07E2143643CBB56084B9F394A5D203D66D2506F144A
        4683D65A6A2F536CCE9169CF886984E622B17A07416EC1640B2C0CC56611D269
        D201CC35751ABB8B6BE1F6E20658E9AD704F4EB194C325A4D6C83780E9CA1A4A
        36D84F295B04FBE6AF8722EC730745395C42C767AE6C84A0822FCB51461F1AC3
        F2085C1D7C0C0932694787C326644CC439091FE6E158593D3495EF85903798A5
        8CBEC79551B838F808464435AB410E074B7F145996C1934994B3C5502B544280
        15E1D2C29D10516350232CB3735FC67FC0B5A12710F72601E1EC76DB1C8EC240
        8AEB072363F86F520C1E0C75804C5428B37A552B866C6531E58F4D161392F40E
        6637D8C206148BC321B480614631A2F6C83C2C74AA9FE0DEF776508966D7FF94
        7FC3B9481BC47D1339CAECE35AD852D61FCE5C4D2B3EB7BE21C13D356A9A832D
        16002316C3801A8751690C029C0867065A212ECA80985CCF9B6983708A79B66B
        E3F5EE2C637B74FC14125A9F6B2E6F46E9F981361815B5BCCAEC3A49EBB3B1F9
        B6CDBA9747AA13BCFE1CFBF920E298D9AF9D6EB94FD2A2019DDFF1B6EE4EF78C
        EB6B4DC7E155B2A9B5101F53CDFA3DD494390320920A58213D02E21BDFD7DDFD
        38E7823DD9F390EFFA153E655DFC7AC6CB0730CBF8E96AB15425D2296DDC873D
        9D9B17555D69AA3EA015BCB18F7F6846AFE3BDF3FC9C509436899F7EE3102325
        7439B1A9BC6AE256CD41331FEE9F000300F167418131FD860D0000000049454E
        44AE426082}
      Transparent = True
      Visible = False
    end
    object imageErro: TImage
      Left = -27
      Top = 76
      Width = 23
      Height = 25
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000014
        0000001408060000008D891D0D0000001974455874536F667477617265004164
        6F626520496D616765526561647971C9653C000002D24944415478DAAC545D48
        1451143EF3B33BEB82BA3B9B6D91101481F51494A5F64B186921BD1561F66849
        60A11158A016414861BD643F2F4529F856629994416626E8122915BDA9998AE5
        EE6CE3EEECCEECCEBDCDBDB2ABB3636E42078661BE73CE77CFCF3717E03F1B93
        2E20505F931B1F1FDD0A0CC3F01B367D12EB9B26564C38535E2662355A8F35B5
        1C105A6572B2EC2C6317DA1887E386B7B573322DE14CC5D1FD480EB682AEAF5B
        B6748E9B62B3DD95DEC7CF5EFC95909205033D8031F76F036374D625167B9F74
        BCB510923651481E3155C6F1007A3CB532008401304A9006D92CD7466F5B6780
        4E24114766B6988CAB3C0F5C751D00CF9BF9AA2F515FD23076D1DCC488933859
        C0229B5322C06E2B00EEDC65009B8D3E5C6D03C542D1A8E910922B355F73265B
        26D2503F0E9AE41088AA603F5303EEE2C380867D00B118B0DB0B41EAE902ED61
        0B880C4E1DC5DEB51DBD7DB41FAAB314131D02F8EF3543D038D3555C4A3179E0
        1DA806E6317C96A5BBC46CF2A684D86E17965AA2C799013ABFB0705ED3286668
        D3129BE0A084B37EBF222E25B5AA0B602BDC07727F2FE84A08DC078F00B2DB40
        BF7BD3428A94B09224E4F28B06F5BE37C0B14CE26F00EEEC456077EE01E97517
        6D93B82483C47DA8CCF073A0DF694A92EA868C267FFE92935BCEABBBEA57101A
        5B380E4170E23B48AF9E83FAA8053C1902B88DB9A90F6E53ECF7CCB4A94292BB
        FA5885CF24ECA192A286352C34F2ECBC92645583B891246638CC9745244A3BC9
        16E6C78E3086291D37E6777FB862D2A10ACC2D7F1C7D4E7C6709760B19DDBE81
        25C8E81F1651A749AE45D8BBBBFBE530C79FFC1156E6C8A9E98C56168E842282
        A394E45A0889ED7AF97E587366EE1853A23EC910361976AA118CF8C643E12F31
        4F4E01C9497B1F8ED45639A5A181131CCF9FB6C563F9AC11C630F35569BC6D08
        E9FAFD9C0325ED9B1BAE87577C63CF7DFBCA4E3E6D5F8F358DCD3D7E6A34336F
        0B5A2EFE8F00030007123F4D60FD3A460000000049454E44AE426082}
      Transparent = True
      Visible = False
    end
    object Label3: TLabel
      Left = 22
      Top = 11
      Width = 309
      Height = 28
      Caption = 'SINCRONIZADOR - DASHBOARD'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = Label3Click
    end
    object cxBtn_sync: TcxButton
      Left = 22
      Top = 464
      Width = 355
      Height = 41
      Caption = 'Sincronizar com banco web'
      TabOrder = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxBtn_syncClick
    end
    object GroupBox_log: TGroupBox
      Left = 392
      Top = 51
      Width = 289
      Height = 454
      Caption = 'Logs'
      TabOrder = 1
      object Memo_log: TMemo
        Left = 11
        Top = 21
        Width = 262
        Height = 420
        Alignment = taCenter
        BorderStyle = bsNone
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object PageControl1: TPageControl
    Left = 22
    Top = 51
    Width = 355
    Height = 390
    ActivePage = TabSheet1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Configura'#231#245'es'
      object lb_email: TLabel
        Left = 25
        Top = 141
        Width = 156
        Height = 17
        Caption = 'Email vinculado a empresa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object lb_api: TLabel
        Left = 25
        Top = 81
        Width = 91
        Height = 17
        Caption = 'Api envio Jason'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        StyleElements = [seClient, seBorder]
      end
      object pnEmail: TEdit
        Left = 25
        Top = 162
        Width = 304
        Height = 25
        Color = 8454143
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TextHint = 'Email'
      end
      object chkIniciarWindows: TCheckBox
        Left = 25
        Top = 10
        Width = 144
        Height = 17
        Caption = 'Iniciar com Windows '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object chkSincVendas: TCheckBox
        Left = 25
        Top = 41
        Width = 138
        Height = 28
        Caption = 'Sincronizar Vendas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object chkSincNFe: TCheckBox
        Left = 185
        Top = 46
        Width = 120
        Height = 17
        Caption = 'Sincronizar NFe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object GroupBox2: TGroupBox
        Left = 11
        Top = 257
        Width = 326
        Height = 91
        Caption = 'Sincronizar Autom'#225'tico'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object Label2: TLabel
          Left = 241
          Top = 40
          Width = 57
          Height = 17
          Caption = 'MINUTOS'
        end
        object Label1: TLabel
          Left = 129
          Top = 40
          Width = 45
          Height = 17
          Caption = 'A CADA'
        end
        object editMinutos: TEdit
          Left = 181
          Top = 37
          Width = 50
          Height = 26
          Alignment = taCenter
          BevelInner = bvLowered
          BevelKind = bkFlat
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = ANSI_CHARSET
          Font.Color = 16744448
          Font.Height = -19
          Font.Name = 'Century Gothic'
          Font.Style = [fsBold]
          Font.Quality = fqProof
          MaxLength = 3
          NumbersOnly = True
          ParentFont = False
          TabOrder = 0
          Text = '10'
        end
        object btn_ligar: TButton
          Left = 17
          Top = 30
          Width = 103
          Height = 39
          Caption = 'LIGAR'
          ImageIndex = 2
          ImageMargins.Left = 10
          Images = cxImageList1
          TabOrder = 1
          Visible = False
          OnClick = btn_ligarClick
        end
        object btnDesligar: TButton
          Left = 17
          Top = 30
          Width = 103
          Height = 39
          Caption = 'DESLIGAR'
          ImageIndex = 1
          ImageMargins.Left = 10
          Images = cxImageList1
          TabOrder = 2
          Visible = False
          OnClick = btnDesligarClick
        end
      end
      object edt_api: TEdit
        Left = 25
        Top = 104
        Width = 304
        Height = 25
        Color = 8454143
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        TextHint = 'Caminho da Api Jason'
      end
      object chk_notificacao: TCheckBox
        Left = 185
        Top = 10
        Width = 141
        Height = 17
        Caption = 'Notifica'#231#227'o do Sync'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'JSON'
      ImageIndex = 2
      object Memo1: TMemo
        Left = 10
        Top = 11
        Width = 343
        Height = 302
        Color = clYellow
        Lines.Strings = (
          '{'
          '  "notasFiscais": {'
          '    "TotalEnviadas": {'
          '      "janeiro": 3,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "TotalCanceladas": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "TotalContigencia": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    }'
          '  },'
          '  "vendas": {'
          '    "canceladas": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "concluidas": {'
          '      "janeiro": 3,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    }'
          '  },'
          '  "f_pagamentos": {'
          '    "dinheiro": 6465,'
          '    "credito": 0,'
          '    "debito": 0,'
          '    "pix": 0,'
          '    "prazo": 0'
          '  },'
          '  "caixa": {'
          '    "saldo": {'
          '      "janeiro": 6465,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "entradas": {'
          '      "janeiro": 6465,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "saidas": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "saldoAtual": 6465,'
          '    "EntradaAtual": 6465,'
          '    "SaidaAtual": 0'
          '  },'
          '  "cadastros": {'
          '    "produtos": "8560",'
          '    "clientes": "602",'
          '    "usuarios": "1",'
          '    "fornecedores": "40"'
          '  },'
          '  "contasReceber": {'
          '    "receber": {'
          '      "janeiro": 10.99,'
          '      "feveiro": 20.99,'
          '      "marco": 30.99,'
          '      "abril": 40.99,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "recebidas": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "vencidasAtual": 1.99,'
          '    "pendentesAtual": 2.99,'
          '    "pagasAtual": 3.99'
          '  },'
          '  "contasPagar": {'
          '    "pagas": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "pendendentes": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "vencidasAtual": 0,'
          '    "pendentesAtual": 0,'
          '    "pagasAtual": 0'
          '  },'
          '  "caixasAbertos": ['
          '    {'
          '      "usuario": "admin",'
          '      "horaAbertura": "10:34:31",'
          '      "dataAbertura": "20/10/2021",'
          '      "saldoInicial": 0,'
          '      "saldoAtual": 83935.68,'
          '      "Entradas": 83935.68,'
          '      "saidas": 0,'
          '      "dinheiro": 83935.68,'
          '      "credito": 0,'
          '      "debito": 0,'
          '      "cheque": 0,'
          '      "convenio": 0,'
          '      "vRefeicao": 0,'
          '      "vCombustivel": 0'
          '    }'
          '  ],'
          '  "topProdutos": ['
          '    {'
          '      "produto": "ARROZ PARBOLIZADO '
          'CAICARA",'
          '      "quantidade": "750"'
          '    },'
          '    {'
          '      "produto": "FD DE ARROZ CAICARA C '
          '10 '
          'K",'
          '      "quantidade": "120"'
          '    }'
          '  ],'
          '  "lucrosPresumidos": {'
          '    "ganhos": {'
          '      "janeiro": 2497.5,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "perdidos": {'
          '      "janeiro": 0,'
          '      "feveiro": 0,'
          '      "marco": 0,'
          '      "abril": 0,'
          '      "maio": 0,'
          '      "junho": 0,'
          '      "julho": 0,'
          '      "agosto": 0,'
          '      "setembro": 0,'
          '      "outubro": 0,'
          '      "novembro": 0,'
          '      "dezembro": 0'
          '    },'
          '    "relatorioVendas": {'
          '      "concluidas": {'
          '        "valorVendas": 6465,'
          '        "quantidadeVendas": 3,'
          '        "totalDescontos": 0,'
          '        "totalLucros": 2497.5,'
          '        "TicketMedio": 2155,'
          '        "TempoMedioAtendimento": '
          '"00:00:42",'
          '        "QuantidadeProdutosVendidos": 870'
          '      },'
          '      "canceladas": {'
          '        "valorVendas": 0,'
          '        "LurosPerdidos": 0,'
          '        "QuantidadeProdutosPerdidos": 0,'
          '        "QuantidadeVendasPerdidas": 0'
          '      },'
          '      "vendasUsuarios": ['
          '        {'
          '          "usuario": "admin",'
          '          "totalVendas": "6465",'
          '          "comissoes": "0",'
          '          "quantidadeVendas": 3,'
          '          "quantidadeProdutos": 870,'
          '          "tempoAtendimento": "00:00:42"'
          '        }'
          '      ]'
          '    }'
          '  }'
          '}')
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Empresa'
      ImageIndex = 4
      object GroupBox3: TGroupBox
        Left = 11
        Top = 3
        Width = 318
        Height = 342
        Caption = 'Dados da Empresa'
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 24
          Width = 87
          Height = 17
          Caption = 'Nome Fantasia'
          FocusControl = DBEdit_fantasia
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object Label6: TLabel
          Left = 16
          Top = 64
          Width = 74
          Height = 17
          Caption = 'Raz'#227'o Social'
          FocusControl = DBEdit_razao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object Label7: TLabel
          Left = 16
          Top = 104
          Width = 29
          Height = 17
          Caption = 'CNPJ'
          FocusControl = DBEdit_cnpj
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object Label8: TLabel
          Left = 16
          Top = 144
          Width = 157
          Height = 17
          Caption = 'Respons'#225'vel pela Empresa'
          FocusControl = DBEdit_responsavel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object Label9: TLabel
          Left = 16
          Top = 184
          Width = 31
          Height = 17
          Caption = 'Email'
          FocusControl = DBEdit_email
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object Label4: TLabel
          Left = 16
          Top = 226
          Width = 76
          Height = 17
          Caption = 'Api Cadastro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          StyleElements = [seClient, seBorder]
        end
        object DBEdit_fantasia: TDBEdit
          Left = 16
          Top = 40
          Width = 281
          Height = 21
          DataField = 'FANTASIA'
          DataSource = dsEmpresa
          TabOrder = 0
        end
        object DBEdit_razao: TDBEdit
          Left = 16
          Top = 80
          Width = 281
          Height = 21
          DataField = 'RAZAO'
          DataSource = dsEmpresa
          TabOrder = 1
        end
        object DBEdit_cnpj: TDBEdit
          Left = 16
          Top = 120
          Width = 281
          Height = 21
          CharCase = ecLowerCase
          DataField = 'CNPJ'
          DataSource = dsEmpresa
          TabOrder = 2
        end
        object DBEdit_responsavel: TDBEdit
          Left = 16
          Top = 161
          Width = 281
          Height = 21
          DataField = 'RESPONSAVEL_EMPRESA'
          DataSource = dsEmpresa
          TabOrder = 3
        end
        object DBEdit_email: TDBEdit
          Left = 16
          Top = 201
          Width = 281
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = dsEmpresa
          TabOrder = 4
        end
        object edt_api2: TEdit
          Left = 16
          Top = 246
          Width = 281
          Height = 25
          Color = 8454143
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          TextHint = 'Caminho Api de Cadastro'
        end
        object cxButton_enviar_empresa: TcxButton
          Left = 16
          Top = 288
          Width = 280
          Height = 33
          Caption = 'Enviar dados da Empresa'
          TabOrder = 6
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = cxButton_enviar_empresaClick
        end
      end
    end
  end
  object banco: TFDConnection
    Params.Strings = (
      'Server='
      'DriverID=MySQL')
    LoginPrompt = False
    OnError = bancoError
    Left = 576
    Top = 312
  end
  object FDQuery1: TFDQuery
    Connection = banco
    Left = 488
    Top = 176
    ParamData = <
      item
        Name = 'json'
        DataType = ftWideString
        FDDataType = dtWideString
      end>
  end
  object TrayIcon1: TTrayIcon
    AnimateInterval = 2
    Hint = 'DashBoard - Sincronizador'
    BalloonTitle = 'Eurico Tecnologia'
    BalloonTimeout = 2
    PopupMenu = pmMenu
    OnDblClick = TrayIcon1DblClick
    Left = 618
    Top = 25
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 626
    Top = 104
  end
  object TimeGo: TTimer
    Enabled = False
    OnTimer = TimeGoTimer
    Left = 456
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Sistema\libmySQL.dll'
    Left = 616
    Top = 176
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'Database=C:\Sistema\Dados\DADOS.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 800
    Top = 64
  end
  object qryAux: TFDQuery
    Connection = Conexao
    Left = 480
    Top = 24
  end
  object Transacao: TFDTransaction
    Connection = Conexao
    Left = 640
    Top = 352
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 488
    Top = 312
  end
  object FBDriver: TFDPhysFBDriverLink
    VendorLib = 'C:\Sistema\fbclient.dll'
    Left = 648
    Top = 264
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoInProcessAuth, hoKeepOrigProtocol, hoForceEncodeParams]
    Left = 832
    Top = 208
  end
  object pmMenu: TPopupMenu
    Left = 578
    Top = 248
    object RestaurarAplicao1: TMenuItem
      Caption = 'Restaurar Aplica'#231#227'o'
      OnClick = RestaurarAplicao1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object SairdaAplicao1: TMenuItem
      Caption = 'Sair da Aplica'#231#227'o'
      OnClick = SairdaAplicao1Click
    end
  end
  object tmrIniciar: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmrIniciarTimer
    Left = 528
    Top = 104
  end
  object cxImageList1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 27263840
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000020744558745469746C650057692D66693B576966693B57
          6972656C6573733B526164696F3B491D3C9A000001C349444154785EA5D24F48
          D3711806F0EF4E410BC1C30E1B1244D1A5ABFD81C28ABC346A839D4C103A1691
          98855E0ADD61B00C8A29A3D4DAD61F5128E6AC49D38A6ACD65240DC6E60E6114
          C426A287589722787A1EF811C4341ABEF08187F7FBBC63879F01B0297FC666B3
          1987C361A22F3A0ED13015A86A29D2081D5647DD9A199CF2EE1E9E6E7F3999BD
          82DCA738BEACBEC34A755194B54322DB077632ECEEF9EB38F0E0D8C91B0F7DD5
          ECE27D644B114CBCBA8491E4690C4DB689B276982BDDC1DBD218D8FDCE1B9FD1
          5C1E6DF1D0CF671FC2B83AE6FB4131F2D076DA22CAD62EA2CEECC21078F38B3C
          E662E8C09B7B33DDF0DF3EF19E76B95C2EF32FECECA0F9BBA92EF076DE9C0B36
          3751B237D4BA4D85C8F38E46EAA10CAD59E6AC5DA33AEC6EE5CD13DA693462B7
          DBCDCDE4A9765A491746F1B1F21ACBDFF2C29C86767A5347DD9AF1C78E061399
          00F29F9348176F219A3A83D0A33651D64E6F5087DD6B353FD01B3ED81F4D7522
          F2F42C0231EF141DA106B172426FEAA86BD69BF3037BFB3B07F675EB2FEA8371
          3A9DA26CB4E3DB0575CCFFCCE063F7712A8BB2A97782E3ADE5DC521CA25CEFBD
          3EB0F2F4821FC25C31F54ED7F5FD6EAAD057E50D8B0036E537440C933743BCD2
          500000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001D744558745469746C6500436C6F73653B457869743B426172733B52
          6962626F6E3B4603B9E8000002AD49444154785E85934B4C546714C77FF73232
          0C041DC2237644C368F109868D98A0290BDA60E2DE9526921856C3C2A08C2E1A
          A336A64DB48D81A8892D6E241A7CA20B1530261849DA4D47596818082F015118
          0698B973DFB7773EB1333BEE97FFCD3927DFF97DE77B1CE9E3AF17293FF3B30C
          48426B7D9939765A1290337AE1DC4B8F2CD73B0E802306C24CEB9BE7ACFA6206
          86650FECFCE55283079025DBAE2F3D5CB79A94B58E206692C5CF1606933DAF7F
          006451BA69986099A8C3C38C3C7846D791D3BCB97413351A151AFCADD38D8589
          DE7F412A3A426A388AC801D92300A689E36A2A1225129923D8D1C9FC9387FCDD
          D587244BC4037BDC581B91AB97716C93F2AA6D989A004802A0AF28382EF19F3B
          FD34F4F7515852C4E2AE20FFFED10140CDC9101B0ABD54B4FFCEAB1F7F62D3F9
          0AB4643203589E9C469F9926B8BF8AF947DD94B5849072246A5A43E040913F9F
          BC75394C3DEE2658BB9BD4F07BE2E3B35915A83AFAA719766CCDE7C3403F43C8
          6C6D6EC65FE8C391C0B660E8FA359203BD546EF7A34E4C60A49C2C8066602514
          B4D94F98F12596150DDB721043DC84CC4A3A168FA14FA75CA085A17D05885B30
          D280548AE8FB39947D8D048E3661D936DE5C99BC5C8FB0BF3BD684527B88D1D1
          18B6AAE22E9A5D8186954C105B50680C87503D3EF2BDEE9E6FFD0940F9F11380
          8FFA700BBD4FEEB2A94842D73D990A74DDC45C49B2A37A336FDB4E5122AB8C5F
          6FE7CBBDDB7C763571A39D328FCEBB702BDF6F2FC352750C4DCFBC0343750189
          243E3381131BE369DD018A4BD71328CE136730D7D3CDD3CEBFD8B2A518AF99C0
          4C030CFEDF82EBE802602C2CE22DC8676F7500633981E2DE0C1694FAFD6C2C29
          419D8FA12515B06C4C43461080822B6595CF7D927410475A3DF9ACA6B0859FDD
          50C2566C7BF0ECD258A3E846200FF066B5AAB4462B3B800628FF0122CC6063F4
          5F96130000000049454E44AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          6100000021744558745469746C65004170706C793B4F4B3B436865636B3B4261
          72733B526962626F6E3B6463C8680000037D49444154785E4D8E7F4C94051CC6
          3FEF7B77E02073EA92742577579B684891E62AB6C4526B6013696BC9DC5A0B33
          D0322DA716D3CA94A21A8E96E976AEB654688E409B46B859CC249500E3F81588
          234EE0F875DC1DF7A3BB7BDFF7DBC16AEBD9F3D9BEFF3CCFF7C13555CB58A801
          40014CC5E5696BF638D24FBEF7EDF2D683550F7B0E5666B4969C5A5EBBEBCB65
          2F0209803A116E6438F82377A66A60385007A0E4EFB2A5BC51B1B4AEF4EC5AB9
          D476583A87AA642C7055BA47CE4A43F72752713157F67D93DE54B0DFBE04308D
          867E9E290050725F4BBDB7F8E8B29EAA86B7C4E5BF203DDEE3D23E71585AC6F6
          48E7E4C7D2E777C870A05E7E68DE277B4F668C6EDE6BCF00D4017F350A607EF5
          48DAB99CECBC9CF4343BC3E1264CAA60C282AAA8288A028A30313E852DE509EE
          0C4D72EEF26967CD17FD4F0EDE0A064DF9BBEDEB6CD6C51F3C9DF5382EFF1540
          104014216E500C2ED6DDA4F67C3BEDB79BC9C95EC3E8F8784AD28288BBADC1D3
          6C4E98652A7C2C7D2543816674430304C4885B0755E1CC99EBCC51D750F14E35
          DBCB32E91DF98DCCA5ABE8FCB36733E0500D3132EF9EAB108C7AE9ED1BA6B4AC
          969F2E39896A11CE5F68212529975D5B4A395A59C40B79CF6049D0489AAD81AA
          3C0A9854436741140FE148809AEA16CA8AAEA34C65F1E9E7F524EBEBD99A7F80
          53751FB2707118EB836642311F31C63174497C286BEE6C55D3F48971DF2088C1
          A60D6BF9BAB6849D0547D8FD520D2F3F5F822FD8C7AFCEEF58B16A11FEC82831
          3DC6A87F8868C488745C9D0C9AF5A8D2E51EF15BE72FD248B127E2F5FE8DE3FB
          FDEC28280755E1FDCFB691BF310B6FC48566C4C030F08D458984B40E4057837E
          ADAAA7CB87A0E2090EB2E491594C1A4DD45C2EC779AB0E53B287C4399384A353
          718288A8F4767B09F8F4F380069094BBDD7AB3E474869CB8B1428E5DCB90AAB6
          0DB2E59055B2B621C72EAF93134D99723C8EE3F79572A83A5336EEB439EF9A67
          990FA82A1071F7855EF9E35AC0D3EB0C010A9EF000799B56F1EEDBAFC7BF87D0
          0D411185BEEE30AD8DFE88AB2B501CF0C4FC5706DE34CC0D7F15E9AB53BF6A17
          784ED78C4AB72BF6803DDD82B6B013D5A420064CB875FABB628CB8A21DEEDBA1
          A2D6FAB11B8066480C7EE92F045000737CD6BCA736DFB77F7D616A63EE769BCC
          B0C326CF6E4D6D5B5D70FF47C9732CF700164099CE4D3373FCA76CAB43052CFF
          62065440001D884E130F19FC4FFF00FE20CB5D5DF1FFF30000000049454E44AE
          426082}
      end>
  end
  object qryEmpresa: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'Select emp.*, cid.coduf VIRTUAL_ID_UF, cid.uf VIRTUAL_UF from em' +
        'presa emp'
      'left join cidade cid on cid.codigo=emp.id_cidade'
      '/*where*/'
      '/*ordem*/')
    Left = 553
    Top = 448
    object qryEmpresaCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEmpresaFANTASIA: TStringField
      FieldName = 'FANTASIA'
      Origin = 'FANTASIA'
      Required = True
      Size = 50
    end
    object qryEmpresaRAZAO: TStringField
      FieldName = 'RAZAO'
      Origin = 'RAZAO'
      Required = True
      Size = 50
    end
    object qryEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
    end
    object qryEmpresaRESPONSAVEL_EMPRESA: TStringField
      FieldName = 'RESPONSAVEL_EMPRESA'
      Origin = 'RESPONSAVEL_EMPRESA'
      Size = 50
    end
    object qryEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
  end
  object dsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 644
    Top = 424
  end
end
