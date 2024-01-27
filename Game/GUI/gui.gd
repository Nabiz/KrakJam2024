extends CanvasLayer

var money = 100
var wood = 20
var rock = 50

var happy_count = 0
@onready var happy_label = $MarginContainer2/HBoxContainer/Label

@onready var money_label = $MarginContainer/Resources/Money/Label
@onready var wood_label = $MarginContainer/Resources/Wood/Label
@onready var rock_label = $MarginContainer/Resources/Rock/Label

func _ready():
	Utils.gui = self
	money = 100
	wood = 20
	rock = 50
	update_resources_labels()

func add_resources(add_money, add_wood, add_rock):
	money += add_money
	wood += add_wood
	rock += add_rock
	update_resources_labels()

func update_resources_labels():
	money_label.text = str(money)
	wood_label.text = str(wood)
	rock_label.text = str(rock)

func add_happy_villager():
	happy_count += 1
	happy_label.text = str(happy_count) + "/20"
