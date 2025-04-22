extends Control

func _on_credits_button_down():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_how_pressed():
	get_tree().change_scene_to_file("res://scenes/instruction.tscn")


func _on_start_button_down():
	get_tree().change_scene_to_file("res://scenes/debate.tscn")
