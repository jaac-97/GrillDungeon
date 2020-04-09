extends KinematicBody2D


# Declare member variables here. Examples:
export var speed = 100
var velocity = Vector2.ZERO
var movement = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = 0
	if Input.is_action_pressed("ui_right"):
		dir += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		dir -=1
		$AnimatedSprite.flip_h = true
	velocity.x = dir * speed
	
	if Input.is_action_pressed("run"):
		speed = 200
		movement = "run"
	else:
		speed = 100
		movement = "walk"
	
	if dir != 0:
		$AnimatedSprite.play(movement)
	else:
		$AnimatedSprite.play("stand")
	
	velocity = move_and_slide(velocity, Vector2.ZERO)
