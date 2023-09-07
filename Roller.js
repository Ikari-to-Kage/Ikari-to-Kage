/* > TMWilliams | ITP 140-35, Spring 2023 | "Stardust Stat Roller" <

Credit where credit is due;
Special thanks to Matt Newnham-Wheatley ('Teg') for answering my endless questions,
and his invaluable assistance in debugging certain functions. I think I learned 
another half a class worth of material just tossing the ideas around to fix things
with him, who's been in the industry for as long as I've been dabbling with codes.

There are many sections where I used different methods to resolve a problem, and in
many of those cases, there may be-- and likely are-- better methods. With due-time
approaching, these different methods are left to rest, as they work just fine, but
the resulting code is not 'pretty', nor does it follow any specific style guide.
*/
 
//To Do List.
// ^ JS: Save function.
// v CSS: Rework padding/margins to make sense.
// v JS/HTML: Check for a DNI code for inputs, to prevent display-blanking on click.

// Display References.
    const PCName = document.getElementById("charName");
    const PCRace = document.getElementById("charRace");
    const PCClss = document.getElementById("charClss");
    const PCGend = document.getElementById("charGend");
    const PCDetl = document.getElementById("charDetl");

    let STATS = [10,10,10,10,10,10];
    let MODS =  [0,0,0,0,0,0];
    let BASE =  [10,10,10,10,10,10]; //Back up for the base rolls.

// Display Updates.
const Details = document.querySelectorAll('input');
  Array.from(Details).forEach(input => {
    input.addEventListener('blur', () => AmendDisplay());
  });

const Notes = document.querySelectorAll('textarea');
  Array.from(Notes).forEach(textarea => {
    textarea.addEventListener('blur', () => AmendDisplay());
  });

const Numbers = document.querySelectorAll('input[type="number"]');
  Array.from(Numbers).forEach(input => {
    input.addEventListener('click', () => AmendDisplay());
  });

function AmendDisplay() {    
    // Update the Character Sheet Details.
    charaName = PCName.value;
    document.querySelector("span.characterName").innerHTML = charaName;
    charaRace = PCRace.value;
    document.querySelector("span.characterRace").innerHTML = charaRace;
    charaClss = PCClss.value;
    document.querySelector("span.characterClss").innerHTML = charaClss;
    charaGend = PCGend.value;
    document.querySelector("span.characterGend").innerHTML = charaGend;
    charaDetl = PCDetl.value;
    document.querySelector("span.characterDetl").innerHTML = ` <i>Notes</i>: ${charaDetl}`; 
        
    // Update the Stats.
    let PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, BASE);
    UpdateStats(STATS);
    MODS = getAbMod(STATS);

    // Print the Stats.
    document.querySelector("span.charaSTR").innerHTML = `${STATS[0]}`;
    document.querySelector("span.charaDEX").innerHTML = `${STATS[1]}`;
    document.querySelector("span.charaCON").innerHTML = `${STATS[2]}`;
    document.querySelector("span.charaINT").innerHTML = `${STATS[3]}`;
    document.querySelector("span.charaWIS").innerHTML = `${STATS[4]}`;
    document.querySelector("span.charaCHR").innerHTML = `${STATS[5]}`;

    // Print the Ability Modifiers.
    document.querySelector("span.abSTR").innerHTML = `${MODS[0]}`;
    document.querySelector("span.abDEX").innerHTML = `${MODS[1]}`;
    document.querySelector("span.abCON").innerHTML = `${MODS[2]}`;
    document.querySelector("span.abINT").innerHTML = `${MODS[3]}`;
    document.querySelector("span.abWIS").innerHTML = `${MODS[4]}`;
    document.querySelector("span.abCHR").innerHTML = `${MODS[5]}`;
    
    // Funsie stats.
    document.querySelector("span.statTotal").innerHTML = BASE[0] + BASE[1] + BASE[2] + BASE[3] + BASE[4] + BASE[5];

}

// Update Stats.
function UpdateStats(StatPile) {
    STATS = StatPile;
}

function UpdateBase(StatPile) {
    BASE = StatPile;
}

// Turn over a bucket of D6's...
function standardArray() {
    // Assign array.
    var statPile = [15,14,13,12,10,8];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

function nonPlayerArray() {
  // Assign array. 
  var statPile = [13,12,11,10,9,8];
  var PrioFetch = getPriority("Priority");
  assignStat(PrioFetch, statPile);

  // Amend statPile.
  UpdateStats(statPile);
  AmendDisplay();
}
  
  // Fun Methods.
function rollFey() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 8) + 1;
  var randomNumber2 = Math.floor(Math.random() * 8) + 1;
  
  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2];
    
  // Return compiled number.
  var roll = unsortedDice[0] + unsortedDice[1] + 2;
  
  return roll;
}

function rollFeyStats() {
    // Assign the dice.
    var statPile = [rollFey(),rollFey(),rollFey(),rollFey(),rollFey(),rollFey()];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

function rollPande() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 6) + 1;
  var randomNumber2 = Math.floor(Math.random() * 8) + 1;
  var randomNumber3 = Math.floor(Math.random() * 10) + 1;
  
  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2, randomNumber3];
  var sortedDice = unsortedDice.sort(sortDice);
    
  // Return compiled number.
  var roll = sortedDice[0] + sortedDice[1];
  
  return roll;
}

function rollPandeStats() {
    // Assign the dice.
    var statPile = [rollPande(),rollPande(),rollPande(),rollPande(),rollPande(),rollPande()];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

  // Classic Methods
function roll2D6() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 6) + 1;
  var randomNumber2 = Math.floor(Math.random() * 6) + 1;
    
  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2];
    
  // Return compiled number.
  var roll = unsortedDice[0] + unsortedDice[1] + 6;
  
  return roll;
}

function roll2d6Stats() {
    // Assign the dice.
    var statPile = [roll2D6(),roll2D6(),roll2D6(),roll2D6(),roll2D6(),roll2D6()];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}
  
function roll3D6() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 6) + 1;
  var randomNumber2 = Math.floor(Math.random() * 6) + 1;
  var randomNumber3 = Math.floor(Math.random() * 6) + 1;
  
  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2, randomNumber3];
    
  // Return compiled number.
  var roll = unsortedDice[0] + unsortedDice[1] + unsortedDice[2];
  
  return roll;
}

function roll3d6Stats() {
    // Assign the dice.
    var statPile = [roll3D6(),roll3D6(),roll3D6(),roll3D6(),roll3D6(),roll3D6()];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

function roll4D6_drop1() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 6) + 1;
  var randomNumber2 = Math.floor(Math.random() * 6) + 1;
  var randomNumber3 = Math.floor(Math.random() * 6) + 1;
  var randomNumber4 = Math.floor(Math.random() * 6) + 1;

  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2, randomNumber3, randomNumber4];
  var sortedDice = unsortedDice.sort(sortDice);

  // Return compiled number.
  var roll = sortedDice[0] + sortedDice[1] + sortedDice[2];
  
  return roll;
}

function roll4d6Stats() { 
    // Assign the dice.
    var statPile = [roll4D6_drop1(),roll4D6_drop1(),roll4D6_drop1(),roll4D6_drop1(),roll4D6_drop1(),roll4D6_drop1()];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

function roll5D6_drop2() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 6) + 1;
  var randomNumber2 = Math.floor(Math.random() * 6) + 1;
  var randomNumber3 = Math.floor(Math.random() * 6) + 1;
  var randomNumber4 = Math.floor(Math.random() * 6) + 1;
  var randomNumber5 = Math.floor(Math.random() * 6) + 1;

  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2, randomNumber3, randomNumber4, randomNumber5];
  var sortedDice = unsortedDice.sort(sortDice);
  
  // Return compiled number.
  var roll = sortedDice[0] + sortedDice[1] + sortedDice[2];
  
  return roll;
}

function roll5d6Stats() { 
    // Assign the dice.
    var statPile = [roll5D6_drop2(),roll5D6_drop2(),roll5D6_drop2(),roll5D6_drop2(),roll5D6_drop2(),roll5D6_drop2(),];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

  // D20 Methods
function roll20R2D6() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 6) + 1;
  var randomNumber2 = Math.floor(Math.random() * 6) + 1;
    
  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2];
    
  // Return compiled number.
  var roll = 20 - (unsortedDice[0] + unsortedDice[1]);
  
  return roll;
}

function roll20r2d6Stats() {
    // Assign the dice.
    var statPile = [roll20R2D6(),roll20R2D6(),roll20R2D6(),roll20R2D6(),roll20R2D6(),roll20R2D6()];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

function roll3D20() {
  // Roll the dice.
  var randomNumber1 = Math.floor(Math.random() * 20) + 1;
  var randomNumber2 = Math.floor(Math.random() * 20) + 1;
  var randomNumber3 = Math.floor(Math.random() * 20) + 1;
    
  // Sort the dice.
  var unsortedDice = [randomNumber1, randomNumber2, randomNumber3];
    
  // Return compiled number.
  var roll = Math.round((unsortedDice[0] + unsortedDice[1] + unsortedDice[2]) / 3);
  
  return roll;
}

function roll3d20Stats() {
    // Assign the dice.
    var statPile = [roll3D20(),roll3D20(),roll3D20(),roll3D20(),roll3D20(),roll3D20()];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

function roll8d20Stats() {
    // Roll the dice.
    var randomNumber1 = Math.floor(Math.random() * 20) + 1;
    var randomNumber2 = Math.floor(Math.random() * 20) + 1;
    var randomNumber3 = Math.floor(Math.random() * 20) + 1;
    var randomNumber4 = Math.floor(Math.random() * 20) + 1;
    var randomNumber5 = Math.floor(Math.random() * 20) + 1;
    var randomNumber6 = Math.floor(Math.random() * 20) + 1;
    var randomNumber7 = Math.floor(Math.random() * 20) + 1;
    var randomNumber8 = Math.floor(Math.random() * 20) + 1;
      
    // Sort the dice.
    var unsortedDice = [randomNumber1, randomNumber2, randomNumber3, randomNumber4, randomNumber5, randomNumber6, randomNumber7, randomNumber8];
    var sortedDice = unsortedDice.sort(sortDice);
    
    // Assign the dice.
    var statPile = [sortedDice[0], sortedDice[1], sortedDice[2], sortedDice[3], sortedDice[4], sortedDice[5]];
    var PrioFetch = getPriority("Priority");
    assignStat(PrioFetch, statPile);

    // Amend statPile.
    UpdateStats(statPile);
    AmendDisplay();
}

// Sort the handful of D6's...
function sortDice(a, b) {
    return b - a;
}

// Make sense of the non-sense.
function getPriority(listId) {
    var orderArray = [];   
    var childs = Array.from(document.getElementById(listId).children); //Works.
    for(var i=0; i< childs.length; i++){
      var child = childs[i];
      var PrioID = child.getAttribute("id");
      
      orderArray.push(PrioID);
    }
    return orderArray;
}

function assignStat(PriorityArray, StatArray) {
    // Sort.
    sortedStats = StatArray.sort(sortDice);
    
    // Find spot.
    var S = PriorityArray.indexOf("PrioSTR");
    var D = PriorityArray.indexOf("PrioDEX");
    var Co = PriorityArray.indexOf("PrioCON");
    var I = PriorityArray.indexOf("PrioINT");
    var W = PriorityArray.indexOf("PrioWIS");
    var Ch = PriorityArray.indexOf("PrioCHR");
    
    // Assign Sorted to Priority.
    baseSTR = StatArray[S];
    baseDEX = StatArray[D];
    baseCON = StatArray[Co];
    baseINT = StatArray[I];
    baseWIS = StatArray[W];
    baseCHR = StatArray[Ch];

    baseStats = [baseSTR, baseDEX, baseCON, baseINT, baseWIS, baseCHR];
    UpdateBase(baseStats);
    alteredStats = addModifiers(baseStats);   
    UpdateStats(alteredStats);
    return alteredStats;
}

function addModifiers(StatArray) {
    var RceSTR = parseInt(document.getElementById("ModSTR").value);
    var RceDEX = parseInt(document.getElementById("ModDEX").value);
    var RceCON = parseInt(document.getElementById("ModCON").value);
    var RceINT = parseInt(document.getElementById("ModINT").value);
    var RceWIS = parseInt(document.getElementById("ModWIS").value);
    var RceCHR = parseInt(document.getElementById("ModCHR").value);
   
    statSTR = RceSTR + StatArray[0];
    statDEX = RceDEX + StatArray[1];
    statCON = RceCON + StatArray[2];
    statINT = RceINT + StatArray[3];
    statWIS = RceWIS + StatArray[4];
    statCHR = RceCHR + StatArray[5];

    stats = [statSTR, statDEX, statCON, statINT, statWIS, statCHR];
    return stats;
}

function getAbMod(StatArray) {
  var modArrayUpdate = [];
  for(var i=0; i < 6; i++){    
    modArrayUpdate.push(Math.floor((StatArray[i] - 10) / 2))
  }
  return modArrayUpdate;
}

// Clean up the bucket of D6's.
function resetSheet() {
    const currentUrl = window.location.href;
    location.href = currentUrl;
}

// Sortable stat list. Original src; https://stackoverflow.com/questions/10588607/tutorial-for-html5-dragdrop-sortable-list
var _el;

function dragStart(e) {
  e.dataTransfer.effectAllowed = "move";
  e.dataTransfer.setData("text/plain", null);
  _el = e.target;
  _el.classList.add("scruffed"); //Unruly elements get scruffed.
}

function dragOver(e) {
  if (isBefore(_el, e.target))
    e.target.parentNode.insertBefore(_el, e.target);
  else
    e.target.parentNode.insertBefore(_el, e.target.nextSibling);
}

function dragStop(e) {
  _el.classList.remove("scruffed");
  AmendDisplay()
}

function isBefore(el1, el2) {
  if (el2.parentNode === el1.parentNode)
    for (var cur = el1.previousSibling; cur && cur.nodeType !== 9; cur = cur.previousSibling)
      if (cur === el2)
        return true;
  return false;
}