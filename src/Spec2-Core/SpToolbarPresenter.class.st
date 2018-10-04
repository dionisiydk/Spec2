Class {
	#name : #SpToolbarPresenter,
	#superclass : #SpCompositePresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #accessing }
SpToolbarPresenter >> commands [
	^children collect: [ :each | each command ]
]

{ #category : #initialization }
SpToolbarPresenter >> createChildren [
	"All my children are dynamic menu items build by Commander in context of parent presenter"
]

{ #category : #'styles-default' }
SpToolbarPresenter >> setUpDefaultStyle [
	<styleSpec>
	
	| menu |
	menu := SpToolbarActivation buildMenuInContext: parent createCommandContext.
	
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout alignCenter.
		
		menu buildSpecToolbar: layout
	]
]
