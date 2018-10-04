presenter building
setUpViewFor: aPresenter
	
	self applySuitableSpec: SpViewSpec for: aPresenter ifAbsent: [
		^self setUpUndefinedViewFor: aPresenter].
	
	self applySuitableSpec: SpStyleSpec for: aPresenter ifAbsent: [^self]