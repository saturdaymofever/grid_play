extends Node2D

var grid_size = Vector2(3, 3)
var tile_size = 256

func grid_compose():
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			get_node(str(x) + "_" + str(y)).position = Vector2(x * tile_size, y * tile_size)
