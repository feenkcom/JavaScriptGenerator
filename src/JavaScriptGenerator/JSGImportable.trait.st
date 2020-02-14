"
I define methods to allow easily import a module.
"
Trait {
	#name : #JSGImportable,
	#category : #'JavaScriptGenerator-Traits'
}

{ #category : #importing }
JSGImportable >> require [
	^ JSGRequire moduleIdentifier: self
]
