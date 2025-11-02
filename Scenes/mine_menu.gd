extends Control


@onready var mine_buttons = $"Mine-Buttons"
@onready var options = $Options


func _ready():
	mine_buttons.visible = true
	options.visible = false



func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/location.tscn")


func _on_options_pressed():
	mine_buttons.visible = false
	options.visible = true


func _on_exit_pressed():
	get_tree().quit()


func _on_back_pressed() -> void:
	_ready()
