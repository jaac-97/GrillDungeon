extends Node2D


const LIMIT_LEFT = -315
const LIMIT_TOP = -250
const LIMIT_RIGHT = 955
const LIMIT_BOTTOM = 690

func _ready():
	for child in get_children():
		if child is Hidriogio:
			if not $Hidriogio.active:
				$Hidriogio.active = true
#	for child in get_children():
#		if child is Player:
#			var camera = child.get_node("Camera")
#			camera.limit_left = LIMIT_LEFT
#			camera.limit_top = LIMIT_TOP
#			camera.limit_right = LIMIT_RIGHT
#			camera.limit_bottom = LIMIT_BOTTOM






func _on_Hidriogio_dead():
	print("dead")
	$Screens/DeathScreen.show_death_screen()


func _on_Spikes_area_entered(area):
	pass # Replace with function body.


func _on_WindCurrent_area_exited(area):
	pass # Replace with function body.
