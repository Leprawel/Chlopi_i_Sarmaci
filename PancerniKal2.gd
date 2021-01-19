extends Node2D



func _ready():
	pass 

func _on_WoodButton2_pressed():
	var amountOfWoodAdded2 = $WoodLineEdit2.text
	var theAmountOfWood2 = $WoodScore2.text
	var newScoreWood2 = str(int(amountOfWoodAdded2) + int(theAmountOfWood2))
	$WoodScore2.text = newScoreWood2 + " / tyg"
	$WoodLineEdit2.clear()


func _on_StoneButton2_pressed():
	var amountOfStoneAdded2 = $StoneLineEdit2.text
	var theAmountOfStone2 = $StoneScore2.text
	var newScoreStone2 = str(int(amountOfStoneAdded2) + int(theAmountOfStone2))
	$StoneScore2.text = newScoreStone2 + " / tyg"
	$StoneLineEdit2.clear()

func _on_IronButton2_pressed():
	var amountOfIronAdded2 = $IronLineEdit2.text
	var theAmountOfIron2 = $IronScore2.text
	var newScoreIron2 = str(int(amountOfIronAdded2) + int(theAmountOfIron2))
	$IronScore2.text = newScoreIron2 + " / tyg"
	$IronLineEdit2.clear()
