extends Node2D

signal died
signal turn_ended

const BATTLE_UNITS = preload("res://battle_units.tres")

@export var damage = 3
@export var hp = 25: set = set_hp

@onready var hp_label = $HPLabel
@onready var animation_player = $AnimationPlayer
@onready var hover_info = $HoverInfo


func _ready():
	BATTLE_UNITS.set_enemy(self)


func _exit_tree():
	BATTLE_UNITS.set_enemy(null)


func init(text_box):
	hover_info.init(text_box)


func take_damage(amount):
	hp -= amount
	
	if is_dead():
		emit_signal("died")
		queue_free()
	else:
		animation_player.play("Shake")


func is_dead():
	return hp <= 0


func attack():
	await get_tree().create_timer(0.4).timeout
	animation_player.play("Attack")
	await animation_player.animation_finished
	emit_signal("turn_ended")


func deal_damage():
	if BATTLE_UNITS.get_player_stats():
		BATTLE_UNITS.get_player_stats().hp -= damage


func set_hp(value):
	hp = value
	if hp_label:
		hp_label.text = str(hp) + "hp"
