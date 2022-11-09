unit Main2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid,
  uniDBGrid, uniDBNavigator, uniEdit, uniDBEdit, uniGridExporters, unimVideo,
  uniPanel, uniHTMLFrame, uniMap, unimMap, uniButton, uniLabel, System.Math,FireDac.Stan.Param;

type
  TMainForm = class(TUniForm)
    UniDBNavigator1: TUniDBNavigator;
    UniDBGrid1: TUniDBGrid;
    Map: TUniMap;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    long: TUniNumberEdit;
    lat: TUniNumberEdit;
    UniButton1: TUniButton;
    UniButton2: TUniButton;
    HTMLFrame: TUniHTMLFrame;
    UniLabel3: TUniLabel;
    Distance: TUniNumberEdit;
    UniButton3: TUniButton;
    UniLabel4: TUniLabel;
    oLat: TUniNumberEdit;
    UniLabel5: TUniLabel;
    oLong: TUniNumberEdit;
    dLat: TUniNumberEdit;
    dLong: TUniNumberEdit;
    Origin: TUniLabel;
    Destination: TUniLabel;
    iCountry: TUniEdit;
    UniButton4: TUniButton;
    UniLabel8: TUniLabel;
    UniButton5: TUniButton;
    UniButton6: TUniButton;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    lowtraffic: TUniNumberEdit;
    moderatetraffic: TUniNumberEdit;
    heavytraffic: TUniNumberEdit;
    procedure UniDBGrid1ColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure UniFormShow(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure MapMarkerCreated(Sender: TObject; var Marker: TUniMapMarker);
    procedure UniButton2Click(Sender: TObject);
    procedure UniButton3Click(Sender: TObject);
    procedure UniButton4Click(Sender: TObject);
    procedure UniButton5Click(Sender: TObject);
    procedure UniButton6Click(Sender: TObject);
    procedure UniDBGrid1CellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;
function HaversineDist(th1, ph1, th2, ph2:double):double;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

function HaversineDist(th1, ph1, th2, ph2:double):double;
const diameter = 2 * 6372.8;
var   dx, dy, dz:double;
begin
  ph1    := degtorad(ph1 - ph2);
  th1    := degtorad(th1);
  th2    := degtorad(th2);

  dz     := sin(th1) - sin(th2);
  dx     := cos(ph1) * cos(th1) - cos(th2);
  dy     := sin(ph1) * cos(th1);
  Result := arcsin(sqrt(sqr(dx) + sqr(dy) + sqr(dz)) / 2) * diameter;
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
  Map.SetView(lat.Value,long.Value,17,True);
  //Map.FlyTo(lat.Value,long.Value,17,True);
end;

procedure TMainForm.UniButton2Click(Sender: TObject);
begin
  Map.SetView(UniMainModule.FDQuery1.FieldByName('latitude').AsFloat,UniMainModule.FDQuery1.FieldByName('longitude').AsFloat,17,True);
end;

procedure TMainForm.UniButton3Click(Sender: TObject);
var
  ModifiedDistance: Double;
begin

  Distance.Value := HaversineDist(oLat.Value, oLong.Value, dLat.Value, dLong.Value);
  ModifiedDistance := Distance.Value * 1.5;
  LowTraffic.Value := Round((ModifiedDistance/40) * 60);
  ModerateTraffic.Value := Round(LowTraffic.Value * 1.5);
  HeavyTraffic.Value := Round(ModerateTraffic.Value * 1.5);
end;

procedure TMainForm.UniButton4Click(Sender: TObject);
begin
  UniMainModule.FDQuery1.SQL.Text := 'SELECT id,country,city,latitude,longitude,altitude FROM Cities WHERE country = :vCountry ORDER BY city ASC';
  UniMainModule.FDQuery1.ParamByName('vCountry').AsString := iCountry.Text;
  UniMainModule.FDQuery1.Open;
end;

procedure TMainForm.UniButton5Click(Sender: TObject);
begin
  Origin.Caption := UniMainModule.FDQuery1.FieldByName('city').AsString;
  oLat.Value :=  UniMainModule.FDQuery1.FieldByName('latitude').AsFloat;
  oLong.Value :=  UniMainModule.FDQuery1.FieldByName('longitude').AsFloat;
end;

procedure TMainForm.UniButton6Click(Sender: TObject);
begin
  Destination.Caption := UniMainModule.FDQuery1.FieldByName('city').AsString;
  dLat.Value :=  UniMainModule.FDQuery1.FieldByName('latitude').AsFloat;
  dLong.Value :=  UniMainModule.FDQuery1.FieldByName('longitude').AsFloat;
end;

procedure TMainForm.UniDBGrid1CellClick(Column: TUniDBGridColumn);
begin
  UniButton2.Click;
end;

procedure TMainForm.UniDBGrid1ColumnSort(Column: TUniDBGridColumn; Direction: Boolean);
begin
   ///UniMainModule.SortColumn(Column.FieldName, Direction);
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  //Map.FlyTo(120.766667,15.15,17,True);
end;

procedure TMainForm.MapMarkerCreated(Sender: TObject; var Marker: TUniMapMarker);
begin

  with Marker do
  begin
    Popup.content:= UniMainModule.FDQuery1.FieldByName('city').AsString;
    AddToMap;
    OpenPopup;
  end;

end;

initialization
  RegisterAppFormClass(TMainForm);

end.
