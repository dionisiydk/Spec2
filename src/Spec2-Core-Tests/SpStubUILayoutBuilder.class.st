Class {
	#name : #SpStubUILayoutBuilder,
	#superclass : #SpUILayoutBuilder,
	#category : 'Spec2-Core-Tests-StubUI'
}

{ #category : #private }
SpStubUILayoutBuilder >> addChildView: aViewStub [

	viewContainer contents add: aViewStub
]

{ #category : #'layout-alignment' }
SpStubUILayoutBuilder >> alignCenter [

]

{ #category : #'layout-alignment' }
SpStubUILayoutBuilder >> alignCenterLeft [

]

{ #category : #'layout strategies' }
SpStubUILayoutBuilder >> beFlow [

]

{ #category : #'layout strategies' }
SpStubUILayoutBuilder >> beProportional [

]

{ #category : #'layout strategies' }
SpStubUILayoutBuilder >> exact: aNumber [
]

{ #category : #'layout strategies' }
SpStubUILayoutBuilder >> fitContent [
]

{ #category : #'layout strategies' }
SpStubUILayoutBuilder >> horizontal [
]

{ #category : #private }
SpStubUILayoutBuilder >> layoutChildView: childView with: layoutBlock [

	layoutBlock value: self
]

{ #category : #'layout-insets' }
SpStubUILayoutBuilder >> margin: aPoint [ 

]

{ #category : #'layout strategies' }
SpStubUILayoutBuilder >> matchParent [
]

{ #category : #'layout-insets' }
SpStubUILayoutBuilder >> padding: aPoint [ 
	"Setup inside insets for viewContainer"
]

{ #category : #'layout strategies' }
SpStubUILayoutBuilder >> vertical [

]
