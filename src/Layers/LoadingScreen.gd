extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hide_loading_screen()


func show_loading_screen():
	$ColorRect.show()
	$Label.show()

func hide_loading_screen():
	$ColorRect.hide()
	$Label.hide()
