event handling
keyboardFocusChange: gotFocus
	super keyboardFocusChange: gotFocus.

	gotFocus ifFalse: [ self close ]