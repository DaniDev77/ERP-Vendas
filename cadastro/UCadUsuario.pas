unit UCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.ComCtrls,cCadUsuario,uEnum,uDTMConexao, Vcl.Imaging.pngimage;

type
  TfrmCadUsuario = class(TForm1)
    FDQListagemusuarioId: TFDAutoIncField;
    FDQListagemnome: TStringField;
    FDQListagemsenha: TStringField;
    edtUsuarioId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtSenha: TLabeledEdit;
    Image6: TImage;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    oUsuario:TUsuario;
    function Gravar(EstadoDoCadastro:TEstadoCadastro):Boolean; override;
    function Apagar:Boolean;override;
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses
  cAcaoAcesso;

{$R *.dfm}

{ TfrmCadUsuario }

function TfrmCadUsuario.Apagar: Boolean;
begin
     if oUsuario.Selecionar(FDQListagem.FieldByName('usuarioId').AsInteger) then begin
        Result:=oUsuario.Apagar;
     end;

end;

procedure TfrmCadUsuario.btnAlterarClick(Sender: TObject);
begin
   if oUsuario.Selecionar(FDQListagem.FieldByName('usuarioId').AsInteger) then begin
      edtUsuarioId.Text:=IntToStr(oUsuario.codigo);
      edtNome.Text     :=oUsuario.nome;
      edtSenha.Text    :=oUsuario.senha;
     // lkpPerfil.KeyValue:=oUsuario.perfil;

    end
    else if EstadoDoCadastro=ecAlterar then begin
      btnCancelar.Click;
      Abort;
    end;

  inherited;

end;

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);
begin
  if Trim(edtNome.Text) = ''  then begin ShowMessage('Nome obrigatório!');  edtNome.SetFocus;  Exit; end;
  if Trim(edtSenha.Text) = '' then begin ShowMessage('Senha obrigatória!'); edtSenha.SetFocus; Exit; end;

  if (EstadoDoCadastro = ecInserir) and oUsuario.UsuarioExiste(edtNome.Text) then
  begin
    ShowMessage('Usuário já cadastrado!');
    edtNome.SetFocus;
    Exit;
  end;

  if edtUsuarioId.Text <> EmptyStr then
    oUsuario.codigo := StrToInt(edtUsuarioId.Text)
  else
    oUsuario.codigo := 0;

  oUsuario.nome  := Trim(edtNome.Text);
  oUsuario.senha := Trim(edtSenha.Text);

  inherited;
end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
   if Assigned(oUsuario) then
   FreeAndNil(oUsuario);
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
   oUsuario:=TUsuario.Create(dtmPrincipal.dtmPrincipalDB);
   IndiceAtual:='nome';
end;

procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
  inherited;
  CentralizarDadosGrid(grdListagem);
  CentralizarTitulosGrid(grdListagem);
end;

function TfrmCadUsuario.Gravar(EstadoDoCadastro: TEstadoCadastro): Boolean;
begin
  if EstadoDoCadastro = ecInserir then
    Result := oUsuario.Inserir
  else if EstadoDoCadastro = ecAlterar then
    Result := oUsuario.Atualizar;
end;


end.
