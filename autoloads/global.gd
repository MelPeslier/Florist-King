extends Node

var YOUR_SILENTWOLF_API_KEY :String = "dnJ0rZvJDI3Vfz6wrJ2Dx9diJiAKZ0wy7HJeGwLO"
var YOUR_SILENTWOLF_GAME_ID :String = "FloristKing"

# Called when the node enters the scene tree for the first time.
func _ready():
	SilentWolf.configure({
		"api_key": YOUR_SILENTWOLF_API_KEY,
		"game_id": YOUR_SILENTWOLF_GAME_ID,
		"log_level": 1
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})


