# FD_SamplePlugin

Attempted port of FlashDevelop's [Sample Plugin] to Haxe C#.

## Status

It works!

## FD Project Template

If you fancy trying to build your own FD plugin with Haxe,
you can try the FD [project template](https://github.com/skial/FD_PluginTemplate)
that distills this repo into the bare minimum files you need to get
started.

## Dependencies

- Haxe `3.2.1`
- Visual Studio 2015 Community Edition
- My `hxcs` fork:
	- `haxelib git hxcs https://github.com/skial/hxcs.git fd_plugin_dll`

## Building

If you installed the dependencies to their default locations
you _should_ be set and able to type `haxe build.hxml`.

If you installed Visual Studio to an alternative location, you will need
to open the `build.hxml` file and update the invalid paths.

Also, if you have to, update the paths to the listed `-net-lib`.

## Errors

If the `dll` is built with `-debug`, then its possible this error can appear.

```
Only one usage of each socket address (protocol/network address/port) is normally permitted

   at System.Net.Sockets.Socket.DoBind(EndPoint endPointSnapshot, SocketAddress socketAddress)
   at System.Net.Sockets.Socket.Bind(EndPoint localEP)
   at FlashConnect.XmlSocket..ctor(String address, Int32 port)
```

## Evidence!

![haxe gen flashdevelop plugin](hxplugin.png)

[Sample Plugin]: https://github.com/fdorg/flashdevelop/tree/development/External/Plugins/SamplePlugin "FlashDevelop SamplePlugin"
