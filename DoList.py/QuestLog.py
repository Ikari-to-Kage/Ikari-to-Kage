# ----- ----- ----- ----- ----- # ----- ----- ----- ----- ----- ----- ----- ----- #
#   Tara M. Williams (2023)     # Author's Note; Tkinter was NOT the best choice, #
#   Class: ITP150 - Python.     #  and I have regrets about it. I am also quite   #
#   Final Project : QuestLog.py #  aware of the many database security concerns.  #
# ----- ----- ----- ----- ----- # ----- ----- ----- ----- ----- ----- ----- ----- #
#   Imports
import tkinter as box                   #   Frames, inner and outter.
from tkinter import ttk as sticker      #   Buttons, labels, input boxes.
from tkinter import messagebox as warn  #   Pop ups for verification, errors.
import sqlite3 as database              #   Database interface.

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Quest Lists, Database Set-up
questList = []                  #   Empty, to be filled by user.
connection = database.connect('questArchive.db')
command = connection.cursor()   #   For running the database alterations.
command.execute("CREATE TABLE IF NOT EXISTS questList(Name TEXT, Description TEXT, Priority TEXT, Date TEXT)")
    #   Would have to be restructured to force DATE type, or sequential number types, depending on exact restrictions of SQLite3. 

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Functions   -   Quest Save/Clear/Load
def newQuest():                 #   New list item.
    name = qName.get()          #   Get name. 
    task = qDescription.get("1.0",'end-1c')   #   Get description.
    prio = qPriority.get()      #   Get priority value. 
    date = qDueDate.get()       #   Get end date. Requires bringing in more classes, and considerable input formatting. 

    if len(name) == 0:
        warn.showinfo('Error','All tasks require a name, at minimum.')
    else:
        questList.append(name)  #   Add to the quest list.
        #   !   Database Alteration Code; Alter below with care.   !   #
        command.execute("INSERT INTO questList VALUES(?, ?, ?, ?)", (name, task, prio, date,))
        #   ^   Database Alteration Code; Alter above with care.   ^   #
        updateQuestBoard()      #   Clears and repopulates the quest list.
        emptyForm()             #   Empty form for a new entry.

def endQuest():                 #   Remove a quest.
    try:                        #   If quest selected is found, remove it.
        value = questBoard.get(questBoard.curselection())   # Something's bugged here. 
        if value in questList:
            questList.remove(value)
            updateQuestBoard()
            #   !   Database Alteration Code; Alter below with care.   !   #
            command.execute("DELETE FROM questList WHERE Name = ?", (value,))   # CHECK THIS.
            #   ^   Database Alteration Code; Alter above with care.   ^   #
    except:                     #   ...or if user forgot to select it.
        warn.showinfo('Error','No quest found by that name.')

def resetQuests():              #   Clear entire quest list.
    newJourney = warn.askyesno('Reset Quest List', 'Are you certain? This choice can not be reversed.')
    if newJourney == True:
        while(len(questList) != 0): #   Loop through the list, until empty.
            questList.pop()         #   Remove the item.
        #   !   Database Alteration Code; Alter below with care.   !   #
        command.execute("DELETE FROM questList")
        #   ^   Database Alteration Code; Alter above with care.   ^   #
        updateQuestBoard()

def loadQuests():               #   Loop through DB file, return names.
    while(len(questList) != 0):
        questList.pop()         #   Not quite sure why this works, tbh.
    for row in command.execute("SELECT name FROM questList"):
        #   Quest list sortable on load by priority/date; SORTBY database call. 
        questList.append(row[0])#   Add to questList[].

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Functions   -   Updates/Utility
def updateQuestBoard():         #   Clears and repopulates the quest list.
    questBoard.delete(0, 'end') #   Delete content of displayed quest list.
    for quest in questList:     #   Repopulate said display board.
        #   Quest list sortable on load by priority/date; SORTBY database call?
        #   if (search database for name, if priority = high)
        #   questBoard.insert('end', "☆ " + quest)
        questBoard.insert('end', quest)

#def updateQuestBoard():         #   Clears and repopulates the quest list.
#    questBoard.delete(0, 'end') #   Delete content of displayed quest list.
#    prioBox = []
#    for quest in questList:     #   Repopulate said display board.
#        #   Quest list sortable on load by priority/date; SORTBY database call?
#        for row in command.execute("SELECT Priority FROM questList WHERE Name = ?", (quest,)):
#            prioBox.append(row[0])     # This mess retained for possible reworking, because it causes viewBox to push out of index. I have no idea how.         
#        if (prioBox[0] == "High"):
#            questBoard.insert('end', "☆ " + quest)
#            prioBox.pop()
#        else:
#            questBoard.insert('end', quest)

def emptyForm():                #   Empty form for a new entry.
    qName.delete(0, 'end')
    qDescription.delete(1.0, 'end')
    qPriority.delete(0, 'end')  #   probably has to be keyed to drop downs. 
    qDueDate.delete(0, 'end')   #    ^

def showDetails(event):         #   Updates the viewing panel. 
    value = questBoard.get(questBoard.curselection())
    viewBox = []
    queries = ["Name","Description","Priority","Date"]

    for item in queries:
        for row in command.execute("SELECT "+item+" FROM questList WHERE Name = ?", (value,)):
            viewBox.append(row[0])

    #   v This part seems to work. Just gotta get the right date into the array.
    qViewLabel.config(text = "Currently Selected Quest : ",font=("Times New Roman",11))
    vName.config(text = " "+viewBox[0],font=("Times New Roman",13,'bold'))
    vDesc.config(text = "Details: "+viewBox[1])
    vPrio.config(text = " Priority: "+viewBox[2])
    vDate.config(text = " Due by: "+viewBox[3])
            
def close():                    #   Exit button.
    window.destroy()

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Window Creation, External Settings  -   Bugs if placed above functions.

TEXT_BG_Color = "#f9eded"       #   Reach Goal; Have these customizable by User.
TEXT_FONT_Color = "#000000"     #   Text colors would have to be included,
WINDOW_BG_Color = "#f9eded"     #   as well as hovers. Store in Database.
INPUT_BG_Color = "#F4F4F4"      #   Model after old sticky notes.
BORDER_COLOR = "#C0C0C0"        # <- Unsetable short Frame widgets for everything. 

window = box.Tk()               #   Create base window.
window.title("Weekly Quest Log")#   Name the window.
window.geometry("450x550+750+150")  #WidthxHeight+HorPlace+VertPlace
window.resizable(False,False)   #   No resize, because I hard-code my buttons. 
window.configure(bg=WINDOW_BG_Color)

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Header  -   Titles. 
headerFrame = box.Frame(window, bg=WINDOW_BG_Color)
headerFrame.pack(fill="both",)
headerLabel = box.Label(headerFrame, text="Weekly Quest List",
    font=("Times New Roman", "30"),bg=TEXT_BG_Color)
headerLabel.pack(padx=0, pady=0)

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Inputs  -   Title/Frame. 
inputFrame = box.Frame(window, bg=WINDOW_BG_Color)
inputFrame.place(x=0,y=50,width=225,height=450)
inputLabel = box.Label(inputFrame, text="Create a New Quest",
    font=("Times New Roman",),bg=TEXT_BG_Color,)
inputLabel.place(x=1,y=5,width=223) #   1-off for measures. 

#   Inputs  -   Text input.     [ 1 line = 25px ]
qNameLabel = box.Label(inputFrame, text="Title ",
    font=("Times New Roman",),bg=TEXT_BG_Color,anchor="e",)
qNameLabel.place(x=5,y=32,width=70,height=21)
qName = sticker.Entry(inputFrame, width=24,)
qName.place(x=75,y=32)

#   Choice box. 
qPriorityLabel = box.Label(inputFrame, text="Priority ",
    font=("Times New Roman",),bg=TEXT_BG_Color,anchor="e",)
qPriorityLabel.place(x=5,y=57,width=70,height=21)
#   Works just fine, data wise-- causes the curSelection() function to lose it's mind, slightly, on selection after clicking in the listbox. "bad listbox index". 
PriorityChoices = ['High','-','Low']
preSelect = box.StringVar()
preSelect.set('-')
qPriority = sticker.Combobox(inputFrame, width=21,values=PriorityChoices)
#qPriority = sticker.Entry(inputFrame, width=24,)
qPriority.place(x=75,y=57)


qDueDateLabel = box.Label(inputFrame, text="Due Date ",
    font=("Times New Roman",),bg=TEXT_BG_Color,anchor="e",)
qDueDateLabel.place(x=5,y=82,width=70,height=21)
qDueDate = sticker.Entry(inputFrame, width=24,) # This would have to be restricted to numbers.
qDueDate.place(x=75,y=82)
    #   This section will require reworking to account for the introduction of proper date-time functions. 

qDescriptionLabel = box.Label(inputFrame, text="Details ",
    font=("Times New Roman",),bg=TEXT_BG_Color,anchor="e",)
qDescriptionLabel.place(x=5,y=107,width=70,height=21)
qDescription = box.Text(inputFrame, height=5,width=18,)
qDescription.place(x=75,y=107,)

#   Inputs  -   Buttons.        [ Exactly 25px tall. ] +16
newButton = sticker.Button(inputFrame, text="Post New Quest", width=25, command=newQuest)
newButton.place(x=33,y=191)
endButton = sticker.Button(inputFrame, text="Remove Quest", width=25, command=endQuest)
endButton.place(x=33,y=216)
clearButton = sticker.Button(inputFrame, text="Reset Quest Board", width=25, command=resetQuests)
clearButton.place(x=33,y=241)
closeButton = sticker.Button(inputFrame, text="Return Later", width=25, command=close)
closeButton.place(x=33,y=266)

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Board   -   Display and selectable list.
qBoardFrame = box.Frame(window, bg=WINDOW_BG_Color)
qBoardFrame.place(x=225,y=50,width=225,height=450)
qBoardLabel = box.Label(qBoardFrame, text="Quest Board",
    font=("Times New Roman",),bg=TEXT_BG_Color)
qBoardLabel.place(x=1,y=5,width=223) #   1-off for measures. 
questBoard = box.Listbox(qBoardFrame,
    width = 35,
    height = 16,
    selectmode = 'SINGLE', 
    #   Text box style. 
    background = INPUT_BG_Color, #BG
    foreground = TEXT_FONT_Color, #Text
    #   Text box select.
    selectbackground = "#c0c0c0",
    selectforeground = "#580000",
)
questBoard.place(x=6, y=32)    #   Box placement adjustment.
questBoard.bind("<<ListboxSelect>>", showDetails)

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Viewing Panel
qViewFrame = box.Frame(window, bg=WINDOW_BG_Color)
qViewFrame.place(x=0,y=342,width=450,height=200)

#   Header/Prio. 
qViewLabel = box.Label(qViewFrame, text="Select a quest above to view the details here!",
    font=("Times New Roman",12),
    bg=TEXT_BG_Color,anchor="nw")
qViewLabel.place(x=5,y=5,width=300)
vPrio = box.Label(qViewFrame, text=" ",font=("Times New Roman",12),
    bg=TEXT_BG_Color,anchor="nw",)
vPrio.place(x=300,y=5,width=145)

#   Same line as Date.
vName = box.Label(qViewFrame, text=" ",font=("Times New Roman",13),
    bg=TEXT_BG_Color,anchor="w",)
vName.place(x=5,y=27,width=300)
vDate = box.Label(qViewFrame, text=" ",font=("Times New Roman",12),
    bg=TEXT_BG_Color,anchor="w",)
vDate.place(x=300,y=27,width=145)

#   Paragraph size. 
vDesc = box.Label(qViewFrame, text=" ",font=("Times New Roman",12),
    bg=TEXT_BG_Color,anchor="nw",
    wraplength=440,justify="left")
vDesc.place(x=5,y=50,width=440,height=250)

# ----- ----- ----- ----- /#\ ----- ----- ----- ----- /#\ ----- ----- ----- ----- #
#   Run QuestLog.py
if __name__ == "__main__":
    loadQuests()                #   Load prior questList.
    updateQuestBoard()          #   Print prior questList.
    window.mainloop()           #   Run program by input, until closed.
    connection.commit()         #   Save changes to the database, for next time.
    command.close()             #   Disconnect from database file.