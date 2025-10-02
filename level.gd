extends Node

signal start_combat
var player_coord
var monster_coord
var monster
var player

func _ready() -> void:
	$grid.grid_compose()
	player_coord = $grid.random_coord($grid.grid_size)
	monster_coord = $grid.random_coord($grid.grid_size)

func _process(_delta: float) -> void:
	player.position = $grid.position + player_coord * $grid.tile_size
	monster.position = $grid.position + monster_coord * $grid.tile_size

func _on_hud_start_exploring() -> void:
	$fx_explore_button.play()
	player_coord = $grid.random_coord($grid.grid_size)
	monster_coord = $grid.random_coord($grid.grid_size)
	print(monster.position)
	if monster.position == player.position:
		start_combat.emit()

func set_player(new_player: Sprite2D):
	player = new_player




func set_monster(new_monster: Sprite2D):
	monster = new_monster
