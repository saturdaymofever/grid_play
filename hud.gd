extends CanvasLayer

signal start_exploring
signal hit_monster



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$attack.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	start_exploring.emit()
	

func _on_attack_pressed() -> void:
	hit_monster.emit()

func show_player_pv(amount:int):
	if amount <= 0:
		$hitpoints_value.text = "Dead !!!"
	else:
		$hitpoints_value.text = str(amount)
