*Spec2-Core
buildSpecToolbar: aToolbarLayout

	self isActive ifFalse: [ ^self].
	
	contents do: [ :each | each buildSpecToolbar: aToolbarLayout ]