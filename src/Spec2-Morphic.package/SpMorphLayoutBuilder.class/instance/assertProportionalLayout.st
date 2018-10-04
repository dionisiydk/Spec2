assertions
assertProportionalLayout

	parentMorph layoutPolicy isProportionalLayout ifTrue: [ ^self].
			
	self error: 'Parent morph should have proportional layout!'