extends StaticBody2D


onready var can_be_destroyed = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	can_be_destroyed = true
	print("can destroy")


func _on_Area2D_area_exited(area):
	can_be_destroyed = false


func _on_Carbono_move_destroy():
	if can_be_destroyed:
		queue_free()
