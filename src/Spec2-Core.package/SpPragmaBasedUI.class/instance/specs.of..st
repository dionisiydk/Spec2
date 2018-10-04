accessing
specs: aSpecClass of: aPresenter

	| allSpecs |
	allSpecs := presenterSpecs at: aPresenter class ifAbsentPut: [ 
		self collectSpecsFor: aPresenter ].
	^allSpecs at: aSpecClass ifAbsent: [ #() ]