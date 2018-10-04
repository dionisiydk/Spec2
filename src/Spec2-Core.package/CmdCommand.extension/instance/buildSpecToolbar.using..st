*Spec2-Core
buildSpecToolbar: aToolbarLayout using: aCommandActivator
	
	| presenter |
	presenter := self createSpecToolbarItemFor: aCommandActivator.
	
	aToolbarLayout add: presenter with: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ]