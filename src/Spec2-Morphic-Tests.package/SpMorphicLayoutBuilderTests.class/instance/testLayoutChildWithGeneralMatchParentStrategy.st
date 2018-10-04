tests
testLayoutChildWithGeneralMatchParentStrategy

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c matchParent ].
	
	self assert: child hResizing equals: #spaceFill.
	self assert: child vResizing equals: #spaceFill