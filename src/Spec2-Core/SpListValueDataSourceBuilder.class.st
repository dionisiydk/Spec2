Class {
	#name : #SpListValueDataSourceBuilder,
	#superclass : #Object,
	#instVars : [
		'dataSource'
	],
	#category : #'Spec2-Core-Dataset'
}

{ #category : #'instance creation' }
SpListValueDataSourceBuilder class >> for: aListValueDataSource [
	^self new 
		dataSource: aListValueDataSource 
]

{ #category : #accessing }
SpListValueDataSourceBuilder >> dataSource [
	^ dataSource
]

{ #category : #accessing }
SpListValueDataSourceBuilder >> dataSource: anObject [
	dataSource := anObject
]
