unit fDiagnos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Grids, Vcl.DBGrids,
  Vcl.ToolWin, Vcl.ActnCtrls;

type
  TuDiagnos = class(TForm)
    ActionToolBar1: TActionToolBar;
    DBGrid1: TDBGrid;
    AC: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    DS: TDataSource;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uDiagnos: TuDiagnos;

implementation

{$R *.dfm}

uses fDM, eDiagnos, cDiagnoses;
var Diag:TDiagnoses;
procedure TuDiagnos.Action1Execute(Sender: TObject);
begin
  DiagnosEdit.show;
  DiagnosEdit.Insert:=true;
  DiagnosEdit.LabeledEdit1.Clear;
  DiagnosEdit.LabeledEdit2.Clear;
end;

procedure TuDiagnos.Action2Execute(Sender: TObject);
begin
  DiagnosEdit.show;
  DiagnosEdit.Insert:=false;
  DiagnosEdit.id:=dm.QDiagBrowseid.AsInteger;
  DiagnosEdit.LabeledEdit1.Text:=dm.QDiagBrowsecode.AsString;
  DiagnosEdit.LabeledEdit2.Text:=dm.QDiagBrowsename.AsString;
end;

procedure TuDiagnos.Action3Execute(Sender: TObject);
begin
    if MessageBox(handle, '������� �������?', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
     Diag:=TDiagnoses.Create;
     diag.Del(dm.QDiagBrowseid.AsInteger);
     Diag.Destroy;
     dm.RefTable(dm.QDiagBrowse);
  end;
end;

procedure TuDiagnos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.
