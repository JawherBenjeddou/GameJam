extends "res://scripts/enemies/new_enemy.gd"
@export var Dead = false
@onready var HB = $HBoxContainer
func _ready():
	HP = 3
	PlayerChase = false
	
func _process(delta):
	
	if HP ==2: 
		HB.get_child(0).visible =false
	if HP == 1 : 
		HB.get_child(1).visible =false
			
	if HP <=0:
		HB.get_child(2).visible =false
		Dead = true
		queue_free()
