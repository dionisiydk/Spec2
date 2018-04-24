accessing
rawValue: aValue
	super rawValue: aValue.
	
	(aspect allowsAutoAcceptValues and: [aspect isValueValid: aValue])
		ifTrue: [ self acceptValue]