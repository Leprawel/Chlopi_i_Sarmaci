extends Node2D



func _ready():
	$PancerniKal.hide()




func _on_Pancerni_pressed():
	$WybierzZastep.hide()
	$Pancerni.hide()
	$Dragoni.hide()
	$Rajtarzy.hide()
	$Lisowczycy.hide()
	$Korsarze.hide()
	$PancerniKal.show()


func _on_Dragoni_pressed():
	pass 


func _on_Rajtarzy_pressed():
	pass 


func _on_Lisowczycy_pressed():
	pass 


func _on_Korsarze_pressed():
	pass 



















