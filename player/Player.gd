extends Node2D

####################
# VARIABLES
####################

@onready var currentRoom = get_node("../Room10") # Starting room
var canMove := false

@export var points_to_give: int= 1
@export var points_to_take: int= 1
@export var points_cannot_be_more_than: = ""
@export var points_cannot_be_less_than: = ""
@export var start_points: int= 0
@export var default_text: = ""
var points: int= start_points

@export var allow_conditions: bool= true
var plus_condition = false
var minus_condition = true

####################
# FUNCTION(s)
####################

func plus_points():
	if plus_condition == true:
		points += int(points_to_give)
		$PointsLabel.text = str(points)

func points_plus_limit_handler():
	if not points_cannot_be_more_than == "":
		if points > int(points_cannot_be_more_than):
			points = int(points_cannot_be_more_than)
			$PointsLabel.text = str(points)

func minus_points():
	if minus_condition == true:
		points -= int(points_to_take)
		$PointsLabel.text = str(points)

func points_minus_limit_handler():
	if not points_cannot_be_less_than == "":
		if points < int(points_cannot_be_less_than):
			points = int(points_cannot_be_less_than)
			$PointsLabel.text = str(points)

func points_handler():
	if allow_conditions == true:
		if (plus_condition == true and minus_condition == false) or (plus_condition == false and minus_condition == true):
			plus_points()
			minus_points()
	
	points_plus_limit_handler()
	points_minus_limit_handler()

func _ready():
	position = currentRoom.position
	currentRoom.enter()
	
	if not default_text == "":
		$PointsLabel.text = str(default_text)

func _process(_delta):
	# Movement
	if Input.is_action_just_pressed("ui_left"):
		currentRoom.move(0, self)
	elif Input.is_action_just_pressed("ui_right"):
		currentRoom.move(1, self)
	elif Input.is_action_just_pressed("ui_up"):
		currentRoom.move(2, self)
	elif Input.is_action_just_pressed("ui_down"):
		currentRoom.move(3, self)
	
	# Points handler
	points_handler()


func _on_move_cooldown_timeout():
	canMove = true
