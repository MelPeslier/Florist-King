class_name Flower
extends Node2D

#Sprite
@export var sprite: Sprite2D

# Happiness
@export var happiness :float = 1.0
@export var min_happiness :float = 0.5
@export var max_happiness :float = 1.5


# Price
var sell_price :float

func _sell_flower() -> float:
	return sell_price * happiness

func _die_flower() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "modulate:a", 0.0, 1.0)
