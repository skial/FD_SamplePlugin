package sameplugin;

import cs.system.windows.forms.Keys;
import cs.system.SerializableAttribute;
import cs.system.componentmodel.DescriptionAttribute;
import cs.system.componentmodel.DefaultValueAttribute;

/**
 * ...
 * @author Skial Bainn
 */
// @see https://github.com/HaxeFoundation/haxe/pull/3954
@:strict(SerializableAttribute)
class Settings {
	
	@:isVar
	@:property
	@:strict(DescriptionAttribute("A sample integer setting."))
	@:strict(DefaultValueAttribute(69))
	private var sampleNumber:Int = 69;
	
	@:isVar
	@:property
	@:strict(DescriptionAttribute("A sample string setting."))
	@:strict(DefaultValueAttribute("This is a sample plugin."))
	private var sampleText(get, set):String = 'This is a sample plugin.';
	
	@:isVar
	@:property
	@:strict(DescriptionAttribute("A sample shortcut setting."))
	@:meta("System.ComponentModel.DefaultValueAttribute(System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.F1)")
	private var sampleShortcut:Keys = untyped Keys.Control | Keys.F1;
	
	public function new() {
		
	}
	
	private function get_sampleText():String {
		return this.sampleText;
	}
	
	private function set_sampleText(value:String):String {
		return this.sampleText = value;
	}
	
	private function get_sampleNumber():Int {
		return this.sampleNumber;
	}
	
	private function set_sampleNumber(value:Int):Int {
		return this.sampleNumber = value;
	}
	
	private function get_sampleShortcut():Keys {
		return this.sampleShortcut;
	}
	
	private function set_sampleShortcut(value:Keys):Keys {
		return this.sampleShortcut = value;
	}
	
}