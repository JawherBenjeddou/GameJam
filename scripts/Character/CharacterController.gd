extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animationplayer = $MeleeAttackAnimation
@onready var m_AnimationNode = $Node2D
func _on_animation_finished(anim_name: String):
	if anim_name == "melee":
		# Handle the animation finishing logic here.
		m_AnimationNode.visible = false
func _physics_process(delta):
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	if Input.is_action_pressed("ui_accept"):
		m_AnimationNode.visible = true
		animationplayer.play("melee") 
		m_AnimationNode.visible = true
	if !animationplayer.is_playing():
		m_AnimationNode.visible = false
		
	move_and_slide()
