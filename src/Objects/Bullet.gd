extends KinematicBody2D

signal hit
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
var direction = Vector2.RIGHT
var speed = 150
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = direction * speed
	move_and_slide(velocity, direction)


func _on_Area2D_area_entered(area):
	print("bullet hit")
	Global.emit_signal("bullet_hit")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Timer_timeout():
	pass
