extends Area2D

onready var enable = false
signal activation4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Hidriogio_interact():
	if enable:
		emit_signal("activation4")

func _on_SW4_body_entered(body):
	enable = true
	
func _on_SW4_body_exited(body):
	enable = false
	
