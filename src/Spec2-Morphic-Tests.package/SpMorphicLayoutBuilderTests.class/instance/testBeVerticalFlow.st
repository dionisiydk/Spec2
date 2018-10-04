tests-flow layout
testBeVerticalFlow

	layout beFlow vertical.
	
	self assert: morph layoutPolicy class equals: TableLayout.
	self assert: morph listDirection equals: #topToBottom.
	self assert: morph wrapDirection equals: #none