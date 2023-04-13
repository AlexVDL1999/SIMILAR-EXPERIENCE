extends Node2D

export(int,1,4) var line
var is_colliding = false
var picker
var spritesTexture = [preload("res://maps/rythm/assets/Izquierda.png"),preload("res://maps/rythm/assets/Arriba.png"),preload("res://maps/rythm/assets/Abajo.png"),preload("res://maps/rythm/assets/Derecha.png")]
var is_collected = false
onready var label = get_tree().get_nodes_in_group("score")[0]

func _ready():

	randomize()
	$Sprite.texture = spritesTexture[line-1]
	match line:
		1:
			global_position = Vector2(371,-200 * float(randi() % 4 +1))
		2:
			global_position = Vector2(499,-200 * float(randi() %  4 +1))
		3:
			global_position = Vector2(617,-200 * float(randi() % 4 +1))
		4:
			global_position = Vector2(740,-200 * float(randi() % 4 +1))
	print(global_position)
func _process(delta):
	collect()
	
func collect():
	if not is_collected:
		if is_colliding and picker:
			if picker.is_collecting:
				is_collected = true
				picker.is_collecting = false
				$AnimationPlayer.play("New Anim")
				label.text = str(int(label.text)+1)
				label.get_node("AnimationPlayer").play("good")
				
			
func _on_Area2D_area_entered(area):
	if area.is_in_group("Picker"):
		is_colliding = true
		picker = area.get_parent()
#	if area.is_in_group("Note"):
#		queue_free()


func _on_Area2D_area_exited(area):
	if area.is_in_group("Picker"):
		is_colliding = false



func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
