Class {
	#name : #SpDataItemChildren,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #converting }
SpDataItemChildren >> asDataItemChildren [
	^self
]

{ #category : #accessing }
SpDataItemChildren >> createDataset [
	self subclassResponsibility 
]

{ #category : #testing }
SpDataItemChildren >> isEmpty [
	self subclassResponsibility 
]

{ #category : #accessing }
SpDataItemChildren >> name [
	^ name
]

{ #category : #accessing }
SpDataItemChildren >> name: anObject [
	name := anObject
]
