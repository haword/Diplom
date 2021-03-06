unit cSocStatus;

interface

{ ����� ��� ������ ��������� Soc_Status }
uses cSmallTables, fDM;

Type
  TSocStatus = class
  public
    id: integer;
    name: String;
    Group_inval: TSmallTables;

    procedure Get(Find_id: integer);
    procedure New(Soc_status: TSocStatus);
    procedure Change(Soc_status: TSocStatus);
    procedure Del(Soc_status: TSocStatus);
    constructor Create;
    destructor Destroy;
  end;

implementation

{ TSoc_status }

procedure TSocStatus.Change(Soc_status: TSocStatus);
begin
  with dm.QsocStatus do
  begin
    close;
    sql.clear;
    sql.add('update Soc_status set name=:name, group_inval=:group_inval where id=:id');
    parameters.ParamValues['id'] := Soc_status.id;
    parameters.ParamValues['name'] := Soc_status.name;
    parameters.ParamValues['group_inval'] := Soc_status.Group_inval.id;
    ExecSQl;
  end;
end;

constructor TSocStatus.Create;
begin
  Group_inval:=TSmallTables.create('GroupInval');
  Group_inval.id:=0;
end;

procedure TSocStatus.Del(Soc_status: TSocStatus);
begin
  with dm.QsocStatus do
  begin
    close;
    sql.clear;
    sql.add('delete Soc_status group_inval from Soc_status where id=:id');
    parameters.ParamValues['id'] := Soc_status.id;
    ExecSQl;
  end;
end;

destructor TSocStatus.Destroy;
begin
  Group_inval.Destroy;
  inherited;
end;

procedure TSocStatus.Get(Find_id: integer);
begin
  with dm.QsocStatus do
  begin
    close;
    sql.clear;
    sql.add('select name, group_inval from Soc_status where id=:id');
    parameters.ParamValues['id'] := Find_id;
    open;
  end;
  id := Find_id;
  name := dm.QsocStatus.FieldByName('name').AsString;
  Group_inval := TSmallTables.Create;
  Group_inval.GetAtr(dm.QsocStatus.FieldByName('group_inval').AsInteger,
    'Soc_Status');
end;

procedure TSocStatus.New(Soc_status: TSocStatus);
begin
  with dm.QsocStatus do
  begin
    close;
    sql.clear;
    sql.add('insert Soc_status(name, group_inval) values(name, group_inval)');
    parameters.ParamValues['name'] := Soc_status.name;
    parameters.ParamValues['group_inval'] := Soc_status.Group_inval.id;
    ExecSQl;
  end;
end;

end.
