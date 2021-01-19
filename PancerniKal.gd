extends Node2D


func _ready():
	pass 



func _on_WoodButton_pressed():
	var amountOfWoodAdded = $WoodLineEdit.text
	var theAmountOfWood = $WoodScore.text
	var newScoreWood = str(int(amountOfWoodAdded) + int(theAmountOfWood))
	$WoodScore.text = newScoreWood
	$WoodLineEdit.clear()


func _on_StoneButton_pressed():
	var amountOfStoneAdded = $StoneLineEdit.text
	var theAmountOfStone = $StoneScore.text
	var newScoreStone = str(int(amountOfStoneAdded) + int(theAmountOfStone))
	$StoneScore.text = newScoreStone
	$StoneLineEdit.clear()


func _on_IronButton_pressed():
	var amountOfIronAdded = $IronLineEdit.text
	var theAmountOfIron = $IronScore.text
	var newScoreIron = str(int(amountOfIronAdded) + int(theAmountOfIron))
	$IronScore.text = newScoreIron
	$IronLineEdit.clear()


func _on_Arrow3_pressed():
	get_tree().change_scene("res://Menu.tscn")
