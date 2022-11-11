unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
     uServer, uDm;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  private
    { Private declarations }
    function dataHora: String;
    procedure escreverLog(mensagem: String);
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function buscarVersoes: String;
    function buscarLivros: String;
    function buscarCapitulos(id_livro: Integer): Integer;
    function buscarVersiculos(id_versao, id_livro, id_capitulo: Integer): String;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils;

function TServerMethods1.buscarCapitulos(id_livro: Integer): Integer;
var
  nomeLivro: String;
  numCapitulos: Integer;
begin
  Result := 0;

  // Buscar a quantidade de caítulos do livro selecionado
  if (id_livro = 0) OR (id_livro > 66) then
    Exit;

  with fDm do
  begin
    ConectarBanco;

    nomeLivro := BuscarLivro(id_livro);
    escreverLog(dataHora + ' - Buscar os capítulos do livro ' + nomeLivro);

    numCapitulos := BuscarCapitulos(id_livro);

    Result := numCapitulos;
    DesconectarBanco;
  end;
end;

function TServerMethods1.buscarLivros: String;
var livros: String;
begin
  // Buscar os livros cadastrados no banco
  escreverLog(dataHora + ' - Buscar Livros');
  livros := EmptyStr;

  with fDm do
  begin
    ConectarBanco;
    BuscarLivros;

    qryLivros.First;

    while NOT(qryLivros.Eof) do
    begin
      livros := livros + IntToStr(qryLivrosb_liv_id.AsInteger) + ' - ' +
                qryLivrosb_liv_nome.AsString + ';';
      qryLivros.Next;
    end;

    Result := livros;
    DesconectarBanco;
  end;
end;

function TServerMethods1.buscarVersiculos(id_versao, id_livro, id_capitulo: Integer): String;
var texto, nomeLivro: String;
begin
  //
  with fDm do
  begin
    ConectarBanco;

    nomeLivro := BuscarLivro(id_livro);
    escreverLog(dataHora + ' - Buscar os versículos do capítulo ' + IntToStr(id_capitulo) + ' do livro ' + nomeLivro);

    texto := BuscarVersiculos(id_versao, id_livro, id_capitulo);

    Result := texto;
    DesconectarBanco;
  end;
end;

function TServerMethods1.buscarVersoes: String;
var versoes: String;
begin
  // Buscar as versões das bíblidas cadastradas no banco
  escreverLog(dataHora + ' - Procurar versões');
  versoes := EmptyStr;

  with fDm do
  begin
    ConectarBanco;
    BuscarVersoes;

    qryVersoes.First;

    while NOT(qryVersoes.Eof) do
    begin
      versoes := versoes + IntToStr(qryVersoesvrs_id.AsInteger) + ' - ' +
                 qryVersoesvrs_nome.AsString + ';';
      qryVersoes.Next;
    end;

    Result := versoes;
    DesconectarBanco;
  end;
  
end;

function TServerMethods1.dataHora: String;
var dataHora: TDateTime;
begin
  //
  Result := EmptyStr;
  dataHora := Now;

  DateTimeToString(Result, 'c', dataHora);
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

procedure TServerMethods1.escreverLog(mensagem: String);
begin
  if (mensagem = EmptyStr) then
    Exit;

  frmServidor.memLog.Lines.Add(mensagem);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;
end.

