extends CharacterBody2D

class_name Player

const SPEED = 300.0

@onready var animation = $AnimatedSprite2D
@onready var requires_ui = $Requires

@onready var item_sprite = $ItemSprite2D
var item_id = 0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_building = null
var current_villager = null

func _ready():
	Utils.player = self
	item_sprite.frame = item_id

func _physics_process(_delta):
	movement()
	update_item_position()

func _process(_delta):
	player_build()
	player_give_item()

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

func update_item_position():
	if animation.flip_h:
		item_sprite.position = Vector2(-21, 17)
	else:
		item_sprite.position = Vector2(21, 17)

func show_requires_ui(show_ui=true):
	if current_building:
		requires_ui.set_required_name(current_building.building_name)
		requires_ui.set_required_resources(current_building.money, current_building.wood, current_building.rock)
	requires_ui.visible = show_ui

func player_build():
	if Input.is_action_just_pressed("ui_select"):
		if current_building:
			current_building.build()

func player_give_item():
	if Input.is_action_just_pressed("ui_select"):
		if current_villager:
			if current_villager.desire_id == item_id:
				current_villager.item_recived()
				take_item(0)

func take_item(id):
	item_id = id
	item_sprite.frame = item_id
