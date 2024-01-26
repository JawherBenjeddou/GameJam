extends Node


@onready var HammerAttack = preload("res://Scenes/HammerAttack.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

//function called when wanted attack
func Attack(AttackType):
	if Input.is_action_just_pressed("ui_accept"):
		var attack = AttackType.instance()
		add_child(attack)
		attack.animationplay()

		await get_tree().create_timer(0.5)
		attack.queue_free()

