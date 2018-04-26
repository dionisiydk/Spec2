accessing
rawValue: aValue
	super rawValue: aValue.
	
	(valueAspect allowsAutoAcceptValues and: [valueAspect isValueValid: aValue])
		ifTrue: [ self acceptValue]