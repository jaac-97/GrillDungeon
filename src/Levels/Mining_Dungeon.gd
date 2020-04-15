extends Node2D

export (PackedScene) var Rock

func _ready():
	Global.connect("rock_hit_player", self, "_on_Carbono_dead")
	randomize()
	$RockTimer.start()


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


func _on_RockTimer_timeout():
	$RockPath/RockSpawnLocation.offset = randi()
	var rock = Rock.instance()
	add_child(rock)
	rock.position = $RockPath/RockSpawnLocation.position
	$DeathScreen.connect("restart_scene", rock, "_on_restart_game")
