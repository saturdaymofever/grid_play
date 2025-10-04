extends Node

signal exploration_turn

var monster:Monster
var player:Player

func _ready() -> void:
	$grid.grid_compose()

func _process(_delta: float) -> void:
	player.position = get_grid_offset() + get_coord_as_pixel_coordinate(player)
	monster.position = get_grid_offset() + get_coord_as_pixel_coordinate(monster)

func get_grid_offset():
	return($grid.position)

func get_coord_as_pixel_coordinate(character) -> Vector2:
	return(character.coord * $grid.tile_size)
	

func _on_hud_start_exploring() -> void:
	$fx_explore_button.play()
	exploration_turn.emit()
	#player_coord = $grid.random_coord($grid.grid_size)
	#monster_coord = $grid.random_coord($grid.grid_size)
	#if monster.position == player.position:
		#start_combat.emit()

func set_player(new_player: Sprite2D):
	player = new_player

func set_monster(new_monster: Sprite2D):
	monster = new_monster
