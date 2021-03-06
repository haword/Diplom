unit ePolikl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  cAdress, cPlace;

type
  TPoliklEdit = class(TForm)
    LabeledEdit1: TLabeledEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LookArea: TDBLookupComboBox;
    LookLoc: TDBLookupComboBox;
    LookStreet: TDBLookupComboBox;
    LookHouse: TDBLookupComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    insert: Boolean;
    Adress: TAdress;
    Polikl: Tplace;

    procedure newRecord;
    procedure ChangeRecord;
    { Public declarations }
  end;

var
  PoliklEdit: TPoliklEdit;

implementation

{$R *.dfm}

uses fDM;

procedure TPoliklEdit.Button1Click(Sender: TObject);
begin
  if insert then
    newRecord
  else
    ChangeRecord;

end;

procedure TPoliklEdit.ChangeRecord;
begin
  Polikl := Tplace.Create('Polikl');
  Polikl.Get(dm.QPoliklBrowseid.AsInteger);

  Adress := Polikl.Adress.Create;
  Polikl.Adress.GetAtr(dm.QPoliklBrowseidAdress.AsInteger);

  Adress.Ar.GetAtr(LookArea.KeyValue);
  Adress.Loc.GetAtr(LookLoc.KeyValue);
  Adress.Street.GetAtr(LookStreet.KeyValue);
  Adress.House_numb.GetAtr(LookHouse.KeyValue);

  Polikl.name_ := LabeledEdit1.Text;

  if Adress.id=0 then
  begin
   Adress.New;
   Adress.GetAtr(dm.GetLastId('Adress'));
  end
  else
  Adress.ChangeAtr;

  Polikl.ChangeAtr;
  Polikl.Destroy;
  close;
  dm.RefTable(dm.QPoliklBrowse);
end;

procedure TPoliklEdit.newRecord;
begin

  Polikl := Tplace.Create('Polikl');
  Adress := Polikl.Adress.Create;
  Adress.Ar.GetAtr(LookArea.KeyValue);
  Adress.Loc.GetAtr(LookLoc.KeyValue);
  Adress.Street.GetAtr(LookStreet.KeyValue);
  Adress.House_numb.GetAtr(LookHouse.KeyValue);
  Adress.New;
  Polikl.Adress.GetAtr(dm.GetLastId('Adress'));
  Polikl.name_ := LabeledEdit1.Text;
  Polikl.New;
  Polikl.Destroy;
  close;
  dm.RefTable(dm.QPoliklBrowse);
end;

end.
