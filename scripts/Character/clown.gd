extends CharacterBody2D
@export var SPEED = 200
@onready var hands =preload("res://Scenes/hand.tscn")
@onready var hammer = preload("res://Scenes/HammerAttack.tscn")
@onready var Plunger = preload("res://Scenes/plunger.tscn")
@onready var Jack = preload("res://Scenes/jack_box.tscn")

@export var ClownHealth: int = 5
var CurrentItem 
@onready var AttackCD = $AttackCoolDown
@onready var AbilityCD = $AbilityCoolDown
@onready var Item_List = [Jack , Plunger ,hammer]
@onready var hitanimation = $AnimationPlayer
@onready var deathanimation = $AnimatedSprite2D
func Autoattack (AttckType , _timer) :
	var attack = AttckType.instantiate()
	
	if _timer.is_stopped() :
		_timer.wait_time = attack.CoolDown
		_timer.start()
		if AttckType == Plunger :
			get_parent().add_child(attack)
			attack.position = $Weapon.global_position
			attack.rotation =(get_global_mouse_position() - attack.position).angle()
		elif AttckType == Jack : 
			get_parent().add_child(attack) 
			attack.position = $Weapon.global_position
		else :
			$Weapon.add_child(attack) 
		attack.animationplay()
		await get_tree().create_timer(attack.dur).timeout
		if attack != null : 
			attack.queue_free()
	
func _physics_process(delta): 

	if !PlayerDeath():
		var direc = Input.get_vector( "ui_left" ,"ui_right","ui_up","ui_down")
		direc=direc.normalized()
		$AudioStreamPlayer2D.play()
		velocity= direc * SPEED
		
		if Input.is_action_just_pressed("ui_accept") :
			Autoattack(hands  ,AttackCD )
		if Input.is_action_just_pressed("One") :
			CurrentItem = Item_List[1]
		
		if Input.is_action_just_pressed("Two"):
			CurrentItem = Item_List[2]
		if Input.is_action_just_pressed("Three"):
			CurrentItem = Item_List[0]
	
		if Input.is_action_just_pressed("hammer") && CurrentItem :
			Autoattack(CurrentItem , AbilityCD)
			if CurrentItem == hammer :
				$Camera2D2.shake()
	
	
	move_and_slide()
	
func PlayerDeath():
	return ClownHealth <= 0

func _on_hit_box_body_entered(body):
	if body.is_in_group("enemy"):
		hitanimation.play("hit")
		ClownHealth -= 1
