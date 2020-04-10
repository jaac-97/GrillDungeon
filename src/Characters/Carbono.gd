extends KinematicBody2D


signal interact

onready var active = false
# Declare member variables here. Examples:
const RUN_SPEED = 200
const WALK_SPEED = 100
export var speed = WALK_SPEED
var velocity = Vector2.ZERO
var movement = ""
var animation = ""
# Jump
export var fall_gravity_scale = 100.0
export var low_jump_gravity_scale = 200.0
export var jump_power := 300.0
var jump_released = false
# Physics
export var gravity_scale = 100.0
var earth_gravity = 9.807

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = 0
	if active:
		hor_movement(dir)
	else:
		animation = "stand"
		velocity.x = 0
		
	velocity += Vector2.DOWN * gravity_scale * earth_gravity * delta
	
	if Input.is_action_just_released("jump"):
		jump_released = true
		
	if is_on_floor():
		if active:
			if Input.is_action_just_pressed("jump"):
				velocity = Vector2.UP * jump_power
				jump_released = false
	else:
		animation = "jump"
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	$AnimatedSprite.play(animation)


func hor_movement(dir):
	if Input.is_action_pressed("ui_right"):
		dir += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		dir -=1
		$AnimatedSprite.flip_h = true
	
	if is_on_floor():
		speed = RUN_SPEED if Input.is_action_pressed("sprint") else WALK_SPEED
		movement = "run" if Input.is_action_pressed("sprint") else "walk"
	
	velocity.x = dir * speed
	
	animation = movement if dir != 0 else "stand"
