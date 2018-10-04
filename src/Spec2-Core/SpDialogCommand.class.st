Class {
	#name : #SpDialogCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'dialog',
		'result'
	],
	#category : 'Spec2-Core-Commands'
}

{ #category : #testing }
SpDialogCommand class >> canBeExecutedInContext: aPresenterContext [
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	(super canBeExecutedInContext: aPresenterContext) ifFalse: [ ^false ].
	
	^aPresenterContext tool hasResultFor: self
]

{ #category : #activation }
SpDialogCommand class >> menuOrder [
	<classAnnotationDependency>
	self subclassResponsibility 
]

{ #category : #activation }
SpDialogCommand class >> toolbarActivation [
	<classAnnotation>
	
	^SpToolbarActivation byRootGroupItemOrder: self menuOrder for: SpDialogPresenter
]

{ #category : #accessing }
SpDialogCommand >> defaultMenuItemName [

	^result displayString
]

{ #category : #accessing }
SpDialogCommand >> dialog [
	^ dialog
]

{ #category : #accessing }
SpDialogCommand >> dialog: anObject [
	dialog := anObject
]

{ #category : #execution }
SpDialogCommand >> execute [
	dialog applyResult: result
]

{ #category : #execution }
SpDialogCommand >> readParametersFromContext: aPresenterContext [
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	super readParametersFromContext: aPresenterContext.
	
	dialog := aPresenterContext tool.
	(dialog hasResultFor: self class)	ifTrue: [ 
		result := dialog resultOptionFor: self class]
]
