extends Sprite2D

@export var pv = 10
@export var shield = 0
@export var power = 1
var monster_description = "Troll de la fôret du Nord"


func take_damage(amount):
	pv -= amount

func _ready() -> void:
	z_index = 1
