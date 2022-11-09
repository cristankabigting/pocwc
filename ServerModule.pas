unit ServerModule;

interface

uses
  Classes, SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleBeforeInit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result:=TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleBeforeInit(Sender: TObject);
begin
  Self.ExtRoot:='C:\Program Files (x86)\FMSoft\Framework\uniGUI\ext-7.4.0';
  Self.UniRoot:=' C:\Program Files (x86)\FMSoft\Framework\uniGUI\uni-1.90.0.1555';
  Self.Port:=777;
  Self.SessionTimeout:=540000;
  Self.Title :='World Cities';
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.
