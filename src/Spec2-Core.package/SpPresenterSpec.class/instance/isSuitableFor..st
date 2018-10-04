testing
isSuitableFor: aPresenter

	^contexts allSatisfy: [ :each | each isSuitableFor: aPresenter ]