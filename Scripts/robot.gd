extends Node2D

export var lane = 1
export var start_angle = PI
var angle
var radius = Globals.SMALL_RADIUS + Globals.LANE_WIDTH*(1 + 2*lane)/2

var robot_speed_multiplier = 1.02
var speed = Globals.SPEEDS[1] * robot_speed_multiplier

var drop_chance = 0.45
var drop_period = 0.2
var time_since_last_drop = 0
var time_since_last_tick = 0

var hurdle_resource = load("res://Scenes/hurdle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(Globals.DISPLAY_WIDTH/2 + radius*cos(start_angle), Globals.DISPLAY_HEIGHT/2 + radius*sin(start_angle))
	rotation = start_angle
	angle = start_angle


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.state == Globals.states.GAME:
		speed = Globals.SPEEDS[1] * robot_speed_multiplier * Globals.current_speed_multiplier_time
		
		time_since_last_drop += delta
		time_since_last_tick += delta
		angle = angle + delta*(Globals.current_de_facto_speed - speed)
		rotation = angle
		position = Vector2(Globals.DISPLAY_WIDTH/2 + radius*cos(angle), Globals.DISPLAY_HEIGHT/2 + radius*sin(angle))
		
		if time_since_last_tick >= drop_period:
			time_since_last_tick = 0
			var roll = (randi()%10000)/10000.0
			if (roll < drop_chance * (1 + time_since_last_drop * 0.35)):
				time_since_last_drop = 0
				
				var drop_lane = randi() % 3
				
				var new_hurdle = hurdle_resource.instance()
				new_hurdle.init(drop_lane, angle + 0.4)
				get_parent().add_child(new_hurdle)
	
	else:
		speed = Globals.MENU_SPEED


func _on_RobotArea_area_entered(area):
	if (area.name == "HurdleArea"):
		get_parent().remove_child(area.get_parent().get_parent())
