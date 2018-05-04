extends Node

class NPC:
	var is_friend
	var name
	var dialogs = []
	func _init(_name = "tmp", _is_friend = false):
		name = _name
		is_friend = _is_friend
	func _add_dialog (dialog):
		dialogs.push_back(dialog)
	

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
