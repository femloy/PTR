/// @description palettes & reset choice
switch sel[1]
{
	default:
		spr_palette = spr_peppalette;
		spr_idle = spr_player_idle;
		spr_select = spr_player_panic;
		selarray = [
			["YELLOW", "Palette zero. Don't make comparisons."],
			["PEPPINO", "A somewhat overweight Italian chef."],
			["SPICED", "Looks like someone had a taste of the Max Level Ultra X-Spicy\nItalian-served Pepper Pizza™ Deluxe, not sponsored by Pepperman™."],
			["BLUE", "He's rocking a blue outfit."],
			["RED", "That's right, he's rocking a red outfit."],
			["GREEN", "Shockingly, he's rocking a green outfit."],
			["GRAY", "It's just a Leaning Nightmare..."],
			["GAMEBOY COLOR", "What a ripoff."],
			["GRAYSCALE", "When a customer leaves a negative review."],
			["XMAS", "Give me a break."],
			["THE NOISE", "This reminds me of a certain parallel universe."],
			["SKETCH", "Oh come on, you didn't even color it in!"],
			["GRINCH", "It's Claus!!!!"],
			["LEAN", "No, he wasn't involved in slaughter."],
			["ANTON", "Unfortunately, he forgot his balls at home."],
			["LIGHT", "People also look for Fluorescent Pizza."],
			["AETHER", "At last, the coder has been found."],
			["SAGE", "PTSD actually stands for \"Pizza Tower Sage Demo\"."],
			["BLACK", "Not the clothes."],
			["MASSACRE", "It's all just a bad dream..."],
			["BURNT PIZZA", "Papa Louie would not be proud."],
			["GAMEBOY", "One of his greatest achievements."],
			["HYPOTHERMIA", "Lesson learned. Don't bathe inside of a freezer."],
			["BONMARIO", "Property of Bonmario of America INC."],
			["DRUNKEN", "No I'm not drunk whthaet are oyugl tkgjg kln abjgt"],
			["ASCENDED PEDDITO", "Likes death, dislikes the livings."],
			["VIRTUAL BOY", "The long awaited all-red palette."],
			["GOLDEN", "He finally made a profit."],
			["BLACK", "Ok, they ARE the clothes this time."],
		];
		break;
	
	case "N":
		spr_palette = spr_noisepalette;
		spr_idle = spr_playerN_idle;
		spr_select = spr_playerN_panicidle;
		selarray = [
			["THE NOISE", "The mischievous gremlin."],
			["HALLOWEEN", "Scary."],
			["PEPPINO", "...The classic?"],
			["SNICK", "Legends say he WAS involved in slaughter..."],
			["XMAS", "Merry!!!"],
			["INVERTED", ".yracS"],
			["NAKED", "Hell yeah! Public indecency!"],
			["CONCEPT", "The original."],
			["THE DOISE", "Do not steal."],
			["NOISETTE", "It takes a noiser noise than\nThe Noise's noise to annoy The Noise."],
			["RAINBOW", "What country is that?"],
			["SKETCH", "He's closing his eyes...!"],
			["THE NOID", "Avoid him."],
			["GALAXY", "Stunning."],
			["CHUNGUS", "A fine Chungus, of the big variety."],
			["MR ORANGE", "I'm seeing double! Four Noise!"],
			["DR.B.B.", "Snooping as usual, I see."],
			["SALAD", "You fat bald bastard you piece of subhuman trash\n2000 years of constant human evolution to create a hairless fucking coconut."],
			["BLACKFACE", "That's not nice."],
			["NOIK", "He's canon."],
			["HYPERTHERMIA", "That's NOT how you preheat an oven."],
			["LUIGI", "The L stands for winner."],
		];
		break;
	
	case "V":
		spr_palette = spr_vigipalette;
		spr_idle = spr_playerV_idle;
		spr_select = spr_playerV_gate;
		selarray = [
			["THE VIGILANTE", "AKA Vigert Ebenezer Lantte."],
			["HALLOWEEN", "Trick or treat.\nThis is a threat."],
			["MM8BDM", "A very exciting night."],
			["CHOCOLANTE", "It's still cheese. Just... with, uh, chocolate flavoring?"],
			["JOHN", "A hungry slime."],
			["GOLDEN", "Something, something, carrots."],
			["CHEDDAR", "Cheddar cheese is a relatively hard, off-white (or orange if colourings such as annatto are added),\nsometimes sharp-tasting, natural cheese. Originating in the English village of Cheddar in Somerset,\ncheeses of this style are now produced beyond the region and in several countries around the world."],
			["SEPIA", "Wildstyle pistolero."],
			["SNICK", "It's NOT him. Never trust purple cheese."],
			["EMERALD", "Hmm."],
			["HOLIDAY", "Merry Cheesemas."],
			["CHEESE MAN", "A gag of the Johnson subject."],
			["VIGILATTE", "Chocolate milk."],
			["BLOODSAUCE", "Who the hell dipped cheese in ketchup?!"],
			["VIGILATEX", "What the fuck"],
			["THE BARTENDER", "Give me a drink, Bartender."],
			["MORSHU", "It's yours, my friend."],
			["CASU MARTZU", "Y'know, this cheese summarizes the current state of the game pretty well."],
		];
		break;
	
	case "S":
		spr_palette = spr_snickpalette;
		spr_idle = spr_snick_idle;
		spr_select = spr_snick_victory;
		selarray = [
			["SNICK", "It's him."],
			["TAIL", "A single tail."],
			["SHADER", "im the greatest living thing my duderino"],
			["BOOTS", "Unlike Snick."],
			["SNICKETTE", "Not to be confused with Satan."],
			["MASTER SYSTEM", "Brought to you by Snicksoft!"],
			["SHADOW", "The obligatory edgy palette."],
			["CYAN", "Don't you dare."],
			["TRANSPARENT", "He seems empty inside... and outside."],
			["MANUAL", "He hosts his own event."],
			["SKETCH", "Let's just say he likes burgers."],
			["SHITK", "Acting sus!"],
			["HALLOWEEN", "Haha don't worry, he's not dead yet."],
			["SOCK", "Sock is without description."],
			["ELMO", "Hilarity ensues."],
			["GAMEBOY", "That's not right..."],
			["HELLSNICK", "Si."],
			["MAJIN", "Fun is infinite."],
			["NEON", "I've seen OC's brighter than this."],
			["PISSK", "Not to be confused with his arch nemesis."],
		];
		break;
	
	case "PP":
		spr_palette = spr_pisspalette;
		spr_idle = spr_playerPP_idle;
		spr_select = spr_playerPP_skinselect;
		selarray = [
			["PISSINO", "God is dead and we killed him."],
			["WHITE", "A somewhat overweight italian failure."],
			["RED", "It could also be-a him, for all we know."],
			["BLUE", "The day he forgot his purpose."],
			["FREDDY", "hor hor horhor hor hor horhor horhor"],
			["SKETCH", "He wouldn't have crashed into somebody.\nHe would've shot a whole convenience store down."],
			["GRAND DAD", "FLINTSTONES HAHAHAHA"],
			["DORITO", "Undertale"],
			["BLACK", "Don't show this to Denchick."],
			["METAL", "Balls of Steel."],
			["???", "You can't get blacker than this."],
			["RANDOM HUMOR", "This isn't even a joke. And I'm asking this personally. Who hurt you?\nWhat happened for things to be this way? Are you okay?"],
			["GRUNT", "To whomever this palette once belonged to, they must be living a pretty sad life right now."],
			["MCDONALDS", "I dislike their soggy fries. Fight me."],
			["ELMO", "You have come to his event. Now you must endure forceful cosplay."],
			["MANUAL", "Do you ever just feel like emanating a strong stench of urine?"],
			["SNICK", "It's not him."],
			["THE EVIL", "Made in hell."],
			["SUPER MARIO", "HOLY SHIT"],
			["LEAN", "This isn't funny anymore. Stop."],
			["4CHAN MYSTERY BOX", "IT'S NOT FUCKING WEED YOU PIECE OF SHIT STONER."],
			["BRODY FOXX", "He died in 2006 from a severe ketamine overdose."],
		]
		break;
}

switch sel[1]
{
	default:
		locked = false;
		break;
}
var basepal = (sel[1] == "P");

if sel[1] != playerid.character
	sel[0] = basepal;
else
	sel[0] = playerid.paletteselect;

selmin = 0;
selmax = pal_swap_get_pal_count(spr_palette) - 1;

if !check_shaders()
{
	sel[0] = 0;
	if basepal
		selarray[0] = selarray[1];
}
