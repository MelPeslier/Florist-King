class_name SharedWaterSystem
extends Flower

# Water
@export var water :float

const min_water :float = 0.0
const max_water :float = 100.0

@export var min_perfect_water :float
@export var max_perfect_water :float

# 1.0 is a normal state
@export var water_decrease_speed :float = 1.0
@export var water_increase_speed :float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# For animation
func _process(delta):
	pass

# For systems
func _physics_process(delta):
	water -= water_decrease_speed * delta
	
	if water <= min_water or water >= max_water:
		_die_flower()
