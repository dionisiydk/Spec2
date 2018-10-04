tests-flow layout
testLayoutChildMargin

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c margin: 2@3 ].
	
	self assert: morph cellInset equals: 2@3