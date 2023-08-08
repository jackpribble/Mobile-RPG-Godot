extends "res://ActionButton.gd"

const slash_animation_pck = preload("res://slash.tscn")


func _on_pressed():
	var enemy = BATTLE_UNITS.get_enemy()
	var player_stats = BATTLE_UNITS.get_player_stats()
	
	if enemy and player_stats and player_stats.ap > 0:
		create_slash(enemy.global_position)
		enemy.take_damage(4)
		player_stats.mp += 2
		player_stats.ap -= 1


func create_slash(slash_position: Vector2):
	var parent = get_tree().current_scene
	var slash_i = slash_animation_pck.instantiate()
	parent.add_child(slash_i)
	slash_i.global_position = slash_position
