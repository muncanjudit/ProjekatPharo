Class {
	#name : #Travel,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'date',
		'country',
		'visible'
	],
	#category : #ProjekatPharo
}

{ #category : #testing }
Travel class >> isVoyageRoot [ 
	^true
]

{ #category : #'as yet unclassified' }
Travel class >> title: aTitle description: aText [
	^self new 
		title: aTitle;
		description: aText;
		yourself
]

{ #category : #'as yet unclassified' }
Travel class >> title: aTitle description: aText country: aString [
	^(self title: aTitle description: aText)
		country: aString;
		yourself
]

{ #category : #'as yet unclassified' }
Travel class >> unclassifiedTag [
	^ 'Unclassified'
]

{ #category : #accessing }
Travel >> beVisible [
	self visible: true
]

{ #category : #accessing }
Travel >> country [
	^country 
]

{ #category : #accessing }
Travel >> country: aString [
	country := aString 
]

{ #category : #accessing }
Travel >> date [
	^date 
]

{ #category : #accessing }
Travel >> date: aDate [
	date := aDate  
]

{ #category : #accessing }
Travel >> description [
	^description
]

{ #category : #accessing }
Travel >> description: aText [
	description := aText 
]

{ #category : #accessing }
Travel >> descriptionContainer [
	<magritteContainer>
	^ super descriptionContainer
		componentRenderer: TBSMagritteFormRenderer;
		yourself
]

{ #category : #accessing }
Travel >> descriptionCountry [
	<magritteDescription>
	^MAStringDescription new 
		label: 'Country';
		priority: 300;	
		accessor: #country;
		comment: 'Unclassified if empty';
		componentClass: TBSMagritteTextInputComponent;
		yourself 
]

{ #category : #accessing }
Travel >> descriptionDate [
	<magritteDescription>
	^MAStringDescription new 
		label: 'Date';
		priority: 400;	
		accessor: #date;
		beRequired;
		yourself 
]

{ #category : #accessing }
Travel >> descriptionDescription [
	<magritteDescription>
	^MAMemoDescription new 
		label: 'Description';
		priority: 200;	
		accessor: #description;
		requiredErrorMessage: 'A blog post must contain a description.';
		comment: 'Please enter a description';
		componentClass: TBSMagritteTextAreaComponent;
		yourself 
]

{ #category : #accessing }
Travel >> descriptionTitle [ 
	<magritteDescription>
	^MAStringDescription new 
		label: 'Title';
		priority: 100;	
		accessor: #title;
		requiredErrorMessage: 'A blog post must have a title.';
		comment: 'Please enter a title';
		componentClass: TBSMagritteTextInputComponent;
		beRequired;
		yourself 
]

{ #category : #accessing }
Travel >> descriptionVisible [
	<magritteDescription>
	^MABooleanDescription new 	
		checkboxLabel: 'Visible';
		priority: 500;
		accessor: #visible;
		componentClass: TBSMagritteCheckboxComponent;
		beRequired;
		yourself 
]

{ #category : #initialization }
Travel >> initialize [ 
	super initialize .
	self country: Travel unclassifiedTag .
	self date: Date today.
	self notVisible
]

{ #category : #testing }
Travel >> isUnclassified [
	^ self country = Travel unclassifiedTag
]

{ #category : #accessing }
Travel >> isVisible [
	^self visible 
]

{ #category : #accessing }
Travel >> notVisible [
	self visible: false
]

{ #category : #accessing }
Travel >> title [ 
	^title
]

{ #category : #accessing }
Travel >> title: aString [ 
	title := aString
]

{ #category : #accessing }
Travel >> visible [ 
	^visible
]

{ #category : #accessing }
Travel >> visible: aBoolean [
	visible := aBoolean 
]
