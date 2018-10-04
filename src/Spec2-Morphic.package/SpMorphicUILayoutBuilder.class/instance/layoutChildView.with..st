private
layoutChildView: childView with: layoutBlock
	layoutBlock value: (SpChildMorphLayoutBuilder on: childView parent: viewContainer)