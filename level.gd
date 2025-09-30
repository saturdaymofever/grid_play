extends Node


func _ready() -> void:
	$hud.show_player_pv($player.pv)
	$grid.grid_compose()

func _process(delta: float) -> void:
	pass




func _on_hud_start_exploring() -> void:
	pass

func _on_hud_hit_monster() -> void:
	$hit.play()
	$monster.take_damage($player.power)
	$hud.show_player_pv($player.pv)
