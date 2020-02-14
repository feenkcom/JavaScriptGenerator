Extension { #name : #SequenceableCollection }

{ #category : #'*JavaScriptGenerator' }
SequenceableCollection >> jsgCallArgumentsOf: aP3GCallable [
	^ JSGCall target: aP3GCallable positionalArguments: self
]

{ #category : #'*JavaScriptGenerator' }
SequenceableCollection >> writeJavaScriptOn: aStream [
	aStream << $[.
	self do: [ :item | item writeJavaScriptOn: aStream ] separatedBy: [ aStream << $, ].
	aStream << $]
]
