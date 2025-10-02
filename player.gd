extends Sprite2D

@export var pv = 20
@export var shield = 0
@export var power = 2

func take_damage(amount):
	pv -= amount

func _ready() -> void:
	z_index = 1
