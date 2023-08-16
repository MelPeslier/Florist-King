extends Node2D

@export var roomNumber : int
@export var leftRoom : NodePath
@export var rightRoom : NodePath
@export var upRoom : NodePath
@export var downRoom : NodePath
@export var fifthRoom : NodePath


func move(selectedRoom):
	if !selectedRoom:
		return
	
	var player = get_node("../Player")
	if !player.canMove:
		return
	
	selectedRoom = get_node(selectedRoom)
	player.currentRoom = selectedRoom
	player.position = selectedRoom.position
	player.canMove = false
	player.get_node("MoveCooldown").start()
	$Arrows.visible = false
	selectedRoom.enter()
	

func enter(): # When the player enters the room
	$Arrows.visible = true


func _on_left_pressed():
	move(leftRoom)

func _on_right_pressed():
	move(rightRoom)

func _on_up_pressed():
	move(upRoom)

func _on_down_pressed():
	move(downRoom)

func _on_direction_5_pressed():
	move(fifthRoom)
