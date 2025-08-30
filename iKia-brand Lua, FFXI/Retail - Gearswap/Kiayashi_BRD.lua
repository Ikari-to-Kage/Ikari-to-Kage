--Last Edit; 7ish-25-
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.BRD |  --
--	|  v.4.Baha |  --
--	*-----------*  --
---------------------
--{(HUD Set-up>------
---------------------
	require('tables');
	require('texts');
	require('images-light');
	function ManaScrollHUD()
		local ManaScroll
		local primitives = require('images-light');
			ManaScroll = primitives.new('', {
				['color'] = { ['alpha'] = 255, ['red'] = 255, ['blue'] = 255, ['green'] = 255 }, 
				['texture'] = { ['fit'] = false },
				['pos'] = { ['x'] = 1470, ['y'] = 35 }, 
				['size'] = { ['width'] = 400, ['height'] = 275 },
				['draggable'] = false,});
			ManaScroll:path(string.format('%sHUD/GreenHUD.png', windower.addon_path))
			ManaScroll:transparency(0)
			ManaScroll:show()
	end
	
	function ManaBarsHUD()
	-- Text Start Position; X = 1514(1475+39) Y = 83(35+48), Roughly. New Line = Size+3
		--Melee Toggles.
			BlackMana = texts.new('Melee Settings: \n [7] Idle: ' ..IdleArray[IdleIndex].. ' \n [8] Engage: ' ..EngagedArray[EngagedIndex].. ' \n [9] Weapons: ' ..WeaponArray[WeaponIndex].. ' \n' , 
				{bg={visible=false}, flags={draggable=false},
				['pos'] = { ['x'] = 1510, ['y'] = 80},
				text = {size=13, font='Times New Roman'}})
			BlackMana:color(0,150,255)
			BlackMana:show()
		--Tier Display.
			RedMana = texts.new('[1] Tier: ' ..TierArray[TierIndex].. ' ', 
				{bg={visible=false}, flags={draggable=false},
				['pos'] = { ['x'] = 1510, ['y'] = 160},
				text = {size=13, font='Times New Roman'}})
			RedMana:color(155,0,0)
			RedMana:transparency(99)
			RedMana:hide()
		--Mage Toggles.
			WhiteMana = texts.new('Magic Settings: \n [6] TP Lock: On/Off.', 
				{bg={visible=false}, flags={draggable=false},
				['pos'] = { ['x'] = 1510, ['y'] = 160},
				text = {size=13, font='Times New Roman'}})
			WhiteMana:color(255,255,255)
			WhiteMana:show()
	end

------------------
--{(Array Logic>--
------------------
	IdleIndex = 1 
	IdleArray = {"Movement","Defense",} --"Kiting",}
	EngagedIndex = 1 
	EngagedArray = {"General","Defense",}
	WeaponIndex = 1
	WeaponArray = {"Carnwenhan","Tauret","Naegling",}

	TierIndex = 1
	TierArray = {"Low","High"}
	Weapon = 'None'
	
-- Keybinds.
	--windower.send_command('bind Numpad1 gs c C1') -- Tier
	windower.send_command('bind Numpad2 gs c C2') -- Backcycle; Armors.
	windower.send_command('bind Numpad3 gs c C3') -- Backcycle; Weapons.

	windower.send_command('bind Numpad6 gs c C6') -- Weapon Lock
	
	windower.send_command('bind Numpad7 gs c C7') -- Idle
	windower.send_command('bind Numpad8 gs c C8') -- Melee
	windower.send_command('bind Numpad9 gs c C9') -- Weapon
	
-------------------------
--{(Talent Assignments>--
-------------------------

--{(Spell group maps, make sure everything is in the right place.>--
	PotencyBuffs = S{"Enfire","Enfire II","Enblizzard","Enblizzard II","Enaero","Enaero II","Enstone","Enstone II","Enthunder","Enthunder II","Enwater","Enwater II",
			"Blaze Spikes","Ice Spikes","Shock Spikes","Temper",
			"Barfire","Barblizzard","Baraero","Barstone","Barthunder","Barwater","Barsleep","Barpoison","Barparalyze","Barblind","Barsilence","Barpetrify","Barvirus","Baramnesia",
			"Barfira","Barblizzara","Baraera","Barstonra","Barthundra","Barwatera","Barsleepra","Barpoisonra","Barparalyzra","Barblindra","Barsilencera","Barpetra","Barvira","Baramnesra",}

	DurationBuffs = S{"Reraise","Blink","Haste","Flurry","Sneak","Invisible","Deodorize","Klimaform",
			"Firestorm","Hailstorm","Windstorm","Sandstorm","Thunderstorm","Rainstorm","Voidstorm","Aurorastorm",} -- Add more as needed.
		ProShell = S{"Protect","Protect II","Protect III","Protect IV","Shell","Shell II","Shell III","Shell IV",
			"Protectra","Protectra II","Protectra III","Protectra IV","Shellra","Shellra II","Shellra III","Shellra IV",} --Specify the rings.
		Regens = S{"Regen","Regen II","Regen III",} -- Specify Mainhand + Body.
		Refreshes = S{"Refresh",} -- Specify w.e it is that ups it.

	Heals = S{"Cure","Cure II","Cure III","Cure IV","Cure V",
			"Cura","Cura II","Curaga","Curaga II","Curaga III"} -- Should be all of them.
			
	Placeholders = S{"Sheepfoe Mambo","Dragonfoe Mambo","Scop's Operetta","Puppet's Operetta", --Primary PH's.
			"Fowl Aubade","Herb Pastoral","Shining Fantasia","Gold Capriccio","Warding Round","Goblin Gavotte"} --Secondary.
	
	DurationSongs = S{"Adventurer's Dirge","Foe Sirvente",} --Marsyas swap
	RangeSongs = S{"Chocobo Mazurka","Raptor Mazurka","Goddess's Hymnus",} --Harp swap, for range.
	
	DebuffSongs = S{"Foe Requiem","Foe Requiem II","Foe Requiem III","Foe Requiem IV","Foe Requiem V","Foe Requiem VI","Foe Requiem VII",
			"Foe Lullaby","Foe Lullaby II","Maiden's Virelai","Pining Nocturne","Battlefield Elegy","Carnage Elegy",--"Horde Lullaby","Hoard Lullaby II",
			"Fire Threnody","Fire Threnody II","Ice Threnody","Ice Threnody II","Wind Threnody","Wind Threnody II","Earth Threnody","Earth Threnody II",
			"Ltng. Threnody","Ltng. Threnody II","Water Threnody","Water Threnody II","Light Threnody","Light Threnody II","Dark Threnody","Dark Threnody II",
			"Magic Finale",}
	
--{(Waltz/JA group maps, if anything else weird appears, put it here.>--

	JAWaltz = S{"Curing Waltz","Curing Waltz II","Curing Waltz III","Divine Waltz","Healing Waltz",}	

--{(Weaponskill group maps, make sure everything is in the right place.>--
	
	WSSTRAtt = S{"Fast Blade","Flat Blade","Circle Blade","Savage Blade",
		"Exenterator","Viper Bite","Shadowstitch","Rudra's Storm",}
	
	WSCrit = S{"Vorpal Blade","Wasp Sting","Viper Bite","Evisceration",}
	
	WSElem = S{"Burning Blade","Red Lotus Blade","Shining Blade","Seraph Blade","Sanguine Blade",
		"Gust Slash","Cyclone","Aeolian Edge","Energy Drain","Energy Steal",}

-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "And so, the muse once more sings..." ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {main="Carnwenhan",sub="Genmei Shield",range="Linos",
			head={ name="Chironic Hat", augments={'"Refresh"+2',}},
			body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
			hands={ name="Chironic Gloves", augments={'"Refresh"+2',}},
			legs="Assid. Pants +1",
			feet="Fili Cothurnes +2",
			waist="Embla Sash",
			 neck="Bathy Choker +1",
			 right_ear="Infused Earring",
			 left_ear="Etiolation Earring",
			 right_ring="Chirich Ring +1",
			 left_ring="Karieyh Ring",
			back="Kumbira Cape",}

		sets.Idle.Defense = set_combine(sets.Idle.Movement,{
			head="Fili Calot +2",
			body="Ashera Harness",
			hands="Fili Manchettes +2",
			legs="Nyame Flanchard",
			feet="Fili Cothurnes +2",
			 waist="Flume Belt",
			 left_ear="Eabani Earring",
			 right_ring="Chirich Ring +1",
			 left_ring="Defending Ring",
			back={ name="Intarabus's Cape", augments={'Phys. dmg. taken-10%',}},})

		sets.Idle.Kiting = {main="Gleti's Knife",sub="Genmei Shield",range="Linos",
			head="Nyame Helm",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Bathy Choker +1",
			waist="Flume Belt",
			left_ear="Eabani Earring",
			right_ear="Infused Earring",
			left_ring="Defending Ring",
			right_ring="Ilabrat Ring",
			back="Relucent Cape",}

--{(Melee Sets>--
	sets.Engaged = {}
		sets.Engaged.General = {range="Linos", --QA+3
			head="Aya. Zucchetto +2", 	--STP	//Bunzi. QA+3
			body="Ashera Harness",		--IT EXISTS, TY WhiteRabbit ;w; <3
			hands="Bunzi's Gloves",		--DA
			legs="Volte Tights",		--STP
			feet="Nyame Sollerets",		--DT --> Options, Volte/Battlecast.
			neck="Bard's Charm +2",		--STP + QA3
			waist="Windbuffet Belt +1",	--TA/QA 
			left_ear="Cessance Earring",--DA STP
			right_ear="Brutal Earring",	--DA STP
			left_ring="Chirich Ring +1",--STP
			right_ring="Petrov Ring",	--STP DA//Maybe upgrade.
			back={ name="Intarabus's Cape", augments={'"Store TP"+10',}},} 
				-- Accuracy [General]: 1210 -- DT [General]: 32DT, Cape+10. [Total: 42, +Shield]
				
				-- For when one sword is just not enough. 
				sets.Engaged["General"].DW = set_combine(sets.Engaged.General,{waist="Shetal Stone",
					left_ear="Eabani Earring",
					right_ear="Suppanomimi",})
					-- Accuracy [Dualwield]: 1221 -- DT [General]: 25DT, Cape+10. [Total: 35]

			-- 'Can you stop trying to eat me? Please?'
			sets.Engaged.Defense = set_combine(sets.Engaged.General,{
				head="Nyame Helm", 		--DT-7
				hands="Bunzi's Gloves",	--DT-8
				legs="Nyame Flanchard",	--DT-8
				feet="Nyame Sollerets",	--DT-7
				back={ name="Intarabus's Cape", augments={'"Store TP"+10','Phys. dmg. taken-10%',}},})
				-- Accuracy [Defense]: 1170 -- DT [Defense]: 32DT, +10PDT, Cape+10. [Total: 42, +Shield]
				
				-- For when one sword is just not enough. 
				sets.Engaged["Defense"].DW = set_combine(sets.Engaged.Defense,{waist="Shetal Stone",
					left_ear="Eabani Earring",
					right_ear="Suppanomimi",})
					-- Accuracy [Dualwield]: 1221 -- DT [General]: 25DT, Cape+10. [Total: 35]
	
--{(Weapons.>--	Assign more as needed with re-use.
	sets.Carnwenhan	= {main="Carnwenhan",sub="Genmei Shield",}
	sets.Tauret 	= {main="Tauret",sub="Genmei Shield",}
	sets.Naegling	= {main="Naegling",sub="Genmei Shield",}
	
	sets.Carnwenhan.DW	= {main="Carnwenhan",sub="Gleti's Knife",}
	sets.Tauret.DW 		= {main="Tauret",sub="Gleti's Knife",}
	sets.Naegling.DW	= {main="Naegling",sub="Gleti's Knife",}
	
--{(JA Sets>--	
	sets.JA = {}

		sets.JA["Nightingale"] = {feet={ name="Brd. Slippers +2", augments={'Enhances "Nightingale" effect',}},}
		sets.JA["Troubadour"] = {body={ name="Bihu Justaucorps +4", augments={'Enhances "Troubadour" effect',}},}	
		sets.JA["Soul Voice"] = {legs={ name="Brd. Cannions +2", augments={'Enhances "Soul Voice" effect',}},}
		sets.JA["Clarion Call"] = { }
		
		sets.JA.Waltz = {range="Gjallarhorn",
			head="Inyanga Tiara +2",
			body="Inyanga Jubbah +2",
			hands="Inyan. Dastanas +2",
			legs="Dashing Subligar",
			feet="Brioso Slippers +4",
			neck="Mnbw. Whistle +1",
			waist="Chaac Belt",
			left_ear="Etiolation Earring",
			right_ear="Regal Earring",
			left_ring="Defending Ring",
			right_ring="Ayanmo Ring",
			back="Kumbira Cape",}

--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
	
		sets.WS["STR/Att"] = {range="Linos",
			head="Nyame Helm",
			body="Bihu Jstcorps. +4",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Bard's Charm +2",
			waist="Grunfeld Rope",
			left_ear="Moonshade Earring",
			right_ear="Telos Earring",
			right_ring="Epaminondas's Ring",
			left_ring="Karieyh Ring",
			back={ name="Intarabus's Cape", augments={'Weapon skill damage +10%',}},}
				sets.WS["Rudra's Storm"] = set_combine(sets.WS["STR/Att"],{right_ear="Mache Earring +1",right_ring="Ilabrat Ring",})
		
		sets.WS["Mordant Rime"] = {range="Gjallarhorn",	
			head="Nyame Helm",				-- ^ CHR WSD Linos.
			body="Brioso Slippers +4",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Bard's Charm +2",
			waist="Grunfeld Rope",			-- Sailfi.
			left_ear="Moonshade Earring",	-- lolIshvara.
			right_ear="Regal Earring",
			right_ring="Epaminondas's Ring",
			left_ring="Metamor. Ring +1",	-- v CHR WSD Cape.
			back={ name="Intarabus's Cape", augments={'Weapon skill damage +10%',}},}
		
		sets.WS["Crit/DEX/Att"] = {head="Blistering Sallet +1",
			body="Ayanmo Corazza +2",
			hands="Bunzi's Gloves",
			legs={ name="Lustr. Subligar +1", augments={'Crit. hit rate+3%',}},
			feet="Aya. Gambieras +2",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Moonshade Earring",
			right_ear="Mache Earring +1",
			left_ring="Ilabrat Ring",
			right_ring="Begrudging Ring",
			back={ name="Intarabus's Cape", augments={'Weapon skill damage +10%',}},}
		
		sets.WS["EleWS"] = {head="C. Palug Crown",
			body="Brioso Slippers +4",
			hands="Nyame Gauntlets",
			legs={ name="Chironic Hose", augments={'Sklchn.dmg.+3%','Weapon skill damage +7%',}},
			feet={ name="Chironic Slippers", augments={'Weapon skill damage +6%',}},
			neck="Mizu. Kubikazari",
			waist="Eschan Stone",
			left_ear="Moonshade Earring",
			right_ear="Friomisi Earring",
			right_ring="Epaminondas's Ring",
			left_ring="Karieyh Ring",
			back="Toro Cape",}
				sets.WS["Sanguine Blade"] = set_combine(sets.WS["EleWS"],{head="Pixie Hairpin +1",right_ring="Archon Ring"})

--{(Precast Sets>--	
	sets.PreCast = { }
		sets.PreCast.FastCast = {--ammo="Impatiens", --QM+2%
			head="Nahtirah Hat", --FC+10%
			body="Inyanga Jubbah +2", --FC+12%
			hands="Leyline Gloves", --FC+5%, Augment+3%.
			legs="Volte Brais", --FC+8%
			feet="Fili Cothurnes +2", --FC+10%
			neck="Incanter's Torque",
			waist="Witful Belt", --QM+3% --FC+3%
			right_ear="Loquac. Earring", --FC+2%
			left_ear="Etiolation Earring", --FC+1%
			left_ring="Lebeche Ring", --QM+2%
			right_ring="Kishar Ring", --FC+4%
			back="Perimede Cape",} --QM+4%
				sets.PreCast.Ninjutsu = set_combine(sets.PreCast.FastCast,{neck="Magoraga Beads",})
				sets.PreCast.Stoneskin = set_combine(sets.PreCast.FastCast,{main="Pukulatmuj +1",head="Umuthi Hat",legs="Querkening Brais",waist="Siegel Sash",})
				sets.PreCast['Dispelga']= set_combine(sets.PreCast.FastCast,{main="Daybreak",})
				sets.PreCast['Singing']= set_combine(sets.PreCast.FastCast,{ammo="",head="Fili Calot +2",
					feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +10',}},})
				sets.PreCast["Honor March"]= set_combine(sets.PreCast['Singing'],{range="Marsyas",}) -- Honor March Anti-cancel.

--{(Midcast Sets>--	
	sets.MidCast = { }
	
	sets.MidCast.SIRD = {	-- Set to be used as base for mid-combat Stone and Aquaveil, and others as needed.
		sub="Genmei Shield",			-- ->		DT-10
		head="Nyame Helm",				-- ->		DT-7	[or, Aqua+1]
		body="Ros. Jaseran +1",			--SIRD+25
		hands="Chironic Gloves",		--SIRD+20
		legs="Bunzi's Pants",			--SIRD+20	DT-9	[or, Aqua+1/SS+35]
		feet="Nyame Sollerets", 		-- ->		DT-7
		neck="Loricate Torque +1",		--SIRD+5	DT-6
		waist="Emphatikos Rope",		--SIRD+12			Aqua+1!
		left_ear="Magnetic Earring",	--SIRD+8
		right_ear="Etiolation Earring",	-- ->		MDT-3	[or, SS+10]
		left_ring="Defending Ring",		-- ->		DT-10
		--right_ring="Freke Ring",		--SIRD+10
		back={ name="Intarabus's Cape", augments={'Phys. dmg. taken-10%',}},}

	-- Music Kits.
		sets.MidCast['Singing'] = {main="Carnwenhan",
			range="Gjallarhorn", 		--<*+4 All Songs.
			head="Fili Calot +2",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			legs="Inyanga Shalwar +2",
			feet="Brioso Slippers +4",
			neck="Moonbow Whistle +1",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Intarabus's Cape",}
				sets.MidCast["Honor March"] = set_combine(sets.MidCast['Singing'],{range="Marsyas",})

		-- The "I need to annoy the mob to death." kit.
		-- sets.MidCast.Debuff = set_combine(sets.Idle.Kiting,{range="Gjallarhorn",body="Emet Harness +1",neck="Warder's Charm +1",left_ear="Cryptic Earring",right_ear="Friomisi Earring",right_ring="Petrov Ring",})
				
		sets.MidCast.Debuff = {main="Carnwenhan",	--<*+Duration.
			sub="Ammurapi Shield",
			range="Gjallarhorn",  		--<*+4 All Songs.		
			head="Fili Calot +2",		--AF1+3 Hat.
			body="Fili Hongreline +2",	--AF3+2.
			hands="Fili Manchettes +2",	--AF3+2.
			legs="Inyanga Shalwar +2",  --<*+Duration.
			feet="Brioso Slippers +4",	--<*+Duration.
			neck="Mnbw. Whistle +1",  	--<*+3 All Songs.
			waist="Obstinate Sash",
			left_ear="Regal Earring",
			right_ear="Fili Earring +1",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Stikini Ring +1",
			back="Rhapsode's Cape",}
				sets.MidCast["Horde Lullaby"] = set_combine(sets.MidCast.Debuff,{range="Daurdabla",})
				sets.MidCast["Horde Lullaby II"] = set_combine(sets.MidCast.Debuff,{range="Daurdabla",})
				
	
	-- Enfeebling Kits
		sets.MidCast['Enfeebling Magic']= {main="Daybreak",sub="Ammurapi Shield",
			head="C. Palug Crown",
			body="Inyanga Jubbah +2",
			hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
			legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+9','Mag. Acc.+15',}},
			feet="Aya. Gambieras +2",
			neck="Incanter's Torque",
			waist="Obstinate Sash",
			left_ear="Regal Earring",
			right_ear="Digni. Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Kishar Ring",
			back="Rhapsode's Cape",}
				sets.MidCast['Dispelga']= set_combine(sets.MidCast['Enfeebling Magic'], {main="Daybreak",})

		sets.MidCast['Dark Magic'] = set_combine(sets.MidCast['Enfeebling Magic'],{ })

	-- Enhancing Magic Kits
		sets.MidCast['Enhancing Magic']= set_combine(sets.MidCast.SIRD,{main="Pukulatmuj +1",
			sub="Ammurapi Shield",
			head="Umuthi Hat",
			body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
			hands="Inyan. Dastanas +2",
			legs="Shedir Seraweels",
			feet="Kaykaus Boots +1",
			neck="Incanter's Torque",
			waist="Embla Sash",
			left_ear="Mimir Earring",
			right_ear="Andoaa Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Perimede Cape",})

			sets.MidCast.Duration= set_combine(sets.MidCast['Enhancing Magic'],{sub="Ammurapi Shield",
				head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
				body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
				hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
				legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
				feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +10',}},
				waist="Embla Sash",})
					sets.MidCast["Phalanx"]=  set_combine(sets.MidCast.Duration,{head={ name="Chironic Hat", augments={'Phalanx +4'}},
						hands={ name="Chironic Gloves", augments={'Phalanx +5'}},body={ name="Chironic Doublet", augments={'Phalanx +5',}},
						legs={ name="Chironic Hose", augments={'Phalanx +5'}},feet={ name="Chironic Slippers", augments={'Phalanx +4'}},})
					sets.MidCast["Aquaveil"]=  set_combine(sets.MidCast.Duration,{head="Chironic Hat",hands="Regal Cuffs",legs="Shedir Seraweels",waist="Emphatikos Rope",})
					sets.MidCast["Stoneskin"]=  set_combine(sets.MidCast.Duration,{legs="Shedir Seraweels",neck="Nodens Gorget",waist="Siegel Sash",left_ear="Earthcry Earring",})
				--RDM Cleaving/Shield Sets.
					sets.MidCast.AquaTank = set_combine(sets.MidCast.SIRD,{head="Chironic Hat",waist="Emphatikos Rope",})
					sets.MidCast.StoneTank = set_combine(sets.MidCast.SIRD,{neck="Nodens Gorget",waist="Siegel Sash",right_ear="Earthcry Earring",})
					sets.MidCast.CureTank = set_combine(sets.MidCast.SIRD,{body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",feet="Kaykaus Boots +1",
						waist="Flume Belt",right_ear="Roundel Earring",right_ring="Lebeche Ring",})

	-- Healing Kits
		sets.MidCast['Healing Magic']= set_combine(sets.MidCast.SIRD,{head={ name="Vanya Hood", augments={'Healing magic skill +20',}}, -- +10%
			hands="Inyan. Dastanas +2",
			feet={ name="Vanya Clogs", augments={'Healing magic skill +20',}}, -- +5%
			neck="Incanter's Torque",
			left_ring="Haoma's Ring",
			right_ring="Sirona's Ring",})

			sets.MidCast.Cures = set_combine(sets.MidCast['Healing Magic'],{body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",feet="Kaykaus Boots +1", -- +23%-I, +8%-II
				legs={ name="Chironic Hose", augments={'"Cure" potency +11%',}},
				waist="Rumination Sash",
				left_ring="Lebeche Ring",
				left_ear="Regal Earring",})

	-- Elemental Kits
		sets.MidCast['Elemental Magic'] = {main="Daybreak",
			sub="Culminus",
			ammo="Impatiens",
			head="C. Palug Crown",
			body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
			hands="Bunzi's Gloves",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+9','Mag. Acc.+15',}},
			feet={ name="Chironic Slippers", augments={'Magic burst dmg.+12%',}},
			neck="Mizu. Kubikazari",
			waist="Eschan Stone",
			left_ear="Regal Earring",
			right_ear="Hermetic Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Stikini Ring +1",
			back="Toro Cape",}
			
		sets.MidCast['Divine Magic']= set_combine(sets.MidCast['Elemental Magic'],{main="Daybreak",feet={ name="Chironic Slippers", augments={'Magic burst dmg.+12%',}},})
		
		sets.MidCast['Geomancy'] = {hands="Inyan. Dastanas +2",neck="Incanter's Torque",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",}
		
		--sets.MidCast.Treasure = {head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",}
			sets.MidCast['Stone']= set_combine(sets.MidCast['Elemental Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Holy']= set_combine(sets.MidCast['Divine Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Diaga']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})		
			sets.MidCast['Dia']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})		
			sets.MidCast['Dia II']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})		
			sets.MidCast["Foe Requiem"]= set_combine(sets.MidCast.Debuff,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})

	sets.Static = {main='',sub='',}

end	

--------------------
--{(Rules & Logic>--
--------------------
	function file_unload()
-- Keybinds.
		--windower.send_command('unbind Numpad1 gs c C1') -- Tier
		windower.send_command('unbind Numpad2 gs c C2') -- Backcycle; Armors.
		windower.send_command('unbind Numpad3 gs c C3') -- Backcycle; Weapons.
	
		windower.send_command('unbind Numpad6 gs c C6') -- Weapon Lock
		
		windower.send_command('unbind Numpad7 gs c C7') -- Idle
		windower.send_command('unbind Numpad8 gs c C8') -- Melee
		windower.send_command('unbind Numpad9 gs c C9') -- Weapon
		add_to_chat(158,' "DJ Mittens, it\'s time to pack up the tunes.~" -Scy ')
	end	

	function is_am_active()
		return buffactive['Aftermath'] or buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'] 
	end

	function HandleOffhand()
		if (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]].DW,sets[WeaponArray[WeaponIndex]].DW))
		end
	end

	function IdleOffhand()
		if (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]].DW))
		end
	end

	function ObiCheck(spell)
		if (spell.skill == "Elemental Magic") or (spell.skill == "Dark Magic") or (spell.skill == "Healing Magic") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({waist="Hachirin-no-obi"})
			end
		end
	end

	function MidCastVibeCheck(spell)
		if (EngagedIndex == 3 and player.status =='Engaged') then
			if spell.english == "Aquaveil" then
				equip(sets.MidCast.AquaTank) 
			elseif spell.english == "Stoneskin" then
				equip(sets.MidCast.StoneTank)
			elseif Heals:contains(spell.name) then
				if spell.target.type == 'SELF' then
					equip(set_combine(sets.MidCast.CureTank,{waist="Gishdubar Sash",}))
				else equip(sets.MidCast.CureTank) end
			end
		end
	end

	function precast(spell,action)
	--send_command('@input /echo '..spell.type)
		if spell.action_type == 'Magic' then
			if sets.PreCast[spell.english] then
				equip(sets.PreCast[spell.english])
			elseif sets.PreCast[spell.skill] then
				equip(sets.PreCast[spell.skill])
			else
				equip(sets.PreCast.FastCast)
			end
		elseif spell.type == "WeaponSkill" then
			if sets.WS[spell.english] then
				if (spell.element == world.day_element) or (spell.element == world.weather_element) then
					equip(set_combine(sets.WS[spell.english],{waist="Hachirin-no-Obi"}))
				else
					equip(sets.WS[spell.english])
				end
					elseif WSSTRAtt:contains(spell.name) then
						equip(sets.WS["STR/Att"])
					elseif WSCrit:contains(spell.name) then
						equip(sets.WS["Crit/DEX/Att"])
					elseif WSElem:contains(spell.name) then
						if (spell.element == world.day_element) or (spell.element == world.weather_element) then
							equip(set_combine(sets.WS["EleWS"],{waist="Hachirin-no-Obi"}))
						else
							equip(sets.WS["EleWS"])
						end
				else equip(sets.WS["STR/Att"])	
			end
		elseif spell.type == "JobAbility" then
			if sets.JA[spell.english] then
				equip(sets.JA[spell.english])
			end
		elseif spell.type == "Waltz" then 
			if JAWaltz:contains(spell.name) then
				equip(sets.JA.Waltz)
			end
		end

	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function midcast(spell,action)
		if spell.action_type == 'Magic' then
			if sets.MidCast[spell.english] then
				equip(sets.MidCast[spell.english]) 
				-- Music Code.
				elseif Placeholders:contains(spell.name) then
					equip(set_combine(sets.MidCast['Singing'],{range="Daurdabla",body="Nyame Mail",}))
					elseif DurationSongs:contains(spell.name) then	--Length > Potency.
						equip(set_combine(sets.MidCast['Singing'],{range="Marsyas",}))
					elseif RangeSongs:contains(spell.name) then		-- EVERYONE GETS IT.
						equip(set_combine(sets.MidCast['Singing'],{range="Daurdabla",}))
					elseif DebuffSongs:contains(spell.name) then
						equip(sets.MidCast.Debuff)
				-- End Music Code.
				elseif PotencyBuffs:contains(spell.name) then
					equip(sets.MidCast['Enhancing Magic']) 
				elseif DurationBuffs:contains(spell.name) then
					equip(sets.MidCast.Duration) 
				elseif ProShell:contains(spell.name) then
					equip(set_combine(sets.MidCast.Duration,{left_ring="Sheltered Ring",})) 					
				elseif Regens:contains(spell.name) then
					equip(set_combine(sets.MidCast.Duration,{main="Bolelabunga",head="Inyanga Tiara +2",body="Telchine Chas.",}))
				elseif Refreshes:contains(spell.name) then
					equip(set_combine(sets.MidCast.Duration,{waist="Gishdubar Sash",}))
				elseif Heals:contains(spell.name) then
					if spell.target.type == 'SELF' then
						equip(set_combine(sets.MidCast.Cures,{waist="Gishdubar Sash",})) 
					else equip(sets.MidCast.Cures) end
				elseif sets.MidCast[spell.skill] then
					equip(sets.MidCast[spell.skill])	
				end
			end 
	-- Tank/Cleaving/FuckYourMidCastDeathCheck.png
		MidCastVibeCheck(spell) 
	-- Weathercheck.
		ObiCheck(spell)
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function aftercast(spell,action)
	if player.status =='Engaged' then
		equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
		HandleOffhand()
		else
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
			equip(equipSet)
			IdleOffhand()
		end	
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function status_change(new,old)
	if buffactive['Terror'] or buffactive['Stun'] or buffactive['Sleep'] or buffactive['Petrification'] then
        equip(sets.Idle.Defense)
		elseif new == 'Idle' then
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
			IdleOffhand()
		elseif new == 'Resting' then
			equip(sets.Resting)
		elseif new == 'Engaged' then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
		HandleOffhand()
		equip(equipSet)
	end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

-- Check for Array Reworks With Each Use.
	function self_command(command)
	--Idle.
		if command == 'C7' then
			IdleIndex = (IdleIndex % #IdleArray) +1
			status_change(player.status)
			add_to_chat(158,'Idle Mode: ' ..IdleArray[IdleIndex])
	--Melee.
		elseif command == 'C8' then
			EngagedIndex = (EngagedIndex % #EngagedArray) +1
			status_change(player.status)
			--add_to_chat(158, "EngagedIndex value is currently: "..EngagedIndex)
			add_to_chat(158,'Melee Mode: ' ..EngagedArray[EngagedIndex])	
	--Backswitch.
		elseif command == 'C2' then
			if ((EngagedIndex -1) % #EngagedArray) == 0
				then EngagedIndex = #EngagedArray
			else EngagedIndex = ((EngagedIndex -1) % #EngagedArray) end
			status_change(player.status)
			add_to_chat(158,'Melee Mode: ' ..EngagedArray[EngagedIndex])
	--Weaponswapper.
		elseif command == 'C9' then 
			WeaponIndex = (WeaponIndex % #WeaponArray) +1
			status_change(player.status)
			add_to_chat(158,'Mainhand Weapon: ' ..WeaponArray[WeaponIndex])
	--Backswitch.
		elseif command == 'C3' then
			if ((WeaponIndex -1) % #WeaponArray) == 0
				then WeaponIndex = #WeaponArray
			else WeaponIndex = ((WeaponIndex -1) % #WeaponArray) end
			status_change(player.status)
			add_to_chat(158,'Mainhand Weapon: ' ..WeaponArray[WeaponIndex])
	--Severity Gauge.
		elseif command == 'C1' then
			TierIndex = (TierIndex % #TierArray) +1
			status_change(player.status)
			add_to_chat(158,'Content Selection: ' ..TierArray[TierIndex])	
	--Weapon Lock.
		elseif command == 'C6' then
			if Weapon == 'Weapon' then
				Weapon = 'None'
				add_to_chat(123,'Main & Sub: [unlocked]')
				send_command('gs enable main; gs enable sub')
			else
				Weapon = 'Weapon'
				add_to_chat(158,'Main & Sub: [locked]')
				send_command('gs disable main; gs disable sub')
			end	
		end
		status_change(player.status)
		texts.destroy(BlackMana)
		texts.destroy(RedMana)
		texts.destroy(WhiteMana)
		ManaBarsHUD()		
	end