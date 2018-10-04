tests
testLayoutChildWithExactVerticalSize

	| child |
	child := Morph new.
	layout layoutChildView: child with: [ :c |
		c vertical matchParent. "To reset default rigid sizing"
		c vertical exact: 100 ].
	
	self assert: child height equals: 100.
	self assert: child vResizing equals: #rigid