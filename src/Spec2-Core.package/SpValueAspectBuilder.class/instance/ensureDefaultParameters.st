building
ensureDefaultParameters
	defaultParametersAreSet ifTrue: [ ^self ].
	
	aspect setUpDefaultParameters.
	
	defaultParametersAreSet := true