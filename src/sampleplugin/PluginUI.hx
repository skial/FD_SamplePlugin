package sampleplugin;

import plugincore.*;
import cs.system.windows.forms.RichTextBox;
import cs.system.windows.forms.UserControl;
import cs.system.windows.forms.DockStyle;
import cs.system.drawing.Size;
import cs.system.drawing.Point;

/**
 * ...
 * @author Skial Bainn
 */
@:nativeGen class PluginUI extends UserControl {
	
	@:property @:isVar private var richTextBox(get, null):RichTextBox;
	private var pluginMain:PluginMain;

	public function new(pluginMain:PluginMain) {
		super();
		this.InitializeComponent();
		this.pluginMain = pluginMain;
	}
	
	private function get_richTextBox():RichTextBox {
		return this.richTextBox;
	}
	
	private function InitializeComponent():Void {
		this.richTextBox = new RichTextBox();
		this.SuspendLayout();
		
		this.richTextBox.DetectUrls = false;
		this.richTextBox.Dock = DockStyle.Fill;
		this.richTextBox.Location = new Point(0, 0);
		this.richTextBox.Name = 'richTextBox';
		this.richTextBox.Size = new Size(280, 352);
		this.richTextBox.TabIndex = 0;
		this.richTextBox.Text = '';
		
		this.Controls.Add( this.richTextBox );
		this.Name = 'PluginUI';
		this.Size = new Size(280, 352);
		this.ResumeLayout();
	}
	
}