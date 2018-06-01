initialization
initialize
	super initialize.
	
	self beMultiple.
	items := #().
	indexCache := #().
	announcer := Announcer new