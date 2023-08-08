extends Button

const BATTLE_UNITS = preload("res://battle_units.tres")
@onready var hover_info = $HoverInfo


func init(text_box):
	hover_info.init(text_box)


func _on_pressed():
	pass # Replace with function body.
