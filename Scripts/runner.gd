extends AnimatedSprite

var init_pos = Vector2(Globals.DISPLAY_WIDTH/2 + Globals.SMALL_RADIUS + Globals.LANE_WIDTH*3/2, Globals.DISPLAY_HEIGHT/2)

var lane = 1 # middle lane

var lane_positions = [
	Vector2(Globals.DISPLAY_WIDTH/2 + Globals.SMALL_RADIUS + Globals.LANE_WIDTH*1/2, Globals.DISPLAY_HEIGHT/2),
	Vector2(Globals.DISPLAY_WIDTH/2 + Globals.SMALL_RADIUS + Globals.LANE_WIDTH*3/2, Globals.DISPLAY_HEIGHT/2),
	Vector2(Globals.DISPLAY_WIDTH/2 + Globals.SMALL_RADIUS + Globals.LANE_WIDTH*5/2, Globals.DISPLAY_HEIGHT/2)
]

# Called when the node enters the scene tree for the first time.
func _ready():
	position = init_pos
	
func _input(event):
	if Globals.state == Globals.states.GAME and (event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right")):
		if event.is_action_pressed("ui_left"):
			if (lane > 0):
				lane -= 1
			
		elif event.is_action_pressed("ui_right"):
			if (lane < 2):
				lane += 1
		
		AudioManager.play_jump("switch_lane")
		$Tween.interpolate_property($".", "position", position, lane_positions[lane], 0.04)
		$Tween.start()
		Globals.current_speed = Globals.SPEEDS[lane]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if Globals.state == Globals.states.GAME:
		if (area.name == "RobotArea"):
			AudioManager.play_hit("die")
			Globals.state = Globals.states.DIED
			get_parent().get_node("DieMenu/AnimationPlayer").play("slide_in")
			AudioManager.play_loop("menu_music")
		
		elif (area.name == "HurdleArea"):
			AudioManager.play_hit("hit_hurdle")
			get_parent().remove_child(area.get_parent().get_parent())
			Globals.current_speed_multiplier_hurdle = 0.33
