extends Node2D


const lines : Array[String] =[
	"asllema w mar7baa bik  ", 
	" tbbaa3ni tawa ",
	"other long text"]

func _on_area_2d_body_entered(body):
	if body.name =="Clown":
			get_tree().change_scene_to_file("res://Scenes/training_room.tscn")


func _on_secretairearea_body_entered(body):
	if body.name =="Clown":
		DialogueManager.start_dialog( $secretaire.global_position + Vector2(20,-35),lines )
		
