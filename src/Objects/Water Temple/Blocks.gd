extends StaticBody2D

onready var view1 = true
onready var view2 = true
onready var view3 = true
onready var view4 = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_SW1_activation1():
	if view1:
		$B1.visible = false
		$B1.disabled = true
		print("DESPEJADO1")
	else:
		$B1.visible = true
		$B1.disabled = false
		print("BLOQUEADO1")
	view1 = !view1

func _on_SW2_activation2():
	if view2:
		$B2.visible = false
		$B2.disabled = true
		print("DESPEJADO2")
	else:
		$B2.visible = true
		$B2.disabled = false
		print("BLOQUEADO2")
	view2 = !view2
	
func _on_SW3_activation3():
	if view3:
		$B3_1.visible = false
		$B3_1.disabled = true
		$B3_2.visible = true
		$B3_2.disabled = false
		$B3_3.visible = false
		$B3_3.disabled = true
		print("DESPEJADO3")
	else:
		$B3_1.visible = true
		$B3_1.disabled = false
		$B3_2.visible = false
		$B3_2.disabled = true
		$B3_3.visible = true
		$B3_3.disabled = false
		print("BLOQUEADO3")
	view3 = !view3

func _on_SW4_activation4():
	if view1:
		$B4.visible = false
		$B4.disabled = true
		print("DESPEJADO1")
	else:
		$B4.visible = true
		$B4.disabled = false
		print("BLOQUEADO1")
	view4 = !view4
