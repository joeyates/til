# Links

Project file

```
{file:PATH OPTIONAL_TEXT}
```

# Queries

```sh
yard list --query QUERY
```

# YARD::CodeObjects::Base

object.file - the file where the object is defined
object.namespace - the yardoc Namespace
object.tag("param") the documented param(s?)

# YARD::CodeObjects::MethodObject

https://rubydoc.info/gems/yard/YARD/CodeObjects/MethodObject

object.name  - the method name as a Symbol
object.parameters - Array<Array(String, String)>> parameter name and default value
