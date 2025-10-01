extends Node

var game_menu_scene = preload("res://scenes/game_menu.tscn")
var player_scene = preload("res://scenes/player.tscn")
var monster_scene = preload("res://scenes/monster.tscn")
var level_scene = preload("res://scenes/level.tscn")
var level_combat_scene = preload("res://scenes/level_combat.tscn")

var player: Sprite2D
var monster: Sprite2D



func _ready() -> void:
	
	#player = player_scene.instantiate()
	monster = monster_scene.instantiate()
	player = player_scene.instantiate()
	var game_menu = game_menu_scene.instantiate()
	game_menu.start_game_buton.connect(start_game)
	add_child(game_menu)
	

	
func _process(_delta: float) -> void:
	pass

func start_game():
	$game_menu.queue_free()
	var level = level_scene.instantiate()
	level.set_player(player)
	level.set_monster(monster)
	level.start_combat.connect(start_combat)
	add_child(player)
	add_child(monster)
	add_child(level)
	
func start_combat():
	$level.queue_free()
	var level_combat = level_combat_scene.instantiate()
	level_combat.set_player(player)
	level_combat.set_monster(monster)
	add_child(level_combat)
