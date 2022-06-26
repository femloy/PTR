alpha = 1
depth = -8
tiles[0] = array_create(0)
tiles[1] = array_create(0)
tiles[2] = array_create(0)
for (var i = 0; i < 3; i++)
{
    var lay_id = layer_get_id(concat("Tiles_Secret", (i + 1)))
    tilemap_sprite[i] = -4
    if (lay_id != -1)
    {
        var map_id = layer_tilemap_get_id(lay_id)
        var ts = tilemap_get_tileset(map_id)
        var t = -4
        switch ts
        {
            case 74:
                t = tile_ruin
                break
            case 75:
                t = tile_ruin2
                break
            case 90:
                t = sprite_tile_beachtest
                break
            case 91:
                t = sprite_tile_beachtest2
                break
            case 94:
                t = sprite_tile_beachtest2dark
                break
            case 79:
                t = tile_chateau1
                break
            case 49:
                t = tile_desert
                break
            case 51:
                t = tile_ufo
                break
            case 50:
                t = tile_cavern
                break
            case 76:
                t = tile_dungeon
                break
            case 77:
                t = tile_dungeon2
                break
            case 78:
                t = tile_dungeon3
                break
            case 65:
                t = tile_entrance1
                break
            case 64:
                t = tile_tower
                break
            case 86:
                t = tile_farm
                break
            case 95:
                t = sprite_tile_forest
                break
            case 96:
                t = sprite_tile_forest1_shade
                break
            case 97:
                t = sprite_tile_forest2
                break
            case 123:
                t = bg_tilefreezer
                break
            case 23:
                t = tile_freezer2
                break
            case 83:
                t = tile_graveyard1
                break
            case 85:
                t = tile_graveyard3
                break
            case 84:
                t = tile_graveyard2
                break
            case 47:
                t = tile_factory
                break
            case 25:
                t = tile_factory2424
                break
            case 125:
                t = spr_kidspartytile
                break
            case 99:
                t = sprite_tile_kungfu
                break
            case 100:
                t = tile_kunfucity
                break
            case 101:
                t = sprite_tile_kungfustructure
                break
            case 12:
                t = spr_mansiontile2
                break
            case 55:
                t = tile_castle
                break
            case 71:
                t = tile_medieval
                break
            case 72:
                t = tile_medieval2
                break
            case 73:
                t = tile_medieval3
                break
            case 102:
                t = sprite_tile_minigolf
                break
            case 103:
                t = sprite_tile_minigolf2
                break
            case 104:
                t = sprite_tile_minigolf2_shad
                break
            case 70:
                t = tile_secret
                break
            case 13:
                t = sprite_tile_space1
                break
            case 115:
                t = sprite_tile_spaceback1
                break
            case 109:
                t = sprite_tile_space2
                break
            case 87:
                t = tile_pinball1
                break
            case 88:
                t = tile_pinball2
                break
            case 89:
                t = tile_pinball3
                break
            case 31:
                t = sprite_tile_war1
                break
            case 17:
                t = sprite_tile_war2
                break
            case 129:
                t = sprite_tile_war3
                break
            case 6:
                t = sprite_tile_war4
                break
            case 29:
                t = sprite_tile_war1shadow
                break
            case 7:
                t = sprite_tile_space2shadow
                break
            case 132:
                t = sprite_tile_citycarnival
                break
            case 16:
                t = sprite_tile_citydark
                break
            case 122:
                t = spr_medievalinterior
                break
            case 133:
                t = spr_medievallibrary
                break
            case 4:
                t = spr_interiortile
                break
        }

        tilemap_sprite[i] = t
        var _w32 = (sprite_get_width(t) / 32)
        for (var yy = 0; yy < image_yscale; yy++)
        {
            for (var xx = 0; xx < image_xscale; xx++)
            {
                var _x = (x + (xx * 32))
                var _y = (y + (yy * 32))
                var data = tilemap_get_at_pixel(map_id, _x, _y)
                var _id = tile_get_index(data)
                var xi = 0
                var yi = 0
                for (var j = 0; j < _id; j++)
                {
                    xi++
                    if (xi >= _w32)
                    {
                        xi = 0
                        yi++
                    }
                }
                array_push(tiles[i], [_x, _y, (xi * 32), (yi * 32)])
                data = tile_set_empty(data)
                tilemap_set_at_pixel(map_id, data, _x, _y)
            }
        }
    }
}
trace(tilemap_sprite)
if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
    instance_destroy()
