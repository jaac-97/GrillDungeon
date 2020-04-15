extends Node2D

signal WaterTemple_finished

func _ready():
	pass


func _on_OxiChef_dead():
	print("dead")
	$DeathScreen.show_death_screen()


func _on_DeathScreen_restart_scene():
	$OxiChef.position = $OxiChef.init_pos
	$DeathScreen/RestartButton.hide()
	yield(get_tree().create_timer(1),"timeout")
	$DeathScreen/ColorRect.hide()
	$DeathScreen/Label.hide()


func activate():
	show()
	$OxiChef.active = true
	$OxiChef/Camera2D.current = true


func deactivate():
	hide()
	$OxiChef.active = false
	$OxiChef/Camera2D.current = false

