extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(5), "timeout")
	goto_final_screen()

func goto_final_screen():
	Global.goto_scene("res://src/Layers/FinalScreen.tscn")


func hide_end_screen():
	$Label.hide()
	$Sprite.hide()

func show_end_screen():
	$Label.show()
	$Sprite.show()
