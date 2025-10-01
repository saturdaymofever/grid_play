extends TextureRect

signal start_game_buton

func _on_start_pressed() -> void:
	start_game_buton.emit()
