opening
openModal: aPresenter with: anInitBlock

	| modalContainer |
	modalContainer := SpModalViewStub of: self.	
	modalContainer contents add: aPresenter view.
		
	anInitBlock value: modalContainer.
	
	modalRequestSemaphore := Semaphore new.
	modalRequestSemaphore wait.