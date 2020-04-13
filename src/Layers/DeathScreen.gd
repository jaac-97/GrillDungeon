extends CanvasLayer

signal restart_scene


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.hide()
	$Label.hide()
	$RestartButton.hide()


func show_death_screen():
	$ColorRect.show()
	$Label.show()
	
	yield(get_tree().create_timer(1), "timeout")
	
	$RestartButton.show()


func _on_RestartButton_pressed():
	emit_signal("restart_scene")
