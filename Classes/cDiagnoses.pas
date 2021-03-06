unit cDiagnoses;

interface

{ ����� ��� ������ � ��������� Diagnoses }
type
  TDiagnoses = Class
  public
    id: integer;
    code_: String;
    name_: string;

    procedure GetAtr(Find_id: integer);
    procedure ChangeAtr;
    procedure New;
    procedure Del(idRec: integer);
  End;

implementation

{ TDiagnoses }

uses fDM;

procedure TDiagnoses.ChangeAtr;
begin
  dm.QDiagnoses.Close;
  dm.QDiagnoses.SQL.Clear;
  dm.QDiagnoses.SQL.Add('update Diagnoses set');
  dm.QDiagnoses.SQL.Add(' name=:name, code=:code  where id=:id');
  dm.QDiagnoses.Parameters.ParamValues['code'] := code_;
  dm.QDiagnoses.Parameters.ParamValues['name'] := name_;
  dm.QDiagnoses.Parameters.ParamValues['id'] := id;
  dm.QDiagnoses.ExecSQL;
end;

procedure TDiagnoses.Del(idRec: integer);
begin
  dm.QDiagnoses.Close;
  dm.QDiagnoses.SQL.Add('delete from Diagnoses where id=:id');
  dm.QDiagnoses.Parameters.ParamValues['id'] := idRec;
  dm.QDiagnoses.ExecSQL;
end;

procedure TDiagnoses.GetAtr(Find_id: integer);
begin
  dm.QDiagnoses.Close;
  dm.QDiagnoses.SQL.Clear;
  dm.QDiagnoses.SQL.Add('select name, code from Diagnoses where id=:id');
  dm.QDiagnoses.Parameters.ParamValues['id'] := Find_id;
  dm.QDiagnoses.Open;
  name_ := dm.QDiagnoses.FieldByName('name').AsString;
  code_ := dm.QDiagnoses.FieldByName('code').AsString;
  id := Find_id;
end;

procedure TDiagnoses.New;
begin
  dm.QDiagnoses.Close;
  dm.QDiagnoses.SQL.Clear;
  dm.QDiagnoses.SQL.Add('insert Diagnoses (code, name)  Values(:code,:name)');
  dm.QDiagnoses.Parameters.ParamValues['code'] := code_;
  dm.QDiagnoses.Parameters.ParamValues['name'] := name_;
  dm.QDiagnoses.ExecSQL;
end;

end.
