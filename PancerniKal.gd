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
