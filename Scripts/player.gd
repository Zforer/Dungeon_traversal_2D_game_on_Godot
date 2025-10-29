extends CharacterBody2D


const MAX_SPEED = 125
const JUMP_VELOCITY = -450
const GRAVITY = 1000


@onready var _animated_sprite = $AnimatedSprite2D


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


func _process(_delta):
	if Input.is_action_pressed("move_right"):
		_animated_sprite.play("run_right")
	elif Input.is_action_pressed("move_left"):
		_animated_sprite.play("run_left")
	elif Input.is_action_pressed("move_ap"):
		_animated_sprite.play("jamp")
	else:
		_animated_sprite.play("static")
