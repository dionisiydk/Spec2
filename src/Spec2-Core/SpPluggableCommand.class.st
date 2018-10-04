Class {
	#name : #SpPluggableCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'block',
		'name',
		'icon'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpPluggableCommand >> block [
	^ block
]

{ #category : #accessing }
SpPluggableCommand >> block: anObject [
	block := anObject
]

{ #category : #accessing }
SpPluggableCommand >> defaultMenuIcon [
	^ icon
]

{ #category : #accessing }
SpPluggableCommand >> defaultMenuItemName [
	^ name
]

{ #category : #execution }
SpPluggableCommand >> execute [
	block value
]

{ #category : #accessing }
SpPluggableCommand >> icon [
	^ icon
]

{ #category : #accessing }
SpPluggableCommand >> icon: aForm [
	icon := aForm
]

{ #category : #accessing }
SpPluggableCommand >> iconName: aString [
	icon := self class iconNamed: aString
]

{ #category : #accessing }
SpPluggableCommand >> name [
	^ name
]

{ #category : #accessing }
SpPluggableCommand >> name: anObject [
	name := anObject
]
