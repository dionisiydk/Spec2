Extension { #name : #Collection }

{ #category : #'*Spec2-Core' }
Collection >> asDataItemChildren [
	^SpSimpleChildren items: self
]

{ #category : #'*Spec2-Core' }
Collection >> asSpecDataset [
	^(SpSimpleDataSource on: self) asSpecDataset
]
