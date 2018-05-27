tests
testChangesSubscription
	| executed |
	executed := false.
	
	dataset whenChangedSend: #value to: [ executed := true ].
	
	dataset announceChanges.
	
	self assert: executed.