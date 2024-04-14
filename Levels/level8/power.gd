extends Line2D

var min_length = -10
var max_length = -110

var speed = 1
var dir = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	points[1] += dir * Vector2(0, speed)
	if points[1].y < max_length:
		points[1] = Vector2(0, max_length)
		dir *= -1
	elif points[1].y > min_length:
		points[1] = Vector2(0, min_length)
		dir *= -1

