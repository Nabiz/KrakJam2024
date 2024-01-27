extends CharacterBody2D

@export var desire_id = 1
@onready var sprite = $Sprite2D
@onready var cloud_sprite = $CloudSprite
@onready var desire_sprite = $CloudSprite/desire
@onready var item_area = $ItemArea2D

var happy_texture = preload("res://Assets/Sprites/villager/villager_happy_idle.png")

func _ready():
	desire_sprite.frame = desire_id

func item_recived():
	Utils.gui.add_happy_villager()
	sprite.texture = happy_texture
	item_area.queue_free()


func _on_area_2d_body_entered(body):
	if body is Player:
		Utils.player.current_villager = self
		cloud_sprite.visible = true


func _on_area_2d_body_exited(body):
	if body is Player:
		Utils.player.current_villager = null
		cloud_sprite.visible = false
