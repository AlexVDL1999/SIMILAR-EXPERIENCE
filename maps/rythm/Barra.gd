extends Node2D
var bar_length_in_m = 8
var Note = preload("res://maps/rythm/NotaMusical.tscn")
var note_scale = 0.5

func _ready():
	randomize()
	add_notes()
	
func add_notes():
	for notes in ((randi()%8)+2):
		print("nota")
		var note = Note.instance()
		note.line = (randi() % 4)+1
		#note.position += Vector2(0,(note_data.pos))#int(note_data.pos) * note_scale
		add_child(note)
		
		#note.global_position += 
func _process(delta):
	global_position += Vector2(0,bar_length_in_m)
