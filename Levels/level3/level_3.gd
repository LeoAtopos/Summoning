extends Node2D

@onready var pusher = $Pusher
@onready var box = $Box
@onready var target = $Target

var boxsize = 32
var top_limit
var bottom_limit
var left_limit
var right_limit
# Called when the node enters the scene tree for the first time.
func _ready():
	top_limit =  -3 * boxsize
	bottom_limit = boxsize * 3
	left_limit = - 5 * boxsize
	right_limit = boxsize * 5

	box.position = Vector2(-3*boxsize,0)
	target.position = Vector2(3*boxsize,0)
	Sgm.canMove = false
	Dialogic.start("level3_open_line")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Sgm.canMove: return
	if Input.is_action_just_pressed("up") and pusher.position.y>top_limit:
		pusher.position += Vector2(0, -boxsize)
		if check_push():
			box.position += Vector2(0, -boxsize)
			check_dead()
	if Input.is_action_just_pressed("down") and pusher.position.y<bottom_limit:
		pusher.position += Vector2(0, boxsize)
		if check_push():
			box.position += Vector2(0, boxsize)
			check_dead()
	if Input.is_action_just_pressed("left") and pusher.position.x>left_limit:
		pusher.position += Vector2(-boxsize,0)
		if check_push():
			box.position += Vector2(-boxsize,0)
			check_dead()
	if Input.is_action_just_pressed("right") and pusher.position.x<right_limit:
		pusher.position += Vector2(boxsize,0)
		if check_push():
			box.position += Vector2(boxsize,0)
			check_dead()
	
	if box.position == target.position:
		print(box.position,target.position)
		Sgm.canMove = false
		Dialogic.start("level3_portout_line")

func check_push()->bool:
	if pusher.position == box.position:
		return true
	else:
		return false

func check_dead():
	if box.position.y <= -3 * boxsize or box.position.y >= 3 * boxsize or box.position.x <= -5 * boxsize or box.position.x >= 5 * boxsize:
		pusher.position = Vector2.ZERO
		box.position = Vector2(-3*boxsize,0)
		target.position = Vector2(3*boxsize,0)