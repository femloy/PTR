with (obj_comboend)
{
    for (var i = 0; i < comboscore; i += comboscore)
        create_collect((obj_player1.x + irandom_range(-60, 60)), ((obj_player1.y - 100) + irandom_range(-60, 60)), choose(1559, 1561, 1562, 1563, 1560))
    comboscore = 0
    instance_destroy()
}
with (instance_create(x, y, obj_comboend))
{
    combo = global.savedcombo
    comboscore = global.comboscore
    combominus = round((comboscore / 50))
}
global.comboscore = 0
global.savedcombo = 0
