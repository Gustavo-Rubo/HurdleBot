extends Node2D

export var lane = 0
export var start_angle = PI
var angle
var radius

func init(l, a):
	lane = l
	start_angle = a

# Called when the node enters the scene tree for the first time.
func _ready():
	radius = Globals.SMALL_RADIUS + Globals.LANE_WIDTH*(1 + 2*lane)/2
	position = Vector2(Globals.DISPLAY_WIDTH/2 + radius*cos(start_angle), Globals.DISPLAY_HEIGHT/2 + radius*sin(start_angle))
	rotation = start_angle
	angle = start_angle


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	angle = angle + delta*Globals.current_de_facto_speed
	rotation = angle
	position = Vector2(Globals.DISPLAY_WIDTH/2 + radius*cos(angle), Globals.DISPLAY_HEIGHT/2 + radius*sin(angle))
	
