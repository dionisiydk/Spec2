tests
testBuildingCompositePresenterWithComplexLayout

	| presenter container1 container2 |
	presenter := SpMultiLabelPresenterExample on: #testModel withStyle: #complexLayout.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpCompositeViewStub.
	self assert: presenter view contents size equals: 2.
	
	container1 := presenter view contents first.
	self assert: container1 class equals: SpCompositeViewStub.
	self assert: container1 contents first class equals: SpLabelViewStub.
	self assert: container1 contents first name equals: #defaultLabel.
	
	container2 := presenter view contents last.
	self assert: container2 class equals: SpCompositeViewStub.
	self assert: container2 contents first class equals: SpLabelViewStub.
	self assert: container2 contents first name equals: #specialLabel