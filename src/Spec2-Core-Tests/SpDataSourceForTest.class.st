Class {
	#name : #SpDataSourceForTest,
	#superclass : #SpSimpleDataSource,
	#instVars : [
		'wasOpened',
		'wasClosed'
	],
	#category : 'Spec2-Core-Tests-Examples'
}

{ #category : #controlling }
SpDataSourceForTest >> close [
	wasClosed := true
]

{ #category : #initialization }
SpDataSourceForTest >> initialize [
	super initialize.
	
	wasOpened := false.
	wasClosed := false
]

{ #category : #controlling }
SpDataSourceForTest >> open [
	wasOpened := true
]

{ #category : #testing }
SpDataSourceForTest >> wasClosed [
	^ wasClosed
]

{ #category : #testing }
SpDataSourceForTest >> wasOpened [
	^ wasOpened
]
