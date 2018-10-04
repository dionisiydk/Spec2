initialization
initialize
	super initialize.
	
	self beMultiple.
	items := #().
	indexCache := Dictionary new.
	announcer := Announcer new