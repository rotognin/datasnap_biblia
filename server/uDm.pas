unit uDm;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMSSQL, Data.FMTBcd, Data.DB, Data.SqlExpr,
  uServer;

type
  TfDm = class(TDataModule)
    SQLConnection: TSQLConnection;
    qryVersoes: TSQLQuery;
    qryVersoesvrs_id: TIntegerField;
    qryVersoesvrs_nome: TStringField;
    qryLivros: TSQLQuery;
    qryLivrosb_liv_id: TIntegerField;
    qryLivrosb_liv_nome: TStringField;
    qryCapitulos: TSQLQuery;
    qryLivro: TSQLQuery;
    qryLivrob_liv_nome: TStringField;
    qryCapituloscapitulos: TSmallintField;
    qryVersiculos: TSQLQuery;
    qryVersiculosver_versiculo: TSmallintField;
    qryVersiculosver_texto: TMemoField;
  private
    { Private declarations }
    procedure FecharConsultas;
  public
    { Public declarations }
    procedure ConectarBanco;
    procedure DesconectarBanco;
    procedure BuscarVersoes;
    procedure BuscarLivros;
    function BuscarLivro(id_livro: Integer): String;
    function BuscarCapitulos(id_livro: Integer): Integer;
    function BuscarVersiculos(id_versao, id_livro, id_capitulo: Integer): String;
  end;

var
  fDm: TfDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TfDm }

function TfDm.BuscarCapitulos(id_livro: Integer): Integer;
begin
  //
  if (qryCapitulos.Active) then
    qryCapitulos.Close;

  qryCapitulos.ParamByName('id_livro').Value := id_livro;
  qryCapitulos.Open;

  Result := qryCapituloscapitulos.AsInteger;
end;

function TfDm.BuscarLivro(id_livro: Integer): String;
begin
  if (id_livro = 0) then
    Exit;

  if (qryLivro.Active) then
    qryLivro.Close;

  qryLivro.ParamByName('id_livro').Value := id_livro;
  qryLivro.Open;

  Result := qryLivrob_liv_nome.AsString;
end;

procedure TfDm.BuscarLivros;
begin
  //
  if (qryLivros.Active) then
    qryLivros.Close;

  qryLivros.Open;
end;

function TfDm.BuscarVersiculos(id_versao, id_livro, id_capitulo: Integer): String;
var texto: String;
begin
  if (qryVersiculos.Active) then
    qryVersiculos.Close;

  qryVersiculos.ParamByName('ver_vrs_id').Value := id_versao;
  qryVersiculos.ParamByName('ver_liv_id').Value := id_livro;
  qryVersiculos.ParamByName('ver_capitulo').Value := id_capitulo;

  qryVersiculos.Open;

  qryVersiculos.First;

  while NOT(qryVersiculos.Eof) do
  begin
    texto := texto + IntToStr(qryVersiculosver_versiculo.AsInteger) + ' - ' +
             qryVersiculosver_texto.AsString + '|';
    qryVersiculos.Next;
  end;

  Result := texto;
end;

procedure TfDm.BuscarVersoes;
begin
  //
  if (qryVersoes.Active) then
    qryVersoes.Close;

  qryVersoes.Open;
end;

procedure TfDm.ConectarBanco;
begin
  if (SQLConnection.Connected) then
    Exit;

  SQLConnection.Open;

  if NOT(SQLConnection.Connected) then
    frmServidor.memLog.Lines.Add('Não foi possível conectar no banco!');
end;

procedure TfDm.DesconectarBanco;
begin
  FecharConsultas;

  if (SQLConnection.Connected) then
    SQLConnection.Close;
end;

procedure TfDm.FecharConsultas;
begin
  if (qryVersoes.Active) then
    qryVersoes.Close;

  if (qryLivros.Active) then
    qryLivros.Close;

  if (qryLivro.Active) then
    qryLivro.Close;

  if (qryCapitulos.Active) then
    qryCapitulos.Close;
end;

end.
