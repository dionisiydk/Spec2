*Spec2-Core
createSpecToolbarItemFor: aCommandActivator
	
	^SpCommandPresenter 
		buttonOn: [ aCommandActivator executeCommand ] 
		named: aCommandActivator menuItemName
		icon:  aCommandActivator menuItemIcon