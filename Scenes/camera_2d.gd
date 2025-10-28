extends Camera2D

var zoomfactor = 1
var zoomspeed = 20
var zoomstep = 0.01
var factorstep = 0.01

func _ready():
	pass
	
func _process(delta):
	zoom.x = lerp(zoom.x, zoomfactor * zoom.x, zoomspeed * zoom.x)
	zoom.y = lerp(zoom.y, zoomfactor * zoom.y, zoomspeed * zoom.y)
	
	zoom.x = clamp(zoom.x, 0.5, 2)
	zoom.y = clamp(zoom.y, 0.5, 2)
	
	if zoomfactor > 1:
		zoomfactor -= factorstep
		
	elif zoomfactor < 1:
		zoomfactor += factorstep

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoomfactor -= zoomstep
			
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoomfactor += zoomstep
