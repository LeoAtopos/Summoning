extends Node2D

@onready var arrow = %arrow
@onready var power = $power
@onready var state_chart = $StateChart
@onready var tip = $tip_label
@onready var ball :RigidBody2D = $ball

var stage = "pause" # pause,aiming,powering,shooting,stopped,goaled

var shoot_angle
var shoot_power
var ball_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	ball_pos = ball.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pause_state_entered():
	arrow.set_process(false)
	tip.visible = false
	power.visible = false
	Dialogic.start("level8_open_line")


func _on_pause_state_processing(delta:float):
	if Sgm.golf_can_go:
		state_chart.send_event("start aiming")


func _on_aiming_state_entered():
	ball.reset_state = true
	ball.linear_velocity = Vector2.ZERO
	ball.angular_velocity = 0
	ball.move_body(ball_pos)
	arrow.set_process(true)
	arrow.visible = true
	power.visible = false
	tip.visible = true
	tip.text = "SPACE to Aim"


func _on_aiming_state_processing(delta):
	if Input.is_action_just_pressed("aim"):
		arrow.set_process(false)
		shoot_angle = arrow.rotation
		state_chart.send_event("aimed")

func _on_powering_state_entered():
	power.visible = true
	power.set_process(true)
	tip.text = "SPACE to Shoot"


func _on_powering_state_processing(delta:float):
	if Input.is_action_just_pressed("aim"):
		power.set_process(false)
		shoot_power = power.points[1].y
		tip.visible = false
		await get_tree().create_timer(0.5).timeout
		state_chart.send_event("shoot")


func _on_shooting_state_entered():
	print("shoot_power:",shoot_power)
	var shoot_force = -Vector2(shoot_power * cos(shoot_angle), shoot_power * sin(shoot_angle)) * 10
	print("shoot_force:",shoot_force)
	ball.apply_central_impulse ( shoot_force )
	arrow.visible = false
	power.visible = false
	await get_tree().create_timer(0.3).timeout
	state_chart.send_event("shoot done")


func _on_flying_state_processing(delta:float):
	print(ball.linear_velocity.length())
	if ball.linear_velocity.length() < 1:
		state_chart.send_event("no goal")
	if Input.is_action_just_pressed("aim"):
		state_chart.send_event("no goal")


func _on_goalpoint_body_entered(body):
	print("goallllll")
	state_chart.send_event("goal")


func _on_goaled_state_entered():
	print("Gggggggggoallllll")
	Dialogic.start("level8_out_line")


func _on_bound_body_entered(body:Node2D):
	state_chart.send_event("no goal")
