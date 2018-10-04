assertions
assertVerticalFlowLayout

	(parentMorph layoutPolicy isTableLayout
		and: [parentMorph listDirection = #topToBottom]) 
			ifTrue: [ ^self].
			
	self error: 'Parent morph should have vertical flow layout!'