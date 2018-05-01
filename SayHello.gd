extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass #get_node("MyButton").connect("pressed", self, "_on_Button_pressed")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	get_node("Label").text = "blahblah"
