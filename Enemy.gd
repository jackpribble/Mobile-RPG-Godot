extends Node2D

var hp = 25: set = _set_hp

@onready var hp_label = $HPLabel
@onready var animation_player = $AnimationPlayer


func _set_hp(value):
	hp = value
	hp_label.text = str(hp) + "hp"
	
	if hp <= 0:
		queue_free()
	else:
		animation_player.play("Shake")
	
