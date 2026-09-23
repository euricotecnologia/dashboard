unit uConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls,  dxGDIPlusClasses,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,IniFiles,
  Vcl.AppEvnts, System.JSON, Vcl.ComCtrls, FireDAC.Phys.Intf,
  FireDAC.Phys.FBDef, FireDAC.DApt.Intf, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL, FireDAC.Phys.IBBase, FireDAC.Comp.UI, DateUtils;

type
  TMes = (tmjaneiro, tmfeveiro, tmmarco, tmabril, tmmaio, tmjunho,
          tmjulho, tmagosto, tmsetembro, tmoutubro,tmnovembro, tmdezembro);

  caixasAbertos = record
    usuario,
    horaAbertura,
    dataAbertura,
    saldoInicial,
    saldoAtual,
    Entradas,
    saidas,
    dinheiro,
    credito,
    debito,
    cheque,
    convenio,
    vRefeicao,
    vCombustivel: string;
  end;

  TopsProdutos = record
    produto01,
    quantidade01,
    produto02,
    quantidade02: string
  end;

  Vendasconcluidas = record
    valorVendas,
    quantidadeVendas,
    totalDescontos,
    totalLucros,
    TicketMedio,
    QuantidadeProdutosVendidos: string;
  end;

  Vendascanceladas = record
    valorVendas,
    LurosPerdidos,
    QuantidadeProdutosPerdidos,
    QuantidadeVendasPerdidas: string;
  end;

  VendasUsuarios = record
    usuario,
    totalVendas,
    comissoes,
    quantidadeVendas,
    quantidadeProdutos: string;
  end;

  RelDiario = record
    VendasDiarias,
    LucroDiario: string;
  end;

  function naoVazio(valor:string):string;
  function NFsTotalMes(Qry: TFDQuery; Mes: TMes; Situacao: string): string;
  function VendasTotalMes(Qry: TFDQuery; Mes: TMes; Situacao: string): string;
  function VendasFPGTotalMes(Qry: TFDQuery; Tipo: string): string;
  function CXSaldoMes(Qry: TFDQuery; Mes: TMes): string;
  function CXEntradaMes(Qry: TFDQuery; Mes: TMes): string;
  function CXSaidaMes(Qry: TFDQuery; Mes: TMes): string;
  function CXValorAtual(Qry: TFDQuery; Tipo: string): string;
  function QtdCadastros(Qry: TFDQuery; Tipo: string): string;
  function TotalCReceber(Qry: TFDQuery; Mes: TMes): string;
  function TotalCRecebidas(Qry: TFDQuery; Mes: TMes): string;
  function TotalCReceberAtual(Qry: TFDQuery; Tipo: string): string;
  function TotalCPagar(Qry: TFDQuery; Mes: TMes): string;
  function TotalCPagarPendentes(Qry: TFDQuery; Mes: TMes): string;
  function TotalCPagarAtual(Qry: TFDQuery; Tipo: string): string;
  function CXAbertos(Qry: TFDQuery; CodContas: Integer = 0): string;
  function topProdutos(Qry: TFDQuery): string;
  function RelatorioVendasConcluidas(Qry: TFDQuery): string;
  function RelatorioVendasCanceladas(Qry: TFDQuery): string;
  function VendaUsuarios(Qry: TFDQuery): string;
  function ReplaceVirgulaPonto(Str: string): string;
  function LucrosPresumidosGanhos(Qry: TFDQuery; Mes: TMes): string;
  function ListaCaixasAbertos: string;
  function RelatorioVendasDiarias(Qry: TFDQuery): string;
  function RelatorioVendasLucros(Qry: TFDQuery): string;

var
  CXAberto: caixasAbertos;
  TProdutos: TopsProdutos;
  VConcluidas: Vendasconcluidas;
  VCanceladas: Vendascanceladas;
  VUsuarios: VendasUsuarios;
  vRelDiario: RelDiario;

implementation

uses Principal;

function naoVazio(valor:string):string;
begin
 if valor = '' then
   begin
     Result := '0';
   end;

 if valor = '0' then
   begin
     Result := '0';
   end;

 if (valor <> '0') and (valor <> '') then
   begin
     Result :=  valor;
   end;
end;

function NFsTotalMes(Qry: TFDQuery; Mes: TMes; Situacao: string): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //NFCe
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(nm.total), 0) total from nfce_master nm ' +
    'where (nm.situacao='+QuotedStr(Situacao)+') and ' +
    '(nm.data_emissao between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;
  //NFe
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(nm.total), 0) total from nfe_master nm ' +
    'where (nm.situacao='+QuotedStr(Situacao)+') and ' +
    '(nm.data_emissao between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  rTotal + Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function VendasTotalMes(Qry: TFDQuery; Mes: TMes; Situacao: string): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
  rTemp: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Vendas
  rTemp :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(vm.total), 0) total from vendas_master vm ' +
        'where (vm.situacao='+QuotedStr(Situacao)+') and ' +
        '(vm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
      rTotal  :=  Qry.Fields[0].AsFloat;
      rTemp :=  rTotal;

      if rTotal = 0 then
        Result  :=  '0'
      else
        begin
          Result  :=
            ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
              (naoVazio(FloatToStr(rTotal)))));
        end;
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(nm.total), 0) total from nfe_master nm '+
        'where (nm.situacao='+QuotedStr(Situacao)+') and '+
        '(nm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
      rTotal  :=  Qry.Fields[0].AsFloat+rTemp;

      if rTotal = 0 then
        Result  :=  '0'
      else
        begin
          Result  :=
            ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
              (naoVazio(FloatToStr(rTotal)))));
        end;
    end;
end;

function VendasFPGTotalMes(Qry: TFDQuery; Tipo: string): string;
var
  dtInicial, dtFinal: TDate;
  rTotal: Extended;
begin
  dtInicial :=  StartOfTheMonth(Date);
  dtFinal :=  EndOfTheMonth(Date);
  //Formas de Pagamento
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(fpg.valor), 0) total from vendas_fpg fpg ' +
    'inner join vendas_master vm on fpg.vendas_master=vm.codigo ' +
    'where (vm.situacao=''F'') and (fpg.situacao=''F'') and ' +
    '(fpg.tipo='+QuotedStr(Tipo)+') and (vm.data_emissao between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function CXSaldoMes(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Caixa
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select (coalesce(sum(cx.entrada), 0) - coalesce(sum(cx.saida), 0)) ' +
    'saldo from caixa cx ' +
    'where (cx.emissao between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function CXEntradaMes(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Caixa
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(cx.entrada), 0) ' +
    'entrada from caixa cx ' +
    'where (cx.emissao between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function CXSaidaMes(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Caixa
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(cx.saida), 0) ' +
    'entrada from caixa cx ' +
    'where (cx.emissao between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function CXValorAtual(Qry: TFDQuery; Tipo: string): string;
var
  dtInicial, dtFinal: TDate;
  rTotal: Extended;
begin
  dtInicial :=  StartOfTheMonth(Date);
  dtFinal :=  EndOfTheMonth(Date);
  //Caixa
  if Tipo = 'SALDO' then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select (coalesce(sum(cx.entrada), 0) - coalesce(sum(cx.saida), 0)) ' +
        'saldo from caixa cx ' +
        'where (cx.emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
    end
  else if Tipo = 'SAIDA' then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(cx.saida), 0) ' +
        'saida from caixa cx ' +
        'where (cx.emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
    end
  else if Tipo = 'ENTRADA' then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(cx.entrada), 0) ' +
        'entrada from caixa cx ' +
        'where (cx.emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
    end;

  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function QtdCadastros(Qry: TFDQuery; Tipo: string): string;
var
  sSQL: string;
begin
  Qry.Close;
  Qry.SQL.Clear;
  if Tipo = 'P' then
    begin
      sSQL  :=
        'select count(*) qtd from produto '+
        'where ativo=''S''';
    end
  else if Tipo = 'C' then
    begin
      sSQL  :=
        'select count(*) qtd from pessoa '+
        'where ativo=''S'' and cli=''S''';
    end
  else if Tipo = 'U' then
    begin
      sSQL  :=
        'select count(*) qtd from usuarios '+
        'where ativo=''S''';
    end
  else if Tipo = 'F' then
    begin
      sSQL  :=
        'select count(*) qtd from pessoa '+
        'where ativo=''S'' and forn=''S''';
    end;
  Qry.SQL.Text  := sSQL;
  Qry.Open;

  Result  :=  IntToStr(Qry.Fields[0].AsInteger);
end;

function TotalCReceber(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Receber
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(cr.valor), 0) total from creceber cr '+
    'where (cr.data_recebimento is null) and '+
    '(cr.dtvencimento between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function TotalCRecebidas(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Recebidas
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(cr.vrecebido), 0) total from creceber cr '+
    'where not (cr.data_recebimento is null) and '+
    '(cr.dtvencimento between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function TotalCReceberAtual(Qry: TFDQuery; Tipo: string): string;
var
  dtInicial, dtFinal: TDate;
  rTotal: Extended;
begin
  //Recebidas Atual
  Qry.Close;
  Qry.SQL.Clear;
  if Tipo = 'VENCIDAS' then
    begin
      Qry.SQL.Text  :=
        'select coalesce(sum(cr.valor), 0) total from creceber cr '+
        'where (cr.dtvencimento < :dt1)';
      Qry.Params[0].AsDate  :=  Date;
    end
  else if Tipo = 'PENDENTES' then
    begin
      dtInicial :=  StartOfTheMonth(Date);
      dtFinal :=  EndOfTheMonth(Date);
      Qry.SQL.Text  :=
        'select coalesce(sum(cr.valor), 0) total from creceber cr '+
        'where (cr.dtvencimento between :dt1 and :dt2) and (cr.data_recebimento is null)';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
    end
  else if Tipo = 'PAGAS' then
    begin
      dtInicial :=  StartOfTheMonth(Date);
      dtFinal :=  EndOfTheMonth(Date);
      Qry.SQL.Text  :=
        'select coalesce(sum(cr.valor), 0) total from creceber cr '+
        'where not (cr.data_recebimento is null ) and (cr.vrecebido > 0) '+
        'and (cr.dtvencimento between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
    end;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function TotalCPagar(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Pagar
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(cp.valor), 0) total from cpagar cp '+
    'where not (cp.data_pagamento is null) and '+
    '(cp.dtvencimento between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function LucrosPresumidosGanhos(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Lucros Presumidos Ganhos
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum((vd.qtd*(vd.preco-p.pr_custo2))-vd.vdesconto), 0) TotalLucro ' +
    'from vendas_detalhe vd ' +
    'inner join produto p on vd.id_produto=p.codigo ' +
    'inner join vendas_master vm on vd.fkvenda=vm.codigo ' +
    'where (vd.situacao=''F'') and (vm.situacao=''F'') ' +
    'and (vm.data_emissao between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function TotalCPagarPendentes(Qry: TFDQuery; Mes: TMes): string;
var
  dtInicial, dtFinal: TDate;
  sAno, sMes: Word;
  rTotal: Extended;
begin
  sAno :=  YearOf(Now);
  case Mes of
    tmjaneiro: sMes :=  01;
    tmfeveiro: sMes :=  02;
    tmmarco: sMes :=  03;
    tmabril: sMes :=  04;
    tmmaio: sMes :=  05;
    tmjunho: sMes :=  06;
    tmjulho: sMes :=  07;
    tmagosto: sMes :=  08;
    tmsetembro: sMes :=  09;
    tmoutubro: sMes :=  10;
    tmnovembro: sMes :=  11;
    tmdezembro: sMes :=  12;
  end;
  dtInicial :=  StartOfTheMonth(EncodeDate(sAno, sMes, 1));
  dtFinal :=  EndOfTheMonth(EncodeDate(sAno, sMes, 1));
  //Pagar
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select coalesce(sum(cp.valor), 0) total from cpagar cp '+
    'where (cp.data_pagamento is null) and '+
    '(cp.dtvencimento between :dt1 and :dt2) ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function TotalCPagarAtual(Qry: TFDQuery; Tipo: string): string;
var
  dtInicial, dtFinal: TDate;
  rTotal: Extended;
begin
  //Pagar Atual
  Qry.Close;
  Qry.SQL.Clear;
  if Tipo = 'VENCIDAS' then
    begin
      dtInicial :=  Date;
      Qry.SQL.Text  :=
        'select coalesce(sum(cp.valor), 0) total from cpagar cp '+
        'where (cp.data_pagamento is null) and '+
        '(cp.dtvencimento < :dt1) ';
      Qry.Params[0].AsDate  :=  dtInicial;
    end
  else if Tipo = 'PENDENTES' then
    begin
      dtInicial :=  StartOfTheMonth(Date);
      dtFinal :=  EndOfTheMonth(Date);
      Qry.SQL.Text  :=
        'select coalesce(sum(cp.valor), 0) total from cpagar cp '+
        'where (cp.data_pagamento is null) and '+
        '(cp.dtvencimento between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
    end
  else if Tipo = 'PAGAS' then
    begin
      dtInicial :=  StartOfTheMonth(Date);
      dtFinal :=  EndOfTheMonth(Date);
      Qry.SQL.Text  :=
        'select coalesce(sum(cp.valor), 0) total from cpagar cp '+
        'where not (cp.data_pagamento is null) and '+
        '(cp.dtvencimento between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
    end;
  Qry.Open;
  rTotal  :=  Qry.Fields[0].AsFloat;

  if rTotal = 0 then
    Result  :=  '0'
  else
    begin
      Result  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat
          (naoVazio(FloatToStr(rTotal)))));
    end;
end;

function CXAbertos(Qry: TFDQuery; CodContas: Integer): string;
begin
  //Caixa Aberto
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Add(
    'select u.login usuario, cm.hora hora_abertura, c.data_abertura, '+
    'coalesce(cm.entrada, 0) saldo_inicial, '+
    '    (select coalesce((sum(cm1.entrada)-(sum(cm1.saida))), 0) saldo from contas_movimento cm1 '+
    '     where (cm1.id_usuario=u.codigo) and (cm1.lote=c.lote)), '+
    '    (select coalesce(sum(cm1.entrada), 0) entrada from contas_movimento cm1 '+
    '     where (cm1.id_usuario=u.codigo) and (cm1.lote=c.lote)), '+
    '    (select coalesce(sum(cm1.saida), 0) saida from contas_movimento cm1 '+
    '     where (cm1.id_usuario=u.codigo) and (cm1.lote=c.lote)), '+
    '    (select coalesce(sum(vfpg.valor), 0) dinheiro from vendas_fpg vfpg '+
    '     inner join vendas_master vm on vfpg.vendas_master=vm.codigo '+
    '     where (vm.lote=c.lote) and (vm.situacao=''F'') and (vfpg.situacao=''F'') '+
    '     and (vfpg.tipo=''D'') and (vm.fk_caixa=c.codigo) and (vm.fk_usuario=u.codigo)), '+
    '    (select coalesce(sum(vfpg.valor), 0) credito from vendas_fpg vfpg '+
    '     inner join vendas_master vm on vfpg.vendas_master=vm.codigo '+
    '     where (vm.lote=c.lote) and (vm.situacao=''F'') and (vfpg.situacao=''F'') '+
    '     and (vfpg.tipo=''C'') and (vm.fk_caixa=c.codigo) and (vm.fk_usuario=u.codigo)), '+
    '    (select coalesce(sum(vfpg.valor), 0) debito from vendas_fpg vfpg '+
    '     inner join vendas_master vm on vfpg.vendas_master=vm.codigo '+
    '     where (vm.lote=c.lote) and (vm.situacao=''F'') and (vfpg.situacao=''F'') '+
    '     and (vfpg.tipo=''E'') and (vm.fk_caixa=c.codigo) and (vm.fk_usuario=u.codigo)), '+
    '    (select coalesce(sum(vfpg.valor), 0) cheque from vendas_fpg vfpg '+
    '     inner join vendas_master vm on vfpg.vendas_master=vm.codigo '+
    '     where (vm.lote=c.lote) and (vm.situacao=''F'') and (vfpg.situacao=''F'') '+
    '     and (vfpg.tipo=''Q'') and (vm.fk_caixa=c.codigo) and (vm.fk_usuario=u.codigo)), '+
    '    (select coalesce(sum(vfpg.valor), 0) convenio from vendas_fpg vfpg '+
    '     inner join vendas_master vm on vfpg.vendas_master=vm.codigo '+
    '     where (vm.lote=c.lote) and (vm.situacao=''F'') and (vfpg.situacao=''F'') '+
    '     and (vfpg.tipo=''V'') and (vm.fk_caixa=c.codigo) and (vm.fk_usuario=u.codigo)), '+
    '    (select coalesce(sum(vfpg.valor), 0) vale_refeicao from vendas_fpg vfpg '+
    '     inner join vendas_master vm on vfpg.vendas_master=vm.codigo '+
    '     where (vm.lote=c.lote) and (vm.situacao=''F'') and (vfpg.situacao=''F'') '+
    '     and (vfpg.tipo=''R'') and (vm.fk_caixa=c.codigo) and (vm.fk_usuario=u.codigo)), '+
    '    (select coalesce(sum(vfpg.valor), 0) vale_combustivel from vendas_fpg vfpg '+
    '     inner join vendas_master vm on vfpg.vendas_master=vm.codigo '+
    '     where (vm.lote=c.lote) and (vm.situacao=''F'') and (vfpg.situacao=''F'') '+
    '     and (vfpg.tipo=''O'') and (vm.fk_caixa=c.codigo) and (vm.fk_usuario=u.codigo)) '+
    'from contas c '+
    'inner join usuarios u on c.id_usuario=u.codigo '+
    'left join contas_movimento cm on c.lote=cm.lote and cm.historico=''ABERTURA DE CAIXA'' ');
  if CodContas > 0 then
    Qry.SQL.Add('where (c.codigo='+IntToStr(CodContas)+')');

  Qry.Open;
  CXAberto.usuario  :=  Qry.FieldByName('usuario').AsString;
  CXAberto.horaAbertura  :=  FormatDateTime('hh:mm:ss', Qry.FieldByName('hora_abertura').AsDateTime);
  CXAberto.dataAbertura  :=  FormatDateTime('dd/mm/yyyy', Qry.FieldByName('data_abertura').AsDateTime);
  CXAberto.saldoInicial  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('saldo_inicial').AsFloat)))));
  CXAberto.saldoAtual  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('saldo').AsFloat)))));
  CXAberto.Entradas  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('entrada').AsFloat)))));
  CXAberto.saidas  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('saida').AsFloat)))));
  CXAberto.dinheiro  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('dinheiro').AsFloat)))));
  CXAberto.credito  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('credito').AsFloat)))));
  CXAberto.debito  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('debito').AsFloat)))));
  CXAberto.cheque  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('cheque').AsFloat)))));
  CXAberto.convenio  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('convenio').AsFloat)))));
  CXAberto.vRefeicao  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('vale_refeicao').AsFloat)))));
  CXAberto.vCombustivel  :=  ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('vale_combustivel').AsFloat)))));
end;

function topProdutos(Qry: TFDQuery): string;
var
  dtInicial, dtFinal: TDate;
begin
  dtInicial :=  StartOfTheMonth(Date);
  dtFinal :=  EndOfTheMonth(Date);
  //...
  Qry.Close;
  Qry.SQL.Clear;
  Qry.SQL.Text  :=
    'select first 2 count(vd.qtd) qtd, p.descricao from vendas_detalhe vd '+
    'inner join vendas_master vm on vd.fkvenda=vm.codigo '+
    'inner join produto p on vd.id_produto=p.codigo '+
    'where (vm.situacao=''F'') and (vd.situacao=''F'') and '+
    '(vm.data_emissao between :dt1 and :dt2) '+
    'group by 2 '+
    'order by 1 desc ';
  Qry.Params[0].AsDate  :=  dtInicial;
  Qry.Params[1].AsDate  :=  dtFinal;
  Qry.Open;

  Qry.First;
  TProdutos.produto01 :=  Qry.FieldByName('descricao').AsString;
  TProdutos.quantidade01 :=  Qry.FieldByName('qtd').AsString;
  Qry.Next;
  TProdutos.produto02 :=  Qry.FieldByName('descricao').AsString;
  TProdutos.quantidade02 :=  Qry.FieldByName('qtd').AsString;
end;

function RelatorioVendasConcluidas(Qry: TFDQuery): string;
var
  dtInicial, dtFinal: TDate;
  rTemp: Extended;
  rTemp1, rTemp2: Integer;
begin
  dtInicial :=  StartOfTheMonth(Date);
  dtFinal :=  EndOfTheMonth(Date);
  //...
  rTemp :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(vm.total), 0) ValorVendas from vendas_master vm ' +
        'where (vm.data_emissao between :dt1 and :dt2) and (vm.situacao=''F'') ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
      rTemp :=  Qry.FieldByName('ValorVendas').AsFloat;
      VConcluidas.valorVendas :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('ValorVendas').AsFloat)))));
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(nm.total), 0) ValorVendas from nfe_master nm '+
        'where (nm.data_emissao between :dt1 and :dt2) and (nm.situacao=''2'') ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
      VConcluidas.valorVendas :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('ValorVendas').AsFloat+rTemp)))));
    end;
  rTemp :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum((vd.qtd*(vd.preco-p.pr_custo2))-vd.vdesconto), 0) TotalLucro '+
        'from vendas_detalhe vd '+
        'inner join produto p on vd.id_produto=p.codigo '+
        'inner join vendas_master vm on vd.fkvenda=vm.codigo '+
        'where (vd.situacao=''F'') and (vm.situacao=''F'') '+
        'and (vm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
      rTemp := Qry.FieldByName('TotalLucro').AsFloat;
      VConcluidas.totalLucros :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalLucro').AsFloat)))));
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum((nd.qtd*(nd.preco-p.pr_custo2))-nd.desconto), 0) TotalLucro '+
        'from nfe_detalhe nd '+
        'inner join produto p on nd.id_produto=p.codigo '+
        'inner join nfe_master nm on nd.fknfe=nm.codigo '+
        'where (nm.situacao=''2'') and '+
        '(nm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;
      VConcluidas.totalLucros :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalLucro').AsFloat+rTemp)))));
    end;
  rTemp :=  0;
  rTemp1 :=  0;
  rTemp2 :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select count(vm.codigo) qtdVendas, '+
        'coalesce(sum(vm.desconto) ,0) TotalDescontos, '+
        'coalesce(sum(vd.qtd*(vd.preco-p.pr_custo2)) ,0) TotalLucro, '+
        'coalesce(sum(vd.qtd) ,0) qtdProdVendidos from vendas_master vm '+
        'left join vendas_detalhe vd on vd.fkvenda=vm.codigo and vd.situacao=''F'' '+
        'inner join produto p on vd.id_produto=p.codigo '+
        'where (vm.situacao=''F'') and (vm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      rTemp2 :=  Qry.FieldByName('qtdVendas').AsInteger;
      rTemp :=  Qry.FieldByName('TotalDescontos').AsFloat;
      rTemp1 := Qry.FieldByName('qtdProdVendidos').AsInteger;
      VConcluidas.quantidadeVendas  :=  IntToStr(Qry.FieldByName('qtdVendas').AsInteger);
      VConcluidas.totalDescontos  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalDescontos').AsFloat)))));
      VConcluidas.TicketMedio :=  '0';
      VConcluidas.QuantidadeProdutosVendidos  :=  IntToStr(Qry.FieldByName('qtdProdVendidos').AsInteger);
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select count(nm.codigo) qtdVendas, '+
        'coalesce(sum(nm.desconto) ,0) TotalDescontos, '+
        'coalesce(sum(nd.qtd*(nd.preco-p.pr_custo2)) ,0) TotalLucro, '+
        'coalesce(sum(nd.qtd) ,0) qtdProdVendidos from nfe_master nm '+
        'left join nfe_detalhe nd on nd.fknfe=nm.codigo '+
        'inner join produto p on nd.id_produto=p.codigo '+
        'where (nm.situacao=''2'') and (nm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      VConcluidas.quantidadeVendas  :=  IntToStr(Qry.FieldByName('qtdVendas').AsInteger+rTemp2);
      VConcluidas.totalDescontos  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalDescontos').AsFloat+rTemp)))));
      VConcluidas.TicketMedio :=  '0';
      VConcluidas.QuantidadeProdutosVendidos  :=  IntToStr(Qry.FieldByName('qtdProdVendidos').AsInteger+rTemp1);
    end;
end;

function RelatorioVendasLucros(Qry: TFDQuery): string;
var
  dtInicial, dtFinal: TDate;
  rLucroDiario: Extended;
begin
  dtInicial :=  Date;
  dtFinal :=  Date;
  //...
  rLucroDiario  :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select cast(coalesce(sum((vd.total)-(vd.qtd*pr.pr_custo2)), 0) as numeric(15,2)) lucroDiario '+
        'from vendas_detalhe vd '+
        'inner join vendas_master vm on vm.codigo=vd.fkvenda '+
        'inner join produto pr on pr.codigo=vd.id_produto '+
        'where (vm.situacao=''F'') and (vd.situacao=''F'') and '+
        '(vm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      rLucroDiario  := Qry.FieldByName('lucroDiario').AsFloat;
      vRelDiario.LucroDiario  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('lucroDiario').AsFloat)))));
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select cast(coalesce(sum((nd.total)-(nd.qtd*pr.pr_custo2)), 0) as numeric(15,2)) lucroDiario '+
        'from nfe_detalhe nd '+
        'inner join nfe_master nm on nm.codigo=nd.fknfe '+
        'inner join produto pr on pr.codigo=nd.id_produto '+
        'where (nm.situacao=''2'') and '+
        '(nm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      vRelDiario.LucroDiario  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('lucroDiario').AsFloat+rLucroDiario)))));
    end;
end;

function RelatorioVendasDiarias(Qry: TFDQuery): string;
var
  dtInicial, dtFinal: TDate;
  rVendasDiarias: Extended;
begin
  dtInicial :=  Date;
  dtFinal :=  Date;
  //...
  rVendasDiarias  :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(vm.total), 0) total from vendas_master vm '+
        'where (vm.data_emissao between :dt1 and :dt2) '+
        'and (vm.situacao=''F'') ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      rVendasDiarias  := Qry.FieldByName('total').AsFloat;
      vRelDiario.VendasDiarias  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('total').AsFloat)))));
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(nm.total), 0) total from nfe_master nm '+
        'where (nm.data_emissao between :dt1 and :dt2) '+
        'and (nm.situacao=''2'') ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      vRelDiario.VendasDiarias  :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('total').AsFloat+rVendasDiarias)))));
    end;
end;

function RelatorioVendasCanceladas(Qry: TFDQuery): string;
var
  dtInicial, dtFinal: TDate;
  rvalorVendas, rLurosPerdidos: Extended;
  iQuantidadeProdutosPerdidos,
  iQuantidadeVendasPerdidas: Integer;
begin
  dtInicial :=  StartOfTheMonth(Date);
  dtFinal :=  EndOfTheMonth(Date);
  //...
  rvalorVendas  :=  0;
  rLurosPerdidos  :=  0;
  iQuantidadeProdutosPerdidos :=  0;
  iQuantidadeVendasPerdidas :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(vm.total), 0) ValorVendas, coalesce(sum(vd.qtd*(vd.preco-p.pr_custo2)) ,0) TotalLucro, '+
        'coalesce(sum(vd.qtd) ,0) qtdProdCancelados, count(vm.codigo) qtdVendas from vendas_master vm '+
        'left join vendas_detalhe vd on vd.fkvenda=vm.codigo and vd.situacao=''C'' '+
        'inner join produto p on vd.id_produto=p.codigo '+
        'where (vm.situacao=''C'') and (vm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      rvalorVendas  :=  Qry.FieldByName('ValorVendas').AsFloat;
      rLurosPerdidos  :=  Qry.FieldByName('TotalLucro').AsFloat;
      iQuantidadeProdutosPerdidos :=  Qry.FieldByName('qtdProdCancelados').AsInteger;
      iQuantidadeVendasPerdidas :=  Qry.FieldByName('qtdVendas').AsInteger;
      VCanceladas.valorVendas :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('ValorVendas').AsFloat)))));
      VCanceladas.LurosPerdidos :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalLucro').AsFloat)))));
      VCanceladas.QuantidadeProdutosPerdidos  :=  IntToStr(Qry.FieldByName('qtdProdCancelados').AsInteger);
      VCanceladas.QuantidadeVendasPerdidas  :=  IntToStr(Qry.FieldByName('qtdVendas').AsInteger);
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select coalesce(sum(nm.total), 0) ValorVendas, coalesce(sum(nd.qtd*(nd.preco-p.pr_custo2)) ,0) TotalLucro, '+
        'coalesce(sum(nd.qtd) ,0) qtdProdCancelados, count(nm.codigo) qtdVendas from nfe_master nm '+
        'left join nfe_detalhe nd on nd.fknfe=nm.codigo '+
        'inner join produto p on nd.id_produto=p.codigo '+
        'where (nm.situacao=''3'') and (nm.data_emissao between :dt1 and :dt2) ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      VCanceladas.valorVendas :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('ValorVendas').AsFloat+rvalorVendas)))));
      VCanceladas.LurosPerdidos :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalLucro').AsFloat+rLurosPerdidos)))));
      VCanceladas.QuantidadeProdutosPerdidos  :=  IntToStr(Qry.FieldByName('qtdProdCancelados').AsInteger+iQuantidadeProdutosPerdidos);
      VCanceladas.QuantidadeVendasPerdidas  :=  IntToStr(Qry.FieldByName('qtdVendas').AsInteger+iQuantidadeVendasPerdidas);
    end;
end;

function VendaUsuarios(Qry: TFDQuery): string;
var
  dtInicial, dtFinal: TDate;
  rtotalVendas: Extended;
  iquantidadeVendas,
  iquantidadeProdutos: Integer;
begin
  dtInicial :=  StartOfTheMonth(Date);
  dtFinal :=  EndOfTheMonth(Date);
  //...
  rtotalVendas  :=  0;
  iquantidadeVendas :=  0;
  iquantidadeProdutos :=  0;
  if Form1.chkSincVendas.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select u.login usuario, coalesce(sum(vm.total) ,0) TotalVendas, '+
        'sum(vm.codigo) qtdVendas, sum(vd.qtd) qtdProdVendidos from vendas_master vm '+
        'inner join usuarios u on vm.fk_usuario=u.codigo '+
        'inner join vendas_detalhe vd on vd.fkvenda=vm.codigo and vd.situacao=''F'' '+
        'where (vm.situacao=''F'') and (vm.data_emissao between :dt1 and :dt2) '+
        'group by 1 ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      rtotalVendas  :=  Qry.FieldByName('TotalVendas').AsFloat;
      iquantidadeVendas :=  Qry.FieldByName('qtdVendas').AsInteger;
      iquantidadeProdutos :=  Qry.FieldByName('qtdProdVendidos').AsInteger;
      VUsuarios.usuario :=  Qry.FieldByName('usuario').AsString;
      VUsuarios.totalVendas :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalVendas').AsFloat)))));
      VUsuarios.comissoes :=  '0';
      VUsuarios.quantidadeVendas  :=  IntToStr(Qry.FieldByName('qtdVendas').AsInteger);
      VUsuarios.quantidadeProdutos  :=  IntToStr(Qry.FieldByName('qtdProdVendidos').AsInteger);
    end;
  if Form1.chkSincNFe.Checked then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Text  :=
        'select u.login usuario, coalesce(sum(nm.total) ,0) TotalVendas, '+
        'sum(nm.codigo) qtdVendas, sum(nd.qtd) qtdProdVendidos from nfe_master nm '+
        'inner join usuarios u on nm.fk_usuario=u.codigo '+
        'inner join nfe_detalhe nd on nd.fknfe=nm.codigo '+
        'where (nm.situacao=''2'') and (nm.data_emissao between :dt1 and :dt2) '+
        'group by 1 ';
      Qry.Params[0].AsDate  :=  dtInicial;
      Qry.Params[1].AsDate  :=  dtFinal;
      Qry.Open;

      VUsuarios.usuario :=  Qry.FieldByName('usuario').AsString;
      VUsuarios.totalVendas :=
        ReplaceVirgulaPonto(formatfloat('#0.00',StrToFloat(naoVazio(FloatToStr(Qry.FieldByName('TotalVendas').AsFloat+rtotalVendas)))));
      VUsuarios.comissoes :=  '0';
      VUsuarios.quantidadeVendas  :=  IntToStr(Qry.FieldByName('qtdVendas').AsInteger+iquantidadeVendas);
      VUsuarios.quantidadeProdutos  :=  IntToStr(Qry.FieldByName('qtdProdVendidos').AsInteger+iquantidadeProdutos);
    end;
end;

function ReplaceVirgulaPonto(Str: string): string;
begin
  Result  :=  Str.Replace(',', '.');
end;

function ListaCaixasAbertos: string;
var
  qryCX, qryAux: TFDQuery;
  sJSON: string;
const sVirgula: string = ',';
begin
  try
    sJSON :=  '';
    qryCX :=  TFDQuery.Create(nil);
    qryCX.Connection  := Form1.Conexao;
    qryAux :=  TFDQuery.Create(nil);
    qryAux.Connection  := Form1.Conexao;
    qryCX.Close;
    qryCX.SQL.Clear;
    qryCX.SQL.Text  :=
      'select c.codigo, c.descricao, c.data_abertura, '+
      'c.id_usuario, u.login usuario, c.lote from contas c '+
      'inner join usuarios u on c.id_usuario=u.codigo '+
      'where (c.tipo=''S'') and (c.situacao=''A'') ';
    qryCX.Open;
    qryCX.First;
    while not qryCX.Eof do
      begin
        CXAbertos(qryAux, qryCX.FieldByName('codigo').AsInteger);
        sJSON := sJSON +
          '    { '+
          '   		"usuario": "'+CXAberto.usuario+'", '+
          '   		"horaAbertura": "'+CXAberto.horaAbertura+'", '+
          '   		"dataAbertura": "'+CXAberto.dataAbertura+'", '+
          '   		"saldoInicial": '+CXAberto.saldoInicial+', '+
          '   		"saldoAtual": '+CXAberto.saldoAtual+', '+
          '   		"Entradas": '+CXAberto.Entradas+', '+
          '   		"saidas": '+CXAberto.saidas+', '+
          '   		"dinheiro": '+CXAberto.dinheiro+', '+
          '   		"credito": '+CXAberto.credito+', '+
          '   		"debito": '+CXAberto.debito+', '+
          '   		"cheque": '+CXAberto.cheque+', '+
          '   		"convenio": '+CXAberto.convenio+', '+
          '   		"vRefeicao": '+CXAberto.vRefeicao+', '+
          '   		"vCombustivel": '+CXAberto.vCombustivel+' '+
          '    } ';
        qryCX.Next;
        if not qryCX.Eof then
          sJSON := sJSON + sVirgula;
      end;
    Result  :=  sJSON;
  finally
    qryCX.Free;
    qryAux.Free;
  end;
end;

end.
