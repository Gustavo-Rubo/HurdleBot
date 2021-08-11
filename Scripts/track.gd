tool

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _draw():
	draw_arc(Vector2(Globals.DISPLAY_WIDTH/2, Globals.DISPLAY_HEIGHT/2), Globals.SMALL_RADIUS + Globals.LANE_WIDTH * 0, 0, 2*PI, 40, Globals.Colors.border, 2)
	draw_arc(Vector2(Globals.DISPLAY_WIDTH/2, Globals.DISPLAY_HEIGHT/2), Globals.SMALL_RADIUS + Globals.LANE_WIDTH * 1, 0, 2*PI, 40, Globals.Colors.border, 2)
	draw_arc(Vector2(Globals.DISPLAY_WIDTH/2, Globals.DISPLAY_HEIGHT/2), Globals.SMALL_RADIUS + Globals.LANE_WIDTH * 2, 0, 2*PI, 40, Globals.Colors.border, 2)
	draw_arc(Vector2(Globals.DISPLAY_WIDTH/2, Globals.DISPLAY_HEIGHT/2), Globals.SMALL_RADIUS + Globals.LANE_WIDTH * 3, 0, 2*PI, 40, Globals.Colors.border, 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
