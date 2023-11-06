extends State

@onready var player = owner

func enter(_msg := {}) -> void:
	player.label_state.text = "Run"
	player.animated_sprite.play("run")

func handle_input(_input: InputEvent) -> void:
	pass

func update(_delta: float) -> void:
	pass


func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Jump")
		return


	var input_direction_x: float = (
		Input.get_action_strength("player_right")
		- Input.get_action_strength("player_left")
	)
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

	if Input.is_action_just_pressed("player_jump"):
		state_machine.transition_to("Jump", {do_jump = true})
	elif is_equal_approx(input_direction_x, 0.0):
		state_machine.transition_to("Idle")


func exit() -> void:
	pass
