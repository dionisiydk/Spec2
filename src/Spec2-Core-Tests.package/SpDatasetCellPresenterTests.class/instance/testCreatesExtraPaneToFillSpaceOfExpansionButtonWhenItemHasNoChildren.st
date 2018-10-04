tests
testCreatesExtraPaneToFillSpaceOfExpansionButtonWhenItemHasNoChildren
	
	| extraPane |
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	self deny: model isExpandable.
	presenter rebuild.
	
	extraPane := presenter view contents first.
	
	self assert: extraPane specPresenter isNil "it is just a pane".
	self assert: presenter view contents second specPresenter equals: presenter contentPresenter.