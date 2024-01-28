extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play("ready")
	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D.play("damage")
	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D.play("remove")
	await $AnimatedSprite2D.animation_finished
	


func _on_player_entered(body):
	if $AnimatedSprite2D.animation == "damage" :
		print("DAMAGE PLAYER")
	queue_free()
