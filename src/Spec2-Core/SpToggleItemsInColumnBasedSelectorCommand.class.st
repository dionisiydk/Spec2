Class {
	#name : #SpToggleItemsInColumnBasedSelectorCommand,
	#superclass : #CmdCommand,
	#instVars : [
		'valueSelectorPresenter'
	],
	#category : 'Spec2-Core-Commands'
}

{ #category : #activation }
SpToggleItemsInColumnBasedSelectorCommand class >> shortcutActivation [
	<classAnnotation>
	
	^CmdShortcutActivation by: Character space asShortcut for: SpColumnBasedValueSelectorPresenter 
]

{ #category : #execution }
SpToggleItemsInColumnBasedSelectorCommand >> execute [
	
	valueSelectorPresenter toggleSelectedItems
]

{ #category : #execution }
SpToggleItemsInColumnBasedSelectorCommand >> prepareFullExecutionInContext: aToolContext [
	super prepareFullExecutionInContext: aToolContext.
	
	valueSelectorPresenter := aToolContext tool
]
