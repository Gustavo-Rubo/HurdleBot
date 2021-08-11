extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.play_loop("menu_music")
	$StartMenu/AnimationPlayer.play("slide_in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Globals.state == Globals.states.GAME:
		Globals.score += delta
		$ScoreLabel.set_text("Score: " + String(int(Globals.score)))
		if Globals.score > Globals. high_score:
			Globals.high_score = Globals.score
			$HighScoreLabel.set_text("High Score: " + String(int(Globals.high_score)))


func _input(event):
	if Globals.state == Globals.states.START or Globals.state == Globals.states.DIED:
		if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
			
			if Globals.state == Globals.states.START:
				$StartMenu/AnimationPlayer.play_backwards("slide_in")
			
			if Globals.state == Globals.states.DIED:
				$DieMenu/AnimationPlayer.play_backwards("slide_in")
				
			Globals.state = Globals.states.GAME
			Globals.score = 0.0
			Globals.current_speed_multiplier_time = 1
			$Runner._input(event)
			$Robot.angle = $Robot.start_angle
			AudioManager.play_loop("game_music")
			
