Extension { #name : #BlockClosure }

{ #category : #'*Spec2-Core' }
BlockClosure >> asAspectValueSetterOrNil [
	^nil
]

{ #category : #'*Spec2-Core' }
BlockClosure >> asSpecCommand: commandName [
	^SpPluggableCommand new
		block: self;
		name: commandName
]

{ #category : #'*Spec2-Core' }
BlockClosure >> asSpecCommand: commandName icon: aForm [
	^(self asSpecCommand: commandName)
		icon: aForm
]

{ #category : #'*Spec2-Core' }
BlockClosure >> asSpecCommand: commandName iconName: iconName [ 
	^(self asSpecCommand: commandName)
		iconName: iconName
]

{ #category : #'*Spec2-Core' }
BlockClosure >> aspect [
	^super aspect
		createComputedAspect
]

{ #category : #'*Spec2-Core' }
BlockClosure >> printAspectValueName [
	^'noname'
]

{ #category : #'*Spec2-Core' }
BlockClosure >> readAspectValueFrom: anObject [
	^self value: anObject
]

{ #category : #'*Spec2-Core' }
BlockClosure >> writeAspectValue: aValue to: anObject [
	^self value: anObject value: aValue
]
