Class {
	#name : #SpIconicLabelPresenter,
	#superclass : #SpLabelPresenter,
	#category : 'Spec2-Core-Presenters'
}

{ #category : #initialization }
SpIconicLabelPresenter >> attachToView [
	
	view form: (ui iconForLabel: model)
]
