extends State

@onready var player = owner

func enter(_msg := {}) -> void:
	player.label_state.text = "Idle"
	player.velocity = Vector2.ZERO
	player.animated_sprite.play("idle")


func handle_input(_input: InputEvent) -> void:
	pass


func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Jump")

	if Input.is_action_just_pressed("player_jump"):
		state_machine.transition_to("Jump", { do_jump = true })
	elif Input.is_action_pressed("player_left") or Input.is_action_pressed("player_right"):
		state_machine.transition_to("Run")


func exit() -> void:
	pass
