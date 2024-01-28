extends Node2D


const lines : Array[String] =[
	"use WASD or Arrow keys to move"]
var clown_instance
@onready var Health1 = $CanvasLayer/Health1
@onready var Health2 = $CanvasLayer/Health2
@onready var Health3 = $CanvasLayer/Health3
@onready var Health4 = $CanvasLayer/Health4
@onready var Health5 = $CanvasLayer/Health5
# Called when the node enters the scene tree for the first time.
func _ready():
	clown_instance = $TileMap/Clown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_health_ui(clown_instance.ClownHealth)
	var lastplayerpos = clown_instance.position
	if clown_instance.PlayerDeath():
		print("player died")
		clown_instance.deathanimation.play("death")
		var direc = Vector2.UP
		clown_instance.velocity = direc * 100
func update_health_ui(player_health):
	match player_health:
		5:
			Health1.visible = true
			Health2.visible = false
			Health3.visible = false
			Health4.visible = false
			Health5.visible = false
		4:
			Health1.visible = false
			Health2.visible = true
			Health3.visible = false
			Health4.visible = false
			Health5.visible = false
		3:
			Health1.visible = false
			Health2.visible = false
			Health3.visible = true
			Health4.visible = false
			Health5.visible = false
		2:
			Health1.visible = false
			Health2.visible = false
			Health3.visible = false
			Health4.visible = true
			Health5.visible = false
		1:
			Health1.visible = false
			Health2.visible = false
			Health3.visible = false
			Health4.visible = false
			Health5.visible = true
		_:
			# Handle other cases if needed
			print("Invalid player health value")


func _on_area_2d_body_entered(body):
	if body.name == "Clown" :		
		#Play the annimation ( dim down the scnene with tween ) 
		get_tree().change_scene_to_file("res://Scenes/inside_tent.tscn")


func _on_blaka_body_entered(body):
	if body.name == "Clown" : 
		DialogueManager.start_dialog( $blaka/Marker2D.position + Vector2(-100, 10) ,lines )


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()
