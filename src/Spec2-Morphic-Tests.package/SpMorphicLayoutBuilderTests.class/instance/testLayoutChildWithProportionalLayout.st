tests-proportional
testLayoutChildWithProportionalLayout

	| child |
	child := Morph new.
	layout beProportional.
	layout layoutChildView: child with: [ :c |
		c proportion rightFraction: 0.25 ].
	
	self assert: child layoutFrame rightFraction equals: 0.25