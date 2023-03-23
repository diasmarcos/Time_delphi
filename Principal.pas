unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.MPlayer;

type
  TForm2 = class(TForm)
    t_timer: TTimer;
    lb_segundos: TLabel;
    Label2: TLabel;
    lb_minutos: TLabel;
    MediaPlayer1: TMediaPlayer;
    btn_play: TSpeedButton;
    btn_abrir: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Label1: TLabel;
    procedure t_timerTimer(Sender: TObject);
    procedure btn_playClick(Sender: TObject);
    procedure btn_abrirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn_abrirClick(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    MediaPlayer1.FileName:=OpenDialog1.FileName;
  end;
end;

procedure TForm2.btn_playClick(Sender: TObject);
begin
  if (Edit1.Text<>'0') AND (Edit1.Text <> '') then
  begin
    if MediaPlayer1.FileName <> '' then
    begin
        t_timer.Enabled:=true;
    end else begin
        MessageBox (Application.Handle, Pchar ('Selecione o arquivo!!'), 'Alerta', MB_OK);
    end;
  end else begin
      //MessageBox (Application.Handle, Pchar ('Digite o tempo' + #13 + Label1.caption), 'Alerta', MB_OK);
      MessageBox (Application.Handle, Pchar ('Digite o tempo!!'), 'Alerta', MB_OK);
  end;




end;

procedure TForm2.t_timerTimer(Sender: TObject);
var seg, min, cont:Integer;
begin
  seg:= StrToInt(lb_segundos.Caption);
  min:= StrToInt(lb_minutos.Caption);
  cont:= seg+1;

  lb_segundos.Caption:=IntToStr(cont);

  if lb_segundos.Caption = '60' then begin
    lb_segundos.Caption:='0';
    lb_minutos.Caption:= IntToStr(StrToInt(lb_minutos.Caption)+1);

  end;
  if lb_minutos.Caption = Edit1.Text then begin
    t_timer.Enabled:=false;
    MediaPlayer1.Open;
    MediaPlayer1.Play;


  end;

end;

end.
