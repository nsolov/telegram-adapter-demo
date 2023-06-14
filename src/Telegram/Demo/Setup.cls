Class Telegram.Demo.Setup
{

ClassMethod Init(TgToken As %String) As %Status
{
    set st=$$$OK
    set production="Telegram.Demo.EchoProduction"

    for item="Telegram.BusinessOperation","Telegram.LongPollingService" {
        set st=##class(shvarov.i14y.Settings).SetValue(production,item,"Token",TgToken)
        quit:$$$ISERR(st)
    }

    do ##class(%EnsembleMgr).SetAutoStart($namespace, production)
    job ##class(Ens.Director).StartProduction(production)

    return st
}

}
