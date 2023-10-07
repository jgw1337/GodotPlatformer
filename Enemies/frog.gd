extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var SPEED = 50
var is_chasing = false

@onready var player = get_node("../../Player/MainCharacter")
@onready var frog = get_node("AnimatedSprite2D")

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	if is_chasing:
		var direction = (player.position - self.position).normalized()
		frog.play("Jump");
	
		if direction.x > 0:
			frog.flip_h = true
		else:
			frog.flip_h = false
	
		velocity.x = direction.x * SPEED
	else:
		frog.play("Idle");
		velocity.x = 0

	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "MainCharacter":
		is_chasing = true


func _on_player_detection_body_exited(body):
	if body.name == "MainCharacter":
		is_chasing = false
