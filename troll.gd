extends KinematicBody2D

export (int) var SPEED
var lastInput

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
	
	if motion.x != 0:
	    $AnimatedSprite.animation = "right"
	    $AnimatedSprite.flip_v = false
	    $AnimatedSprite.flip_h = motion.x < 0
	elif motion.y > 0:
	    $AnimatedSprite.animation = "down"
	elif motion.y < 0:
		$AnimatedSprite.animation = "up"
	
	if motion.length() > 0:
		motion = motion.normalized() * SPEED
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	move_and_slide(motion)
