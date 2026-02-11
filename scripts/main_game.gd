class_name MainGame extends Node


@onready var head: Head = %Head as Head #before change Head "%Dostep jako unikalna nazwa"
@onready var bounds: Bounds = %Bounds as Bounds
@onready var spawner: Spawner = %Spawner as Spawner

var time_between_moves: float = 1000.0
var time_since_last_move: float = 0
var speed: float = 1000.0
var move_dir:Vector2 = Vector2.RIGHT #Vector2(1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawner.spawn_food()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		move_dir = Vector2.UP # (0,-1)
		head.rotation_degrees = -90
	elif Input.is_action_just_pressed("ui_right"):
		move_dir = Vector2.RIGHT # (1,0)
		head.rotation_degrees = 0
	elif Input.is_action_just_pressed("ui_down"):
		move_dir = Vector2.DOWN # (0,1)
		head.rotation_degrees = 90
	elif Input.is_action_just_pressed("ui_left"):
		move_dir = Vector2.LEFT # (-1,0)
		head.rotation_degrees = 180

func _physics_process(delta: float) -> void:
	time_since_last_move += delta * speed
	if time_since_last_move >= time_between_moves:
		update_snake()
		time_since_last_move = 0

func update_snake():
	var new_pos:Vector2 = head.position + move_dir * Global.GRID_SIZE
	new_pos = bounds.wrap_vector(new_pos) # check if head is out of area
	head.move_to(new_pos)
