Class {
	#name : #SpListValueDataSource,
	#superclass : #SpDataSource,
	#instVars : [
		'listHolder',
		'itemAspects'
	],
	#category : #'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpListValueDataSource class >> on: aListValueHolder [
	
	^self new 
		listHolder: aListValueHolder
]

{ #category : #initialization }
SpListValueDataSource >> initialize [
	super initialize.
	itemAspects := OrderedCollection new
]

{ #category : #accessing }
SpListValueDataSource >> itemAspects [
	^ itemAspects
]

{ #category : #accessing }
SpListValueDataSource >> itemAspects: anObject [
	itemAspects := anObject
]

{ #category : #accessing }
SpListValueDataSource >> listHolder [
	^ listHolder
]

{ #category : #accessing }
SpListValueDataSource >> listHolder: anObject [
	listHolder := anObject
]
