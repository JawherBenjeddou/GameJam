extends Node2D

const lines : Array[String] =[
	"athreb athreb"]
@onready var enemyD= false
#func _on_area_2d_body_entered(body):
#	if body.name =="Clown":
#			get_tree().change_scene_to_file("res://Scenes/training_room.tscn")
func _process(delta):
	if $Enemy == null:
		enemyD=true
func _on_area_2d_body_entered(body):
	if body.name =="Clown":
		DialogueManager.start_dialog( $secretaire.global_position + Vector2(20,-35),lines )
		


func _on_nextlevel_entered(body):
	if body.name =="Clown" && enemyD:
		get_tree().change_scene_to_file("res://Scenes/colwaar.tscn")


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()
