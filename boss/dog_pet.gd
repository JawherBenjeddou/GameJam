extends CharacterBody2D

const DIRECTION = Vector2.DOWN
const SPEED = 35
signal max_distance_reached

@onready var distance_travelled = 0;

func _physics_process(delta):
	if $AnimatedSprite2D.animation != "death" :
		$AnimatedSprite2D.play("idle")
	velocity = DIRECTION * SPEED
	distance_travelled += delta * SPEED
	if distance_travelled > 100 :
		max_distance_reached.emit()
	move_and_slide()
	
func _on_max_distance_reached():
	$AnimatedSprite2D.play("death")
	await $AnimatedSprite2D.animation_finished
	queue_free()
