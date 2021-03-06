unit eDoctor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, cDoctor, Vcl.DBCtrls;

type
  TDoctorEdit = class(TForm)
    LabeledEdit3: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit1: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Button1: TButton;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
  private
  Doc:TDoctor;
    { Private declarations }
  public
  idDoc:integer;
  Insert:Boolean;
  procedure InsDoc;
  procedure ChangeDoc;
  procedure del;
    { Public declarations }
  end;

var
  DoctorEdit: TDoctorEdit;

implementation

{$R *.dfm}

uses fDM;

procedure TDoctorEdit.Button1Click(Sender: TObject);
begin
 if Insert then
   InsDoc
 else
   ChangeDoc;
end;

procedure TDoctorEdit.ChangeDoc;
begin
  Doc:=TDoctor.Create;
  Doc.GetAtr(idDoc);
  Doc.surname:=LabeledEdit1.Text;
  Doc.name_:=LabeledEdit2.Text;
  Doc.patronymic:=LabeledEdit3.Text;
  doc.enpolyment_date:=DateTimePicker1.Date;
  doc.Position.GetAtr(DBLookupComboBox1.KeyValue);
  doc.Polikl.GetAtr(DBLookupComboBox2.KeyValue);
  Doc.ChangeAtrib;
  Doc.Destroy;
  dm.RefTable(dm.QDoctorBrowse);
  close;
end;

procedure TDoctorEdit.del;
begin
  Doc:=TDoctor.Create;
  Doc.GetAtr(idDoc);
  Doc.Del(idDoc);
  Doc.Destroy;
  dm.RefTable(dm.QDoctorBrowse);
end;

procedure TDoctorEdit.InsDoc;
begin
  Doc:=TDoctor.Create;
  Doc.surname:=LabeledEdit1.Text;
  Doc.name_:=LabeledEdit2.Text;
  Doc.patronymic:=LabeledEdit3.Text;
  doc.enpolyment_date:=DateTimePicker1.Date;
  doc.Position.GetAtr(DBLookupComboBox1.KeyValue);
  doc.Polikl.GetAtr(DBLookupComboBox2.KeyValue);
  Doc.New;
  doc.Destroy;
  dm.RefTable(dm.QDoctorBrowse);
  close;
end;

end.
