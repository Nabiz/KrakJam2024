extends StaticBody2D

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@onready var buildArea = $BuildArea
 
var is_build = false

func _ready():
	sprite.visible = false
	collision.disabled = true

func _on_build_area_body_entered(body):
	if body is Player:
		if !is_build:
			Utils.player.current_building = self

func build():
	sprite.visible = true
	collision.set_deferred("disabled", false)
	buildArea.queue_free()


func _on_build_area_body_exited(body):
	if body is Player:
		Utils.player.current_building = null
