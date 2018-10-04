tests
testLayoutChildWithVerticalFitContent

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c vertical fitContent ].
	
	self assert: child vResizing equals: #shrinkWrap