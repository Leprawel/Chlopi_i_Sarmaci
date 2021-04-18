extends Node2D


var resource = {}
var manufacturer = {}
var date
var new_date
var score = 0
var new_score = 0
var size = 0
onready var elem = preload('res://Text.tscn')

func _input(event):
	if event is InputEventScreenDrag:
		print("drag", event.position)
		$Lista.position = event.position


func _physics_process(delta):
	var velocity = Vector2(0,0)
	if $Lista.position.y < -600:
		$Lista.position.y = -600
	if $Lista.position.y > 0:
		$Lista.position.y = 0
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 4
	if Input.is_action_pressed("ui_down"):
		velocity.y += 4
	if velocity.length() > 0:
		$Lista.position += velocity
	else:
		position += velocity * delta
		
func _ready():
	$Menu.hide()
	$Pancerni.hide()
	$Pancerni2.hide()
	$Resource.hide()
	$Lista.hide()
	date = OS.get_unix_time()



func _on_Start_button_pressed():
	$Start.hide()
	$Menu.show()

func _on_Add_pressed():
	$Menu.hide()
	$Pancerni.show()

func _on_Income_pressed():
	$Menu.hide()
	$Pancerni2.show()

func _on_Resource_pressed():
	$Menu.hide()
	$Resource.show()
	$Lista.show()
	print($Lista.position)
	var n = 0
	for i in resource.keys():
		var newElement = elem.instance()
		newElement.setText(i,resource[i])
		newElement.position = Vector2(0,n*100)
		$Lista.add_child(newElement)
		n += 1
	



func _on_Arrow__pressed():
	$Menu.show()
	$Lista.hide()
	$Resource.hide()
	delete_children($Lista)


func _on_Arrow_menu3_pressed():
	$Menu.show()
	$Pancerni.hide()
	$Lista.hide()

func _on_Arrow_menu8_pressed():
	$Menu.show()
	$Pancerni2.hide()



func Pancerni_add(): 
	if resource.has($Pancerni/Resource.text):
		resource[$Pancerni/Resource.text] += int($Pancerni/Value.text)
	else :
		resource[$Pancerni/Resource.text] = int($Pancerni/Value.text)
	size = resource.size()
	$Pancerni/Resource.clear()
	$Pancerni/Value.clear()


func Pancerni2_add():
	if manufacturer.has($Pancerni2/Resource2.text):
		manufacturer[$Pancerni2/Resource2.text] += int($Pancerni2/Value2.text)
	else :
		manufacturer[$Pancerni2/Resource2.text] = int($Pancerni2/Value2.text)
	$Pancerni2/Resource2.clear()
	$Pancerni2/Value2.clear()

func Refresh_date():
	new_date = OS.get_unix_time()
	score = new_date - date
	new_score += score
	date = new_date
	while new_score >= 20:
		for item in resource:
			if manufacturer.has(item):
				resource[item] += manufacturer[item]
		new_score -= 20
	print(resource)
	print(new_score)


func delete_children(node):
	for i in node.get_children():
		i.queue_free()


