Class Telegram.Demo.filterMessagesRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="" production="Telegram.Demo.EchoProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="msgClass" value="Telegram.JSONContainer"></constraint>
<when condition="(GetJSONValue(Document.Data.message,&quot;new_chat_participant&quot;))!=&quot;&quot;" comment="">
<send transform="Telegram.Demo.NewUserTransform" target="Telegram.BusinessOperation"></send>
</when>
<when condition="(GetJSONValue(Document.Data.message.document.thumbnail,&quot;file_path&quot;))!=&quot;&quot;" comment="">
<send transform="Telegram.Demo.FileTransform" target="Telegram.BusinessOperation"></send>
</when>
<when condition="(GetJSONValue(Document.Data.message,&quot;text&quot;))!=&quot;&quot;" comment="">
<send transform="Telegram.Demo.MessageTransformDTL" target="Telegram.BusinessOperation"></send>
</when>
<otherwise>
<send transform="Telegram.Demo.NoTextTransformDTL" target="Telegram.BusinessOperation"></send>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
