Extension { #name : #Symbol }

{ #category : #'*Spec2-Core' }
Symbol >> asAspectSlotGetterOf: aClass [
	^aClass slotNamed: self
]

{ #category : #'*Spec2-Core' }
Symbol >> asAspectValueSetterOrNil [
	^self isUnary 
		ifTrue: [ (self, ':') asSymbol]
		ifFalse: [ nil ]
]

{ #category : #'*Spec2-Core' }
Symbol >> printAspectValueName [
	^self asString
]

{ #category : #'*Spec2-Core' }
Symbol >> readAspectValueFrom: anObject [
	^anObject perform: self
]

{ #category : #'*Spec2-Core' }
Symbol >> writeAspectValue: aValue to: anObject [
	^anObject perform: self with: aValue
]
