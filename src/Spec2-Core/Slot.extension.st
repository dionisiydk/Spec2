Extension { #name : #Slot }

{ #category : #'*Spec2-Core' }
Slot >> asAspectValueSetterOrNil [
	^self
]

{ #category : #'*Spec2-Core' }
Slot >> printAspectValueName [
	^self name
]

{ #category : #'*Spec2-Core' }
Slot >> readAspectValueFrom: anObject [
	^self read: anObject
]

{ #category : #'*Spec2-Core' }
Slot >> writeAspectValue: aValue to: anObject [
	self write: aValue to: anObject
]
