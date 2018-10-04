tests
testBuildingPresenterWhichHasNoViewDefined

	| presenter |
	presenter := SpPresenterStub new. 
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpViewStub.
	self assert: presenter view name equals: #undefinedView