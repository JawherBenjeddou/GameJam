extends CharacterBody2D
var HP = 10

func _on_hurt_box_body_entered(body):
	if body.name == "hammer" :
		self.HP -= body.hitpoint
		#playhurtanimat
	
