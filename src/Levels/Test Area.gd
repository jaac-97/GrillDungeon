extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	var temp_state
	if event.is_action_pressed("change"):
		if $OxiChef.active:
			temp_state = $Carbono.active
			$Carbono.active = $OxiChef.active
			$OxiChef.active = temp_state
		elif $Carbono.active:
			temp_state = $Hidriogio.active
			$Hidriogio.active = $Carbono.active
			$Carbono.active = temp_state
		elif $Hidriogio.active:
			temp_state = $OxiChef.active
			$OxiChef.active = $Hidriogio.active
			$Hidriogio.active = temp_state


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
