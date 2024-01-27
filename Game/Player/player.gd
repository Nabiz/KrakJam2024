extends CharacterBody2D

class_name Player

const SPEED = 300.0

@onready var animation = $AnimatedSprite2D
@onready var requires_ui = $Requires

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_building = null

func _ready():
	Utils.player = self

func _physics_process(_delta):
	movement()

func _process(_delta):
	player_build()

func movement():
	var direction = Input.get_axis("ui_left", "ui_right")
	var direction2 = Input.get_axis("ui_up", "ui_down")
	if direction or direction2:
		velocity.x = direction
		velocity.y = direction2
		animation.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animation.play("Idle")
	velocity = velocity.normalized() * SPEED
	animation.flip_h = true if velocity.x < 0.01 else false
	move_and_slide()

func show_requires_ui(show_ui=true):
	requires_ui.visible = show_ui

func player_build():
	if Input.is_action_just_pressed("ui_select"):
		if current_building:
			current_building.build()
