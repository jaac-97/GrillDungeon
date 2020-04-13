extends CanvasLayer




# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.visible = false
	$Label.visible = false


func show_death_screen():
	$ColorRect.visible = true
	$Label.visible = true
