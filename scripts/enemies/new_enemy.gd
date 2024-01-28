extends CharacterBody2D

@export var HP : int =1
@export var FollowSpeed : int = 70
var PlayerChase : bool = true
@onready var Player 

var waypoints : Array = [Vector2(100, 100), Vector2(200, 100), Vector2(200, 200), Vector2(100, 200)]
var currentWaypoint : int = 0
@export var SPEED : int = 40
@onready var Direc = Vector2(0,0)
func play_hurt_animation() -> void:
	# Implement the code to play the hurt animation here
	# For example, if you have an AnimationPlayer node named "animation_player"
	# and the animation is named "hurt_animation" we can do
	# $animation_player.play("hurt_animation")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if HP <=0:
		queue_free()

func _physics_process(delta):
	if Player && PlayerChase:
		Direc = (Player.position - position).normalized()
		velocity = Direc*SPEED
		move_and_slide()
	

func _on_detection_area_body_entered(body):
	Player = body
	PlayerChase = true

func _on_detection_area_body_exited(body):
	Player = null
	PlayerChase = false



func _on_Player_in_sight(body):
	if body.name=="Clown":
		Player = body

	 
func _on_detection_area_entered(area):
	pass # Replace with function body.


func _on_hurt_box_area_entered(body):
	if body.name!="NewEnemy":
		if body.is_in_group("weapon"):
			HP -= body.Damage
			Direc =  -(body.position - position).normalized()
			velocity +=Direc*900
			move_and_slide()
			if body.name=="Plunger" :
				body.queue_free()
			
