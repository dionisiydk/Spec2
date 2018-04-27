controlling
confirmModalFrom: aView

	self build.
	ui openModal: self from: aView with: [:modalView | 
		applyingResultBlock := [ modalView close ]].
	
	(result isNil and: [self hasResultFor: SpCancelDialogCommand]) ifTrue: [ 
		result := self resultOptionFor: SpCancelDialogCommand ].
	^result