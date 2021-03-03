extends Node2D


func _on_Refresh_pressed():
	get_node("..").Refresh_date()


func _on_Add_button2_pressed():
	get_node("..").Pancerni2_add()
