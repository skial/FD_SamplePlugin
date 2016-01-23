# FD_SamplePlugin

Attempted port of FlashDevelop's [Sample Plugin] to Haxe C#.

## Status

It works! _But_, the plugin seems to cause FlashDevelop to lag, still looking into why.

## Building

Open `build.hxml` and replace the values for `-D resgen` and `-D csc` to point to
`ResGen.exe` and `csc.exe` respectively.

Also update the paths to the listed `-net-lib` paths if you have to.

## Errors

If the `dll` is built with `-debug`, then on next this error appears.

```
Only one usage of each socket address (protocol/network address/port) is normally permitted

   at System.Net.Sockets.Socket.DoBind(EndPoint endPointSnapshot, SocketAddress socketAddress)
   at System.Net.Sockets.Socket.Bind(EndPoint localEP)
   at FlashConnect.XmlSocket..ctor(String address, Int32 port)
```

## Evidence!

![haxe gen flashdevelop plugin](hxplugin.png)

[Sample Plugin]: https://github.com/fdorg/flashdevelop/tree/development/External/Plugins/SamplePlugin "FlashDevelop SamplePlugin"