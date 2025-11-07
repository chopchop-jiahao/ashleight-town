extends Node

# preload GUT CLI
@onready var gut_cmd = preload("res://addons/gut/gut_cmdln.gd")

func _ready() -> void:
	# Godot 4.x: instantiate() is coroutine
	var gut_runner = await gut_cmd.instantiate()
	
	# set result output (JUnit)
	gut_runner.set_result_file("gut_results.xml")
	gut_runner.set_result_format("junit")
	
	# execute the whole tests folder
	gut_runner.run_tests("res://tests")
	
	# quit Godot
	get_tree().quit()
