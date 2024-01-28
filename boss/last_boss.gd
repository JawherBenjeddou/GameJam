extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_attack_area_body_entered(body):
	if body != $".":
		var new_explosion = preload("res://boss/aoe_attack.tscn").instantiate()
		new_explosion.global_position = $"Boss Sprite".global_position
		add_child(new_explosion)
