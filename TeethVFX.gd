@tool
extends Node3D

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
var maxTime : float = 3.0
var curTime : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if curTime > maxTime:
		animationPlayer.play("Bite")
		curTime = 0.0
	
	curTime += delta
	
	
