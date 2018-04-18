tests
testCreationOnInvalidModelShouldForceInvalidStyle
		
	| model |
	model := (2@3) aspect x 
		restriction: (SpNumberRestriction minValue: 100 maxValue: 1000); 
		asValueHolder.
	self deny: model isValid.
	
	presenter := SpValuePresenter on: model.
	
	self assert: presenter currentStyle equals: #invalid