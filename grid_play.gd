extends Node

var player_scene = preload("res://scenes/player.tscn")
var monster_scene = preload("res://scenes/monster.tscn")

var player:Player
var monster:Monster

var monster_defeated:int = 0
const win_objectif = 3

const grid_size:Vector2 = Vector2(3, 3)

var current_state:State

enum State {
	EXPLORATION,
	FIGHT,
	WIN,
	GAME_OVER
}

func process_exploration_turn():
	player.new_rand_coord(grid_size)
	monster.new_rand_coord(grid_size)
	if player.coord == monster.coord:
		current_state = State.FIGHT

func process_fight_turn():
	monster.take_damage(player.power)
	player.take_damage(monster.power)
	if player.pv <= 0:
		current_state = State.GAME_OVER
	if monster.pv <= 0:
		monster_defeated += 1
		if monster_defeated == win_objectif:
			current_state = State.WIN
		else:
			current_state = State.EXPLORATION

func _ready() -> void:
	current_state = State.EXPLORATION
	player = player_scene.instantiate()
	monster = monster_scene.instantiate()


func _process(delta: float) -> void:
	pass
