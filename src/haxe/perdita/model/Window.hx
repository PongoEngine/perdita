package perdita.model;

import js.Browser.window;
import perdita.model.util.Point;

class Window
{
    public var position :Point;
    public var dimensions :Point;
    public var isUpdatingWidth :Bool;

	public function new() : Void
	{
        this.position = new Point(100, 100);
        this.dimensions = new Point(100, 100);
        this.isUpdatingWidth = false;
	}

    public static function resizeTo(thisWindow :Window, x :Int, y :Int) : Void
    {
        var width = (x - thisWindow.position.x) + 6;
        var height = y - thisWindow.position.y + 6;

        thisWindow.dimensions.x = Std.int(Math.max(60, width));
        thisWindow.dimensions.y = Std.int(Math.max(80, height));
    }

    public static function moveBy(thisWindow :Window, x :Int, y :Int) : Void
    {
        var nX = thisWindow.position.x + x;
        var nY = thisWindow.position.y + y;
        thisWindow.position.x = Std.int(Math.max(0, nX));
        thisWindow.position.y = Std.int(Math.max(0, nY));

        if(thisWindow.position.x + thisWindow.dimensions.x > window.innerWidth) {
            thisWindow.position.x = Std.int(window.innerWidth - thisWindow.dimensions.x);
        }

        if(thisWindow.position.y + thisWindow.dimensions.y > window.innerHeight) {
            thisWindow.position.y = Std.int(window.innerHeight - thisWindow.dimensions.y);
        }
    }
}