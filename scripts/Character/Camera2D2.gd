extends Camera2D

var shake_duration = 0.5  # Adjust the duration of the shake
@export var shake_intensity = 10.0  # Adjust the intensity of the shake
var shake_timer = -1
@onready var InitPos = position
func _process(delta):
	if shake_timer > 0:
		# Generate a random offset for the camera position
		var offset = Vector2(randf_range(-shake_intensity, shake_intensity), randf_range(-shake_intensity, shake_intensity))


		offset_camera(offset)

#Decrease the shake timer
		shake_timer -= delta
	elif shake_timer <0  :
		# Reset the camera position when the shake is done
		position = InitPos

func shake():
	# Start the shake by setting the shake timer
	shake_timer = shake_duration

func offset_camera(offset):
	# Offset the camera position
	offset.x = clamp(offset.x, -shake_intensity, shake_intensity)
	offset.y = clamp(offset.y, -shake_intensity, shake_intensity)

#Set the new camera position
	position += offset

