extends Sprite2D

class_name Player

var pv:int = 20
var shield:int = 0
var power:int = 2
var coord:Vector2

func new_rand_coord(max_coord:Vector2):
	var x = randi_range(0, max_coord.x -1)
	var y = randi_range(0, max_coord.y -1)
	coord = Vector2(x, y)
	

func take_damage(amount):
	pv -= amount

func _ready() -> void:
	z_index = 1
