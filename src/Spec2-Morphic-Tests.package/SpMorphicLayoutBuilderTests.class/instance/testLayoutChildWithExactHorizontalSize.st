tests
testLayoutChildWithExactHorizontalSize

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c horizontal matchParent. "To reset default rigid sizing"
		c horizontal exact: 100 ].
	
	self assert: child width equals: 100.
	self assert: child hResizing equals: #rigid