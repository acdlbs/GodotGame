extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var playerNear = false
var dialogue = []

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("Panel").visible = false
	dialogue.push_front("hey")
	dialogue.push_front("I dont like you")
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass

func _input(event):
	if (Input.is_key_pressed(KEY_X) and playerNear):
		_talk()
		print("fkldsajflkds")

func _talk():
	if (!dialogue.empty()):
		get_node("Panel").visible = true
		get_node("Panel/Label").text = dialogue.pop_front()
	else:
		get_node("Panel").visible = false

func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		playerNear = true
		print("foobar")


func _on_Area2D_body_exited(body):
	if (body.get_name() == "Player"):
		playerNear = false
