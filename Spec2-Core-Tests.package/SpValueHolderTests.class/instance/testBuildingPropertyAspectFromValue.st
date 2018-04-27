tests
testBuildingPropertyAspectFromValue

	| holder newAspect |
	holder := (2@3) aspect itself asValueHolder.

	newAspect := holder aspect x build.
	
	self assert: newAspect class equals: SpObjectPropertyAspect.	
	self assert: newAspect object equals: 2@3.
	self assert: newAspect readValue equals: 2