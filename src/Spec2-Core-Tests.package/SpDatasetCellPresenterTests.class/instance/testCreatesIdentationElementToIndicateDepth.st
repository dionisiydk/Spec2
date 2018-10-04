tests
testCreatesIdentationElementToIndicateDepth
	
	| identationPane |
	model dataSourceItem depth: 101.
	presenter rebuild.
	
	identationPane := presenter view contents first.
	
	self assert: identationPane specPresenter isNil "it is just a pane".
	self assert: presenter view contents second specPresenter equals: presenter contentPresenter.