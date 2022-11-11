unit uBiblia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmBiblia = class(TForm)
    Label1: TLabel;
    lstVersoes: TListBox;
    Label2: TLabel;
    lstLivros: TListBox;
    lstCapitulos: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    memVersiculos: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure lstVersoesClick(Sender: TObject);
    procedure lstLivrosClick(Sender: TObject);
    procedure lstCapitulosClick(Sender: TObject);
  private
    { Private declarations }
    procedure ajustarVersoes(versoes: String);
    procedure ajustarLivros(livros: String);
    procedure ajustarCapitulos(capitulos: Integer);
    procedure ajustarVersiculos(texto: String);
  public
    { Public declarations }
  end;

var
  frmBiblia: TfrmBiblia;
  idVersao, idLivro: Integer;

implementation

{$R *.dfm}

uses ClientClassesUnit, ClientModuleUnit;

procedure TfrmBiblia.ajustarCapitulos(capitulos: Integer);
var capitulo: Integer;
begin
  capitulo := 0;
  lstCapitulos.Items.Clear;

  while (capitulo < capitulos) do
  begin
    Inc(capitulo);
    lstCapitulos.Items.Add(IntToStr(capitulo));
  end;
end;

procedure TfrmBiblia.ajustarLivros(livros: String);
var
  tamanho, posicao: Integer;
  livro: String;
begin
  lstLivros.Items.Clear;

  if (livros = EmptyStr) then
    Exit;

  tamanho := Length(livros);
  posicao := 1;

  while (posicao < tamanho) do
  begin
    livro := EmptyStr;

    while (Copy(livros, posicao, 1) <> ';') do
    begin
      livro := livro + Copy(livros, posicao, 1);
      Inc(posicao);
    end;

    if (livro <> EmptyStr) then
      lstLIvros.Items.Add(livro);

    Inc(posicao);
  end;
end;

procedure TfrmBiblia.ajustarVersiculos(texto: String);
var
  tamanho, posicao: Integer;
  versiculo: String;
begin
  memVersiculos.Clear;
  memVersiculos.Lines.BeginUpdate;

  if (texto = EmptyStr) then
    Exit;

  tamanho := Length(texto);
  posicao := 1;

  while (posicao < tamanho) do
  begin
    versiculo := EmptyStr;

    while (Copy(texto, posicao, 1) <> '|') do
    begin
      versiculo := versiculo + Copy(texto, posicao, 1);
      Inc(posicao);
    end;

    if (versiculo <> EmptyStr) then
      memVersiculos.Lines.Add(StringReplace(versiculo, '&quot;', '"', [rfReplaceAll]));

    Inc(posicao);
  end;

  memVersiculos.Lines.EndUpdate;
end;

procedure TfrmBiblia.ajustarVersoes(versoes: String);
var
  tamanho, posicao: Integer;
  versao: String;
begin
  lstVersoes.Items.Clear;

  if (versoes = EmptyStr) then
    Exit;

  tamanho := Length(versoes);
  posicao := 1;

  while (posicao < tamanho) do
  begin
    versao := EmptyStr;

    while (Copy(versoes, posicao, 1) <> ';') do
    begin
      versao := versao + Copy(versoes, posicao, 1);
      Inc(posicao);
    end;

    if (versao <> EmptyStr) then
      lstVersoes.Items.Add(versao);

    Inc(posicao);
  end;
end;

procedure TfrmBiblia.FormCreate(Sender: TObject);
var versoes, livros: String;
begin
  versoes := ClientModule1.ServerMethods1Client.buscarVersoes;
  ajustarVersoes(versoes);

  livros := ClientModule1.ServerMethods1Client.buscarLivros;
  ajustarLivros(livros);

  idVersao := 0;
  idLivro  := 0;
end;

procedure TfrmBiblia.lstCapitulosClick(Sender: TObject);
var texto: String;
    idCapitulo: Integer;
begin
  memVersiculos.Lines.Clear;

  if (idVersao = 0) then
  begin
    ShowMessage('É necessário selecionar a versão da bíblia.');
    Exit;
  end;

  if (idLivro = 0) then
  begin
    ShowMessage('É necessário selecionar o livro.');
    Exit;
  end;

  idCapitulo := 0;
  idCapitulo := lstCapitulos.ItemIndex + 1;

  texto := ClientModule1.ServerMethods1Client.buscarVersiculos(idVersao, idLivro, idCapitulo);

  if (texto <> EmptyStr) then
    ajustarVersiculos(texto);
end;

procedure TfrmBiblia.lstLivrosClick(Sender: TObject);
var id_livro, num_capitulos: Integer;
begin
  id_livro := lstLivros.ItemIndex + 1;
  idLivro  := id_livro;

  num_capitulos := ClientModule1.ServerMethods1Client.buscarCapitulos(id_livro);

  if (num_capitulos > 0) then
    ajustarCapitulos(num_capitulos);
end;

procedure TfrmBiblia.lstVersoesClick(Sender: TObject);
begin
  idVersao := lstVersoes.ItemIndex + 1;
end;

end.
