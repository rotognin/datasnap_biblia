object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 359
  Width = 577
  object SQLConnection: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=211'
      'HostName=localhost'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/')
    Left = 48
    Top = 40
    UniqueId = '{46A82975-1171-409B-BCE7-56149B10FE36}'
  end
end
