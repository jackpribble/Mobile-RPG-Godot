extends Node

const BATTLE_UNITS = preload("res://battle_units.tres")

@export var enemies: Array[PackedScene] = []

@onready var battle_action_buttons = $UI/BattleActionButtons
@onready var animation_player = $AnimationPlayer
@onready var next_room_button = $UI/CenterContainer/NextRoomButton
@onready var enemy_position = $EnemyPosition
@onready var text_box = $UI/TextBoxPanel/TextBox
@onready var sword_action_button = $UI/BattleActionButtons/SwordActionButton
@onready var heal_action_button = $UI/BattleActionButtons/HealActionButton


func _ready():
	start_player_turn()
	var enemy = BATTLE_UNITS.get_enemy()
	
	sword_action_button.init(text_box)
	heal_action_button.init(text_box)
	
	if enemy:
		enemy.init(text_box)
		enemy.died.connect(_on_enemy_died)


func start_enemy_turn():
	battle_action_buttons.hide()
	var enemy = BATTLE_UNITS.get_enemy()

	if enemy and not enemy.is_queued_for_deletion():
		enemy.attack()
		
		await enemy.turn_ended
		start_player_turn()
	
	
func start_player_turn():
	battle_action_buttons.show()
	var player_stats = BATTLE_UNITS.get_player_stats()
	player_stats.ap = player_stats.max_ap
	await player_stats.turn_ended
	start_enemy_turn()


func create_new_enemy():
	enemies.shuffle()
	var enemy_pck = enemies.front()
	var enemy = enemy_pck.instantiate()
	enemy_position.add_child(enemy)
	enemy.died.connect(_on_enemy_died)
	enemy.init(text_box)

func _on_enemy_died():
	next_room_button.show()
	battle_action_buttons.hide()


func _on_next_room_button_pressed():
	next_room_button.hide()
	animation_player.play("FadeToNewRoom")
	await animation_player.animation_finished
	BATTLE_UNITS.get_player_stats().ap = BATTLE_UNITS.get_player_stats().max_ap
	battle_action_buttons.show()
	start_player_turn()
	create_new_enemy()
