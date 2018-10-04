*Spec2-Core
asAspectValueSetterOrNil
	^self isUnary 
		ifTrue: [ (self, ':') asSymbol]
		ifFalse: [ nil ]