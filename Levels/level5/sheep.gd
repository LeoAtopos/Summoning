extends Area2D

var move_size = 50
var left_limit
var right_limit
var speed = 1
var dir
# Called when the node enters the scene tree for the first time.
func _ready():
	move_size += randi_range(-25, 25)
	left_limit = position.x - move_size
	right_limit = position.x + move_size
	dir = randf_range(-1,1)
	if dir>=0:
		dir = 1
	else:
		dir = -1
	speed = randf_range(45,85)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += dir * Vector2(speed * delta,0)
	if position.x < left_limit:
		position.x = left_limit
		dir *= -1
	elif position.x > right_limit:
		position.x = right_limit
		dir *= -1


func _on_body_entered(body:Node2D):
	if body.name == "bullet":
		queue_free()
