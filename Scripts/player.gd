extends CharacterBody2D

const MAX_SPEED = 125
const JUMP_VELOCITY = -450
const GRAVITY = 1000


func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * MAX_SPEED
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	# Обработка прыжка
	if Input.is_action_just_pressed("move_ap") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	move_and_slide()
