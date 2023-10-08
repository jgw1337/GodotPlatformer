extends Node2D

var cherry = preload("res://Collectables/cherry.tscn")

func _on_timer_timeout():
	var cherryTemp = cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var randInt = rng.randi_range(100, 800)
	
	cherryTemp.position = Vector2(randInt, 230)
	
	add_child(cherryTemp)
