extends Node2D



func _ready():
	pass




func _on_Pancerni_pressed():
	get_tree().change_scene("res://PancerniKal.tscn")


func _on_Dragoni_pressed():
	pass 


func _on_Rajtarzy_pressed():
	pass 


func _on_Lisowczycy_pressed():
	pass 


func _on_Korsarze_pressed():
	pass 



func _on_Arrow_pressed(): 
	get_tree().change_scene("res://Wybierz.tscn")
