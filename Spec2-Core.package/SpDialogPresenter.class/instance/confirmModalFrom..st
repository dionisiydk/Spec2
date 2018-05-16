controlling
confirmModalFrom: aView
	
	self build.
	ui openModal: self over: aView with: [:modalView | 
		applyingResultBlock := [ modalView close ]].
	
	(result isNil and: [self hasResultFor: SpCancelDialogCommand]) ifTrue: [ 
		result := self resultOptionFor: SpCancelDialogCommand ].
	self detachFromModel. "Cleanup all subscriptions on model from itself and children"
	^result