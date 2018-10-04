tests
testBuildingCompositePresenter

	| presenter label1 label2 |
	presenter := SpMultiLabelPresenterExample new.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpCompositeViewStub.
	self assert: presenter view contents size equals: 2.
	
	label1 := presenter view contents first.
	self assert: label1 class equals: SpLabelViewStub.
	self assert: label1 name equals: #defaultLabel.
	
	label2 := presenter view contents last.
	self assert: label2 class equals: SpLabelViewStub.
	self assert: label2 name equals: #specialLabel.