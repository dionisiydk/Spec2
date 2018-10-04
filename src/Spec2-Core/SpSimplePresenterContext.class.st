Class {
	#name : #SpSimplePresenterContext,
	#superclass : #CmdToolContext,
	#category : 'Spec2-Core-Commands'
}

{ #category : #testing }
SpSimplePresenterContext >> representsSimpleAnnotationUser: someUserClass [

	^(super representsSimpleAnnotationUser: someUserClass)
		or: [tool isKindOf: someUserClass]
]
