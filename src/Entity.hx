import h2d.Bitmap;
import Item.Fruit;
import h2d.Object;

// Base of All sprited object in the game
class Entity extends Object{
    public var sprite : h2d.Bitmap;
    public var isSpriteChanged : Bool;
    var INTERACT_DISTANCE = 100;
    var DROP_DISTANCE = 80;
    public var holds : Object;
    public function new() {
        super();
        // add sprite container
        var s = new Object(this);
        s.name = "sprite";
        isSpriteChanged = false;

        // add holding container
        var s = new Object(this);
        s.name = "holds";
    }

    function update(dt: Float) : Void{
        // detect any sprite change
        if (isSpriteChanged) {
            var s = this.getObjectByName("sprite");
            s.removeChildren();
            s.addChild(this.sprite);
            isSpriteChanged = false;
        }
    }
}

enum Tool {
    Hammer; Axe; Pickaxe; Sickle; // 镰刀
    Hoe; None;
}

// TODO : add All given entities to class

class Character extends Entity {
    public var triggers : Array<Object>;
    public var controller : Controller;
    public var camera : Misc.Camera;
    
    public var sprites : Array<Bitmap>;

    public var state : State;
    public var layer : h2d.Layers;
    public var layerNum : Int;

    /**
     * New character object
     * @param sprites All sprites the object use
     */
    public function new(sprites:Array<Bitmap>) {
        super();
        this.sprites = sprites;
    }

    public override function update(dt: Float) {
        super.update(dt);
    }
}

enum State {
    Holding; Idle;
}

class Player extends Character {
    var toolInventory : Array<Tool>;
    var currentTool : Tool;

    var OFFSET_HOLD_X = 0;
    var OFFSET_HOLD_Y = -50;
    
    public function new(sprites:Array<Bitmap>) {
        super(sprites);
        this.state = Idle;
        this.name = "player";
    }

    public override function update(dt: Float) {
        super.update(dt);
    }

    /**
     * 让该角色和传入的其他对象互动
     * @param list 对象的list
     */
    public function interact(list : Iterator<Object>) {
        if (state == Idle) {
            while (list.hasNext()) {
                var item = list.next();
                if ((item is Fruit) && (isInDistanceInteractive(item))) { // 希望能通过 item.isCarrible bool值来判定是否能够放到头上
                    this.holds = item;
                    item.x = OFFSET_HOLD_X; item.y = OFFSET_HOLD_Y;
                    this.getObjectByName("holds").addChild(item);
                    state = Holding;
                    break; // TODO : this method only take the first-found item in the distance, modify to make it better
                }
            }
        } else if (state == Holding) { //
            var item = this.holds;
            item.x = this.x + DROP_DISTANCE * this.controller.direction.x;
            item.y = this.y + DROP_DISTANCE * this.controller.direction.y;
            this.layer.add(item, layerNum);

            this.holds = null;
            state = Idle;
        }
    }

    function isInDistanceInteractive(item : Object) : Bool {
        return (Math.sqrt(Math.pow(item.x - this.x, 2) + Math.pow(item.y - this.y, 2)) <= INTERACT_DISTANCE);
    }
}
