extends Spatial

export (float) var speed = 0.002
var movement_vector = Vector3(0, -1, 0)
var FLOOR = -75.0;

func _ready():
	$RB_Food.connect("body_entered", self, "_on_select_collision")
	$AnimationPlayer.play("default")
	#self.connect("area_entered", self, "_on_collision")

func _process(delta):
	self.transform.origin += movement_vector * speed
	if self.transform.origin.y < FLOOR:
		speed = 0

func _set_position(value):
	self.transform.origin = value

func _set_scale(scala):
	self.scale = Vector3(scala, scala, scala)

func _on_select_collision(area):

	#print("Food Collision: ", area.name,' ', self.name)
	
	if area.name.find("Fish") != -1:
		self.visible = false
		self.get_parent().remove_child(self)
		
	if area.name.find("Snail") != -1:
		self.visible = false
		
	if area.name.find("Down limit") != -1:
		speed = 0
		$AnimatedSprite.stop()