specs collection
collectSpecsFor: aPresenter
	"The result will be grouped by class"
	| all currentClass |
	all := Dictionary new.	
	
	currentClass := aPresenter class.
	[currentClass = Object] whileFalse: [
		self collectSpecsFor: currentClass on: all.
		currentClass := currentClass superclass].
	
	^all