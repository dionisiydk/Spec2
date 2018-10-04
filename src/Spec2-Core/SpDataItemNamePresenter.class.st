Class {
	#name : #SpDataItemNamePresenter,
	#superclass : #SpCompositePresenter,
	#instVars : [
		'itemNamePresenter'
	],
	#category : 'Spec2-Core-Dataset'
}

{ #category : #initialization }
SpDataItemNamePresenter >> createChildren [
	
	itemNamePresenter := SpLabelPresenter textual: model name
]

{ #category : #'styles-default' }
SpDataItemNamePresenter >> setUpDefaultStyle [
	<styleSpec>
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal.

		layout add: itemNamePresenter with: [ :c |
			c vertical fitContent ]
	 ]
]
