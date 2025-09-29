extends Node

var screen_size = Vector2(2560, 1440)
var tile_size = 384
var tile_scene = preload("res://tile.tscn")
var grid_scene = preload("res://grid_container.tscn")
var hud_scene = preload("res://canvas_layer.tscn")

var margin_x = (screen_size.x - tile_size * 3 )/ 2
var margin_y = (screen_size.y - tile_size * 3 )/ 2


func _ready() -> void:
	
#	for x in range(3):
#		for y in range(3):
#			var tile = tile_scene.instantiate()
#			tile.position = Vector2(tile_size * x + margin_x, tile_size * y + margin_y)
#			add_child(tile)
#	var grid = grid_scene.instantiate()
#	add_child(grid)
	var hud = hud_scene.instantiate()
	add_child(hud)


	
func _process(delta: float) -> void:
	pass
	

func _on_button_pressed() -> void:
	print("pressed")
