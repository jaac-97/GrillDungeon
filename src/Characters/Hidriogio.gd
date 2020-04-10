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
export var jump_power := 600.0
var jump_released = false
# Physics
export var gravity_scale = 100.0
var earth_gravity = 9.807
var on_floor
# Special variables
var inflated = false
var extra_jump_available = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = 0
	activate_special()
	if active:
		hor_movement(dir)
	else:
		animation = "stand"
		velocity.x = 0
	
	if not inflated:
		velocity += Vector2.DOWN * gravity_scale * earth_gravity * delta
#	else:
#		animation = "inflated"
	
	if on_floor:
		extra_jump_available = true
		if active and not inflated:
			if Input.is_action_just_pressed("jump"):
				velocity = Vector2.UP * jump_power
	elif not inflated:
		animation = "jump"
	
	if inflated and extra_jump_available:
		if Input.is_action_just_pressed("jump"):
			velocity = Vector2.UP * jump_power
			$AnimatedSprite.play("deflate")
			extra_jump_available = false
			inflated = false
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if not inflated:
		$AnimatedSprite.play(animation)
	
	on_floor = true if is_on_floor() else false
	

func hor_movement(dir):
	if Input.is_action_pressed("ui_right"):
		dir += 1
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed("ui_left"):
		dir -=1
		$AnimatedSprite.flip_h = true
	
	if on_floor and not inflated:
		speed = RUN_SPEED if Input.is_action_pressed("sprint") else WALK_SPEED
		movement = "run" if Input.is_action_pressed("sprint") else "walk"
	
	velocity.x = dir * speed
	
	if not inflated:
		animation = movement if dir != 0 else "stand"


func activate_special():
	if active and extra_jump_available:
		if Input.is_action_just_pressed("special"):
			velocity.y = 0
			inflated = true
			$AnimatedSprite.play("inflate")
			$FloatTime.start()



func _on_FloatTime_timeout():
	if inflated:
		$AnimatedSprite.play("deflate")
		inflated = false
