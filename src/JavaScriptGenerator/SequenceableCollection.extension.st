Extension { #name : #SequenceableCollection }

{ #category : #'*JavaScriptGenerator' }
SequenceableCollection >> jsgCallArgumentsOf: aP3GCallable [
	^ JSGCall target: aP3GCallable positionalArguments: self
]

{ #category : #'*JavaScriptGenerator' }
SequenceableCollection >> writeLinkLanguageOn: aStream [
	aStream << $[.
	self do: [ :item | item writeLinkLanguageOn: aStream ] separatedBy: [ aStream << $, ].
	aStream << $]
]
