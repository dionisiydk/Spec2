accessing
manualSelection
	^selections detect: [ :each | each isKindOf: SpManualSelection ]