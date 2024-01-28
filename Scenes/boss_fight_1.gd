extends Node2D

@onready var deathscreen = preload("res://Deatj/DeathScreen.tscn")
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
		get_node("TileMap/Clown/CollisionShape2D").disabled = true
		var direc = Vector2.UP
		clown_instance.velocity = direc * 100
		await  get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://Deatj/DeathScreen.tscn")
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
			Health3	.visible = false
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


func _on_audio_stream_player_2d_finished():
	$AudioStreamPlayer2D.play()
