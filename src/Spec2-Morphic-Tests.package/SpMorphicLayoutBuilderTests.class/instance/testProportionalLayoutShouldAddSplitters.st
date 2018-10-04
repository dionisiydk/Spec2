tests-proportional
testProportionalLayoutShouldAddSplitters

	| child |
	layout beProportional.
	layout buildBy: [ 
		child := Morph new.
		layout layoutChildView: child with: [ :c |
			c proportion rightFraction: 0.25 ].
		morph addMorphBack: child.
		child := Morph new.
		layout layoutChildView: child with: [ :c |
			c proportion leftFraction: 0.25 ].
		morph addMorphBack: child].
	
	self assert: (morph findA: ProportionalSplitterMorph) notNil