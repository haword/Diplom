unit fPac;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TPac = class(TForm)
    AC: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    DBGrid1: TDBGrid;
    ActionToolBar1: TActionToolBar;
    DataSource1: TDataSource;
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
  Pac: TPac;

implementation

{$R *.dfm}

uses ePacient, fDM;

procedure TPac.Action1Execute(Sender: TObject);
begin
  PacientEdit.Insert := true;
  with PacientEdit do
  begin
    Show;
    LabeledEdit1.Clear;
    LabeledEdit2.Clear;
    LabeledEdit3.Clear;
    Edit1.Clear;
    Combobox1.ItemIndex := -1;
    DateTimePicker1.Date := now();
  end;

  dm.OpenAdressTables;
  dm.OpenPlaceTables;
  dm.OpenStatusTable;
  dm.OpenPolisTable
end;

procedure TPac.Action2Execute(Sender: TObject);
begin
  PacientEdit.Show;
  PacientEdit.GetPac;
  PacientEdit.Insert := false;

  dm.OpenAdressTables;
  dm.OpenPlaceTables;
  dm.OpenStatusTable;
  dm.OpenPolisTable
end;

procedure TPac.Action3Execute(Sender: TObject);
begin
  if MessageBox(Handle, '������� ��������?', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
    begin
      PacientEdit.DelPac;
    end;
end;

procedure TPac.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.
