extends Sprite2D

@export var pv = 10
@export var power = 1



func take_damage(amount):
	pv -= amount
