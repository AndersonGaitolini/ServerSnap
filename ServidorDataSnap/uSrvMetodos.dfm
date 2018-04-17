object srvMetodos: TsrvMetodos
  OldCreateOrder = False
  Height = 350
  Width = 432
  object fdcConexao: TFDConnection
    Params.Strings = (
      
        'Database=D:\Programacao\DELPHI\RepoDelphi\GITHUB\PROJETO_BKPXML_' +
        'GITHUB\BACKUPXML.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 16
    Top = 24
  end
  object fdqQuery: TFDQuery
    Connection = fdcConexao
    SQL.Strings = (
      'SELECT *  FROM LM_BKPDFE')
    Left = 16
    Top = 96
    object fdqQueryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdqQueryCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 300
    end
    object fdqQueryIDF_DOCUMENTO: TIntegerField
      FieldName = 'IDF_DOCUMENTO'
      Origin = 'IDF_DOCUMENTO'
      Required = True
    end
    object fdqQueryDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object fdqQueryDATARECTO: TDateField
      FieldName = 'DATARECTO'
      Origin = 'DATARECTO'
    end
    object fdqQueryMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Origin = 'MOTIVO'
    end
    object fdqQueryPROTOCOLOCANC: TStringField
      FieldName = 'PROTOCOLOCANC'
      Origin = 'PROTOCOLOCANC'
      Size = 50
    end
    object fdqQueryPROTOCOLORECTO: TStringField
      FieldName = 'PROTOCOLORECTO'
      Origin = 'PROTOCOLORECTO'
      Size = 50
    end
    object fdqQueryDATAALTERACAO: TDateField
      FieldName = 'DATAALTERACAO'
      Origin = 'DATAALTERACAO'
    end
    object fdqQueryTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object fdqQueryEMAILSNOTIFICADOS: TStringField
      FieldName = 'EMAILSNOTIFICADOS'
      Origin = 'EMAILSNOTIFICADOS'
      Size = 150
    end
    object fdqQueryTIPOAMBIENTE: TStringField
      FieldName = 'TIPOAMBIENTE'
      Origin = 'TIPOAMBIENTE'
      Size = 30
    end
    object fdqQueryXMLENVIO: TBlobField
      FieldName = 'XMLENVIO'
      Origin = 'XMLENVIO'
    end
    object fdqQueryXMLEXTEND: TBlobField
      FieldName = 'XMLEXTEND'
      Origin = 'XMLEXTEND'
    end
    object fdqQueryMOTIVOCANC: TStringField
      FieldName = 'MOTIVOCANC'
      Origin = 'MOTIVOCANC'
    end
    object fdqQueryXMLENVIOCANC: TBlobField
      FieldName = 'XMLENVIOCANC'
      Origin = 'XMLENVIOCANC'
    end
    object fdqQueryXMLEXTENDCANC: TBlobField
      FieldName = 'XMLEXTENDCANC'
      Origin = 'XMLEXTENDCANC'
    end
    object fdqQueryPROTOCOLOAUT: TStringField
      FieldName = 'PROTOCOLOAUT'
      Origin = 'PROTOCOLOAUT'
      Size = 50
    end
  end
  object fdDriverLinkFB: TFDPhysFBDriverLink
    Left = 104
    Top = 24
  end
  object fdstnstrgjsnlnk1: TFDStanStorageJSONLink
    Left = 168
    Top = 32
  end
end
