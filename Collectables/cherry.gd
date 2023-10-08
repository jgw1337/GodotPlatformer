extends Area2D

func _on_body_entered(body):
	if body.name == "MainCharacter":
		Game.gold += 5
		Game.playerHp += 5
		
		var tween_position = get_tree().create_tween()
		var tween_alpha = get_tree().create_tween()

		tween_position.tween_property(self, "position", position - Vector2(0, 50), 0.3)
		tween_alpha.tween_property(self, "modulate:a", 0, 0.3)
		tween_alpha.tween_callback(queue_free)
		
		Utils.saveGame()
