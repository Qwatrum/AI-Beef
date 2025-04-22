extends Control


func _on_back_button_down():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
