extends Button

func _physics_process(delta):
	if $Add_buttton.pressed:
		get_node("Interface").Pancerni_add()
