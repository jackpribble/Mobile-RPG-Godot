extends Panel

@onready var hp = $StatsContainer/HP
@onready var ap = $StatsContainer/AP
@onready var mp = $StatsContainer/MP



func _on_player_stats_hp_changed(value):
	hp.text = "HP\n" + str(value)


func _on_player_stats_ap_changed(value):
	ap.text = "AP\n" + str(value)


func _on_player_stats_mp_changed(value):
	mp.text = "MP\n" + str(value)


func _ready():
	hp.text = "HP\n" + str(25)
	ap.text = "AP\n" + str(3)
	mp.text = "MP\n" + str(10)
