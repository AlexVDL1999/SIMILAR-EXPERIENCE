extends Node

var numDialogo = 0
func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		match numDialogo:
			0:
				$TextureRect.hide()
				$TextureRect2.show()
			1:
				get_tree().change_scene("res://maps/Mapa1.tscn")
	
	
		numDialogo+=1
