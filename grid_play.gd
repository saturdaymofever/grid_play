extends Node

var core:CoreGridPlay

# Ici on preload les scenes du player et du monstre, nous en auront besoin
var win_screen:PackedScene = preload("res://scenes/win.tscn")
var game_over_screen:PackedScene = preload("res://scenes/game_over.tscn")

#AJOUT MORGAN
var level_exploration_scene:PackedScene = preload("res://scenes/level_exploration.tscn")
var level_fight_scene:PackedScene = preload("res://scenes/level_fight.tscn")
var level_exploration_instantiated:bool = false
var level_fight_instantiated:bool = false

var level_exploration:Node
var level_fight:Node

func check_if_fight_is_instantiated():
	if level_fight_instantiated == false:
		instantiate_fight_level()
		level_fight_instantiated = true

func instantiate_fight_level():
	level_fight = level_fight_scene.instantiate()
	level_fight.set_player(core.player)
	level_fight.set_monster(core.monster)
	level_fight.fight_turn.connect(core.process_fight_turn)
	add_child(level_fight)

# ici on instantie et declare les variables de départ
func _ready() -> void:
	core = CoreGridPlay.new()
	add_child(core.player)
	add_child(core.monster)

func _process(_delta: float) -> void:
	if core.current_state == core.State.EXPLORATION:
		check_if_level_fight_is_killed()
		check_if_level_exploration_is_instantiated()
		
	if core.current_state == core.State.FIGHT:
		check_if_level_exploration_is_killed()
		check_if_fight_is_instantiated()
		
	if core.current_state == core.State.WIN:
		kill_all()
		var show_win_screen = win_screen.instantiate()
		add_child(show_win_screen)
		
	if core.current_state == core.State.GAME_OVER:
		kill_all()
		var show_game_over_screen = game_over_screen.instantiate()
		add_child(show_game_over_screen)
		

func check_if_level_exploration_is_instantiated():
	if level_exploration_instantiated == false:
		instantiate_level_exploration()
		level_exploration_instantiated = true

func instantiate_level_exploration():
	level_exploration = level_exploration_scene.instantiate()
	level_exploration.exploration_turn.connect(core.process_exploration_turn)
	level_exploration.set_player(core.player)
	level_exploration.set_monster(core.monster)
	add_child(level_exploration)
	
func check_if_level_exploration_is_killed():
	if level_exploration_instantiated:
		level_exploration.queue_free()
		level_exploration_instantiated = false

func check_if_level_fight_is_killed():
	if level_fight_instantiated:
		level_fight.queue_free()
		level_fight_instantiated = false

func kill_all():
	check_if_level_exploration_is_killed()
	check_if_level_fight_is_killed()
