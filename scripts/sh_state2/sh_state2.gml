function sh_state2(args) {
	return sh_state(args, obj_player2);
}
function meta_state2()
{
	return {
		description: "change the second player's state",
		arguments: ["state"],
		suggestions: [
			obj_player2.state,
		],
	}
}
