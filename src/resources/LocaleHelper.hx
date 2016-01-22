package resources;

import cs.system.Object;
import cs.system.reflection.Assembly;
import cs.system.resources.ResourceManager;
import haxe.PosInfos;
import plugincore.localization.LocaleVersion;

/**
 * ...
 * @author Skial Bainn
 */
class LocaleHelper {
	
	private static var resources:ResourceManager = null;

	public function new() {
		
	}
	
	public static function Initialize(locale:LocaleVersion, ?pos:PosInfos):Void {
		var path = 'SamplePlugin.Resources.en_US';
		resources = new ResourceManager(path, Assembly.GetExecutingAssembly());
		//throw ([resources, path, locale, pos]:Array<Dynamic>);
		//resources = ResourceManager.CreateFileBasedResourceManager('en_US.resX', './', null);
	}
	
	public static function GetString(identifier:String, ?pos:PosInfos):String {
		return resources.GetString(identifier);
	}
	
}