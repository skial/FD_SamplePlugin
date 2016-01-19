# FD_SamplePlugin

Attempted port of FlashDevelop's [Sample Plugin] to Haxe C#.

## Status

Currently, the project _can_ compile but FlashDevelop fails to load the `.dll` file with
the following error.

```
Could not load file or assembly 'file:///C:\Users\skial\AppData\Local\FlashDevelop\Plugins\Main.dll' or 
one of its dependencies. This assembly is built by a runtime newer than the currently loaded runtime and cannot be loaded.

   at System.Reflection.Assembly._nLoad(AssemblyName fileName, String codeBase, Evidence assemblySecurity, Assembly locationHint, StackCrawlMark& stackMark, Boolean throwOnFileNotFound, Boolean forIntrospection)
   at System.Reflection.Assembly.nLoad(AssemblyName fileName, String codeBase, Evidence assemblySecurity, Assembly locationHint, StackCrawlMark& stackMark, Boolean throwOnFileNotFound, Boolean forIntrospection)
   at System.Reflection.Assembly.InternalLoad(AssemblyName assemblyRef, Evidence assemblySecurity, StackCrawlMark& stackMark, Boolean forIntrospection)
   at System.Reflection.Assembly.InternalLoadFrom(String assemblyFile, Evidence securityEvidence, Byte[] hashValue, AssemblyHashAlgorithm hashAlgorithm, Boolean forIntrospection, StackCrawlMark& stackMark)
   at System.Reflection.Assembly.LoadFrom(String assemblyFile)
   at FlashDevelop.Utilities.PluginServices.AddPlugin(String fileName)
   at FlashDevelop.Utilities.PluginServices.FindPlugins(String path)
   at FlashDevelop.MainForm.InitializeMainForm()
```

Using ILSpy to look at the generated `.dll`, versions `4.0.0` and `2.0.0` of mscorlib, System.Drawing and System.Windows.Form 
are included. Removing the `@std` from the included `.dll` with `-net-lib` results in the following compile error.

```
haxe build.hxml
haxelib run hxcs hxcs_build.txt --haxe-version 3300 --feature-level 1
c:\Windows\Microsoft.NET\Framework\v4.0.30319\Accessibility.dll: error CS1703: An assembly with the same
        identity 'Accessibility, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a' has already
        been imported. Try removing one of the duplicate references.
bin\Accessibility.dll: (Location of symbol related to previous error)
c:\Windows\Microsoft.NET\Framework\v4.0.30319\System.Drawing.dll: error CS1703: An assembly with the same
        identity 'System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a' has
        already been imported. Try removing one of the duplicate references.
bin\System.Drawing.dll: (Location of symbol related to previous error)
c:\Windows\Microsoft.NET\Framework\v4.0.30319\System.Windows.Forms.dll: error CS1703: An assembly with the same
        identity 'System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089' has
        already been imported. Try removing one of the duplicate references.
bin\System.Windows.Forms.dll: (Location of symbol related to previous error)
Compilation error
Native compilation failed
Error: Build failed
```

[Sample Plugin]: https://github.com/fdorg/flashdevelop/tree/development/External/Plugins/SamplePlugin "FlashDevelop SamplePlugin"