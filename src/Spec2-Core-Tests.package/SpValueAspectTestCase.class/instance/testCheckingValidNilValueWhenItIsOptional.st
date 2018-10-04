tests
testCheckingValidNilValueWhenItIsOptional
	
	aspect := self aspectExample.
	aspect	
		optional
		restriction: (SpNumberRestriction minValue: 100 maxValue: 500).
			
	self assert: (aspect isValueValid: nil)