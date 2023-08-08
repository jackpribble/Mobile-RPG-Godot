extends Resource
class_name BattleUnits

var player_stats = null : set = set_player_stats, get = get_player_stats
var enemy = null : set = set_enemy, get = get_enemy


func set_player_stats(value):
	player_stats = value


func get_player_stats():
	return player_stats


func set_enemy(value):
	enemy = value


func get_enemy():
	return enemy
