package sameplugin;

import plugincore.*;
import cs.system.windows.forms.RichTextBox;
import cs.system.windows.forms.UserControl;

/**
 * ...
 * @author Skial Bainn
 */
@:nativeGen class PluginUI extends UserControl {
	
	@:property @:isVar private var richTextBox(get, never):RichTextBox;
	private var pluginMain:PluginMain;

	public function new(pluginMain:PluginMain) {
		super();
	}
	
	private function get_richTextBox():RichTextBox {
		return this.richTextBox;
	}
	
	private function InitializeComponent():Void {
		
	}
	
}