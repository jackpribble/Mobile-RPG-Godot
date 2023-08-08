extends Node

const BATTLE_UNITS = preload("res://battle_units.tres")

signal turn_ended
signal hp_changed(value)
signal ap_changed(value)
signal mp_changed(value)

var max_ap = 3
var max_mp = 10
var max_hp = 25
var hp = max_hp: set = set_hp
var ap = max_ap: set = set_ap
var mp = max_mp: set = set_mp


# Called when the node enters the scene tree for the first time.
func _ready():
	BATTLE_UNITS.set_player_stats(self)


func _exit_tree():
	BATTLE_UNITS.set_player_stats(null)


func set_hp(value):
	hp = clamp(value, 0, max_hp)
	emit_signal("hp_changed", hp)
	

func set_ap(value):
	ap = clamp(value, 0, max_ap)
	emit_signal("ap_changed", ap)
	
	if ap <= 0:
		emit_signal("turn_ended")
	
	
func set_mp(value):
	mp = clamp(value, 0, max_mp)
	emit_signal("mp_changed", mp)



