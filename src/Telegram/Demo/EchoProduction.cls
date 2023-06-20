Class Telegram.Demo.EchoProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Telegram.Demo.EchoProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Telegram.BusinessOperation" Category="" ClassName="Telegram.BusinessOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">tg</Setting>
  </Item>
  <Item Name="Telegram.LongPollingService" Category="" ClassName="Telegram.LongPollingService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="SSLConfig">tg</Setting>
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
    <Setting Target="Host" Name="Target">MessageRouting</Setting>
    <Setting Target="Adapter" Name="FilesMimeTypes">application/pdf</Setting>
    <Setting Target="Adapter" Name="FilesPath">/irisdev/app/pdfs</Setting>
    <Setting Target="Adapter" Name="FilesSave">file,thumbnail</Setting>
  </Item>
  <Item Name="Telegram.WebHookService" Category="" ClassName="Telegram.WebHookService" PoolSize="0" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Target"></Setting>
  </Item>
  <Item Name="MessageRouting" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">Telegram.Demo.filterMessagesRule</Setting>
  </Item>
  <Item Name="Telegram.Demo.TestOperation" Category="" ClassName="Telegram.Demo.TestOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ChatId"></Setting>
    <Setting Target="Host" Name="Document"></Setting>
    <Setting Target="Host" Name="Photo"></Setting>
  </Item>
</Production>
}

}
