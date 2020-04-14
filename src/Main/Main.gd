extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$LoadingScreen.hide_loading_screen()
	deactivate_water_temple()
	deactivate_sky_tower()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("swap"):
		_on_StageChange()


func _on_StartScreen_start_game():
	$LoadingScreen.show_loading_screen()
	$StartScreen.hide_start_screen()
	activate_water_temple()
	yield(get_tree().create_timer(1), "timeout")
	$LoadingScreen.hide_loading_screen()


func _on_StageChange():
	$LoadingScreen.show_loading_screen()
	deactivate_water_temple()
	activate_sky_tower()
	yield(get_tree().create_timer(1), "timeout")
	$LoadingScreen.hide_loading_screen()


func deactivate_water_temple():
	$WaterTemple.hide()
	$WaterTemple/OxiChef/Camera2D.current = false
	$WaterTemple/OxiChef.active = false


func activate_water_temple():
	$WaterTemple/OxiChef/Camera2D.current = true
	$WaterTemple/OxiChef.active = true
	$WaterTemple.show()


func deactivate_sky_tower():
	$Sky_Tower.hide()
	$Sky_Tower/Hidriogio/Camera2D.current = false
	$Sky_Tower/Hidriogio.active = false


func activate_sky_tower():
	$Sky_Tower.show()
	$Sky_Tower/Hidriogio/Camera2D.current = true
	$Sky_Tower/Hidriogio.active = true
