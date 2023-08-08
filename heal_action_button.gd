extends "res://ActionButton.gd"


func _on_pressed():
	var player_stats = BATTLE_UNITS.get_player_stats()
	
	if player_stats and player_stats.mp >= 8:
		player_stats.hp += 5
		player_stats.mp -= 8
		player_stats.ap -= 1
