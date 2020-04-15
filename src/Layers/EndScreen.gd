extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func hide_end_screen():
	$Label.hide()
	$Sprite.hide()

func show_end_screen():
	$Label.show()
	$Sprite.show()
