Extension { #name : #Dictionary }

{ #category : #'*JavaScriptGenerator' }
Dictionary >> jsgCallArgumentsOf: aP3GCallable [
	^ JSGCall target: aP3GCallable keywordArguments: self
]

{ #category : #'*JavaScriptGenerator' }
Dictionary >> writeJavaScriptOn: aWriteStream [ 
	aWriteStream << ${.
	self associations do: [ :assoc |
		assoc key writeJavaScriptOn: aWriteStream.
		aWriteStream << ' : '.
		assoc value writeJavaScriptOn: aWriteStream ] separatedBy: [ aWriteStream << ' , ' ].
	aWriteStream << $}
]
