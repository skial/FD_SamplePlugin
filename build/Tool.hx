package;

import sys.FileSystem;
import sys.io.Process;
import haxe.macro.Context;
import haxe.macro.Compiler;

using StringTools;
using haxe.io.Path;
using sys.FileSystem;

/**
 * ...
 * @author Skial Bainn
 */
class Tool {
	
	private static inline var RESGEN = 'resgen';
	private static inline var CSC = 'csc';

	public static function run() {
		var cwd = Sys.getCwd();
		var args = Sys.args();
		var defines = Context.getDefines();
		var directory = Compiler.getOutput();
		var output = (cwd + directory).normalize();
		
		trace( args );
		
		var _csc = null;
		var _resgen = null;
		var _plugincore = null;
		
		var _stdout = Sys.stdout();
		var _stderr = Sys.stderr();
		
		/*for (key in defines.keys()) {
			trace( key, defines.get( key ) );
			
		}*/
		
		if (!defines.exists( RESGEN )) {
			Context.error( 'You need to specify `-D resgen=path/to/resgen.exe`', Context.currentPos() );
			
		} else if (defines.exists( RESGEN ) && defines.get( RESGEN ) == '1') {
			Context.error( 
				'You need to specify a value for `-D resgen`. Example: `-D resgen=C:/Program Files (x86)/Microsoft SDKs/Windows/v10.0A/bin/NETFX 4.6.1 Tools/Resgen.exe`', 
				Context.currentPos() 
			);
			
		} else {
			_resgen = defines.get( RESGEN );
			trace( ('' + defines.get( RESGEN )).trim());
			
		}
		
		if (!defines.exists( CSC )) {
			Context.error( 'You need to specify `-D csc=path/to/csc.exe`', Context.currentPos() );
			
		} else if (defines.exists( CSC ) && defines.get( CSC ) == '1') {
			Context.error( 
				'You need to specify a value for `-D csc`. Example: `-D csc=C:/Windows/Microsoft.NET/Framework/v3.5/csc.exe`', 
				Context.currentPos() 
			);
			
		} else {
			_csc = defines.get( CSC );
			
		}
		
		if (args.filter( function(s) return s.indexOf( 'PluginCore.dll' ) == -1 ).length == 0) {
			Context.error( 
				'You need to add `-net-lib "C:/path/to/FD/PluginCore.dll"`, which is located in your FlashDevelop installation directory',
				Context.currentPos()
			);
			
		} else {
			_plugincore = args.filter( function(s) return s.indexOf( 'PluginCore.dll' ) != -1 )[0];
			
		}
		
		Context.onAfterGenerate( function() {
			
			var exitcode = 0;
			
			Sys.println( '\n----- Processing resources -----\n' );
			// TODO Detect resources.
			var resgen_proc = new Process('"$_resgen" "$output/src/Resources/en_US.resX"');
			_stdout.write( resgen_proc.stdout.readAll() );
			_stderr.write( resgen_proc.stderr.readAll() );
			exitcode = resgen_proc.exitCode();
			resgen_proc.close();
			
			if (!'$output/bin'.exists()) {
				'$output/bin'.createDirectory();
				
			}
			
			var csc_args = [
				'/nologo', 
				'/unsafe',
				'/optimize+',
				'/target:' + (defines.exists('dll')? 'library':'exe'), 
				'/out:$output/bin/no_compilation.dll', 
			]
			.concat( [for(arg in args) if (arg.endsWith('.dll')) '/reference:"$arg"'] )
			.concat( [for (i in 0...args.length) if (args[i] == '-c-arg') args[i + 1]] )
			.concat( [
				'/resource:"$output/src/Resources/en_US.resources",SamplePlugin.Resources.en_US.resources',
				'/recurse:*.cs'
			] );
			
			if (defines.exists('debug')) csc_args.unshift( '/debug' );
			
			Sys.println( '\n----- Building ' + (defines.exists('dll')? 'dll':'exe') + ' file -----\n' );
			var csc_proc = new Process( '"$_csc"' + csc_args.join(' ') );
			_stdout.write( csc_proc.stdout.readAll() );
			_stderr.write( csc_proc.stderr.readAll() );
			exitcode = csc_proc.exitCode();
			csc_proc.close();
			
		} );
		
	}
	
}