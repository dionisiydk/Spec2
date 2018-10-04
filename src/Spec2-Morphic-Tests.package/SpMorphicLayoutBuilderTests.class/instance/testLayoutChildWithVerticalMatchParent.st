tests
testLayoutChildWithVerticalMatchParent

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c vertical matchParent ].
	
	self assert: child vResizing equals: #spaceFill