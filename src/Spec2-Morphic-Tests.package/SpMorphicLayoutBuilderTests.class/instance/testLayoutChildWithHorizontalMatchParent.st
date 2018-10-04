tests
testLayoutChildWithHorizontalMatchParent

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c horizontal matchParent ].
	
	self assert: child hResizing equals: #spaceFill