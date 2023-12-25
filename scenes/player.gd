extends CharacterBody2D
var mouse_pos = Vector2(0,0)
var player_pos = Vector2(0,0)
var target_pos = Vector2(0,0)
func _physics_process(_delta):
	if Input.is_action_just_pressed("click"):
		mouse_pos = get_global_mouse_position()
		target_pos = (mouse_pos - position).normalized()
	if position.distance_to(mouse_pos) > 3:	
		velocity = target_pos * 300
		move_and_slide()
