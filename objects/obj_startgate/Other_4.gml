switch targetRoom
{
    case 393:
    case 409:
    case 425:
    case 444:
        world = 1
        break
    case 475:
    case 503:
    case 518:
    case 541:
        world = 2
        break
    case 566:
    case 583:
    case 623:
        world = 3
        break
    case 636:
    case 128:
    case 86:
    case 131:
        world = 4
        break
    case 472:
    case 90:
    case 659:
    case 125:
        world = 5
        break
}

ini_open_from_string(obj_savesystem.ini_str)
highscore = ini_read_real("Highscore", string(level), 0)
secret_count = ini_read_string("Secret", string(level), 0)
toppin[0] = ini_read_real("Toppin", (string(level) + "1"), 0)
toppin[1] = ini_read_real("Toppin", (string(level) + "2"), 0)
toppin[2] = ini_read_real("Toppin", (string(level) + "3"), 0)
toppin[3] = ini_read_real("Toppin", (string(level) + "4"), 0)
toppin[4] = ini_read_real("Toppin", (string(level) + "5"), 0)
ini_close()
switch level
{
    case "entrance":
        msg = "ENTRANCE"
        break
    case "medieval":
        msg = "PIZZASCAPE"
        break
    case "chateau":
        msg = "PIZZASCARE"
        break
    case "ruin":
        msg = "TEH ANCIENT CHEESE"
        break
    case "dungeon":
        msg = "BLOODSAUCE DUNGEON"
        break
    case "floorroom":
        msg = "OREGANO DESERT"
        break
    case "graveyard":
        msg = "THE WASTEYARD"
        break
    case "farm":
        msg = "FUN FARM"
        break
    case "ufo":
        msg = "SPACE PINBALL"
        break
    case "strongcold":
        msg = "STRONGCOLD"
        break
    case "forest":
        msg = "GNOME FOREST"
        break
    case "beach":
        msg = "PINEAPPLE BEACH"
        break
    case "dragonlair":
        msg = "DRAGON LAIR"
        break
    case "snickchallenge":
        msg = "SNICK CHALLENGE"
        break
}

