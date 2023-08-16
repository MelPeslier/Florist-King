extends Node

var rooms := []

func _ready():
	var pot_rooms :Array = get_tree().get_nodes_in_group("PotRoom")
	
	for room in pot_rooms:
		if room is Node2D:
			var pots := []
			for table in room.get_children():
				if table is Marker2D and table.name == "Table":
					for pot in table.get_children():
						if pot is Marker2D and pot.name.begins_with("Pot"):
							pots.push_back(pot)
			rooms.push_back(pots)
	print(rooms)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
