extends Node2D
signal battle_started

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.pick_over == true:
		$start.visible = false
		Globals.pick_over = false
		





	


func _on_start_battle_go():
	Globals.ongoing_battle = true
