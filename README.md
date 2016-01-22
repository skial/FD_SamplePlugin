# FD_SamplePlugin

Attempted port of FlashDevelop's [Sample Plugin] to Haxe C#.

## Status

It works!

_But_, on next relaunch of FD this error appears.

```
Only one usage of each socket address (protocol/network address/port) is normally permitted

   at System.Net.Sockets.Socket.DoBind(EndPoint endPointSnapshot, SocketAddress socketAddress)
   at System.Net.Sockets.Socket.Bind(EndPoint localEP)
   at FlashConnect.XmlSocket..ctor(String address, Int32 port)
```

Also, FD is lagging :/

## Evidence!

![haxe gen flashdevelop plugin](hxplugin.png)

[Sample Plugin]: https://github.com/fdorg/flashdevelop/tree/development/External/Plugins/SamplePlugin "FlashDevelop SamplePlugin"