extends PanelContainer

@onready var money_label = $MarginContainer/VBoxContainer/Money/Label
@onready var wood_label = $MarginContainer/VBoxContainer/Wood/Label
@onready var rock_label = $MarginContainer/VBoxContainer/Brick/Label

@onready var name_label = $MarginContainer/VBoxContainer/Label

func set_required_resources(money, wood, rock):
	money_label.text = str(money)
	wood_label.text = str(wood)
	rock_label.text = str(rock)

func set_required_name(building_name):
	name_label.text = building_name
