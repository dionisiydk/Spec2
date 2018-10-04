Class {
	#name : #SpCommandPresenter,
	#superclass : #SpCompositePresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpCommandPresenter class >> buttonOn: aSpCommand [

	^self on: aSpCommand withStyle: #button
]

{ #category : #'instance creation' }
SpCommandPresenter class >> buttonOn: aBlock named: commandName [

	^self buttonOn: (aBlock asSpecCommand: commandName)
]

{ #category : #'instance creation' }
SpCommandPresenter class >> buttonOn: aBlock named: commandName iconName: iconName [

	^self buttonOn: (aBlock asSpecCommand: commandName iconName: iconName)
]

{ #category : #initialization }
SpCommandPresenter >> attachToModel [

]

{ #category : #initialization }
SpCommandPresenter >> attachToView [
	super attachToView.
	
"	view tooltip: model description."
	ui when: SpMouseClick on: view do: [ self executeCommand ]
]

{ #category : #accessing }
SpCommandPresenter >> command [
	^model command
]

{ #category : #initialization }
SpCommandPresenter >> createChildren [
	"Children are static components (label and icon) dependant from style"
]

{ #category : #initialization }
SpCommandPresenter >> executeCommand [
	
	model executeCommand
]

{ #category : #'styles-button' }
SpCommandPresenter >> lightSelectionColor [
	^ Color r: 175 g: 213 b: 250 range: 255
]

{ #category : #accessing }
SpCommandPresenter >> model: aCommandActivatorOrConvertable [
	super model: aCommandActivatorOrConvertable asCommandActivator
	
]

{ #category : #'styles-button' }
SpCommandPresenter >> setUpButtonStyle [
	<styleSpec>
	<forStyle: #button>
	view borderColor: ui theme darkBaseColor.
	view borderWidth: 1.
	view color: ui theme lightBaseColor.
	
	ui when: SpMouseDown on: view do: [ self applyStyle: #pressedButton ].
	ui when: SpMouseUp on: view do: [ self resetStyle ].
	ui when: SpMouseLeave on: view do: [ currentStyle = #pressedButton ifTrue: [self resetStyle] ].
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal; alignCenter.
		layout padding: 3@2.
		
		model menuItemIcon ifNotNil: [ :icon | 
			layout add: (SpImagePresenter on: icon) with: [ :c | 
				c fitContent; margin: 2@2 ]].
		layout add: (SpLabelPresenter textual: model menuItemName) with: [ :c | 
			c fitContent; margin: 2@2 ] ]
]

{ #category : #'styles-default' }
SpCommandPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	self setUpButtonStyle
]

{ #category : #'styles-button' }
SpCommandPresenter >> setUpIconicStyle [
	<styleSpec>
	<forStyle: #iconic>
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal.
				
		layout add: (SpImagePresenter on: model menuItemIcon) with: [ :c | 
			c fitContent ]]
]

{ #category : #'styles-button' }
SpCommandPresenter >> setUpPressedButtonStyle [
	<styleSpec>
	<forStyle: #pressedButton>
	
	self setUpButtonStyle.
	
	view color: self lightSelectionColor
]
