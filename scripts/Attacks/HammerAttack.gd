extends Node2D

@onready var animationplayer = $Marker2D/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

func animationplay():
	animationplayer.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
