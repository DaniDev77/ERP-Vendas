unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,uDTMConexao, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnFechar: TBitBtn;
    btnAcessar: TBitBtn;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    bFechar:Boolean;
    procedure FecharAplicacao;
    procedure FecharFormulario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}
                             {edtUsuario    edtSenha  btnFechar  btnAcessar   }
 uses cCadUsuario,Upricipal;

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var oUsuario: TUsuario;
begin
  if Trim(edtUsuario.Text) = '' then begin ShowMessage('Informe o usuário!');  edtUsuario.SetFocus; Exit; end;
  if Trim(edtSenha.Text)   = '' then begin ShowMessage('Informe a senha!');    edtSenha.SetFocus;   Exit; end;

  try
    oUsuario := TUsuario.Create(dtmPrincipal.dtmPrincipalDB);
    if oUsuario.Logar(edtUsuario.Text, edtSenha.Text) then
    begin
      oUsuarioLogado.codigo := oUsuario.codigo;
      oUsuarioLogado.nome   := oUsuario.nome;
      oUsuarioLogado.senha  := oUsuario.senha;
      MessageDlg('Usuário ' + oUsuarioLogado.nome + ' entrou no sistema.', mtInformation, [mbOK], 0);
      FecharFormulario;
    end
    else
    begin
      MessageDlg('Usuário ou senha inválidos!', mtWarning, [mbOK], 0);
      edtSenha.Clear;
      edtUsuario.SetFocus;
    end;
  finally
    FreeAndNil(oUsuario);
  end;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  FecharAplicacao;  //FECHA A APLICAÇAo
end;


procedure TfrmLogin.FecharAplicacao;
begin
  bFechar := True;
  Application.Terminate;
end;

procedure TfrmLogin.FecharFormulario;
begin
  bFechar := True;
  Close;
end;

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:= bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
    bFechar:=False;
    edtUsuario.SetFocus;
end;

end.
