unit eWorkEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, cPlace;

type
  TWorkEdit = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    LookLoc: TDBLookupComboBox;
    LookHouse: TDBLookupComboBox;
    LookArea: TDBLookupComboBox;
    LookStreet: TDBLookupComboBox;
    RadioGroup1: TRadioGroup;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    Work: TPlace;
    { Private declarations }
  public
    Insert: Boolean;
    idWork: integer;
    idAdress: integer;

    procedure AddRec;
    procedure ChangRec;
    procedure Del;
    { Public declarations }
  end;

var
  WorkEdit: TWorkEdit;

implementation

{$R *.dfm}

uses fDM;

procedure TWorkEdit.AddRec;
begin
  Work := TPlace.Create('StatWork');
  Work.adress.Ar.id := LookArea.KeyValue;
  Work.adress.Loc.id := LookLoc.KeyValue;
  Work.adress.Street.id := LookStreet.KeyValue;
  Work.adress.House_numb.id := LookHouse.KeyValue;
  Work.name_ := LabeledEdit1.Text;
  Work.adress.New;
  work.adress.id:=dm.GetLastId('Adress');
  Work.New;
  Work.Destroy;
  dm.RefTable(dm.QWorkBrowse);
  Close;
end;

procedure TWorkEdit.Button1Click(Sender: TObject);
begin
  if Insert then
    AddRec
  else
    ChangRec;
end;

procedure TWorkEdit.ChangRec;
begin
  Work := TPlace.Create('StatWork');
  Work.Get(idWork);
  Work.adress.GetAtr(Work.adress.id);
  Work.adress.Ar.id := LookArea.KeyValue;
  Work.adress.Loc.id := LookLoc.KeyValue;
  Work.adress.Street.id := LookStreet.KeyValue;
  Work.adress.House_numb.id := LookHouse.KeyValue;
  Work.name_ := LabeledEdit1.Text;
  Work.adress.ChangeAtr;
  //Work.Adress.id:=(dm.GetLastId('Adress'));
  Work.ChangeAtr;
  Work.Destroy;
  dm.RefTable(dm.QWorkBrowse);
  Close;
end;

procedure TWorkEdit.Del;
begin
  Work := TPlace.Create('StatWork');
  Work.Del(idWork);
  Work.Destroy;
  dm.RefTable(dm.QWorkBrowse);
end;

end.
