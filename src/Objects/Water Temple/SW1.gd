extends Area2D

onready var enable = false
signal activation1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_OxiChef_interact():
	print("INTERACT1")
	if enable:
		emit_signal("activation1")

func _on_SW1_body_entered(body):
	enable = true
	print("ENABLED1")

func _on_SW1_body_exited(body):
	enable = false
	print("DENIED1")
	
