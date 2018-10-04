Class {
	#name : #SpSubmitDialogCommand,
	#superclass : #SpDialogCommand,
	#category : 'Spec2-Core-Commands'
}

{ #category : #testing }
SpSubmitDialogCommand class >> canBeExecutedInContext: aPresenterPresenter [
	"Dialog commands are tightly bound to dialog presenter
	which uses simple tool context to pass itself to command activation methods"
	(super canBeExecutedInContext: aPresenterPresenter) ifFalse: [ ^false ].
	
	^aPresenterPresenter tool showsValidData
]

{ #category : #activation }
SpSubmitDialogCommand class >> menuOrder [
	^1
]

{ #category : #activation }
SpSubmitDialogCommand class >> shortcutActivation [
	<classAnnotation>
	
	^CmdShortcutActivation by: Character enter asShortcut for: SpDialogPresenter
]

{ #category : #activation }
SpSubmitDialogCommand class >> shortcutActivation2 [
	<classAnnotation>
	
	^CmdShortcutActivation by: Character enter meta for: SpDialogPresenter
]

{ #category : #activation }
SpSubmitDialogCommand class >> shortcutActivation3 [
	<classAnnotation>
	
	^CmdShortcutActivation by: $s meta for: SpDialogPresenter
]

{ #category : #accessing }
SpSubmitDialogCommand >> defaultMenuItemName [
	^'Ok'
]

{ #category : #execution }
SpSubmitDialogCommand >> execute [
	dialog submitData.
	super execute.
	
]
