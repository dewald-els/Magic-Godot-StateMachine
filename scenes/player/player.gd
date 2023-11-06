extends CharacterBody2D
class_name Player

var speed: float = 100
var gravity: float = 500
var jump_impulse: float = 250

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label_state: Label = $LabelState

func _ready() -> void:
	pass
