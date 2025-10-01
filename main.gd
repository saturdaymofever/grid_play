extends Node

var game_menu_scene = preload("res://scenes/game_menu.tscn")
var player_scene = preload("res://scenes/player.tscn")
var monster_scene = preload("res://scenes/monster.tscn")
var level_scene = preload("res://scenes/level.tscn")

func _ready() -> void:
	var _player = player_scene.instantiate() #J'instentie ici seulement pour pouvoir recupérer les varible dans d'autre scenes
	var _monster = monster_scene.instantiate() # idem l'ajout de _ devant la variable me permet de dire que je n'utilise pas cette variable ici sans avertisseùent coté godot
	var game_menu = game_menu_scene.instantiate()
	
	add_child(game_menu)
	game_menu.start_game_buton.connect(start_game)
	
func _process(_delta: float) -> void:
	pass

func start_game():
	$game_menu.queue_free()
	var level = level_scene.instantiate()
	add_child(level)
	
