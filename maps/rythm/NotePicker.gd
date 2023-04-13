extends Node2D

export(int, 1,4) var line
var is_pressed = false
var is_collecting = false
signal pressedWrong

func _input(event):
	match line:
		1:
			if Input.is_action_pressed("ui_left"):
				is_pressed = true
				is_collecting = true
				if !isRight:
					emit_signal("pressedWrong")
			elif Input.is_action_just_released("ui_left"):
				is_pressed = false
				is_collecting = false

		2:
			if Input.is_action_pressed("ui_up"):
				is_pressed = true
				is_collecting = true
				if !isRight:
					emit_signal("pressedWrong")
			elif Input.is_action_just_released("ui_up"):
				is_pressed = false
				is_collecting = false
		3:
			if Input.is_action_pressed("ui_down"):
				is_pressed = true
				is_collecting = true
				if !isRight:
					emit_signal("pressedWrong")
			elif Input.is_action_just_released("ui_down"):
				is_pressed = false
				is_collecting = false
		4:
			if Input.is_action_pressed("ui_right"):
				is_pressed = true
				is_collecting = true
				if !isRight:
					emit_signal("pressedWrong")
			elif Input.is_action_just_released("ui_right"):
				is_pressed = false
				is_collecting = false

func _process(delta):
	if is_pressed:
		scale = Vector2(0.9,0.9)
	else:
		scale = Vector2(1,1)


var isRight = false
func _on_Area2D_area_entered(area):
	if area.is_in_group("Note"):
		isRight = true


func _on_Area2D_area_exited(area):
	if area.is_in_group("Note"):
		isRight = false
