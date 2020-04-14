extends Node2D


func _ready():
	pass


func _on_Hidriogio_dead():
	print("dead")
	$Screens/DeathScreen.show_death_screen()


func _on_DeathScreen_restart_scene():
	$Hidriogio.position = $Hidriogio.init_pos
	$Screens/DeathScreen/RestartButton.hide()
	yield(get_tree().create_timer(1),"timeout")
	$Screens/DeathScreen/ColorRect.hide()
	$Screens/DeathScreen/Label.hide()
	
	
func activate():
	show()
	$Hidriogio.active = true
	$Hidriogio/Camera2D.current = true


func deactivate():
	hide()
	$Hidriogio.active = false
	$Hidriogio/Camera2D.current = false
