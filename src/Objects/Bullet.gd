extends RigidBody2D

signal hit
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
var direction = Vector2()
var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = direction * speed
#	move_and_slide(velocity, direction)


func _on_Bullet_body_entered(body):
	emit_signal("hit")
