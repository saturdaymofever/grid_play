extends Node

var screen_size = Vector2(2560, 1440)
var tile_size = 384
var tile_scene = preload("res://tile.tscn")
var grid_scene = preload("res://grid_container.tscn")
var hud_scene = preload("res://hud.tscn")

var margin_x = (screen_size.x - tile_size * 3 )/ 2
var margin_y = (screen_size.y - tile_size * 3 )/ 2


func _ready() -> void:
	pass
#	for x in range(3):
#		for y in range(3):
#			var tile = tile_scene.instantiate()
#			tile.position = Vector2(tile_size * x + margin_x, tile_size * y + margin_y)
#			add_child(tile)
#	var grid = grid_scene.instantiate()
#	add_child(grid)


	
func _process(delta: float) -> void:
	pass
	


func _on_hud_start_exploring() -> void:
	print("test")
