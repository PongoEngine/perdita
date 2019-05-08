package perdita.model;

import haxe.Serializer;
import haxe.Unserializer;

class Drawer
{
	public var width(default, null) :Int;
	public var isOpen(default, null) :Bool;
	public var isLeft(default, null) :Bool;
	public var isActive :Bool;

	public function new(isLeft :Bool):Void 
	{
		this.width = 400;
		this.isOpen = true;
		this.isLeft = isLeft;
		this.isActive = false;
	}

	public function stretchBy(val :Int) : Bool
	{
		var dist = this.isLeft ? val : val * -1;
		this.width += dist;
		this.isOpen = true;

		if(this.width < COLLAPSING_WIDTH) {
			this.isOpen = false;
		}
		return true;
	}

	public function checkWidth() : Void
	{
		if(this.width < COLLAPSING_WIDTH) {
			this.width = MIN_WIDTH;
		}
	}

	public function close() : Void
	{
		this.width = MIN_WIDTH;
		this.isOpen = false;
	}

	public function open(width :Int) : Void
	{
		this.width = width;
		this.isOpen = true;
	}

	@:keep
	function hxSerialize(s:Serializer) {
		s.serialize(width);
		s.serialize(isOpen);
		s.serialize(isLeft);
		s.serialize(isActive);
	}

	@:keep
	function hxUnserialize(u:Unserializer) {
		width = u.unserialize();
		isOpen = u.unserialize();
		isLeft = u.unserialize();
		isActive = u.unserialize();
	}

	public static inline var MIN_WIDTH :Int = 16;
	public static inline var COLLAPSING_WIDTH :Int = 120;
}