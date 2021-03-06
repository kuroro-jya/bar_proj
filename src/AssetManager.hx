class AssetManager {
    /*
    static final SLIME_FRONT = [0.,  0, 32, 32];
    static final SLIME_LEFT  = [0., 32, 32, 32];
    static final SLIME_BACK  = [0., 64, 32, 32];
    static final SLIME_RIGHT = [0., 96, 32, 32];

    static final WATERFRUIT = [ 0., 128, 20, 19];
    static final BLUE_BALL  = [21., 128, 24, 24];
    static final PLANT_SOIL = [46., 128, 42, 16];
    
    static final TILE_GRASS_A = [ 0., 0, 32, 32];
    static final TILE_GRASS_B = [32., 0, 32, 32];
    static final TILE_DIRT_A  = [96., 0, 32, 32];
    static final TILE_DIRT_B  = [128., 0, 32, 32];

    static final PLANT_WATERFRUIT_SEED = [48., 144, 16, 8];
    static final PLANT_WATERFRUIT_STAGE_A = [ 0., 152, 48, 40];
    static final PLANT_WATERFRUIT_STAGE_B = [48., 152, 48, 40];
    static final PLANT_WATERFRUIT_STAGE_C = [96., 152, 48, 40];
    */
    public static var imageSizeData : Dynamic; 
    public static var tileSizeData : Dynamic;

    public static function getAssetSize(name : String) : Dynamic{
        switch (name) {
            // characters
            case "slime_front": return imageSizeData.slime_front;
            case "slime_left" : return imageSizeData.slime_left;
            case "slime_back" : return imageSizeData.slime_back;
            case "slime_right": return imageSizeData.slime_right;

            // items
            case "waterfruit" : return imageSizeData.item_wf;
            case "blue_ball"  : return imageSizeData.item_blueball;

            // plants
            case "plant_waterfruit_seed": return imageSizeData.plant_wf_seed;
            case "plant_waterfruit_stages": return {
                    "a" : imageSizeData.plant_wf_stage_a, 
                    "b" : imageSizeData.plant_wf_stage_b, 
                    "c" : imageSizeData.plant_wf_stage_c
                };

            // tool slimes
            case "slime_rake" : return imageSizeData.slime_rake;
            case "slime_rake_side" : return imageSizeData.slime_rake_side;
            case "slime_drill" : return imageSizeData.slime_drill;
            case "slime_drill_side" : return imageSizeData.slime_drill_side;
            case "slime_scissor" : return imageSizeData.slime_scissor;
            case "slime_scissor_side" : return imageSizeData.slime_scissor_side;

            // tools
            case "tool_rake" : return {
                    "item"  : imageSizeData.item_rake,
                    "side"  : imageSizeData.tool_rake_side,
                    "front" : imageSizeData.tool_rake_front
                };
            case "tool_pickaxe" : return {
                    "item"  : imageSizeData.item_pickaxe,
                    "side"  : imageSizeData.tool_pickaxe_side,
                    "front" : imageSizeData.tool_pickaxe_front
                };
            case "tool_sickle" : return {
                    "item"  : imageSizeData.tool_sickle_side,
                    "side"  : imageSizeData.tool_sickle_side,
                    "front" : imageSizeData.tool_sickle_front
                };
            
            // facilities
            case "plant_soil" : return {
                    "full"  : imageSizeData.fac_ps_full,
                    "none"  : imageSizeData.fac_ps_none,
                    "left"  : imageSizeData.fac_ps_left,
                    "lt"    : imageSizeData.fac_ps_lt,
                    "ltb"   : imageSizeData.fac_ps_ltb,
                    "lb"    : imageSizeData.fac_ps_lb,
                    "lrt"   : imageSizeData.fac_ps_lrt,
                    "inner" : imageSizeData.fac_ps_inner,
                    "lrb"   : imageSizeData.fac_ps_lrb,
                    "rt"    : imageSizeData.fac_ps_rt,
                    "rtb"   : imageSizeData.fac_ps_rtb,
                    "rb"    : imageSizeData.fac_ps_rb,
                    "top"   : imageSizeData.fac_ps_top,
                    "right" : imageSizeData.fac_ps_right,
                    "bottom": imageSizeData.fac_ps_bottom
                };
            case "plant_soil_avl" : return {
                    "full"  : imageSizeData.fac_ps_a_full,
                    "none"  : imageSizeData.fac_ps_a_none,
                    "left"  : imageSizeData.fac_ps_a_left,
                    "lt"    : imageSizeData.fac_ps_a_lt,
                    "ltb"   : imageSizeData.fac_ps_a_ltb,
                    "lb"    : imageSizeData.fac_ps_a_lb,
                    "lrt"   : imageSizeData.fac_ps_a_lrt,
                    "inner" : imageSizeData.fac_ps_a_inner,
                    "lrb"   : imageSizeData.fac_ps_a_lrb,
                    "rt"    : imageSizeData.fac_ps_a_rt,
                    "rtb"   : imageSizeData.fac_ps_a_rtb,
                    "rb"    : imageSizeData.fac_ps_a_rb,
                    "top"   : imageSizeData.fac_ps_a_top,
                    "right" : imageSizeData.fac_ps_a_right,
                    "bottom": imageSizeData.fac_ps_a_bottom
                };

            // tiles
            case "tile_grass_a": return tileSizeData.tile_grass_a;
            case "tile_grass_b": return tileSizeData.tile_grass_b;
            case "tile_dirt_a": return tileSizeData.tile_dirt_a;
            case "tile_dirt_b": return tileSizeData.tile_dirt_b;

            default : 
                trace ("Unknown tile name: " + name);
                return {x:-1., y:-1., w:-1., z:-1.};
        }
    }
}