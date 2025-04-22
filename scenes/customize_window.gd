extends Panel

@export var title_add: String = ""

func _ready():
	$"Title".text += title_add


func _on_knowledge_value_changed(value):
	$"VBoxContainer/KnowText".text = "Knowledge level: (" + str(value) + "%)"


func _on_niveau_value_changed(value):
	$"VBoxContainer/NiveauText".text = "Speech niveau: (" + str(value) + "%)"


func get_list():
	var list = []
	
	list.append($"VBoxContainer/Position".text)
	list.append($"VBoxContainer/Knowledge".value)
	list.append($"VBoxContainer/Niveau".value)
	list.append($"VBoxContainer/Style".text)
	list.append($"VBoxContainer/DStyle".text)
	
	return list
