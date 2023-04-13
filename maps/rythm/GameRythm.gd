extends Node
var Barra = preload("res://maps/rythm/Barra.tscn")
var barras = []
var bar_length_in_m = 8
var curr_location = Vector2(0,-bar_length_in_m)
onready var bars_node = $BarsHolder
var speed = Vector2(0,140)

var bar_length_in_mM
var tempo
var quarter_time_in_sec
var speedM
var note_scale
var start_pos_in_sec


func _ready():
	for i in range(3):
		add_bar()
	calc_params()
	$NotePicker.connect("pressedWrong",self,"_on_picker_wrong") 
	$NotePicker2.connect("pressedWrong",self,"_on_picker_wrong") 
	$NotePicker3.connect("pressedWrong",self,"_on_picker_wrong") 
	$NotePicker4.connect("pressedWrong",self,"_on_picker_wrong") 
	
func _on_picker_wrong():
	$Label.text = str(int($Label.text)-1)
	$Label/AnimationPlayer.play("bad")
func add_bar():
	
	var barra = Barra.instance()
	barras.append(barra)
	barra.bar_length_in_m = bar_length_in_m
	bars_node.add_child(barra)

	if barras.size() < 3:
		barra.global_position -= Vector2(0,1200*barras.size())#Vector2(curr_location.x,curr_location.y)
	
func _process(delta):
	for bar in barras:
		#print (bar.global_position)
		if bar.global_position.y >= 600:
			for noteExist in bar.get_child_count():
				_on_picker_wrong()
			
			
			
			print("Borrado")
			barras.erase(bar)
			bar.queue_free()
			add_bar()




func calc_params():
	bar_length_in_mM = 8
	tempo = 116
	quarter_time_in_sec = 60/float(tempo) # 60/60 = 1, 
	speedM = bar_length_in_m/float(4*quarter_time_in_sec) #Asi funciona la musica moderna
	note_scale = bar_length_in_m/float(4*400) #Convierte la escala en godot meters
	start_pos_in_sec = 0
	
