extends Node2D

var grid_size = Vector2(3, 3)
var tile_size = 256

func grid_compose():
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			get_node(str(x) + "_" + str(y)).position = Vector2(x * tile_size, y * tile_size)

func random_coord(grid_size):
	var x = randi_range(0, grid_size.x -1)
	var y = randi_range(0, grid_size.y -1)
	return(Vector2(x, y))

func monster_coord():
	pass
	

	
