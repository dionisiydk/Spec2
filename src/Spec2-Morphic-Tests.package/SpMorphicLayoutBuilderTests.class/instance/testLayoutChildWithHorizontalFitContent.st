tests
testLayoutChildWithHorizontalFitContent

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c horizontal fitContent ].
	
	self assert: child hResizing equals: #shrinkWrap