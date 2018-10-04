assertions
assertHorizontalFlowLayout

	(parentMorph layoutPolicy isTableLayout
		and: [parentMorph listDirection = #leftToRight]) 
			ifTrue: [ ^self].
			
	self error: 'Parent morph should have horizontal flow layout'