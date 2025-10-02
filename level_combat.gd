extends Node

signal switch_level

var turn = "player_turn"
var player
var monster



func _ready() -> void:
	show_monster_pv_combat(monster.pv)
	show_player_pv_combat(player.pv)
	#if turn == "monster_turn":
		#player.take_damage(monster.power)

func _process(delta: float) -> void:
	if monster.pv <= 0:
		switch_level.emit()
	if turn == "monster_turn":
		player.take_damage(monster.power)
		show_player_pv_combat(player.pv)
		turn = "player_turn"

func _on_hit_pressed() -> void:
	if turn == "player_turn":
		$hit2.play()
		monster.take_damage(player.power)
		show_monster_pv_combat(monster.pv)
		turn = "monster_turn"

func show_player_pv_combat(amount:int):
	if amount <= 0:
		$pv_player.position = Vector2(500, 420)
		$pv_player.add_theme_font_size_override("font_size", 80)
		$pv_player.text = "Dead !!!"
	else:
		$pv_player.position = Vector2(500, 420)
		$pv_player.add_theme_font_size_override("font_size", 80)
		$pv_player.text = str(amount)
		
func show_monster_pv_combat(amount:int):
	if amount <= 0:
		$pv_monster.position = Vector2(1200, 420)
		$pv_monster.add_theme_font_size_override("font_size", 80)
		$pv_monster.text = "Dead !!!"
	else:
		$pv_monster.position = Vector2(1200, 420)
		$pv_monster.add_theme_font_size_override("font_size", 80)
		$pv_monster.text = str(amount)
		
func set_player(new_player: Sprite2D):
	player = new_player
	player.position = Vector2(427, 531)




func set_monster(new_monster: Sprite2D):
	monster = new_monster
	monster.position = Vector2(1117, 531)
	monster.flip_h = true
