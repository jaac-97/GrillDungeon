extends Node2D

export (PackedScene) var bullet
signal finished

func _ready():
	$UpperCannon.start()
	$LowerCannon.start()
	$CannonsMid/Bot.start()
	$CannonsMid/Mid.start()
	$CannonsMid/Top.start()
	$CannonsTop/TBot.start()
	$CannonsTop/TMid.start()
	$CannonsTop/TTop.start()
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


func _on_UpperCannon_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	var bullet3 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	add_child(bullet3)
	bullet1.position = $Cannons/CannonU1.position + Vector2(15,0)
	bullet2.position = $Cannons/CannonU2.position + Vector2(15,0)
	bullet3.position = $Cannons/CannonU3.position + Vector2(15,0)


func _on_LowerCannon_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	var bullet3 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	add_child(bullet3)
	bullet1.position = $Cannons/CannonD1.position + Vector2(15,0)
	bullet2.position = $Cannons/CannonD2.position + Vector2(15,0)
	bullet3.position = $Cannons/CannonD3.position + Vector2(15,0)


func _on_Bot_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.direction = Vector2.UP
	bullet2.direction = Vector2.UP
	bullet1.speed = 300
	bullet2.speed = 300
	bullet1.position = $CannonsMid/Bot1.position + Vector2(-20, -50)
	bullet2.position = $CannonsMid/Bot2.position + Vector2(-20, -50)


func _on_Mid_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.direction = Vector2.UP
	bullet2.direction = Vector2.UP
	bullet1.speed = 300
	bullet2.speed = 300
	bullet1.position = $CannonsMid/Mid1.position + Vector2(-20, -50)
	bullet2.position = $CannonsMid/Mid2.position + Vector2(-20, -50)


func _on_Top_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.direction = Vector2.UP
	bullet2.direction = Vector2.UP
	bullet1.speed = 300
	bullet2.speed = 300
	bullet1.position = $CannonsMid/Top1.position + Vector2(-20, -50)
	bullet2.position = $CannonsMid/Top2.position + Vector2(-20, -50)


func _on_TBot_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.direction = Vector2.UP
	bullet2.direction = Vector2.UP
	bullet1.speed = 300
	bullet2.speed = 300
	bullet1.position = $CannonsTop/Bot1.position + Vector2(-20, -50)
	bullet2.position = $CannonsTop/Bot2.position + Vector2(-20, -50)


func _on_TMid_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.direction = Vector2.UP
	bullet2.direction = Vector2.UP
	bullet1.speed = 300
	bullet2.speed = 300
	bullet1.position = $CannonsTop/Mid1.position + Vector2(-20, -50)
	bullet2.position = $CannonsTop/Mid2.position + Vector2(-20, -50)


func _on_TTop_timeout():
	var bullet1 = bullet.instance()
	var bullet2 = bullet.instance()
	add_child(bullet1)
	add_child(bullet2)
	bullet1.direction = Vector2.UP
	bullet2.direction = Vector2.UP
	bullet1.speed = 300
	bullet2.speed = 300
	bullet1.position = $CannonsTop/Top1.position + Vector2(-20, -50)
	bullet2.position = $CannonsTop/Top2.position + Vector2(-20, -50)


func _on_Wind_Element_area_entered(area):
	emit_signal("inished")
