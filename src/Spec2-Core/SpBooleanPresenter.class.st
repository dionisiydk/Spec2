Class {
	#name : #SpBooleanPresenter,
	#superclass : #SpValueInputPresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpBooleanPresenter class >> checkbox [

	^self new 
		mainStyle: #checkbox
]

{ #category : #'instance creation' }
SpBooleanPresenter class >> checkboxOn: aValueHolder [

	^self checkbox 
		model: aValueHolder
]

{ #category : #'instance creation' }
SpBooleanPresenter class >> radioButton [

	^self new 
		mainStyle: #radioButton
]

{ #category : #'instance creation' }
SpBooleanPresenter class >> radioButtonOn: aValueHolder [

	^self radioButton 	
		model: aValueHolder
]

{ #category : #initialization }
SpBooleanPresenter >> attachToModel [
	super attachToModel.
	
	model whenChangedSend: #modelChanged to: self
]

{ #category : #initialization }
SpBooleanPresenter >> createChildren [
	"Only child is dynamic icon dependant from model value"
]

{ #category : #'event handling' }
SpBooleanPresenter >> modelChanged [

	self rebuild.
	
	self propogateChanges
]

{ #category : #'styles-default' }
SpBooleanPresenter >> setUpCheckboxStyle [
	"No there is no icon for readonly mode. So we simply do not handle clicks.
	Notice that in CheckboxMorph implement disable state directly in drawOn method. Owful"
	<styleSpec>
	<forStyle: #checkbox>
	
	self setUpStyleWithTrueIcon: #checkboxSelected falseIcon: #checkboxUnselected
]

{ #category : #'styles-default' }
SpBooleanPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	self setUpCheckboxStyle
]

{ #category : #'styles-default' }
SpBooleanPresenter >> setUpRadioButtonStyle [
	"No there is no icon for readonly mode. So we simply do not handle clicks.
	Notice that in CheckboxMorph implement disable state directly in drawOn method. Owful"
	<styleSpec>
	<forStyle: #radioButton>
	
	self setUpStyleWithTrueIcon: #radioButtonSelected falseIcon: #radioButtonUnselected
]

{ #category : #'styles-default' }
SpBooleanPresenter >> setUpStyleWithTrueIcon: trueIconName falseIcon: falseIconName [
	"No there is no icon for readonly mode. So we simply do not handle clicks.
	Notice that in CheckboxMorph implement disable state directly in drawOn method. Owful"
	| iconName |
	model isReadOnly ifFalse: [	
		ui when: SpMouseClick on: view do: [ self toggleValue]].	
	
	iconName := model value ifTrue: [ trueIconName ] ifFalse: [ falseIconName ].
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout add: (SpLabelPresenter iconic: iconName) with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
	]
]

{ #category : #controlling }
SpBooleanPresenter >> toggleValue [

	model value: model value not
]
