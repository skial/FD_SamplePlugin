package resources;

import cs.system.reflection.Assembly;
import cs.system.resources.ResourceManager;
import plugincore.localization.LocaleVersion;

/**
 * ...
 * @author Skial Bainn
 */
class LocaleHelper {
	
	private static var resources:ResourceManager = null;

	public function new() {
		
	}
	
	public static function Initialize(locale:LocaleVersion):Void {
		var path = 'SamplePlugin.Resources.' + locale;//.ToString();
		resources = new ResourceManager(path, Assembly.GetExecutingAssembly());
	}
	
	public static function GetString(identifier:String):String {
		return resources.GetString(identifier);
	}
	
}