extends Control

@export_multiline var description = ""
var text_box = null


func init(text_box_target):
	self.text_box = text_box_target


func _on_mouse_entered():
	if text_box: text_box.text = description


func _on_mouse_exited():
	if text_box: text_box.text = ""
