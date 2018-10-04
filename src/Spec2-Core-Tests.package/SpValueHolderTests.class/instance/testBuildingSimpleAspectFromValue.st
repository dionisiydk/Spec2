tests
testBuildingSimpleAspectFromValue

	| holder newAspect |
	holder := (2@3) aspect itself asValueHolder.

	newAspect := holder aspect itself build.
	
	self assert: newAspect class equals: SpSimpleValueAspect.	
	self assert: newAspect value equals: 2@3