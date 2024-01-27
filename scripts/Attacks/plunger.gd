extends Area2D
var Damage = 1
var dur=10
var CoolDown= 1
var travDist = 0 
@onready var animationplayer = $AnimatedSprite2D
func _physics_process(delta):
	const SPEED = 200
	const  MAXDIST = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction*SPEED*delta
	
func animationplay():
	animationplayer.play("chargi")
	await animationplayer.animation_finished
	animationplayer.play("default")
	

func _on_animated_sprite_2d_animation_finished():
	pass # Replace with function body.
