extends Control

@onready var argument_text = preload("res://scenes/argument_text.tscn")

var topic
var stage = 0

var arguments = []
var last_argument_by = "host"

func _ready():
	$"TopicElements".show()

func _on_next_t_button_down():
	topic = str($"TopicElements/Topic".text).strip_edges()
	if topic == "":
		get_tree().change_scene_to_file("res://scenes/debate.tscn")
	else:
		$"TopicElements".hide()
		
		$"CustomizeWindow".show()
		$"Next".show()
		
		$"Person2".show()


func _on_next_button_down():
	if stage == 0:
		$"CustomizeWindow".hide()
		$"CustomizeWindow2".show()
		stage = 1
		$"Next".text = "Start the debate"
		$"Next".focus_mode = false
		$"Person2".hide()
		$"Person".show()
	else:
		$"CustomizeWindow2".hide()
		$"Next".hide()
		$"TopicTitle".text += topic
		$"TopicTitle".show()
		
		$"Person2".show()
		$"Person2".set_properties($"CustomizeWindow".get_list()) # these are changed so the first window is for the left person
		$"Person".show()
		$"Person".set_properties($"CustomizeWindow2".get_list())
		$"Person/AI".setup(topic, $"Person".properties, 2)
		$"Person2/AI".setup(topic, $"Person2".properties, 1)
		
		$"ScrollContainer".show()
		new_argument("Let the debate begin! It's your turn (1)", 1, 0)
		$"NextArgument".hide()
		$"Person2".new_mood("idk")
		$"Person2/Label".show()
		$"Person2/AI".new_arg(arguments)
		$"Person".new_mood("idk")
		$"Person/Label".show()
		
		$"win1".show()
		$"win2".show()
		
		

func new_argument(content, just_for_intro, by):
	var arg_inste = argument_text.instantiate()
	$"ScrollContainer/Arguments".add_child(arg_inste)
	
	$"ScrollContainer/Arguments".move_child(arg_inste, 0)
	
	if just_for_intro != 1:
		if by == 1:
			arguments.append("(1) " + str(content))
			last_argument_by = 1
			arg_inste.set_argument("(1) "+content, by)
		
		elif by == 2:
			arguments.append("(2) " + str(content))
			last_argument_by = 2
			arg_inste.set_argument("(2) "+content, by)
			
	$"NextArgument".show()
	



func _on_next_argument_button_down():
	$"NextArgument".focus_mode = false
	$"NextArgument".hide()
	
	if last_argument_by == 1:
		$"Person".new_mood("idk")
		$"Person/Label".show()
		$"Person/AI".new_arg(arguments)
		$"Person2".new_mood("idk")
		$"Person2/Label".show()
	elif last_argument_by == 2:
		$"Person2".new_mood("idk")
		$"Person2/Label".show()
		$"Person2/AI".new_arg(arguments)
		$"Person".new_mood("idk")
		$"Person/Label".show()


func _on_win_1_button_down():
	$"Person2".new_mood("win")
	end_debate()
	$"Person".new_mood("idk")


func _on_win_2_button_down():
	$"Person".new_mood("win")
	end_debate()
	$"Person2".new_mood("idk")
	
func end_debate():
	$"NextArgument".hide()
	$"win1".hide()
	$"win2".hide()
	$"Back".show()
	



func _on_back_button_down():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
