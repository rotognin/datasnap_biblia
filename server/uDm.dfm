object fDm: TfDm
  OldCreateOrder = False
  Height = 422
  Width = 617
  object SQLConnection: TSQLConnection
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=%.dbo'
      'DriverUnit=Data.DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver250.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver250.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'VendorLibWin64=sqlncli10.dll'
      'HostName=.\SQLEXPRESS'
      'DataBase=rtools'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'User_Name=sa'
      'Password=transport'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Prepare SQL=False')
    Left = 80
    Top = 40
  end
  object qryVersoes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT vrs_id, vrs_nome FROM b_versoes_tb')
    SQLConnection = SQLConnection
    Left = 80
    Top = 96
    object qryVersoesvrs_id: TIntegerField
      FieldName = 'vrs_id'
      Required = True
    end
    object qryVersoesvrs_nome: TStringField
      FieldName = 'vrs_nome'
      Required = True
      Size = 50
    end
  end
  object qryLivros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT b_liv_id, b_liv_nome FROM b_livro_tb')
    SQLConnection = SQLConnection
    Left = 160
    Top = 96
    object qryLivrosb_liv_id: TIntegerField
      FieldName = 'b_liv_id'
      Required = True
    end
    object qryLivrosb_liv_nome: TStringField
      FieldName = 'b_liv_nome'
      Required = True
      Size = 30
    end
  end
  object qryCapitulos: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftSmallint
        Name = 'id_livro'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT MAX(ver_capitulo) as '#39'capitulos'#39' FROM b_versiculos_tb WHE' +
        'RE ver_liv_id = :id_livro')
    SQLConnection = SQLConnection
    Left = 232
    Top = 96
    object qryCapituloscapitulos: TSmallintField
      FieldName = 'capitulos'
    end
  end
  object qryLivro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftShortint
        Name = 'id_livro'
        ParamType = ptInput
        Value = 0
      end>
    SQL.Strings = (
      'SELECT b_liv_nome FROM b_livro_tb WHERE b_liv_id = :id_livro')
    SQLConnection = SQLConnection
    Left = 160
    Top = 152
    object qryLivrob_liv_nome: TStringField
      FieldName = 'b_liv_nome'
      Required = True
      Size = 30
    end
  end
  object qryVersiculos: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftSmallint
        Name = 'ver_vrs_id'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ver_liv_id'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'ver_capitulo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT ver_versiculo, ver_texto FROM b_versiculos_tb'
      
        'WHERE ver_vrs_id = :ver_vrs_id AND ver_liv_id = :ver_liv_id AND ' +
        'ver_capitulo = :ver_capitulo'
      'ORDER BY ver_versiculo ASC')
    SQLConnection = SQLConnection
    Left = 312
    Top = 96
    object qryVersiculosver_versiculo: TSmallintField
      FieldName = 'ver_versiculo'
      Required = True
    end
    object qryVersiculosver_texto: TMemoField
      FieldName = 'ver_texto'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
  end
end
