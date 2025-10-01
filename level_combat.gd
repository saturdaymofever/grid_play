extends Node

var turn = "player_turn"
var player
var monster

func _ready() -> void:
	$hit.visible = false
	if turn == "player_turn":
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
		
func set_player(new_player: Sprite2D):
	player = new_player
	player.position = Vector2(427, 531)
	print(player.position)



func set_monster(new_monster: Sprite2D):
	monster = new_monster
	monster.position = Vector2(1117, 531)
	monster.flip_h = true
