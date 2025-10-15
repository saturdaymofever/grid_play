extends Node

signal fight_turn

var player:Player
var monster:Monster

const monster_position:Vector2 = Vector2(1117, 531)
const player_position:Vector2 = Vector2(427, 531)

func _ready() -> void:
	monster.flip_h = true
	$pv_player.position = Vector2(500, 420)
	$pv_player.add_theme_font_size_override("font_size", 80)
	$pv_monster.position = Vector2(1200, 420)
	$pv_monster.add_theme_font_size_override("font_size", 80)

func _process(_delta: float) -> void:
	show_monster_pv_combat(monster.pv)
	show_player_pv_combat(player.pv)
	monster.position = monster_position
	player.position = player_position
	
func _on_hit_pressed() -> void:
	$hit2.play()
	fight_turn.emit()

func show_player_pv_combat(amount:int):
	$pv_player.text = str(amount)

func show_monster_pv_combat(amount:int):
	$pv_monster.text = str(amount)

func set_player(new_player: Sprite2D):
	player = new_player

func set_monster(new_monster: Sprite2D):
	monster = new_monster
