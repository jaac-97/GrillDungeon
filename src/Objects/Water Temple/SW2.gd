extends Area2D

onready var enable = false
signal activation2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_OxiChef_interact():
	if enable:
		emit_signal("activation2")

func _on_SW2_body_exited(body):
	enable = false
	
func _on_SW2_body_entered(body):
	enable = true# Re
