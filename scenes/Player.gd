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
		
var dash_count: int = 0
var dashing: bool = false

#func dash():
	#if dash_count < max_dash:
	#	dash_count += 1
	#	velocity.y = jump_speed

func get_input():
	velocity.x = 0
	if Input.is_action_just_pressed('up'):
		jump()
		$AnimatedSprite.play("jump")
	if Input.is_action_just_pressed('right') and dashing == false and dash_count == 1:
		print('aaaa')
		dashing = true
		velocity.x += 10*speed
		yield(get_tree().create_timer(.5),"timeout")
		dashing = false
	if Input.is_action_just_pressed('right') and dashing == false:
		dash_count += 1
		print(dash_count)
		yield(get_tree().create_timer(.5),"timeout")
		dash_count = 0
	if Input.is_action_pressed('right'):
		velocity.x += speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
	if Input.is_action_pressed('left'):
		velocity.x -= speed
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite.play("idle")

func _physics_process(delta):
	get_input()
	velocity.y += delta * GRAVITY
	
	velocity = move_and_slide(velocity, UP)
	
	if is_on_floor():
		jump_count = 0
