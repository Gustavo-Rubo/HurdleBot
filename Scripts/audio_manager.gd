extends Node

var JumpPlayer
var HitPlayer
var LoopPlayer

# Audio preloads
var Audio = {
	# Effects:
#	hit_hurdle = preload("res://Audio/hit_hurdle.wav"),
#	die = preload("res://Audio/die.wav"),
#	switch_lane = preload("res://Audio/switch_lane.wav"),
	hit_hurdle = preload("res://Audio/sfxhit.wav"),
	die = preload("res://Audio/sfxdeath2.wav"),
	switch_lane = preload("res://Audio/sfxjump.wav"),
	
	# Music
	game_music = preload("res://Audio/hurdletrack1.ogg"),
	menu_music = preload("res://Audio/hurdletrack2.ogg")
	
	# Buttons
#	button_start = preload()
}

func play_jump(effect):
	JumpPlayer.set_stream(Audio[effect])
	JumpPlayer.play()

func play_hit(button):
	HitPlayer.set_stream(Audio[button])
	HitPlayer.play()
	
func play_loop(loop):
	if LoopPlayer.get_stream() != Audio[loop] or !LoopPlayer.playing:
		LoopPlayer.set_stream(Audio[loop])
		LoopPlayer.play()

func stop_loop():
	LoopPlayer.stop()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	
	JumpPlayer = AudioStreamPlayer.new()
	JumpPlayer.set_bus("Sfx")
	HitPlayer = AudioStreamPlayer.new()
	HitPlayer.set_bus("Sfx")
	LoopPlayer = AudioStreamPlayer.new()
	LoopPlayer.set_bus("Music")

	add_child(JumpPlayer)
	add_child(HitPlayer)
	add_child(LoopPlayer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	print(ConnectionPlayer.playing)
