aspect definitions
doesNotUnderstand: aMessage

	aspect 
		ifNil: [ 	self createPropertyAspectFrom: aMessage ]
		ifNotNil: [ 
			self ensureDefaultParameters.
			aMessage sendTo: aspect]