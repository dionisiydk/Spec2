building
buildBy: aBlock
	super buildBy: aBlock.

	(viewContainer layoutPolicy notNil and: [viewContainer layoutPolicy isProportionalLayout]) 
		ifTrue: [ viewContainer addPaneSplitters ]