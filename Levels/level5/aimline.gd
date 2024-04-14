extends Line2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = get_local_mouse_position() - points[0]
	dir = dir.normalized() * 140
	points[1] = dir
