extends Node2D
var Damage = 1
var dur=1.2
var CoolDown= 1.3
@onready var animationplayer = $Marker2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

func animationplay():
	animationplayer.play("default")
	$HammerFX.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
