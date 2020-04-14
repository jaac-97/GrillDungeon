extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$LoadingScreen.hide_loading_screen()
	$WaterTemple.deactivate()
	$Sky_Tower.deactivate()
	$Mining_Cave.deactivate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("swap"):
		_on_StageChange()


func _on_StartScreen_start_game():
	$LoadingScreen.show_loading_screen()
	$StartScreen.hide_start_screen()
	$WaterTemple.activate()
	yield(get_tree().create_timer(1), "timeout")
	$LoadingScreen.hide_loading_screen()


func _on_StageChange():
	$LoadingScreen.show_loading_screen()
	$WaterTemple.deactivate()
	$Sky_Tower.activate()
	yield(get_tree().create_timer(1), "timeout")
	$LoadingScreen.hide_loading_screen()


func _on_WaterTemple_finished():
	$LoadingScreen.show_loading_screen()
	$WaterTemple.deactivate()
	$Sky_Tower.activate()
	yield(get_tree().create_timer(1), "timeout")
	$LoadingScreen.hide_loading_screen()


func _on_SkyTower_finished():
	$LoadingScreen.show_loading_screen()
	$Sky_Tower.deactivate()
	$Mining_Cave.activate()
	yield(get_tree().create_timer(1), "timeout")
	$LoadingScreen.hide_loading_screen()


func _on_MiningCave_finished():
	pass
