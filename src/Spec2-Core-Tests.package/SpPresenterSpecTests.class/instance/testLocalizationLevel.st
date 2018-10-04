tests
testLocalizationLevel
	
	self assert: spec localizationLevel equals: 0.
	
	spec backendUI: SpStubUI.
	
	self assert: spec localizationLevel equals: 1.