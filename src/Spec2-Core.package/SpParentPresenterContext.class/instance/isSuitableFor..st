testing
isSuitableFor: aPresenter

	| parent |
	parent := aPresenter parent.
	[ parent notNil] whileTrue: [ 
		(self isSuitableForParent: parent) ifTrue: [ ^true ].
		parent := parent parent].
	
	^false