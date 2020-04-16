extends KinematicBody2D


var velocity = Vector2.ZERO
var direction = Vector2.DOWN
var speed = 150
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = direction * speed
	move_and_slide(velocity, direction)


func _on_Area2D_area_entered(area):
	Global.emit_signal("bullet_hit")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
