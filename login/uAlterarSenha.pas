unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,Upricipal,uDTMConexao,cCadUsuario;

type
  TfrmAlterarSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TBitBtn;
    btnAlterar: TBitBtn;
    Label3: TLabel;
    edtSenhaAtual: TEdit;
    edtSenhaNova: TEdit;
    edtRepetirNovaSenha: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;


implementation

{$R *.dfm}

procedure TfrmAlterarSenha.btnAlterarClick(Sender: TObject);
var oUsuario: TUsuario;
begin
  if Trim(edtSenhaAtual.Text)       = '' then begin ShowMessage('Informe a senha atual!');        edtSenhaAtual.SetFocus;       Exit; end;
  if Trim(edtSenhaNova.Text)        = '' then begin ShowMessage('Informe a nova senha!');          edtSenhaNova.SetFocus;        Exit; end;
  if Trim(edtRepetirNovaSenha.Text) = '' then begin ShowMessage('Repita a nova senha!');           edtRepetirNovaSenha.SetFocus; Exit; end;

  if edtSenhaAtual.Text <> oUsuarioLogado.senha then
  begin
    MessageDlg('Senha atual incorreta!', mtWarning, [mbOK], 0);
    edtSenhaAtual.Clear;
    edtSenhaAtual.SetFocus;
    Exit;
  end;

  if edtSenhaNova.Text <> edtRepetirNovaSenha.Text then
  begin
    MessageDlg('As senhas novas não coincidem!', mtWarning, [mbOK], 0);
    edtSenhaNova.Clear;
    edtRepetirNovaSenha.Clear;
    edtSenhaNova.SetFocus;
    Exit;
  end;

  if edtSenhaNova.Text = oUsuarioLogado.senha then
  begin
    MessageDlg('A nova senha deve ser diferente da atual!', mtWarning, [mbOK], 0);
    edtSenhaNova.SetFocus;
    Exit;
  end;

  try
    oUsuario := TUsuario.Create(dtmPrincipal.dtmPrincipalDB);
    oUsuario.codigo := oUsuarioLogado.codigo; // ? bug corrigido
    oUsuario.senha  := edtSenhaNova.Text;
    oUsuario.AlterarSenha;
    oUsuarioLogado.senha := edtSenhaNova.Text; // atualiza sessão
    MessageDlg('Senha alterada com sucesso!', mtInformation, [mbOK], 0);
    LimparEdits;
  finally
    FreeAndNil(oUsuario);
  end;
end;

procedure TfrmAlterarSenha.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmAlterarSenha.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if Key = VK_ESCAPE then
            Close;
end;

procedure TfrmAlterarSenha.FormShow(Sender: TObject);
begin
 LimparEdits;
end;

procedure TfrmAlterarSenha.LimparEdits ;
begin
  edtSenhaAtual.Clear;
  edtSenhaNova.Clear;
  edtRepetirNovaSenha.Clear;
end;


end.
