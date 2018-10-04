styles-default
layoutExpansionButtonOn: aLayout

	model isExpandable	ifTrue: [ 
		aLayout add: self createExpansionButton with: [ :c | 
			c margin: 3@0.
			c horizontal fitContent.
			c vertical fitContent].
		^self].
	
	aLayout addPanelWith: [ :c | 
		c margin: 3@0.
		c horizontal exact: 9.
		c vertical matchParent ]