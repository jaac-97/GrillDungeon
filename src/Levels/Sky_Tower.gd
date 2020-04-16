extends Node2D

export (PackedScene) var bullet
signal finished

func _ready():
	$CannonsTimer.start()
	$GotElement.hide_message()
	Global.connect("bullet_hit", self, "_on_Hidriogio_dead")

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


func _on_Wind_Element_area_entered(area):
	$GotElement.show_message()
	yield(get_tree().create_timer(2), "timeout")
	$GotElement.hide_message()
	emit_signal("finished")


func _on_Fan_area_entered(area):
	$Fan.queue_free()


func _on_CannonsTimer_timeout():
	# Horizontal
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	var bullet3 = bullet.instance()
	var bullet4 = bullet.instance()
	var bullet5 = bullet.instance()
	var bullet6 = bullet.instance()
	# Vertical
	var bullet7 = bullet.instance()
	var bullet8 = bullet.instance()
	var bullet9 = bullet.instance()
	var bullet10 = bullet.instance()
	var bullet11 = bullet.instance()
	var bullet12 = bullet.instance()
	# Horizontal
	add_child(bullet1)
	add_child(bullet2)
	add_child(bullet3)
	add_child(bullet4)
	add_child(bullet5)
	add_child(bullet6)
	# Vertical
	add_child(bullet7)
	add_child(bullet8)
	add_child(bullet9)
	add_child(bullet10)
	add_child(bullet11)
	add_child(bullet12)
	# Horizontal
	bullet1.position = $CannonsH/Cannon1.position + Vector2(15,0)
	bullet2.position = $CannonsH/Cannon2.position + Vector2(15,0)
	bullet3.position = $CannonsH/Cannon3.position + Vector2(15,0)
	bullet4.position = $CannonsH/Cannon4.position + Vector2(15,0)
	bullet5.position = $CannonsH/Cannon5.position + Vector2(15,0)
	bullet6.position = $CannonsH/Cannon6.position + Vector2(15,0)
	# Vertical
	bullet7.position = $CannonsV/Cannon1.position + Vector2(-15,-40)
	bullet8.position = $CannonsV/Cannon2.position + Vector2(-15,-40)
	bullet9.position = $CannonsV/Cannon3.position + Vector2(-15,-40)
	bullet10.position = $CannonsV/Cannon4.position + Vector2(-15,-40)
	bullet11.position = $CannonsV/Cannon5.position + Vector2(-15,-40)
	bullet12.position = $CannonsV/Cannon6.position + Vector2(-15,-40)
	bullet7.direction = Vector2.UP
	bullet8.direction = Vector2.UP
	bullet9.direction = Vector2.UP
	bullet10.direction = Vector2.UP
	bullet11.direction = Vector2.UP
	bullet12.direction = Vector2.UP
