Extension { #name : #Message }

{ #category : #'*Spec2-Core' }
Message >> asAspectSlotGetterOf: aClass [
	^aClass slotNamed: selector
]

{ #category : #'*Spec2-Core' }
Message >> asAspectValueSetterOrNil [
	^selector asAspectValueSetterOrNil
]

{ #category : #'*Spec2-Core' }
Message >> printAspectValueName [
	^self printString
]

{ #category : #'*Spec2-Core' }
Message >> readAspectValueFrom: anObject [
	^self sendTo: anObject
]
