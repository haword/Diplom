unit cDoctor;

interface

uses cSmallTables, fDM, System.Variants;

type
  TDoctor = class
  public
    id: integer;
    surname, name_, patronymic: string;
    enpolyment_date, demissal: Tdate;
    Polikl, Position: TSmallTables;

    procedure ChangeAtrib;
    procedure New;
    procedure Del(Find_id: integer);
    procedure GetAtr(Find_id: integer);
    constructor Create;
    destructor Destroy;
  end;

implementation

{ TDoctor }

procedure TDoctor.ChangeAtrib;
begin
  with dm.QDoctorUpd do
  begin
    Close;
    Parameters.ParamValues['id'] := id;
    Parameters.ParamValues['surname'] := surname;
    Parameters.ParamValues['name'] := name_;
    Parameters.ParamValues['patronymic'] := patronymic;
    Parameters.ParamValues['enployment_date'] := enpolyment_date;
   // Parameters.ParamValues['demissal'] := demissal;
    Parameters.ParamValues['polikl'] := Polikl.id;
    Parameters.ParamValues['position'] := Position.id;
    ExecSQL;
  end;
end;

constructor TDoctor.Create;
begin
  Polikl := TSmallTables.Create('Polikl');
  Position := TSmallTables.Create('Position');
end;

procedure TDoctor.Del(Find_id: integer);
begin
  with dm.QDoctorDel do
  begin
    Close;
    Parameters.ParamValues['id'] := Find_id;
    ExecSQL;
  end;
end;

destructor TDoctor.Destroy;
begin
  Polikl.Destroy;
  Position.Destroy;
end;

procedure TDoctor.GetAtr(Find_id: integer);
begin
  with dm.QDoctorGet do
  begin
    Close;
    Parameters.ParamValues['id'] := Find_id;
    open;
  end;
  surname := dm.QDoctorGetsurname.AsString;
  name_ := dm.QDoctorGetname.AsString;
  patronymic := dm.QDoctorGetpatronymic.AsString;
  enpolyment_date := VarToDateTime(dm.QDoctorGetenployment_date.AsVariant);
 // demissal := dm.QDoctorGetdemissal.AsDateTime;
  Polikl.GetAtr(dm.QDoctorGetidpolikl.Asinteger);
  Position.GetAtr(dm.QDoctorGetidposition.Asinteger);
  id := Find_id;
end;

procedure TDoctor.New;
begin
  with dm.QDoctorIns do
  begin
    Close;
    Parameters.ParamValues['surname'] := surname;
    Parameters.ParamValues['name'] := name_;
    Parameters.ParamValues['patronymic'] := patronymic;
    Parameters.ParamValues['enployment_date'] := enpolyment_date;
   // Parameters.ParamValues['demissal'] := demissal;
    Parameters.ParamValues['polikl'] := Polikl.id;
    Parameters.ParamValues['position'] := Position.id;
    ExecSQL;
  end;
end;

end.
