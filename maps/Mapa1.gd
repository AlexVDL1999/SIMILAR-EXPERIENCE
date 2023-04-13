extends Node

# Declare member variables here. Examples:
# var a = 2https://www.youtube.com/watch?v=JDAhRb6N0_s
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AudioStreamPlayer_finished():
	get_tree().change_scene("res://maps/MainMenu.tscn")
