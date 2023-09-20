Class {
	#name : #TravelBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #ProjekatPharo
}

{ #category : #'as yet unclassified' }
TravelBScreenComponent >> blog [
	^TravelBlog current 
]

{ #category : #hooks }
TravelBScreenComponent >> children [
	^ { header }
]

{ #category : #initialization }
TravelBScreenComponent >> createHeaderComponent [ 
	^ TravelHeaderComponent from: self
]

{ #category : #initialization }
TravelBScreenComponent >> initialize [ 
	super initialize .
	header := self createHeaderComponent
]

{ #category : #'as yet unclassified' }
TravelBScreenComponent >> renderContentOn: html [ 
	html render: header.
	html tbsContainer: 
		[ html heading: 'Travel blog';
			horizontalRule.
	
			html tbsImage 
				beRounded;
				url: 				'https://cdn.visitportugal.com/sites/www.visitportugal.com/files/mediateca/23_660x371.jpg';
				height: 150;
				width: 200;
				marginLeft: 200;
				marginBottom: 50.
		
			html div.
			html div.
		
	]
]
