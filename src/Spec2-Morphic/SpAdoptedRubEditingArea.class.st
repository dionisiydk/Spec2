Class {
	#name : #SpAdoptedRubEditingArea,
	#superclass : #RubEditingArea,
	#category : 'Spec2-Morphic-Views'
}

{ #category : #defaults }
SpAdoptedRubEditingArea >> defaultMargins [

	^ Margin left: 4 right: 2 top: 2 bottom: 2
]

{ #category : #'event handling' }
SpAdoptedRubEditingArea >> mouseDown: evt [
	"The default response is to let my eventHandler, if any, handle it."
	self eventHandler ifNotNil: [
		self eventHandler mouseDown: evt fromMorph: self.
		evt wasHandled ifTrue: [^self]].

	super mouseDown: evt
]
