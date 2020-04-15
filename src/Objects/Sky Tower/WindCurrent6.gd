extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_SW2_activation2():
	show()
	$CollisionShape2D.disabled = false
