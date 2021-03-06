unit cPolis;

interface
 uses cSmallTables, fdm;
Type
  Tpolis = Class
    id: integer;
    PolisType:TSmallTables;
    PolisNumber: String;

    procedure Get(Find_id: integer);
    procedure new;
    procedure Change;
    procedure Del(Find_id: integer);
    destructor Destroy;
    constructor Create;
  End;

implementation

{ Tpolis }

procedure Tpolis.Change;
begin
  with dm.QPolis do
  begin
    Close;
    sql.Clear;
    Sql.Add('update Polis set polis_type=:polis_type, number=:number where id=:id');
    Parameters.ParamValues['polis_type'] := PolisType.id;
    Parameters.ParamValues['number'] := PolisNumber;
    Parameters.ParamValues['id'] := id;
    ExecSQl;
  end;
end;


constructor Tpolis.Create;
begin
  PolisType:=TSmallTables.Create('PolisType');
end;

procedure Tpolis.Del(Find_id: integer);
begin
  with dm.QPolis do
  begin
    Close;
    sql.Clear;
    Sql.Add('delete Polis where id=:id');
    Parameters.ParamValues['id'] := Find_id;
    ExecSQl;
  end;
end;

destructor Tpolis.Destroy;
begin
  PolisType.Destroy;
  inherited;
end;

procedure Tpolis.Get(Find_id: integer);
begin
  with dm.QPolis do
  begin
    Close;
    sql.Clear;
    Sql.Add('select polis_type, number from Polis where id=:id');
    Parameters.ParamValues['id'] := Find_id;
    Open;
  end;
  PolisNumber := dm.QPolis.FieldByName('number').AsString;
  id := Find_id;
  PolisType.GetAtr(dm.QPolis.FieldByName('polis_type').ASinteger);
end;


procedure Tpolis.new;
begin
  with dm.QPolis do
  begin
    Close;
    sql.Clear;
    Sql.Add('insert Polis(polis_type, number) values(:polis_type, :number)');
    Parameters.ParamValues['polis_type'] := PolisType.id;
    Parameters.ParamValues['number'] := PolisNumber;
    ExecSQl;
  end;
end;

end.
