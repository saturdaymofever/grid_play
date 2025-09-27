extends Node

var screen_size = Vector2(1920, 1080)
var screen_center = Vector2(screen_size.x / 2, screen_size.y / 2)
var tile_size = 128
var tile_scene = preload("res://tile.tscn")
var grid_offset = (tile_size * 3)/2
var grid = Vector2(tile_size*3, tile_size*3)

var margin_x = (screen_size.x - tile_size * 3 )/ 2
var margin_y = (screen_size.y - tile_size * 3 )/ 2

func _ready() -> void:
	
	for x in range(3):
		for y in range(3):
			var tile = tile_scene.instantiate()
			tile.position = Vector2(tile_size * x + margin_x, tile_size * y + margin_y)
			add_child(tile)
	print(grid_offset)


	
func _process(delta: float) -> void:
	pass
	
