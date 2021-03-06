program Disease;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Main},
  fDM in 'fDM.pas' {DM: TDataModule},
  fPac in 'forms\fPac.pas' {Pac},
  Vcl.Themes,
  Vcl.Styles,
  cPac in 'Classes\cPac.pas',
  cSmallTables in 'Classes\cSmallTables.pas',
  fAdress in 'forms\fAdress.pas' {uAdress},
  cDiagnoses in 'Classes\cDiagnoses.pas',
  cDoctor in 'Classes\cDoctor.pas',
  cPlace in 'Classes\cPlace.pas',
  cAdress in 'Classes\cAdress.pas',
  cPolis in 'Classes\cPolis.pas',
  cSector in 'Classes\cSector.pas',
  cVisit in 'Classes\cVisit.pas',
  eAdress in 'EditForms\eAdress.pas' {AdressEdit},
  ePacient in 'EditForms\ePacient.pas' {PacientEdit},
  fSector in 'forms\fSector.pas' {uSector},
  eSector in 'EditForms\eSector.pas' {SectorEdit},
  fPolisType in 'forms\fPolisType.pas' {uPolisType},
  ePolis in 'EditForms\ePolis.pas' {PolisEdit},
  fSocStatus in 'forms\fSocStatus.pas' {uSocStatus},
  fDiagnos in 'forms\fDiagnos.pas' {uDiagnos},
  eDiagnos in 'EditForms\eDiagnos.pas' {DiagnosEdit},
  fGrInval in 'forms\fGrInval.pas' {uGrInval},
  fPolikl in 'forms\fPolikl.pas' {uPolikl},
  ePolikl in 'EditForms\ePolikl.pas' {PoliklEdit},
  fDoctor in 'forms\fDoctor.pas' {uDoctor},
  eDoctor in 'EditForms\eDoctor.pas' {DoctorEdit},
  fVisit in 'forms\fVisit.pas' {uVisit},
  eVisit in 'EditForms\eVisit.pas' {VisitEdit},
  fPosition in 'forms\fPosition.pas' {uPosition},
  fWork in 'forms\fWork.pas' {uWork},
  eWorkEdit in 'EditForms\eWorkEdit.pas' {WorkEdit},
  fAnalys in 'forms\fAnalys.pas' {Analys};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TAnalys, Analys);
  Application.CreateForm(TAdressEdit, AdressEdit);
  Application.CreateForm(TPacientEdit, PacientEdit);
  Application.CreateForm(TSectorEdit, SectorEdit);
  Application.CreateForm(TPolisEdit, PolisEdit);
  Application.CreateForm(TDiagnosEdit, DiagnosEdit);
  Application.CreateForm(TPoliklEdit, PoliklEdit);
  Application.CreateForm(TDoctorEdit, DoctorEdit);
  Application.CreateForm(TVisitEdit, VisitEdit);
  Application.CreateForm(TWorkEdit, WorkEdit);
  Application.Run;
end.
