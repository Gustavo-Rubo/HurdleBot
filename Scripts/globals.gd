extends Node

var SMALL_RADIUS = 150
var LANE_WIDTH = 40
var MENU_SPEED = 0.3
var MID_SPEED = 1.8
var SPEEDS = [
	MID_SPEED*(SMALL_RADIUS + LANE_WIDTH * 3/2)/(SMALL_RADIUS + LANE_WIDTH * 1/2), # High Speed
	MID_SPEED, # Mid Speed
	MID_SPEED*(SMALL_RADIUS + LANE_WIDTH * 3/2)/(SMALL_RADIUS + LANE_WIDTH * 5/2) # Low Speed
]

var current_speed = SPEEDS[1]
var current_speed_multiplier_hurdle = 1.0
var current_speed_multiplier_time = 1.0
var current_de_facto_speed

enum states {
	START,
	GAME,
	DIED
}
var state = states.START

var score = 0.0
var high_score = 0.0

var DISPLAY_WIDTH = ProjectSettings.get("display/window/size/width")
var DISPLAY_HEIGHT = ProjectSettings.get("display/window/size/height")

var Colors = {
	border = Color(0, 1, 0),
	lines = Color(0, 1, 0, 0.2)
}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if state == states.GAME:
		current_speed_multiplier_hurdle += delta*0.5
		if current_speed_multiplier_hurdle > 1: current_speed_multiplier_hurdle = 1
		
		current_speed_multiplier_time += delta*0.04
		if current_speed_multiplier_time > 2.55: current_speed_multiplier_time = 2.55
		
		current_de_facto_speed = current_speed * current_speed_multiplier_hurdle * current_speed_multiplier_time
	
	else:
		current_speed = MENU_SPEED
		current_de_facto_speed = MENU_SPEED
