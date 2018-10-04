tests
testLayoutChildWithGeneralFitContentStrategy

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c fitContent ].
	
	self assert: child hResizing equals: #shrinkWrap.
	self assert: child vResizing equals: #shrinkWrap