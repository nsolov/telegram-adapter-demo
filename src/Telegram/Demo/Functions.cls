Class Telegram.Demo.Functions Extends Ens.Rule.FunctionSet
{

/// Rule Editor doesn't design to use DynamicObjects
/// Method to get a value in a Rule, if key contains an underscore
ClassMethod GetJSONValue(obj As %DynamicAbstractObject, key As %String) As %String
{
    if ('$isobject(obj)) {
        return ""
    }
    Return obj.%Get(key)
}

}
