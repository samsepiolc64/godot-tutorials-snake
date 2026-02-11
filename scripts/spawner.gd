class_name Spawner extends Node2D

#signals
#export vars
@export var bounds:Bounds
#instant packed scenes
#var food_scene:PackedScene = preload("uid://bny6cidnl4mx6")
var food_scene:PackedScene = preload("res://scenes/food.tscn")

func spawn_food():
	#where to the spawn it (positioning)
	var spawn_point:Vector2 = Vector2.ZERO
	spawn_point.x = randf_range(bounds.x_min + Global.GRID_SIZE, bounds.x_max - Global.GRID_SIZE)
	spawn_point.y = randf_range(bounds.y_min + Global.GRID_SIZE, bounds.y_max - Global.GRID_SIZE)
	#what were spawning (instantiating)
	var food = food_scene.instantiate()
	food.position = spawn_point
	#where were putting it (parenting) 
	get_parent().add_child(food)
