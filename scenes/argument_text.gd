extends Label

func set_argument(txt, c):
	text = txt
	if c == 1:
		add_theme_color_override("font_color", Color.MEDIUM_BLUE)
	elif c == 2:
		add_theme_color_override("font_color", Color.CRIMSON)
