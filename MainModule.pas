unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Comp.UI;

type
  TUniMainModule = class(TUniGUIMainModule)
    FDConnection1: TFDConnection;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    FDTable1OBJECTID: TIntegerField;
    FDTable1Name: TWideStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDTable1FAC_TYPE: TWideStringField;
    FDTable1L_FAC_TYPE: TWideStringField;
    FDTable1ADDRESS: TWideStringField;
    FDTable1CITY: TWideStringField;
    FDTable1ZIP: TIntegerField;
    FDTable1STRAP: TWideStringField;
    FDTable1MISC1: TWideStringField;
    FDTable1MISC2: TWideStringField;
    FDTable1PHONE: TWideStringField;
    FDTable1SOURCE: TWideStringField;
    FDTable1X: TFloatField;
    FDTable1Y: TFloatField;
    FDTable1USNG: TWideStringField;
    FDTable1EDITOR_NAME: TWideStringField;
    FDTable1EDIT_DATE: TSQLTimeStampField;
    FDTable1SchoolZone: TWideStringField;
    FDTable1YearBuilt: TIntegerField;
    FDTable1Stories: TIntegerField;
    FDTable1Students: TIntegerField;
    FDTable1YearEstablished: TIntegerField;
    FDTable2: TFDTable;
    DataSource2: TDataSource;
    FDTable2id: TFDAutoIncField;
    FDTable2country: TStringField;
    FDTable2city: TStringField;
    FDTable2latitude: TFMTBCDField;
    FDTable2longitude: TFMTBCDField;
    FDTable2altitude: TBCDField;
    FDQuery1: TFDQuery;
    FDQuery1id: TFDAutoIncField;
    FDQuery1country: TStringField;
    FDQuery1city: TStringField;
    FDQuery1latitude: TFMTBCDField;
    FDQuery1longitude: TFMTBCDField;
    FDQuery1altitude: TBCDField;
    procedure SortColumn(const FieldName: string; Dir: Boolean);
    procedure UniGUIMainModuleCreate(Sender: TObject);
//    procedure FDTable2FilterRecord(DataSet: TDataSet; var Accept: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniMainModule: TUniMainModule;


implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

//procedure TUniMainModule.FDTable2FilterRecord(DataSet: TDataSet; var Accept: Boolean);
//var
//  iCountry: String;
//begin
//  iCountry := DataSet.FieldByName('country').AsString;
////  Accept := (iOrderID = 10150) or (iOrderID = 10151) or (iOrderID = 10152);
//  Accept := iCountry = 'Philippines';
//end;

procedure TUniMainModule.SortColumn(const FieldName: string; Dir: Boolean);
begin
  if Dir then
    FDTable1.IndexName := FieldName +'_index_asc'
  else
    FDTable1.IndexName := FieldName + '_index_desc';
end;

procedure TUniMainModule.UniGUIMainModuleCreate(Sender: TObject);
var
  I: Integer;
  IndexnameAsc : string;
  IndexnameDes : string;
begin

  with FDTable1 do
  begin
    for I := 0 to FieldCount-1 do
    begin
      IndexnameAsc := Fields[I].FieldName+'_index_asc';
      IndexnameDes := Fields[I].FieldName+'_index_desc';
      IndexDefs.Add(IndexnameAsc, Fields[I].FieldName, []);
      IndexDefs.Add(IndexnameDes, Fields[I].FieldName, [ixDescending]);
    end;

  end;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
