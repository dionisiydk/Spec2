Class {
	#name : #SpUIContext,
	#superclass : #Object,
	#category : 'Spec2-Core-UI'
}

{ #category : #'instance creation' }
SpUIContext class >> fromClass: aClass [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
SpUIContext class >> fromClassName: classString [

	^self fromClass: (self environment classNamed: classString)
]

{ #category : #testing }
SpUIContext >> isSuitableFor: aPresenter [
	self subclassResponsibility 
]
