extends Area2D

class_name Storage

@export var storage_id = 1
@onready var sprite = $Sprite2D

var can_take = false

func _ready():
	sprite.visible = false
	set_process(false)
	sprite.frame = storage_id

func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		if can_take:
			Utils.player.take_item(storage_id)
		

func activate_storage():
	set_process(true)
	sprite.visible = true

func _on_body_entered(body):
	if body is Player:
		can_take = true

func _on_body_exited(body):
	if body is Player:
		can_take = false
