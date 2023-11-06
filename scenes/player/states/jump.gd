extends State

@onready var player = owner

# If we get a message asking us to jump, we jump.
func enter(msg := {}) -> void:
	player.label_state.text = "Jump"
	player.animated_sprite.play("jump")
	if msg.has("do_jump"):
		player.velocity.y = -player.jump_impulse


func handle_input(_input: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	# Horizontal movement.
	var input_direction_x: float = (
		Input.get_action_strength("player_right")
		- Input.get_action_strength("player_left")
	)
	player.velocity.x = player.speed * input_direction_x
	# Vertical movement.
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	# Landing.
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")


func exit() -> void:
	pass
