*Spec2-Core
buildSpecToolbar: aToolbarLayout

	self canExecuteCommand ifFalse: [ ^self ].
	
	command buildSpecToolbar: aToolbarLayout using: self