unit cAdress;

interface

uses cSmallTables, fDM;

{ ����� ��� ������ � �������� Adress }
type
  TAdress = Class
    id: integer;
    Loc, Ar, Street, House_numb: TSmallTables;

    procedure GetAtr(find_id: integer);
    procedure New;
    procedure ChangeAtr;
    procedure Del(find_id: integer);
    function GetFullAdress: string;
    constructor Create;
    destructor Destroy;

  End;

implementation

{ TAdress }

{ TAdress }

procedure TAdress.ChangeAtr;
begin
  with dm.QAdress do
  begin
    Close;
    SQl.Clear;
    Sql.Add('update adress set locality=:locality,');
    Sql.Add('area=:area, line=:line, number_line=:number_line where id=:id');
    Parameters.ParamValues['id'] := id;
    Parameters.ParamValues['Locality'] := Loc.id;
    Parameters.ParamValues['area'] := Ar.id;
    Parameters.ParamValues['line'] := Street.id;
    Parameters.ParamValues['number_line'] := House_numb.id;
    ExecSQL;
  end;
end;

constructor TAdress.Create;
begin
  Street := TSmallTables.Create('Street');
  Loc := TSmallTables.Create('Locality');
  Ar := TSmallTables.Create('Area');
  House_numb := TSmallTables.Create('HouseNumber');
end;

procedure TAdress.Del(find_id: integer);
begin
  with dm.QAdress do
  begin
    Close;
    sql.clear;
    Sql.Add('delete Adress where id=:id');
    Parameters.ParamValues['id'] := find_id;
    ExecSQL;
  end;
end;

destructor TAdress.Destroy;
begin
  Loc.Destroy;
  Ar.Destroy;
  Street.Destroy;
  House_numb.Destroy;
end;

procedure TAdress.GetAtr(find_id: integer);
begin
  with dm.QAdress do
  begin
    Close;
    Sql.Clear;
    Sql.Add('select locality, area, line, number_line from adress where id=:id');
    Parameters.ParamValues['id'] := find_id;
    Open;
  end;
  id := find_id;
  Loc.GetAtr(dm.QAdresslocality.asinteger);
  Ar.GetAtr(dm.QAdressarea.asinteger);
  Street.GetAtr(dm.QAdressline.asinteger);
  House_numb.GetAtr(dm.QAdressnumber_line.asinteger);
end;

function TAdress.GetFullAdress: string;
begin
  result := '';
  result := Ar.name + ' ' + Loc.name + ' ' + Street.name + ' ' +
    House_numb.name;
end;

procedure TAdress.New;
begin
  with dm.QAdress do
  begin
    Close;
    Sql.Clear;
    Sql.Add('insert adress(locality,area, line, number_line)');
    Sql.Add('values(:locality, :area, :line, :number_line)');
    Parameters.ParamValues['locality'] := Loc.id;
    Parameters.ParamValues['area'] := Ar.id;
    Parameters.ParamValues['line'] := Street.id;
    Parameters.ParamValues['number_line'] := House_numb.id;
    ExecSQL;
  end;
end;

end.
