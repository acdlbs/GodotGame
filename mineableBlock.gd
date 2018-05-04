extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var foo = null
var player = null
signal mine_block
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here\
	foo = get_node("Area2D")
	player = get_node("../walls/Player")
	connect("mine_block", self, "_mine_block")
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	pass

func _mine_block():
	$StaticBody2D.free()
	$Area2D.free()