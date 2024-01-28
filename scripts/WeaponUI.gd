extends CanvasLayer


var sprites = [$Hammer, $JackBox, $Plunger]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Function to enable the Hammer sprite
func enableHammer():
	$Hammer.show()  # Show the Hammer sprite

# Function to disable the Hammer sprite
func disableHammer():
	$Hammer.hide()  # Hide the Hammer sprite

# Function to enable the JackBox sprite
func enableJackBox():
	$JackBox.show()  # Show the JackBox sprite

# Function to disable the JackBox sprite
func disableJackBox():
	$JackBox.hide()  # Hide the JackBox sprite

# Function to enable the Plunger sprite
func enablePlunger():
	$Plunger.show()  # Show the Plunger sprite

# Function to disable the Plunger sprite
func disablePlunger():
	$Plunger.hide()  # Hide the Plunger sprite

# Function to disable all sprites
func disableAllSprites():
	for sprite in sprites:
		sprite.hide()
	
