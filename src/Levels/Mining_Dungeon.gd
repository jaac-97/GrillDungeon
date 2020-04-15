extends Node2D

signal MiningCave_finished

func _ready():
	pass


func _on_Carbono_dead():
	print("dead")
	$DeathScreen.show_death_screen()


func _on_DeathScreen_restart_scene():
	$Carbono.position = $Carbono.init_pos
	$DeathScreen/RestartButton.hide()
	yield(get_tree().create_timer(1), "timeout")
	$DeathScreen/Label.hide()
	$DeathScreen/ColorRect.hide()


func activate():
	show()
	$Carbono.active = true
	$Carbono/Camera2D.current = true


func deactivate():
	hide()
	$Carbono.active = false
	$Carbono/Camera2D.current = false


func _on_EarthElement_area_entered(area):
	emit_signal("MiningCave_finished")
