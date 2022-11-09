object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 616
  ClientWidth = 1304
  Caption = 'WOLRD CITIES'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  WindowState = wsMaximized
  OldCreateOrder = False
  CaptionAlign = taCenter
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  Font.Height = -12
  TextHeight = 15
  object UniDBNavigator1: TUniDBNavigator
    Left = 0
    Top = 0
    Width = 393
    Height = 25
    Hint = ''
    DataSource = UniMainModule.DataSource2
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    TabOrder = 0
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 25
    Width = 626
    Height = 480
    Hint = ''
    DataSource = UniMainModule.DataSource2
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
    ReadOnly = True
    WebOptions.PageSize = 150
    WebOptions.FetchAll = True
    Grouping.FieldName = 'country'
    Grouping.FieldCaption = 'COUNTRY'
    Grouping.Enabled = True
    Grouping.Collapsible = True
    Grouping.SortDescending = True
    Grouping.ShowGroupable = True
    LoadMask.Message = 'Loading data...'
    BorderStyle = ubsSingle
    Font.Name = 'Roboto'
    ParentFont = False
    TabOrder = 1
    ParentColor = False
    Color = clBtnFace
    OnCellClick = UniDBGrid1CellClick
    OnColumnSort = UniDBGrid1ColumnSort
    Columns = <
      item
        FieldName = 'country'
        Title.Caption = 'COUNTRY'
        Title.Font.Style = [fsBold]
        Width = 131
        Visible = False
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'city'
        Title.Caption = 'CITY'
        Title.Font.Style = [fsBold]
        Width = 216
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'latitude'
        Title.Caption = 'LATITUDE'
        Title.Font.Style = [fsBold]
        Width = 80
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'longitude'
        Title.Caption = 'LONGITUDE'
        Title.Font.Style = [fsBold]
        Width = 87
        Font.Name = 'Roboto'
      end
      item
        FieldName = 'altitude'
        Title.Caption = 'ALTITUDE'
        Title.Font.Style = [fsBold]
        Width = 70
        Font.Name = 'Roboto'
      end>
  end
  object Map: TUniMap
    Left = 633
    Top = 40
    Width = 664
    Height = 465
    Hint = ''
    DefaultLat = 15.150000000000000000
    DefaultLong = 120.767500000000000000
    DefaultZoom = 17
    MapLayers = <
      item
        MaxZoom = 25
        Subdomains = 'abc'
        Bounds.Corner1Lat = 15.150000000000000000
        Bounds.Corner1Long = 120.767500000000000000
        Bounds.Corner2Lat = 15.150000000000000000
        Bounds.Corner2Long = 120.767500000000000000
        MapType = mtSatellite
        Caption = 'This is where it is.'
      end>
    MapControlOptions.SortLayers = True
    MapDrawOptions.Enabled = True
    MapDrawOptions.Polyline = False
    MapDrawOptions.Polygon = False
    MapDrawOptions.Circle = False
    MapDrawOptions.Rectangle = False
    MapDrawOptions.CircleMarker = False
    MapDrawOptions.Position = mpTopLeft
    OnMarkerCreated = MapMarkerCreated
  end
  object UniLabel1: TUniLabel
    Left = 634
    Top = 560
    Width = 70
    Height = 15
    Hint = ''
    Caption = 'LONGITUDE'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 3
  end
  object UniLabel2: TUniLabel
    Left = 633
    Top = 533
    Width = 59
    Height = 15
    Hint = ''
    Caption = 'LATITUDE'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 4
  end
  object long: TUniNumberEdit
    Left = 718
    Top = 557
    Width = 145
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 5
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object lat: TUniNumberEdit
    Left = 718
    Top = 529
    Width = 145
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 6
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object UniButton1: TUniButton
    Left = 718
    Top = 584
    Width = 145
    Height = 22
    Hint = ''
    Caption = 'LOCATE'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 7
    OnClick = UniButton1Click
  end
  object UniButton2: TUniButton
    Left = 546
    Top = 0
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'LOCATE'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 8
    OnClick = UniButton2Click
  end
  object HTMLFrame: TUniHTMLFrame
    Left = 634
    Top = 2
    Width = 663
    Height = 39
    Hint = ''
    HTML.Strings = (
      
        '<div style="font-size:12px;text-align:justify;font-weight:normal' +
        ';">'
      '   <span>'
      '      Distance is calculated using Haversine Formula.'
      
        '      The haversine formula is an equation important in navigati' +
        'on,'
      
        '      giving great-circle distances between two points on a sphe' +
        're '
      '      from their longitudes and latitudes.'
      '   </span>'
      '</div>')
  end
  object UniLabel3: TUniLabel
    Left = 878
    Top = 586
    Width = 93
    Height = 15
    Hint = ''
    Caption = 'DISTANCE (KM)'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 10
  end
  object Distance: TUniNumberEdit
    Left = 995
    Top = 584
    Width = 145
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 11
    ReadOnly = True
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object UniButton3: TUniButton
    Left = 1144
    Top = 584
    Width = 145
    Height = 22
    Hint = ''
    Caption = 'CALCULATE'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 12
    OnClick = UniButton3Click
  end
  object UniLabel4: TUniLabel
    Left = 878
    Top = 533
    Width = 59
    Height = 15
    Hint = ''
    Caption = 'LATITUDE'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 13
  end
  object oLat: TUniNumberEdit
    Left = 993
    Top = 529
    Width = 145
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 14
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object UniLabel5: TUniLabel
    Left = 878
    Top = 560
    Width = 70
    Height = 15
    Hint = ''
    Caption = 'LONGITUDE'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 15
  end
  object oLong: TUniNumberEdit
    Left = 993
    Top = 557
    Width = 145
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 16
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object dLat: TUniNumberEdit
    Left = 1144
    Top = 529
    Width = 145
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 17
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object dLong: TUniNumberEdit
    Left = 1144
    Top = 557
    Width = 145
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 18
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object Origin: TUniLabel
    Left = 995
    Top = 508
    Width = 43
    Height = 15
    Hint = ''
    Caption = 'ORIGIN'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 19
  end
  object Destination: TUniLabel
    Left = 1144
    Top = 508
    Width = 82
    Height = 15
    Hint = ''
    Caption = 'DESTINATION'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 20
  end
  object iCountry: TUniEdit
    Left = 2
    Top = 554
    Width = 121
    Hint = ''
    Text = 'Philippines'
    TabOrder = 21
  end
  object UniButton4: TUniButton
    Left = 2
    Top = 582
    Width = 121
    Height = 22
    Hint = ''
    Caption = 'FILTER'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 22
    OnClick = UniButton4Click
  end
  object UniLabel8: TUniLabel
    Left = 2
    Top = 533
    Width = 60
    Height = 15
    Hint = ''
    Caption = 'COUNTRY'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 23
  end
  object UniButton5: TUniButton
    Left = 394
    Top = 0
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'PT1'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 24
    OnClick = UniButton5Click
  end
  object UniButton6: TUniButton
    Left = 470
    Top = 0
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'PT2'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    TabOrder = 25
    OnClick = UniButton6Click
  end
  object UniLabel9: TUniLabel
    Left = 189
    Top = 533
    Width = 301
    Height = 15
    Hint = ''
    Caption = 'TRAVEL TIME ESTIMATE (in minutes, @40 km/hour)'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 26
  end
  object UniLabel10: TUniLabel
    Left = 189
    Top = 558
    Width = 66
    Height = 15
    Hint = ''
    Caption = 'Low Traffic'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 27
  end
  object UniLabel11: TUniLabel
    Left = 309
    Top = 558
    Width = 97
    Height = 15
    Hint = ''
    Caption = 'Moderate Traffic'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 28
  end
  object UniLabel12: TUniLabel
    Left = 437
    Top = 558
    Width = 79
    Height = 15
    Hint = ''
    Caption = 'Heavy Traffic'
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = [fsBold]
    ParentColor = False
    Color = clBtnFace
    TabOrder = 29
  end
  object lowtraffic: TUniNumberEdit
    Left = 189
    Top = 579
    Width = 84
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 30
    ReadOnly = True
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object moderatetraffic: TUniNumberEdit
    Left = 309
    Top = 579
    Width = 84
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 31
    ReadOnly = True
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
  object heavytraffic: TUniNumberEdit
    Left = 437
    Top = 579
    Width = 84
    Hint = ''
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Roboto'
    TabOrder = 32
    ReadOnly = True
    DecimalPrecision = 10
    DecimalSeparator = '.'
  end
end
