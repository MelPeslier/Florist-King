extends Node2D

@export var flower :Flower
@onready var tex = $TextureProgressBar

# To be called after the sunflower initialisation
func _ready():
	# Progress Bar
	tex.min_value = flower.min_happiness
	tex.max_value = flower.max_happiness
	tex.value = flower.happiness
	tex.step = 0.001

func _process(delta):
	tex.value = flower.happiness
