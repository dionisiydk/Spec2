instance creation
forBlock: aBlock
	^(self for: aBlock)
		createComputedAspect;
		yourself