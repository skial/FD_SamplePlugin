package sameplugin;

import cs.system.windows.forms.Keys;
import cs.system.SerializableAttribute;

/**
 * ...
 * @author Skial Bainn
 */
// @see https://github.com/HaxeFoundation/haxe/pull/3954
@:strict(SerializableAttribute)
class Settings {
	
	private var samepleNumber:Int = 69;
	private var sampleText:String = 'This is a sample plugin.';
	private var sampleShortcut:Keys = untyped Keys.Control | Keys.F1;

	public function new() {
		
	}
	
}