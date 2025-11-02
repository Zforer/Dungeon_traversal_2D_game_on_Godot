extends CharacterBody2D


const MAX_SPEED = 125
const JUMP_VELOCITY = -450
const GRAVITY = 1000
const SLAM_FALL_SPEED = 800

var is_slamming: bool = false
var was_in_air: bool = false


@onready var _animated_sprite = $AnimatedSprite2D
@onready var sfx_jamp = $SFX_JAMP


func _ready():
	$SlimeHitbox.monitoring = false


func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * MAX_SPEED
	
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	else:
		velocity.y = 0

	if Input.is_action_just_pressed("move_ap") and is_on_floor():
		sfx_jamp.stop()
		velocity.y = JUMP_VELOCITY
		was_in_air = false
		sfx_jamp.play()
	
	if Input.is_action_pressed("move_down") and not is_on_floor():
		velocity.y = SLAM_FALL_SPEED
		is_slamming = true
		was_in_air = true

	
	if was_in_air and is_on_floor():
		execute_slam_attack()
		was_in_air = false
		is_slamming = false
	
	move_and_slide()


func execute_slam_attack():
	#$Sprite2D.play("Atak")
	$SFX_ATAC.play()
	$SlimeHitbox.monitoring = true
	await get_tree().create_timer(0.1).timeout
	$SlimeHitbox.monitoring = false


func _process(_delta):
	if Input.is_action_pressed("move_right"):
		_animated_sprite.play("run_right")
	elif Input.is_action_pressed("move_left"):
		_animated_sprite.play("run_left")
	elif Input.is_action_pressed("move_ap"):
		_animated_sprite.play("jamp")
	else:
		_animated_sprite.play("static")
