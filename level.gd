extends Node

signal start_exploring

func _ready() -> void:
	$grid.grid_compose()
	var player_coord = $grid.random_coord($grid.grid_size)
	var monster_coord = $grid.random_coord($grid.grid_size)
	$player.position = $grid.position + player_coord * $grid.tile_size
	$monster.position = $grid.position + monster_coord * $grid.tile_size

# VOIR AVEC JOJO lLE COUP DES _ DEVANT LES VARIABLES ET CORRIGER AU BESOIN

func _process(_delta: float) -> void:
	pass

func _on_hud_start_exploring() -> void:
	start_exploring.emit()
	$fx_explore_button.play()
	var player_coord = $grid.random_coord($grid.grid_size)
	var monster_coord = $grid.random_coord($grid.grid_size)
	$player.position = $grid.position + player_coord * $grid.tile_size
	$monster.position = $grid.position + monster_coord * $grid.tile_size
	#if $player.position == $monster.position:
		#get_tree().change_scene_to_file("res://scenes/level_combat.tscn")
