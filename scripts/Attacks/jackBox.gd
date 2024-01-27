extends Node2D
var Damage = 0.5
var dur=8
var CoolDown= 1
@onready var animationplayer = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

func animationplay():
	animationplayer.play("wait")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_hit_zone_body_entered(body):
	if body.name == "NewEnemy" : 
		animationplayer.play("deployed")
		await animationplayer.animation_finished
		animationplayer.play("Idle")
