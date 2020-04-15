extends StaticBody2D


func _ready():
	pass # Replace with function body.

func _on_SW1_activation1():
	$B1.visible = false
	$B1.disabled = true
	print("DESPEJADO1")
	
func _on_SW4_activation4():
	$B2.visible = false
	$B2.disabled = true
	print("DESPEJADO1")
	
