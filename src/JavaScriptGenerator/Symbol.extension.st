Extension { #name : #Symbol }

{ #category : #'*JavaScriptGenerator' }
Symbol >> require [
	"Syntax sugar to make the DSL better."
	^ JSGRequire moduleNamed: self
]
