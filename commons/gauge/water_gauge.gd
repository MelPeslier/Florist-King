extends Node2D

@export var flower :Flower
@onready var tex = $TextureProgressBar

# To be called after the sunflower initialisation
func _ready():
	# Progress Bar
	tex.min_value = flower.min_water
	tex.max_value = flower.max_water
	tex.value = flower.water
	tex.step = 0.01
	
	# Limits : To put the tresholds at ther right place : 128 is size of the Gauge Sprite
	var sprite_width = tex.texture_over.get_width() -10
	$LowLimit.position.x = flower.min_perfect_water * sprite_width / flower.max_water - sprite_width / 2
	$HighLimit.position.x = flower.max_perfect_water * sprite_width / flower.max_water - sprite_width / 2


func _process(delta):
	tex.value = flower.water
