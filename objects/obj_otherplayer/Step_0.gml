var badID = baddiegrabbedID;
if badID == "-4" or badID == "0" or badID == string(obj_null)
	badID = noone;
else if string_digits(badID) != ""
	badID = real(string_digits(badID));
else
	badID = noone;

with badID
{
	state = states.grabbed;
	grabbedby = other.id;
}
