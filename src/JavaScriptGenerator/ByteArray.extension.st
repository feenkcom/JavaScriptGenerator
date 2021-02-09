Extension { #name : #ByteArray }

{ #category : #'*JavaScriptGenerator' }
ByteArray >> writeJavaScriptOn: aStream [
	JSGCall new
		target: 'bytearray' asJSGIdentifier;
		positionalArguments:  { self asArray };
		writeJavaScriptOn: aStream
]
