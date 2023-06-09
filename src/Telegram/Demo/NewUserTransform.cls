Class Telegram.Demo.NewUserTransform Extends Ens.DataTransform [ DependsOn = (Telegram.JSONContainer, Telegram.Request) ]
{

ClassMethod Transform(source As Telegram.JSONContainer, ByRef target As Telegram.Request) As %Status
{
    Set tSC = $$$OK
    Try {
        Set filename = "/irisdev/app/IRIS-logo.png"

        Set target = ##class(Telegram.Request).%New()

        Set data = {
            "chat_id": (source.Data.message.chat.id),
            "protect_content": 1
        }
        If ( ##class(%File).Exists(filename)) {
            Set target.Method = "sendPhoto"
            Do target.Files.Insert(filename)
            Set data."photo" = filename
            Set data."caption" = "Welcome "_source.Data.message."new_chat_participant"."first_name"
        } Else {
            Set target.Method = "sendMessage"
            Set data."text" = "Welcome "_source.Data.message."new_chat_participant"."first_name"
        }

        Set target.Data = data

    } Catch ex {
        Set tSC = ex.AsStatus()
    }
    Return tSC
}

}
