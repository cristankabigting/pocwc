object UniMainModule: TUniMainModule
  OnCreate = UniGUIMainModuleCreate
  MonitoredKeys.Keys = <>
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=project'
      'User_Name=sa'
      'Password=admin123'
      'Server=DESKTOP-LVQBQGD\SQLEXPRESS'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 64
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 232
    Top = 64
  end
  object FDTable1: TFDTable
    Connection = FDConnection1
    CatalogName = 'project'
    SchemaName = 'dbo'
    TableName = 'Schools'
    Left = 72
    Top = 160
    object FDTable1OBJECTID: TIntegerField
      DisplayLabel = 'ID'
      DisplayWidth = 11
      FieldName = 'OBJECTID'
      Origin = 'OBJECTID'
    end
    object FDTable1Name: TWideStringField
      DisplayWidth = 39
      FieldName = 'Name'
      Origin = 'Name'
      Size = 100
    end
    object FDTable1FAC_TYPE: TWideStringField
      DisplayWidth = 15
      FieldName = 'FAC_TYPE'
      Origin = 'FAC_TYPE'
      Size = 50
    end
    object FDTable1L_FAC_TYPE: TWideStringField
      DisplayWidth = 21
      FieldName = 'L_FAC_TYPE'
      Origin = 'L_FAC_TYPE'
      Size = 50
    end
    object FDTable1ADDRESS: TWideStringField
      DisplayWidth = 24
      FieldName = 'ADDRESS'
      Origin = 'ADDRESS'
      Size = 50
    end
    object FDTable1CITY: TWideStringField
      DisplayWidth = 18
      FieldName = 'CITY'
      Origin = 'CITY'
      Size = 50
    end
    object FDTable1ZIP: TIntegerField
      DisplayWidth = 10
      FieldName = 'ZIP'
      Origin = 'ZIP'
    end
    object FDTable1STRAP: TWideStringField
      DisplayWidth = 22
      FieldName = 'STRAP'
      Origin = 'STRAP'
      Size = 50
    end
    object FDTable1MISC1: TWideStringField
      DisplayWidth = 15
      FieldName = 'MISC1'
      Origin = 'MISC1'
      Size = 50
    end
    object FDTable1MISC2: TWideStringField
      DisplayWidth = 19
      FieldName = 'MISC2'
      Origin = 'MISC2'
      Size = 50
    end
    object FDTable1PHONE: TWideStringField
      DisplayWidth = 15
      FieldName = 'PHONE'
      Origin = 'PHONE'
      Size = 50
    end
    object FDTable1SOURCE: TWideStringField
      DisplayWidth = 33
      FieldName = 'SOURCE'
      Origin = 'SOURCE'
      Size = 100
    end
    object FDTable1X: TFloatField
      DisplayWidth = 18
      FieldName = 'X'
      Origin = 'X'
    end
    object FDTable1Y: TFloatField
      DisplayWidth = 16
      FieldName = 'Y'
      Origin = 'Y'
    end
    object FDTable1USNG: TWideStringField
      DisplayWidth = 50
      FieldName = 'USNG'
      Origin = 'USNG'
      Size = 50
    end
    object FDTable1EDITOR_NAME: TWideStringField
      DisplayWidth = 50
      FieldName = 'EDITOR_NAME'
      Origin = 'EDITOR_NAME'
      Size = 50
    end
    object FDTable1EDIT_DATE: TSQLTimeStampField
      DisplayWidth = 34
      FieldName = 'EDIT_DATE'
      Origin = 'EDIT_DATE'
    end
    object FDTable1SchoolZone: TWideStringField
      DisplayWidth = 50
      FieldName = 'SchoolZone'
      Origin = 'SchoolZone'
      Size = 50
    end
    object FDTable1YearBuilt: TIntegerField
      DisplayWidth = 10
      FieldName = 'YearBuilt'
      Origin = 'YearBuilt'
    end
    object FDTable1Stories: TIntegerField
      DisplayWidth = 10
      FieldName = 'Stories'
      Origin = 'Stories'
    end
    object FDTable1Students: TIntegerField
      DisplayWidth = 10
      FieldName = 'Students'
      Origin = 'Students'
    end
    object FDTable1YearEstablished: TIntegerField
      DisplayWidth = 13
      FieldName = 'YearEstablished'
      Origin = 'YearEstablished'
    end
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 208
    Top = 160
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 392
    Top = 80
  end
  object FDTable2: TFDTable
    Active = True
    IndexName = 'IDX_Cities'
    Connection = FDConnection1
    SchemaName = 'dbo'
    TableName = 'Cities'
    Left = 80
    Top = 256
    object FDTable2id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTable2country: TStringField
      FieldName = 'country'
      Origin = 'country'
      Size = 25
    end
    object FDTable2city: TStringField
      FieldName = 'city'
      Origin = 'city'
      Size = 40
    end
    object FDTable2latitude: TFMTBCDField
      FieldName = 'latitude'
      Origin = 'latitude'
      Precision = 10
      Size = 7
    end
    object FDTable2longitude: TFMTBCDField
      FieldName = 'longitude'
      Origin = 'longitude'
      Precision = 10
      Size = 7
    end
    object FDTable2altitude: TBCDField
      FieldName = 'altitude'
      Origin = 'altitude'
      Precision = 5
      Size = 1
    end
  end
  object DataSource2: TDataSource
    DataSet = FDQuery1
    Left = 224
    Top = 256
  end
  object FDQuery1: TFDQuery
    Active = True
    Indexes = <
      item
      end>
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM Cities  WHERE country = '#39'Philippines'#39' ORDER BY cit' +
        'y ASC')
    Left = 80
    Top = 344
    object FDQuery1id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery1country: TStringField
      FieldName = 'country'
      Origin = 'country'
      Size = 25
    end
    object FDQuery1city: TStringField
      FieldName = 'city'
      Origin = 'city'
      Size = 40
    end
    object FDQuery1latitude: TFMTBCDField
      FieldName = 'latitude'
      Origin = 'latitude'
      Precision = 10
      Size = 7
    end
    object FDQuery1longitude: TFMTBCDField
      FieldName = 'longitude'
      Origin = 'longitude'
      Precision = 10
      Size = 7
    end
    object FDQuery1altitude: TBCDField
      FieldName = 'altitude'
      Origin = 'altitude'
      Precision = 5
      Size = 1
    end
  end
end
