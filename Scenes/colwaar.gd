extends Node2D


func _on_area_2d_body_entered(body):
	if body.name == "Clown":
		get_tree().change_scene_to_file("res://Scenes/boss_fight_1.tscn")
