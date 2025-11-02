extends Node2D


@onready var options = $CanvasLayer/Options


func _ready():
	options.visible = false
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		options.visible = true
		get_tree().paused = true


func _on_button_back_pressed():
	_ready()




func _on_button_exit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/mine_menu.tscn")
