tests
testApplyingResult
	| done result |
	done := false.
	result := SpOkDialogResult with: [ done := true ].
	
	presenter applyResult: result.
	
	self assert: presenter result equals: result.
	self assert: done