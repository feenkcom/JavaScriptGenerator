Extension { #name : #Dictionary }

{ #category : #'*JavaScriptGenerator' }
Dictionary >> jsgCallArgumentsOf: aP3GCallable [
	^ JSGCall target: aP3GCallable keywordArguments: self
]

{ #category : #'*JavaScriptGenerator' }
Dictionary >> writeLinkLanguageOn: aWriteStream [ 
	aWriteStream << ${.
	self associations do: [ :assoc |
		assoc key writeLinkLanguageOn: aWriteStream.
		aWriteStream << ' : '.
		assoc value writeLinkLanguageOn: aWriteStream ] separatedBy: [ aWriteStream << ' , ' ].
	aWriteStream << $}
]
