package sampleplugin;

import cs.system.Object;
import cs.system.io.File;
import cs.system.io.Path;
import cs.system.io.Directory;
import cs.system.EventArgs;
import cs.system.EventHandler;
import cs.system.drawing.Image;
import cs.system.windows.forms.*;
import cs.system.windows.forms.ToolStripMenuItem;
import cs.system.componentmodel.*;
import resources.LocaleHelper;

import plugincore.utilities.ObjectSerializer;
import plugincore.localization.LocaleVersion;
import plugincore.utilities.*;
import plugincore.managers.EventManager;
import plugincore.managers.TraceManager;
import plugincore.helpers.*;
import plugincore.IPlugin;
import plugincore.NotifyEvent;
import plugincore.HandlingPriority;
import plugincore.EventType;
import plugincore.PluginBase;
import plugincore.helpers.PathHelper;
import plugincore.IProject;
import plugincore.DataEvent;

import weifenluo.winformsui.docking.DockState;
import weifenluo.winformsui.docking.DockContent;

/**
 * ...
 * @author Skial Bainn
 */
@:nativeGen class PluginMain implements IPlugin {
	
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
		this.InitLocalization();
		this.CreatePluginPanel();
		this.CreateMenuItem();
		this.AddEventHandlers();
	}
	
	public function Dispose():Void {
		this.SaveSettings();
	}
	
	public function HandleEvent(sender:Dynamic, e:NotifyEvent, priority:HandlingPriority):Void {
		switch (e.Type) {
			case EventType.FileSwitch:
				var filename = plugincore.PluginBase.MainForm.CurrentDocument.FileName;
				pluginUI.Output.Text += filename + '\r\n';
				TraceManager.Add( 'Switched to ' + filename );
				
			case EventType.Command:
				var cmd = cast(e, DataEvent).Action;
				if (cmd == 'ProjectManager.Project') {
					var project:IProject = PluginBase.CurrentProject;
					if (project == null) {
						pluginUI.Output.Text += 'Project closed.\r\n';
						
					} else {
						pluginUI.Output.Text += 'Project open: ' + project.ProjectPath + '\r\n';
						
					}
					
				}
				
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
		PluginBase.MainForm.IgnoredKeys.Add(this.settingObject.sampleShortcut);
	}
	
	public function CreatePluginPanel():Void {
		this.pluginUI = new PluginUI(this);
		this.pluginUI.Text = LocaleHelper.GetString('Title.PluginPanel');
		this.pluginPanel = PluginBase.MainForm.CreateDockablePanel(this.pluginUI, this.pluginGuid, this.pluginImage, DockState.DockRight);
	}
	
	public function LoadSettings():Void {
		this.settingObject = new Settings();
		if (!File.Exists(this.settingFilename)) this.SaveSettings();
		else {
			var obj = ObjectSerializer.Deserialize(this.settingFilename, this.settingObject);
			this.settingObject = cast obj;
		}
	}
	
	public function SaveSettings():Void {
		ObjectSerializer.Serialize(this.settingFilename, this.settingObject);
	}
	
	public function OpenPanel(sender:Dynamic, e:EventArgs):Void {
		this.pluginPanel.Show();
	}
	
	private function get_Api():Int return 1;
	private function get_Name():String return this.pluginName;
	private function get_Guid():String return this.pluginGuid;
	private function get_Author():String return this.pluginAuth;
	private function get_Description():String return this.pluginDesc;
	private function get_Help():String return this.pluginHelp;
	private function get_Settings():Dynamic return cast this.settingObject;
	
}