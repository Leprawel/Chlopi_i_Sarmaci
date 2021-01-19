extends Node2D


func _ready():
	$PancerniKal2.hide() 


func _on_Pancerni2_pressed():
	$PancerniKal2.show()
	$Pancerni2.hide()
	$Dragoni2.hide()
	$Rajtarzy2.hide()
	$Lisowczycy2.hide()
	$Korsarze2.hide() 
	$WybierzZastep2.hide()


func _on_Dragoni2_pressed():
	pass 


func _on_Rajtarzy2_pressed():
	pass 


func _on_Lisowczycy2_pressed():
	pass 


func _on_Korsarze2_pressed():
	pass 
