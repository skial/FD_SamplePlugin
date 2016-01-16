package sameplugin;

import cs.system.io.*;
import cs.system.drawing.Image;
import cs.system.windows.forms.*;
import cs.system.componentmodel.*;

import plugincore.localization.*;
import plugincore.utilities.*;
import plugincore.managers.*;
import plugincore.helpers.*;
import plugincore.IPlugin;
import plugincore.NotifyEvent;
import plugincore.HandlingPriority;

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
		
	}
	
	public function Dispose():Void {
		
	}
	
	public function HandleEvent(sender:Dynamic, e:NotifyEvent, priority:HandlingPriority):Void {
		
	}
	
	private function get_Api():Int return 1;
	private function get_Name():String return this.pluginName;
	private function get_Guid():String return this.pluginGuid;
	private function get_Author():String return this.pluginAuth;
	private function get_Description():String return this.pluginDesc;
	private function get_Help():String return this.pluginHelp;
	private function get_Settings():Dynamic return this.settingObject;
	
}