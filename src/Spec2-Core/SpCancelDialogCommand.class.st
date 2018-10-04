Class {
	#name : #SpCancelDialogCommand,
	#superclass : #SpDialogCommand,
	#category : 'Spec2-Core-Commands'
}

{ #category : #activation }
SpCancelDialogCommand class >> menuOrder [
	^2
]

{ #category : #activation }
SpCancelDialogCommand class >> shortcutActivation [
	<classAnnotation>
	
	^CmdShortcutActivation by: Character escape asShortcut for: SpDialogPresenter
]

{ #category : #activation }
SpCancelDialogCommand class >> shortcutActivation2 [
	<classAnnotation>
	
	^CmdShortcutActivation by: $w meta for: SpDialogPresenter
]

{ #category : #accessing }
SpCancelDialogCommand >> defaultMenuItemName [
	^'Cancel'
]
