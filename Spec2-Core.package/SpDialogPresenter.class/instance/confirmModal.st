controlling
confirmModal

	self build.
	ui openModal: self with: [:modalView | 
		applyingResultBlock := [ modalView close ]].
	
	(result isNil and: [self hasResultFor: SpCancelDialogCommand]) ifTrue: [ 
		result := self resultOptionFor: SpCancelDialogCommand ].
	^result