Extension { #name : #Point }

{ #category : #'*Chipmunk2D' }
Point >> asCpVector [
	^ CpVector fromPoint: self
]

{ #category : #'*Chipmunk2D' }
Point >> closeTo: aPoint precision: aNumber [ 
	^ (x closeTo: aPoint x precision: aNumber) and: [ 
		(y closeTo: aPoint y precision: aNumber) ]
]
