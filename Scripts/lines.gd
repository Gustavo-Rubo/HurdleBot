extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(Globals.DISPLAY_WIDTH/2, Globals.DISPLAY_HEIGHT/2)

func _draw():
	for i in range(13):
		var angle = i*2*PI/13
		draw_line(Vector2(Globals.SMALL_RADIUS*cos(angle), Globals.SMALL_RADIUS*sin(angle)), Vector2((Globals.SMALL_RADIUS + 3*Globals.LANE_WIDTH)*cos(angle), (Globals.SMALL_RADIUS + 3*Globals.LANE_WIDTH)*sin(angle)), Globals.Colors.lines, 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += delta*Globals.current_de_facto_speed
