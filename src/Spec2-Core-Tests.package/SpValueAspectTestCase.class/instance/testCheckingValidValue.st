tests
testCheckingValidValue
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	aspect := self aspectExample.
	aspect	
		restriction: (SpNumberRestriction minValue: 100 maxValue: 500).
	
	self assert: (aspect isValueValid: 300).
	self deny: (aspect isValueValid: 2)