initialization
createChildren

	self field: [ model aspect x useSlot restriction: (SpNumberRestriction minValue: 100)].	
	self field: [ model aspect y useSlot].
	self field: [ model aspect isZero readOnly name: 'it is zero point'].