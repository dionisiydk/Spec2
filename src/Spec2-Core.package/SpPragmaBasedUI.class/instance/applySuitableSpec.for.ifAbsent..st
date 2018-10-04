presenter building
applySuitableSpec: aSpecClass for: aPresenter ifAbsent: absentBlock
		
	| suitableSpec |
	suitableSpec := self findMostSuitableSpec: aSpecClass for: aPresenter ifAbsent: absentBlock. 
		
	suitableSpec applyTo: aPresenter