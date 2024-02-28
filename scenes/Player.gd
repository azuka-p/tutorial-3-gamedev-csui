extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = 600
export (int) var GRAVITY = 1200

const UP = Vector2(0,-1)

var velocity = Vector2()

var jump_count: int = 0
const max_jumps: int = 2

func jump():
	if jump_count < max_jumps:
		jump_count += 1
		velocity.y = -jump_speed

var dash_count_r: int = 0
var dashing_r: bool = false

func dash_right():
	if Input.is_action_just_pressed('right') and dashing_r == false and dash_count_r == 1:
		dashing_r = true
		velocity.x += 4000
		yield(get_tree().create_timer(.5),"timeout")
		dashing_r = false
	if Input.is_action_just_pressed('right') and dashing_r == false:
		dash_count_r += 1
		yield(get_tree().create_timer(.2),"timeout")
		dash_count_r = 0

var dash_count_l: int = 0
var dashing_l: bool = false

func dash_left():
	if Input.is_action_just_pressed('left') and dashing_l == false and dash_count_l == 1:
		dashing_l = true
		velocity.x -= 4000
		yield(get_tree().create_timer(.5),"timeout")
		dashing_l = false
	if Input.is_action_just_pressed('left') and dashing_l == false:
		dash_count_l += 1
		yield(get_tree().create_timer(.2),"timeout")
		dash_count_l = 0

func get_input():
	velocity.x = 0
	dash_right()
	dash_left()
	if Input.is_action_just_pressed('up'):
		jump()
		$AnimatedSprite.play("jump")
	if Input.is_action_pressed('right'):
		velocity.x += speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed('left'):
		velocity.x -= speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	if Input.is_action_pressed("down"):
		velocity.y += 5
		velocity.x /= 2
		$AnimatedSprite.play("crouch")
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite.play("idle")

func _physics_process(delta):
	get_input()
	velocity.y += delta * GRAVITY
	
	velocity = move_and_slide(velocity, UP)
	
	if is_on_floor():
		jump_count = 0
