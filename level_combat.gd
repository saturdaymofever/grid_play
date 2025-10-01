extends Node

var turn = "player"


func _ready() -> void:
	$hit.visible = false
	if turn == "player":
		$hit.visible = true
	
func _process(delta: float) -> void:
	pass

func _on_hit_pressed() -> void:
	$hit2.play()
	$monster.take_damage($player.power)
#	$hud.show_player_pv($player.pv)

func show_player_pv(amount:int):
	if amount <= 0:
		$hitpoints_value.text = "Dead !!!"
	else:
		$hitpoints_value.text = str(amount)
		
func show_monster_pv(amount:int):
	if amount <= 0:
		$pv_monster.text = "Dead !!!"
	else:
		$pv_monster.text = str(amount)
