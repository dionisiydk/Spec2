accessing
headerColumn: column
	^column wantsVisibleHeader 
		ifTrue: [ column buildHeader view]
		ifFalse: [ nil ]