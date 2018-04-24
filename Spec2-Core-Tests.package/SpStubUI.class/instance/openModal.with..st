opening
openModal: aPresenter with: anInitBlock

	| modalContainer |
	modalContainer := SpModalViewStub of: self.	
	self layout: aPresenter with: [ :layout | 
		layout viewContainer: modalContainer.
		layout add: aPresenter with: [ :c | 
			c horizontal exact: 400.
			c vertical exact: 400 ].
	].	
	anInitBlock value: modalContainer.
	modalRequestSemaphore := Semaphore new.
	modalRequestSemaphore wait.