unit eSector;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  cSector, cPlace;

type
  TSectorEdit = class(TForm)
    LabeledEdit1: TLabeledEdit;
    LookPolikl: TDBLookupComboBox;
    Label1: TLabel;
    Button1: TButton;
    procedure New;
    procedure Change;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Insert: Boolean;
    idSector: integer;
    { Public declarations }
  end;

var
  SectorEdit: TSectorEdit;
  Sector: TSector;
  Polikl: TPlace;

implementation

{$R *.dfm}

uses cPolis, fDM;

procedure TSectorEdit.Button1Click(Sender: TObject);
begin
  if Insert then
    New
  else
    Change;

end;

procedure TSectorEdit.Change;
begin
  Sector := TSector.Create;
  Sector.Get(idSector);
  Sector.name := LabeledEdit1.Text;
  Sector.Polikl.id := LookPolikl.KeyValue;
  Sector.Change(Sector);
  dm.RefTable(dm.QBrowseSector);
  close;
end;

procedure TSectorEdit.New;
begin
  Sector := TSector.Create;
  Sector.name := LabeledEdit1.Text;
  Sector.Polikl.id := LookPolikl.KeyValue;
  Sector.New(Sector);
  dm.RefTable(dm.QBrowseSector);
  close;
end;

end.
