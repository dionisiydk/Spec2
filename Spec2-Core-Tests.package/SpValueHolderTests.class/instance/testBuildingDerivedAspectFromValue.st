tests
testBuildingDerivedAspectFromValue

	| holder newAspect |
	holder := (2@3) aspect itself asValueHolder.

	newAspect := holder aspect x build.
	
	self assert: newAspect class equals: SpDerivedValueAspect.	
	self assert: newAspect baseValueHolder equals: holder.
	self assert: newAspect value equals: 2