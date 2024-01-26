extends CharacterBody2D
@export var SPEED = 200
@onready
var ActiveWeappon = "hammer"
func attack () :
	pass
func _physics_process(delta):
	var direc = Input.get_vector( "ui_left" ,"ui_right","ui_up","ui_down")
	direc=direc.normalized()
	velocity= direc * SPEED
	if Input.is_action_just_pressed("ui_accept") : 
		attack()
	move_and_slide()
	
