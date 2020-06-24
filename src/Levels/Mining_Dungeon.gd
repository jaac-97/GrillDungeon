extends Node2D

signal finished
export (PackedScene) var rocks

func _ready():
	$Carbono.active = true
	$Carbono/Camera2D.current = true
	$RockSlides/Timer.start()
	$RockSlides/Timer2.start()
	$GotElement.hide_message()
	Global.connect("bullet_hit", self, "_on_Carbono_dead")


func _on_Carbono_dead():
	print("dead")
	$DeathScreen.show_death_screen()


func _on_DeathScreen_restart_scene():
	$Carbono.position = $Carbono.init_pos
	$DeathScreen/RestartButton.hide()
	yield(get_tree().create_timer(1), "timeout")
	$DeathScreen/Label.hide()
	$DeathScreen/ColorRect.hide()


#func activate():
#	show()
#	$Carbono.active = true
#	$Carbono/Camera2D.current = true
#
#
#func deactivate():
#	hide()
#	$Carbono.active = false
#	$Carbono/Camera2D.current = false


func _on_EarthElement_area_entered(area):
	$GotElement.show_message()
	yield(get_tree().create_timer(2), "timeout")
	Global.goto_scene("res://src/Layers/EndScreen.tscn")
#	$GotElement.hide_message()
#	emit_signal("finished")


func _on_Carbon_area_entered(area):
	$Carbon.queue_free()


func _on_Timer_timeout():
	var rocks1 = rocks.instance()
	var rocks3 = rocks.instance()
	var rocks5 = rocks.instance()
	add_child(rocks1)
	add_child(rocks3)
	add_child(rocks5)
	rocks1.position = $RockSlides/RockSlide1.position
	rocks3.position = $RockSlides/RockSlide3.position
	rocks5.position = $RockSlides/RockSlide5.position


func _on_Timer2_timeout():
	var rocks2 = rocks.instance()
	var rocks4 = rocks.instance()
	var rocks6 = rocks.instance()
	var rocks7 = rocks.instance()
	add_child(rocks2)
	add_child(rocks4)
	add_child(rocks6)
	add_child(rocks7)
	rocks2.position = $RockSlides/RockSlide2.position
	rocks4.position = $RockSlides/RockSlide4.position
	rocks6.position = $RockSlides/RockSlide6.position
	rocks7.position = $RockSlides/RockSlide7.position
