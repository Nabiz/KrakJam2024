extends StaticBody2D

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var build_area = $BuildArea
@onready var gray_shader = $GrayscaleShader

var is_build = false

@export var money = 0
@export var wood = 0
@export var rock = 0

func _ready():
	sprite.visible = false
	collision.disabled = true

func _on_build_area_body_entered(body):
	if body is Player:
		if !is_build:
			Utils.player.current_building = self
			Utils.player.show_requires_ui(true)

func build():
	if check_resources():
		Utils.gui.add_resources(-money, -wood, -rock)
		is_build = true
		sprite.visible = true
		collision.set_deferred("disabled", false)
		build_area.queue_free()
		gray_shader.queue_free()

func _on_build_area_body_exited(body):
	if body is Player:
		Utils.player.current_building = null
		Utils.player.show_requires_ui(false)

func check_resources():
	return Utils.gui.money >= money and Utils.gui.wood >= wood and Utils.gui.rock >= rock
