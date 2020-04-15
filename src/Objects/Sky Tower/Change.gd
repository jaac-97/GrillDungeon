extends Timer

func _ready():
	pass


func _on_OnScreen_timeout():
	start(1)
	print("A")

func _on_Change_timeout():
	$OnScreen.start(5)
	print("B")
