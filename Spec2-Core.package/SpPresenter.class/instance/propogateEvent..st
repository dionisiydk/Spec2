event propogation
propogateEvent: anAnnouncement

	announcer ifNotNil: [ announcer announce: anAnnouncement ].
	parent ifNotNil: [ parent propogateEvent: anAnnouncement ]