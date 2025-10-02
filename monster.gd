extends Sprite2D

class_name Monster

var pv = 10
var shield = 0
var power = 1
var coord:Vector2

func take_damage(amount):
	pv -= amount
	
func new_rand_coord(max_coord:Vector2):
	var x = randi_range(0, max_coord.x -1)
	var y = randi_range(0, max_coord.y -1)
	coord = Vector2(x, y)

func _ready() -> void:
	z_index = 1
