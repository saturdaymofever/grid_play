extends Node


func _ready() -> void:
	$hud.show_player_pv($player.pv)
	$grid.grid_compose()
	var player_coord = $grid.random_coord($grid.grid_size)
	var monster_coord = $grid.random_coord($grid.grid_size)
	$player.position = $grid.position + player_coord * $grid.tile_size
	$monster.position = $grid.position + monster_coord * $grid.tile_size

func _process(delta: float) -> void:
	pass




func _on_hud_start_exploring() -> void:
	var player_coord = $grid.random_coord($grid.grid_size)
	var monster_coord = $grid.random_coord($grid.grid_size)
	$player.position = $grid.position + player_coord * $grid.tile_size
	$monster.position = $grid.position + monster_coord * $grid.tile_size

func _on_hud_hit_monster() -> void:
	$hit.play()
	$monster.take_damage($player.power)
	$hud.show_player_pv($player.pv)
