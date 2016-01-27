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
		// The resource `en_US.resource` embedded via ``-resource src/resources/en_US.resources@en_US.resources`
		// is prefixed by hxcs with `src.Resources`. ResourceManager does require the extension.
		resources = new ResourceManager('src.Resources.en_US', Assembly.GetExecutingAssembly());
	}

	public static function GetString(identifier:String, ?pos:PosInfos):String {
		return resources.GetString(identifier);
	}

}
