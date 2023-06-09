Class Telegram.Demo.TestOperation Extends Ens.BusinessOperation
{

Property ChatId As %String;

Property Photo As %String;

Property Document As %String;

Parameter SETTINGS = "ChatId:TelegramDemo,Photo:TelegramDemo,Document:TelegramDemo";

Method Test(pRequest As Ens.StringContainer, Output pResponse As Ens.StringContainer) As %Status
{
    Return $case($ZCVT(pRequest.StringValue,"L"),
        "sendmessage"   : ..sendMessage(),
        "sendphoto"     : ..sendPhoto(),
        "senddocument"  : ..sendDocument(),
        "sendpoll"      : ..sendPoll(),
        "senddice"      : ..sendDice(),
        "getme"         : ..getMe(),
                        : $$$ERROR(5001,"method name")
    )
}

Method getMe()
{
    Set msg = ##class(Telegram.Request).%New()
    Set msg.Method = "getMe"
    Set tSC = ..SendRequestSync("Telegram.BusinessOperation", msg, .response)
    Return:$$$ISERR(tSC) tSC
    $$$TRACE(response.Data.%ToJSON())
    Return tSC
}

Method sendMessage()
{
    Set msg = ##class(Telegram.Request).%New()
    Set msg.Method = "sendMessage"

    // All possible fields are described here https://core.telegram.org/bots/api#sendmessage
    Set msg.Data = {
        "chat_id" : (..ChatId),
        "text": ("*bold text*" _$$$NL_ "_italic text_ " _$$$NL_ "```"_$$$NL_"pre-formatted fixed-width "_$$$NL_"code block```"),
        "parse_mode": "MarkdownV2",
        "disable_notification": "true"
    }
    Return ..SendRequestAsync("Telegram.BusinessOperation", msg)
}

Method sendPhoto() As %Status
{
    If ( ##class(%File).Exists(..Photo) ) {
        Set msg = ##class(Telegram.Request).%New()
        Set msg.Method = "sendPhoto"

        // All possible fields are described here https://core.telegram.org/bots/api#sendphoto
        Set msg.Data = {
            "chat_id": (..ChatId),
            "photo": (..Photo),
            "caption": ("IRIS Telegram Adapter Demo")
        }
        Do msg.Files.Insert(..Photo)
        Return ..SendRequestAsync("Telegram.BusinessOperation", msg)
    }
    Return $$$ERROR(5001, "File not found (Photo)")
}

Method sendDocument() As %Status
{
    If ( ##class(%File).Exists(..Document) ) {
        Set msg = ##class(Telegram.Request).%New()
        Set msg.Method = "sendDocument"

        // All possible fields are described here https://core.telegram.org/bots/api#senddocument
        Set msg.Data = {
            "chat_id": (..ChatId),
            "document": (..Document),
            "caption": ("caption")
        }
        Do msg.Files.Insert(..Document)
        If ( ##class(%File).Exists(..Photo) ) {
            Set msg.Data.thumb = ..Photo
            Do msg.Files.Insert(..Photo)
        }

        Return ..SendRequestAsync("Telegram.BusinessOperation", msg)
    }
    Return $$$ERROR(5001, "File not found (Document)")
}

Method sendPoll() As %Status
{
    Set msg = ##class(Telegram.Request).%New()
    Set msg.Method = "sendPoll"

    // All possible fields are described here https://core.telegram.org/bots/api#sendpoll
    Set msg.Data = {
        "chat_id": (..ChatId),
        "question": "How is the weather?",
        "options": [
            "Fine",
            "Sunny",
            "Cloudy",
            "Rainy"
        ]
    }
    Return ..SendRequestAsync("Telegram.BusinessOperation", msg)
}

Method sendDice() As %Status
{
    Set msg = ##class(Telegram.Request).%New()
    Set msg.Method = "sendDice"
    Set msg.Data = {
        "chat_id": (..ChatId)
    }
    Return ..SendRequestAsync("Telegram.BusinessOperation", msg)
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.StringContainer">
    <Method>Test</Method>
  </MapItem>
</MapItems>
}

}
