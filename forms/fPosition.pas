unit fPosition;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.Grids, Vcl.DBGrids, cSmallTables;

type
  TuPosition = class(TForm)
    DBGrid1: TDBGrid;
    ActionToolBar1: TActionToolBar;
    AC: TActionManager;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    DataSource1: TDataSource;
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  Pos:TSmallTables;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uPosition: TuPosition;

implementation

{$R *.dfm}

uses fDM;

procedure TuPosition.Action1Execute(Sender: TObject);
var
  newName: String;
begin
  if InputQuery('���������� ����� ���������', '������� ������������', newName)
  then
  begin
    Pos := TSmallTables.Create('Position');
    Pos.name := newName;
    Pos.New;
    dm.RefTable(dm.QposBrowse);
  end;

end;

procedure TuPosition.Action2Execute(Sender: TObject);
begin
  Pos := TSmallTables.Create('Position');
  Pos.GetAtr(dm.QposBrowseid.AsInteger);
  Pos.name := InputBox('�������������� ���������',
    '������� ����� ������������ ���������', dm.QposBrowsename.AsString);
  Pos.ChangeAtr;
  dm.RefTable(dm.QposBrowse);
end;

procedure TuPosition.Action3Execute(Sender: TObject);
begin
  if MessageBox(handle, '������� ��������', '�������� ������',
    (MB_YESNO + MB_ICONQUESTION)) = idyes then
  begin
    Pos := TSmallTables.Create('Position');
    Pos.Del(dm.QposBrowseid.AsInteger);
  end;
  dm.RefTable(dm.QposBrowse);
end;

procedure TuPosition.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=Cafree;
end;

end.
