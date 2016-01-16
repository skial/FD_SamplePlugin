package sameplugin;

import cs.system.windows.forms.Keys;

/**
 * ...
 * @author Skial Bainn
 */
@:meta('System.Serializable')
class Settings {
	
	private var samepleNumber:Int = 69;
	private var sampleText:String = 'This is a sample plugin.';
	private var sampleShortcut:Keys = untyped Keys.Control | Keys.F1;

	public function new() {
		
	}
	
}