initialization
field: aBlockProducedAspect

	| newField |
	newField := SpFormFieldPresenter on: aBlockProducedAspect value.
	fields add: newField.
	^newField