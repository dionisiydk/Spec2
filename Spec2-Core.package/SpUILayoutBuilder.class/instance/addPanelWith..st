composing presenters
addPanelWith: layoutBlock

	| currentContainer newContainer |
	currentContainer := viewContainer.
	newContainer := ui createDefaulViewContainer.
	newContainer isMorph ifTrue: [ newContainer setNameTo: 'Panel' ].
	self buildBy: [
		self layoutChildView: newContainer with: [:panelConstraints |	
			viewContainer := newContainer.		 
			layoutBlock value: panelConstraints ]].
	
	viewContainer := currentContainer.
	self addChildView: newContainer