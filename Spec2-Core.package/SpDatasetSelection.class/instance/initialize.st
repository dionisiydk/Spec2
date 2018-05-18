initialization
initialize
	super initialize.
	
	self beMultiple.
	items := #().
	announcer := Announcer new