controlling
announceChanges
	announcer announce: ValueChanged.
	parentItem ifNotNil: [ parentItem propogateChildrenChanges ]