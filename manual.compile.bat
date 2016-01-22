@ECHO off
cd bin/no_compilation/sampleplugin/src
"C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.6.1 Tools\Resgen.exe" "C:/dev/FD_SamplePlugin/src/resources/en_US.resX"
C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe /target:library /out:../bin/no_compilation.dll /nologo /reference:"C:\Program Files (x86)\FlashDevelop\PluginCore.dll" /resource:"C:/dev/FD_SamplePlugin/src/resources/en_US.resources",SamplePlugin.Resources.en_US.resources /platform:x86 /optimize+ /unsafe /debug /recurse:*.cs