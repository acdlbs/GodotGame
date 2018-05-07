extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var isPlayerNear = false
var iconImage = "res://assets/Skeleton Key - Icon.png" 
var player = null
var foo = "item"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	player = get_tree().root.get_node("home/walls/Player")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if (Input.is_key_pressed(KEY_Z) and isPlayerNear):
		print("pickup item")
		_pickup()


func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		isPlayerNear = true
		player = body


func _on_Area2D_body_exited(body):
		if (body.get_name() == "Player"):
			isPlayerNear = false
			player = null

func _get_icon_image():
	return iconImage

func _pickup():
	player._add_item_inventory(self)
	get_node("Sprite").queue_free()
	get_node("CollisionShape2D").queue_free()
	get_node("Area2D").queue_free()