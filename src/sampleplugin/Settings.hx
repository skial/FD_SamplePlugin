package sampleplugin;

import cs.system.windows.forms.Keys;
import cs.system.SerializableAttribute;
import cs.system.componentmodel.DisplayNameAttribute;
import cs.system.componentmodel.DescriptionAttribute;
import cs.system.componentmodel.DefaultValueAttribute;

/**
 * ...
 * @author Skial Bainn
 */
// @see https://github.com/HaxeFoundation/haxe/pull/3954
@:strict(SerializableAttribute)
@:nativeGen class Settings {

	@:property
	@:strict(DisplayNameAttribute("Sample Number"))
	@:strict(DescriptionAttribute("A sample integer setting."))
	@:strict(DefaultValueAttribute(69))
	public var sampleNumber(get, set):Int;
	private var _sampleNumber = 69;

	@:property
	@:strict(DisplayNameAttribute("Sample Text"))
	@:strict(DescriptionAttribute("A sample string setting."))
	@:strict(DefaultValueAttribute("This is a sample plugin."))
	public var sampleText(get, set):String;
	private var _sampleText:String = 'This is a sample plugin.';

	@:property
	@:strict(DisplayNameAttribute("Sample Shortcut"))
	@:strict(DescriptionAttribute("A sample shortcut setting."))
	@:meta("System.ComponentModel.DefaultValueAttribute(System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.F1)")
	public var sampleShortcut(get, set):Keys;
	private var _sampleShortcut:Keys = untyped Keys.Control | Keys.F1;

	public function new() {

	}

	private function get_sampleText():String {
		return this._sampleText;
	}

	private function set_sampleText(value:String):String {
		return this._sampleText = value;
	}

	private function get_sampleNumber():Int {
		return this._sampleNumber;
	}

	private function set_sampleNumber(value:Int):Int {
		return this._sampleNumber = value;
	}

	private function get_sampleShortcut():Keys {
		return this._sampleShortcut;
	}

	private function set_sampleShortcut(value:Keys):Keys {
		return this._sampleShortcut = value;
	}

}
