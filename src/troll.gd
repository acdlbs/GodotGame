extends KinematicBody2D

export (int) var SPEED
var lastInput
var mineAble = false
var target = null
var inventory = []

func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("move_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("move_bottom"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("move_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("move_right"):
		motion += Vector2(1, 0)
		
	var attack = ""
	
	if Input.is_action_pressed("ui_select"):
		attack = "_attack"
	
	if motion.x != 0:
	    $AnimatedSprite.animation = "right" + attack
	    $AnimatedSprite.flip_v = false
	    $AnimatedSprite.flip_h = motion.x < 0
	elif motion.y > 0:
	    $AnimatedSprite.animation = "down" + attack
	elif motion.y < 0:
		$AnimatedSprite.animation = "up" + attack
	
	if motion.length() > 0:
		motion = motion.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	move_and_slide(motion)

func _input(event):
	if (mineAble and Input.is_key_pressed(KEY_Z)):
		print(target)
		get_node("../../mineableBlock").emit_signal("mine_block")
	if (Input.is_key_pressed((KEY_I))):
		if (!inventory.empty()):
			print(inventory)
		else:
			print("inventory empty")
			print(inventory)


func _on_Area2D_body_entered(body):
	if (body.get_name() == "Player"):
		mineAble = true
		print("foo")

func _on_Area2D_body_exited(body):
	if (body.get_name() == "Player"):
		mineAble = false

func _add_item_inventory(var item):
	inventory.append(item)