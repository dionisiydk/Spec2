tests
testCreationByBuilderWithCustomPreviewPresenter
	"#build message is normally hidden from user. 
	It is called implicitly when value holder is requested from builder"
	
	| detailsPresenter |
	detailsPresenter := SpPointFormPresenterExample new.
	aspect := (10@30) aspect itself usePreviewWith: detailsPresenter; build.
	
	self assert: aspect inputPresenter class equals: SpObjectPreviewPresenter.
	self assert: aspect inputPresenter detailsPresenter equals: detailsPresenter.