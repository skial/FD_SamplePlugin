# FD_SamplePlugin

Attempted port of FlashDevelop's [Sample Plugin] to Haxe C#.

## Status

The project compiles and seems to be imported by FD, but results in the following error.

```
End of Stream encountered before parsing was completed.

   at System.Runtime.Serialization.Formatters.Binary.__BinaryParser.Run()
   at System.Runtime.Serialization.Formatters.Binary.ObjectReader.Deserialize(HeaderHandler handler, __BinaryParser serParser, Boolean fCheck, Boolean isCrossAppDomain, IMethodCallMessage methodCallMessage)
   at System.Runtime.Serialization.Formatters.Binary.BinaryFormatter.Deserialize(Stream serializationStream, HeaderHandler handler, Boolean fCheck, Boolean isCrossAppDomain, IMethodCallMessage methodCallMessage)
   at PluginCore.Utilities.ObjectSerializer.InternalDeserialize(String file, Type type)
   at PluginCore.Utilities.ObjectSerializer.Deserialize(String file, Object obj, Boolean checkValidity)
```

And once FD opens, with a dialog box `Unable to load an imcompatiable or broken plugin. c:/path/to/plugin.dll`.

[Sample Plugin]: https://github.com/fdorg/flashdevelop/tree/development/External/Plugins/SamplePlugin "FlashDevelop SamplePlugin"