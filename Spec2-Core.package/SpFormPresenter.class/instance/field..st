initialization
field: aBlockProducedAspect

	| newField |
	newField := SpValuePresenter on: aBlockProducedAspect value.
	fields add: newField.
	^newField