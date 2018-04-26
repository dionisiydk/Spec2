tests
testDoNotReactOnMouseClicksWhenModelIsReadOnly

	| currentValue |
	model valueAspect readOnly.
	presenter rebuild.
	currentValue := model value.
	
	ui simulate: SpMouseClick on: presenter view.
	self assert: model value equals: currentValue