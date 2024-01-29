extends Control


func _on_play_pressed():
	print("debug")
	get_tree().change_scene_to_file("res://Scenes/cut_scnee_1.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_info_pressed():
	get_tree().change_scene_to_file("res://Scenes/InfoScreen.tscn")
