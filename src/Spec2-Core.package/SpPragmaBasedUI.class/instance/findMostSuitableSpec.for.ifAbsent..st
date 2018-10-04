accessing
findMostSuitableSpec: aSpecClass for: aPresenter ifAbsent: absentBlock
		
	| targetSpecs suitableSpecs |
	targetSpecs := self specs: aSpecClass of: aPresenter.
	suitableSpecs := targetSpecs select: [ :each | each isSuitableFor: aPresenter ].
	suitableSpecs ifEmpty: [ ^absentBlock value ].
	
	^suitableSpecs detectMax: [ :each | each localizationLevel ]