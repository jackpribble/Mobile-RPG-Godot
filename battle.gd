extends Node

@onready var enemy = $Enemy


func _on_sword_button_pressed():
	enemy.hp -= 4
