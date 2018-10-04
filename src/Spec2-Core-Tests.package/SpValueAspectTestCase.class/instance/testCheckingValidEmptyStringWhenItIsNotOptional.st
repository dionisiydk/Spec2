tests
testCheckingValidEmptyStringWhenItIsNotOptional
	
	aspect := self aspectExample.
	aspect	
		optional
		emptyValues: #(nil '');
		restriction: SpEmptyTextRestriction not.
	
	self assert: (aspect isValueValid: '').
	aspect emptyValues: #().
	self deny: (aspect isValueValid: '').