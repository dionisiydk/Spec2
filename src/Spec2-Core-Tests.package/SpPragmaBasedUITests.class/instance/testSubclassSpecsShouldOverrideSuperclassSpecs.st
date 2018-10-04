tests
testSubclassSpecsShouldOverrideSuperclassSpecs

	| presenter specs |
	presenter := SpPresenterStubSubclass new.
	specs := ui specs: SpStyleSpec of: presenter.
	
	self assert: specs size equals: 1.
	self assert: specs first definingMethod == (SpPresenterStubSubclass >> #overriddenStyle)