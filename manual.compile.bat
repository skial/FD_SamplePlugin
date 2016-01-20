@ECHO off
cd bin/no_compilation/sampleplugin/src
C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe /target:library /out:../bin/no_compilation.dll /nologo /reference:"C:\Program Files (x86)\FlashDevelop\PluginCore.dll" /platform:x86 /optimize+ /unsafe /checked /recurse:*.cs