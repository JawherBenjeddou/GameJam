extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func mob_spawn():
	var new_dog = preload("res://boss/dog_pet.tscn").instantiate()
	$"Dog Spawn/PathFollow2D".progress_ratio = randf()
	new_dog.global_position = $"Dog Spawn/PathFollow2D".global_position
	add_child(new_dog)

func _on_spawn_timer_timeout():
	mob_spawn()
