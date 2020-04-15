extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
#	self.connect("hit", Player, "_on_rock_hit")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_area_entered(area):
	print("rock hit")
	Global.emit_signal("rock_hit_player")

func _on_Visibility_screen_exited():
	queue_free()

func _on_restart_game():
	print("rock freed")
	queue_free()
