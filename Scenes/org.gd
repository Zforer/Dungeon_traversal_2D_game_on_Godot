extends CharacterBody2D


const speed = 30

var dir = Vector2.RIGHT
var start_pos
var current_state = IDLE
var is_roaming = true
var is_chatting = false

var player
var player_in_chat_zone = false


enum {
	IDLE,
	NEW_DIR,
	MOVE
}


func _ready():
	randomize()
	start_pos = position


func _process(_delta):
	if Input.is_action_just_pressed('chat'):
		is_roaming = false
		is_chatting = true


func _on_chat_detection_body_entered(body):
	if body.has_method('player'):
		player = body
		player_in_chat_zone = true


func _on_chat_detection_body_exited(body):
	if body.has_method('player'):
		player_in_chat_zone = false


func _on_timer_timeout():
	$Timer.wait_time = 1
	# добавить бой
