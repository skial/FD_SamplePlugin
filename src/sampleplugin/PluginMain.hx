package sampleplugin;

import cs.system.io.Path;
import cs.system.io.Directory;
import cs.system.EventArgs;
import cs.system.EventHandler;
import cs.system.drawing.Image;
import cs.system.windows.forms.*;
import cs.system.windows.forms.ToolStripMenuItem;
import cs.system.componentmodel.*;
import resources.LocaleHelper;

import plugincore.localization.LocaleVersion;
import plugincore.utilities.*;
import plugincore.managers.EventManager;
import plugincore.helpers.*;
import plugincore.IPlugin;
import plugincore.NotifyEvent;
import plugincore.HandlingPriority;
import plugincore.EventType;
import plugincore.PluginBase;
import plugincore.helpers.PathHelper;


import weifenluo.winformsui.docking.DockContent;

/**
 * ...
 * @author Skial Bainn
 */
class PluginMain implements IPlugin {
	
	private var pluginName:String = 'SamplePlugin';
	private var pluginGuid:String = '6391a394-7c82-4b8b-9474-92c906297bd3';
	private var pluginHelp:String = 'https://github.com/skial/FD_SamplePlugin/issues';
	private var pluginDesc:String = 'Sample plugin in for FlashDevelop built with Haxe targeting C#.';
	private var pluginAuth:String = 'Skial Bainn';
	private var settingFilename:String;
	private var settingObject:Settings;
	private var pluginPanel:DockContent;
	private var pluginUI:PluginUI;
	private var pluginImage:Image;
	
	@:property public var Api(get, never):Int;
	@:property public var Name(get, never):String;
	@:property public var Guid(get, never):String;
	@:property public var Author(get, never):String;
	@:property public var Description(get, never):String;
	@:property public var Help(get, never):String;
	@:property public var Settings(get, never):Dynamic;

	public function new() {
		
	}
	
	public function Initialize():Void {
		this.InitBasics();
		this.LoadSettings();
		this.AddEventHandlers();
		this.InitLocalization();
		this.CreatePluginPanel();
		this.CreateMenuItem();
	}
	
	public function Dispose():Void {
		this.SaveSettings();
	}
	
	public function HandleEvent(sender:Dynamic, e:NotifyEvent, priority:HandlingPriority):Void {
		switch (e.Type) {
			case EventType.FileSwitch:
				var filename = plugincore.PluginBase.MainForm.CurrentDocument.FileName;
				
				
			case EventType.Command:
				
				
			case _:
				
		}
	}
	
	public function InitBasics():Void {
		var dataPath = Path.Combine(PathHelper.DataDir, 'SamplePlugin');
		if (!Directory.Exists(dataPath)) Directory.CreateDirectory(dataPath);
		this.settingFilename = Path.Combine(dataPath, 'Settings.fdb');
		this.pluginImage = PluginBase.MainForm.FindImage('100');
	}
	
	public function AddEventHandlers():Void {
		EventManager.AddEventHandler(this, untyped EventType.FileSwitch | EventType.Command);
	}
	
	public function InitLocalization():Void {
		var locale:LocaleVersion = PluginBase.MainForm.Settings.LocaleVersion;
		switch (locale) {
			case _:
				LocaleHelper.Initialize(LocaleVersion.en_US);
				
		}
		this.pluginDesc = LocaleHelper.GetString('Info.Description');
	}
	
	public function CreateMenuItem():Void {
		var viewMenu = cast(PluginBase.MainForm.FindMenuItem('ViewMenu'), ToolStripMenuItem);
		viewMenu.DropDownItems.Add( new ToolStripMenuItem(LocaleHelper.GetString("Label.ViewMenuItem"), this.pluginImage, new EventHandler(this.OpenPanel), this.settingObject.sampleShortcut));
	}
	
	public function CreatePluginPanel():Void {
		
	}
	
	public function LoadSettings():Void {
		
	}
	
	public function SaveSettings():Void {
		
	}
	
	public function OpenPanel(sender:Dynamic, e:EventArgs):Void {
		
	}
	
	private function get_Api():Int return 1;
	private function get_Name():String return this.pluginName;
	private function get_Guid():String return this.pluginGuid;
	private function get_Author():String return this.pluginAuth;
	private function get_Description():String return this.pluginDesc;
	private function get_Help():String return this.pluginHelp;
	private function get_Settings():Dynamic return this.settingObject;
	
}