extends CharacterBody2D
class_name Player

@export var speed := 200.0
@export var jump_force := 400.0
@export var base_gravity := 1000.0

@onready var animation_player := %AnimationPlayer
@onready var state_text := %StateText
