extends Node2D

@onready var p1 = $"P1"
@onready var p1_f = $"P1/Face"
@onready var p2 = $"P2"
@onready var p2_f = $"P2/Face"
@onready var p3 = $"P3"
@onready var p3_f = $"P3/Face"
@onready var p4 = $"P4"
@onready var p4_f = $"P4/Face"
@onready var p5 = $"P5"
@onready var p5_f = $"P5/Face"
@onready var p6 = $"P6"
@onready var p6_f = $"P6/Face"
@onready var p7 = $"P7"
@onready var p7_f = $"P7/Face"

var allowed_moods = ["unconfident", "angry", "questioning", "neutral", "disagreeing", "win"]
var persons = [p1,p2,p3,p4,p5,p6,p7]
var faces = [p1_f, p2_f, p3_f, p4_f, p5_f, p6_f, p7_f]

var properties = []

func _ready():
	pass


func new_mood(mood):
	for c in get_children():
		c.hide()
	$"PodiumL".show()
	mood = str(mood)
	if mood == "win":
		$"Win".show()
	else:
		var person = [p1,p2,p3,p4,p5,p6,p7].pick_random()
		var face = [p1_f, p2_f, p3_f, p4_f, p5_f, p6_f, p7_f][[p1,p2,p3,p4,p5,p6,p7].find(person)]
		person.show()
		face.animation = "default"
		face.frame = randi_range(0, face.sprite_frames.get_frame_count("default"))
	
	
func set_properties(p):
	properties = p
