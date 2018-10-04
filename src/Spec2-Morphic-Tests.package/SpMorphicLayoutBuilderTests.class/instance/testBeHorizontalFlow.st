tests-flow layout
testBeHorizontalFlow

	layout beFlow horizontal.
	
	self assert: morph layoutPolicy class equals: TableLayout.
	self assert: morph listDirection equals: #leftToRight.
	self assert: morph wrapDirection equals: #none