extends CanvasLayer

#signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	#emit_signal("start_game")
	Global.goto_scene("res://src/Levels/WaterTemple.tscn")

func hide_start_screen():
	$StartButton.hide()
	$Sprite.hide()
