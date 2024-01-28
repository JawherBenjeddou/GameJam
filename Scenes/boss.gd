extends CharacterBody2D

@onready var Direc = Vector2(0,0)
var PlayerChase = false
#boss speed
var SPEED = 30
var HP = 10
#spawned enemy
var ENEMY_SPEED = 100
var player
var slime = preload("res://Scenes/new_enemy.tscn")
var randomMove= false

#stuff for spawning monkeys
var StillInSpawnCircle = false
var IsTimeFinished = false

func _ready():
	player = $"../Clown"
	pass


func move_towards_player(enemy, player, delta):
	var direction = (player.global_position - enemy.global_position).normalized()
	var desired_velocity = direction * ENEMY_SPEED
	var steering = (desired_velocity - enemy.velocity) * delta * 2.5
	enemy.velocity += steering

func _process(delta):
	spawn_enemy()
	if HP <=0:
		queue_free()
# Called every physics frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player && PlayerChase:
		var direc = ( player.global_position - global_position ).normalized()
		velocity = direc * SPEED
		
		if direc.x == 1 : 
			$Weapon.scale= Vector2 (1,1)
			$AnimatedSprite2D.flip_h=false
			$AnimatedSprite2D.play("walk")
		elif direc.x == -1 : 
			$Weapon.scale= Vector2 (-1,1)
			$AnimatedSprite2D.flip_h=true
			$AnimatedSprite2D.play("walk")
		move_and_slide()

func spawn_enemy():
	# Load the scene resource
	var enemy_scene = preload("res://Scenes/new_enemy.tscn")

	if StillInSpawnCircle && (IsTimeFinished == true):
		print("i spawned ")
		# Instance the scene
		var enemy_instance = enemy_scene.instantiate()
		$AnimatedSprite2D.play("summon")
		# Add the instance to the scene tree
		get_parent().add_child(enemy_instance)

		# Optionally, you can set the position of the spawned instance
		var rng= RandomNumberGenerator.new()
		enemy_instance.position= Vector2(rng.randi_range(10 , 400) ,100)
		$SpawnEnemyCoolDown.start()
		IsTimeFinished = false
		


#makes the enemies make a circle on the player
func get_circle_position(random):
	var kill_circle_centre = player.global_position
	var radius = 40
	 #Distance from center to circumference of circle
	var angle = random * PI * 2;
	var x = kill_circle_centre.x + cos(angle) * radius;
	var y = kill_circle_centre.y + sin(angle) * radius;

	return Vector2(x, y)

#spawn small enemies
func _on_spawn_enemies_body_entered(body):
	if(body.name == player.name):
		PlayerChase = true
		StillInSpawnCircle = true
		$SpawnEnemyCoolDown.start()
		spawn_enemy()

		print("far collider")


func _on_fight_for_itself_body_entered(body):
	if(body.name == player.name):
		$FightForItself/hammer.animationplay()
		PlayerChase = true
		spawn_enemy()
		print("i fight for myself now!")


func _on_spawn_enemies_body_exited(body):
	pass 


func _on_spawn_enemy_cool_down_timeout():
	IsTimeFinished = true


func _on_fight_for_itself_body_exited(body):
	if(body.name == player.name):
		PlayerChase = false
		spawn_enemy()
		


func _on_hitbox_area_entered(body):
	if body.name!="NewEnemy":
		if body.is_in_group("weapon"):
			print('hurt')
			HP -= body.Damage
			
