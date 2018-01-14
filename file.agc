SetVirtualResolution(800, 600)
SetClearColor(255, 255, 255)

//vars
success = 0

StoredTextLines as string[10]
for i = 1 to 10
	StoredTextLines[i] = ""
next i

//here's the list of things it can contain.
ExampleTextLines as string[11]
ExampleTextLines[1] = "j"
ExampleTextLines[2] = "i"
ExampleTextLines[3] = "h"
ExampleTextLines[4] = "g"
ExampleTextLines[5] = "f"
ExampleTextLines[6] = "e"
ExampleTextLines[7] = "d"
ExampleTextLines[8] = "c"
ExampleTextLines[9] = "b" 
ExampleTextLines[10] = "a"
ExampleTextLines[11] = "test"


//user input text
InputText as string
InputText = ""

//a type which contains the ID X Y and TEXT
type StoredTextType
	ID as integer
	X as integer
	Y as integer
	STOREDTEXT as string
	VISIBLE as integer
endtype
//array storing ID number, X pos, Y pos and the string value.
StoredTextPositions as StoredTextType[10]
for pos = 1 to 10
	StoredTextPositions[pos].ID = pos : StoredTextPositions[pos].X = 40 : StoredTextPositions[pos].Y = (50 * pos)
	StoredTextPositions[pos].STOREDTEXT = "" : StoredTextPositions[pos].VISIBLE = 0
next pos

increment as integer
increment = 1

//creates a type and array for "line"
type LineType
	ID as integer
	X as integer
	Y as integer
	NUMBERVALUE as integer
endtype
line as LineType[10]
for l = 1 to 10
	line[l].ID = (l + 10) : line[l].X = 0 : line[l].Y = ((50 * l) + 7.5) : line[l].NUMBERVALUE = l
next l

//edit box properties
CreateEditBox(1)
SetEditBoxFocus(1, 1)
SetEditBoxSize(1, 800, 30)
SetEditBoxTextSize(1, 30)
SetEditBoxPosition(1, 0, 570)

do
	//display the text at the top which should be typed.
	DeleteText(50)
	CreateText(50, ExampleTextLines[increment])
	SetTextPosition(50, 300, 0)
	SetTextColor(50, 0, 0, 0, 255)
	SetTextSize(50, 30)
	
	//keypressed
	//escape
	if GetRawKeyPressed(27)
		exit
	endif
	
	//enter
	if GetRawKeyPressed(13)
		//stores the text in a variable
		InputText = GetEditBoxText(1)
		
		//compares the text to the stored value.
		if InputText = ExampleTextLines[increment]
			CreateText(StoredTextPositions[increment].ID, ExampleTextLines[increment])
			SetTextPosition(StoredTextPositions[increment].ID, StoredTextPositions[increment].X, StoredTextPositions[increment].Y)
			SetTextColor(StoredTextPositions[increment].ID, 0, 0, 0, 255)
			SetTextSize(StoredTextPositions[increment].ID, 30)
			//stores the text in a variable (for displaying on screen)
			StoredTextLines[increment] = ExampleTextLines[increment]
			StoredTextPositions[increment].VISIBLE = 1
			success = 1
		endif
		
		if StoredTextPositions[increment].VISIBLE = 1
			CreateText(line[increment].ID, str(line[increment].NUMBERVALUE))
			SetTextPosition(line[increment].ID, line[increment].X, line[increment].Y)
			SetTextColor(line[increment].ID, 0, 0, 0, 255)
			SetTextSize(line[increment].ID, 15)
		endif
		
		DeleteEditBox(1)
		if increment <= 9 and success = 1
			inc increment
			success = 0
			else
				line
		endif
		
		//creates a new edit box after pressing enter
		CreateEditBox(1)
		SetEditBoxSize(1, 800, 30)
		SetEditBoxTextSize(1,30)
		SetEditBoxPosition(1, 0, 570)
	endif
	
	//sets the focus of the edit box to 1 1 == active, 0 == inactive.
	SetEditBoxFocus(1, 1)
    Sync()
loop
