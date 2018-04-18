initialization
valueChanged: aValueChanged

	model isValid
		ifTrue: [ self resetStyle ] 
		ifFalse: [ self applyStyle: #invalid ]