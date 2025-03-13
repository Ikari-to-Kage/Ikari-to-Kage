--Last Edit; 2-25-25-
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.BLU |  --
--	| v.3.Sylph |  --
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
			ManaScroll:path(string.format('%sHUD/DPS.png', windower.addon_path))
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
		--Mage Toggles.
			WhiteMana = texts.new('Magic Settings: \n [4] Burst: ' ..ElementalArray[ElementalIndex].. ' \n [6] TP Lock: On/Off.', 
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
	IdleArray = {"Movement","Defense","Refresh",}
	EngagedIndex = 1 
	EngagedArray = {"General","Defense",} --"Shield",}
	WeaponIndex = 1
	WeaponArray = {"Almace",
		--"Learn",
		"Naegling","Maxentius","Cleave","Magic",}

	ElementalIndex = 1
	ElementalArray = {"Freenuke", "Burst", "Cleave"}

	Weapon = 'None'
	
-- Keybinds.
	windower.send_command('bind Numpad2 gs c C2') -- Backcycle; Armors.
	windower.send_command('bind Numpad3 gs c C3') -- Backcycle; Weapons.
	
	windower.send_command('bind Numpad4 gs c C4') -- Nuke
	windower.send_command('bind Numpad6 gs c C6') -- Weapon Lock
	
	windower.send_command('bind Numpad7 gs c C7') -- Idle
	windower.send_command('bind Numpad8 gs c C8') -- Melee
	windower.send_command('bind Numpad9 gs c C9') -- Weapon
	
-------------------------
--{(Talent Assignments>--
-------------------------

--{(Spell group maps, make sure everything is in the right place.>--
	PotencyBuffs = S{"Enfire","Enfire II","Enblizzard","Enblizzard II","Enaero","Enaero II","Enstone","Enstone II","Enthunder","Enthunder II","Enwater","Enwater II","Blaze Spikes","Ice Spikes","Shock Spikes",
			"Barfire","Barblizzard","Baraero","Barstone","Barthunder","Barwater","Barsleep","Barpoison","Barparalyze","Barblind","Barsilence","Barpetrify","Barvirus","Baramnesia",
			"Barfira","Barblizzara","Baraera","Barstonra","Barthundra","Barwatera","Barsleepra","Barpoisonra","Barparalyzra","Barblindra","Barsilencera","Barpetra","Barvira","Baramnesra",}

	DurationBuffs = S{"Reraise","Blink","Haste","Flurry","Sneak","Invisible","Deodorize","Klimaform",
			"Firestorm","Hailstorm","Windstorm","Sandstorm","Thunderstorm","Rainstorm","Voidstorm","Aurorastorm",} -- Add more as needed.
		ProShell = S{"Protect","Protect II","Protect III","Protect IV","Protect V","Shell","Shell II","Shell III","Shell IV","Shell V",
			"Protectra","Protectra II","Protectra III","Protectra IV","Shellra","Shellra II","Shellra III","Shellra IV",} --Specify the rings.
		Regens = S{"Regen","Regen II","Regen III","Regeneration",} -- Specify Mainhand + Body.
		Refreshes = S{"Refresh","Battery Charge",} -- Specify w.e it is that ups it.

	Heals = S{"Pollen","Wild Carrot","Magic Fruit","Healing Breeze","Exuviation","Plenilune Embrace","Restoral",--"White Wind" --Breath.
			"Cure","Cure II","Cure III","Cure IV","Cure V",
			"Cura","Cura II","Curaga","Curaga II","Curaga III"} -- Should be all of them.
		
	--{( Note: Most Lv.75 spells removed beyond trait-friendly ones, please see AsuraBLU.lua for Lv.75 list additional spells. >--
	Physical = S{"Battle Dance","Uppercut","Dimensional Death","Death Scissors","Vertical Cleave","Spinal Cleave","Cannonball", --Lv.75 Era Funsies.
			"Quadrastrike","Quad. Continuum","Delta Thrust","Heavy Strike","Empty Thrash","Whirl of Rage","Glutinous Dart","Sweeping Gouge","Saurian Slide",
			"Bloodrake",	--Uber shit.
			"Sickle Slash","Hysteric Barrage","Frenetic Rip","Disseverment","Jet Stream", --Lv.75 Era Funsies.
			"Goblin Rush","Sinker Drill","Thrashing Assault","Barbed Crescent","Benthic Typhoon","Paralyzing Triad","Vanity Dive","Amorphic Spikes",}
			
	Nukes = S{"Magic Hammer","Acrid Stream","Subduction","Molting Plumage","Retinal Glare","Blazing Bound","Evryone. Grudge","Charged Whisker","Embalming Earth",
			"Palling Salvo","Thermal Pulse","Water Bomb","Regurgitation","Rail Cannon","Gates of Hades","Thunderbolt",
			"Tenebral Crush","Scouring Spate","Entomb","Silent Storm","Spectral Floe","Searing Tempest","Blinding Fulgor","Anvil Lightning"} --The Hybrid Elemental Nukes.
	
	MAcc = S{"Head Butt","Frypan","Tail Slap","Sudden Lunge","Temporal Shift","Dream Flower","Yawn","Sheep Song","MP Drainkiss",
			"Frightful Roar","Infrasonics","Mortal Ray","Sound Blast","Blank Gaze","Actinic Burst","Reaving Wind","Absolute Terror",}
	
--{(Waltz/JA group maps, if anything else weird appears, put it here.>--
	JAWaltz = S{"Curing Waltz","Curing Waltz II","Curing Waltz III","Divine Waltz","Healing Waltz",}	

--{(Weaponskill group maps, make sure everything is in the right place.>--
	WSSTRAtt = S{"Fast Blade","Flat Blade","Circle Blade",
				"Skullbreaker","True Strike",}	--Club.
	
	WSSTRMND = S{"Savage Blade","Requiescat",
				"Judgement","Black Halo","Realmrazer",}	--Club.
	
	WSCrit = S{"Chant du Cygne","Vorpal Blade",}
	
	WSElem = S{"Burning Blade","Red Lotus Blade","Shining Blade","Seraph Blade","Sanguine Blade",
				"Shining Strike","Seraph Strike","Flash Nova"}	--Club.

-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	windower.send_command('lua r azureSets');
	add_to_chat(158,' "Hello, Mishipeshu. Ready to play?" ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {head="Malignance Chapeau",
			body="Jhakri Robe +2",
			hands="Gleti's Gauntlets",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Gleti's Boots",
			waist="Chaac Belt",
			 neck="Bathy Choker +1",
			 left_ear="Infused Earring",
			 right_ear="Etiolation Earring",
			 left_ring="Chirich Ring +1",
			 right_ring="Karieyh Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','HP+25','Attack+4','DEF+13',}}, }

		sets.Idle.Defense = set_combine(sets.Idle.Movement,{ammo="Staunch Tathlum",
			head="Nyame Helm",
			body="Shamash Robe",
			neck="Loricate Torque +1",
			waist="Carrier's Sash",
			left_ring="Defending Ring",})

		sets.Idle.Refresh = set_combine(sets.Idle.Defense,{body="Shamash Robe",
			waist="Flume Belt",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",})
--{(Melee Sets>--
	sets.Engaged = {}
		sets.Engaged.General = {ammo="Coiste Bodhar",
			head="Adhemar Bonnet +1",
			body="Malignance Tabard",
			Hands="Adhemar Wrist. +1",
			legs="Samnuha Tights",
			feet={ name="Herculean Boots", augments={'"Triple Atk."+4',}},
			neck="Clotharius Torque",
			waist="Sailfi Belt +1",
			left_ear="Brutal Earring",
			right_ear="Cessance Earring",
			right_ring="Epona's Ring",
			left_ring="Chirich Ring +1",
			back={ name="Rosmerta's Cape", augments={'Crit.hit rate+10','Phys. dmg. taken-10%',}},}
			-- 11%PDT, +10% on Cape Eventually. 26SB.

		sets.Engaged.Defense = set_combine(sets.Engaged.General,{head="Malignance Chapeau",
			hands="Malignance Gloves",
			feet="Malignance Boots",
			neck="Loricate Torque +1",
			left_ring="Defending Ring",})
	
		--Fencer.
		sets.Engaged.Shield = set_combine(sets.Engaged.Defense,{sub="Genmei Shield",})

--{(Weapons.>--	
	
	sets.Almace		= {main="Almace",sub="Tanmogayi +1",}
	sets.Naegling	= {main="Naegling",sub="Thibron",}	--Thib.
	sets.Maxentius	= {main="Maxentius",sub="Thibron",}	--Thib.
	sets.Cleave		= {main="Sakpata's Sword",sub="Bunzi's Rod",}
	sets.Magic		= {main="Maxentius",sub="Bunzi's Rod",}
	sets.Learn		= {main="Sakpata's Sword",sub="Genmei Shield",neck="Incanter's Torque",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",
	    head="Luh. Keffiyeh +1",body="Assim. Jubbah +2",hands="Magus Bazubands",legs="Mavi Tayt +2",feet="Luhlaza Charuqs +1",} -- Body/hands/etc.
		
--{(JA Sets>--	
	sets.JA = {}

		sets.JA["Azure Lore"] = { }
		
		sets.JA["Provoke"] = {head="Rabid Visor",
			body="Emet Harness +1",
			legs="Zoar Subligar +1",
			neck="Warder's Charm +1",
			waist="Chaac Belt",
			left_ear="Cryptic Earring",
			right_ear="Friomisi Earring",
			left_ring="Petrov Ring",
			right_ring="Begrudging Ring",
			back="Mubvum. Mantle",} -- Emn+.
				sets.JA["Animated Flourish"] = set_combine(sets.JA["Provoke"],{})
				
		sets.JA.Waltz = {head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
			body="Passion Jacket",
			hands="Malignance Gloves",
			legs="Dashing Subligar",
			feet="Malignance Boots",
			waist="Chaac Belt",
			left_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			back="Kumbira Cape",}			

--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
	
		sets.WS["STR/Att"] = {ammo="Crepuscular Pebble",
			head="Nyame Helm", 
			body="Nyame Mail", 
			hands="Nyame Gauntlets", 
			legs="Nyame Flanchard", 
			feet="Nyame Sollerets",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Telos Earring",
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ring="Epaminondas's Ring",
			left_ring="Karieyh Ring",
			back={ name="Rosmerta's Cape", augments={'Weapon skill damage +10%',}},}	

		sets.WS["STR/MND"] = {ammo="Crepuscular Pebble",
			head="Nyame Helm", 
			body="Nyame Mail", 
			hands="Nyame Gauntlets", 
			legs="Nyame Flanchard", 
			feet="Nyame Sollerets",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Regal Earring",
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ring="Epaminondas's Ring",
			left_ring="Metamor. Ring +1",
			back={ name="Rosmerta's Cape", augments={'Weapon skill damage +10%',}},}
			
		sets.WS["Crit/DEX/Att"] = {ammo="Coiste Bodhar",
			head="Adhemar Bonnet +1",
			body="Gleti's Cuirass",
			hands="Adhemar Wrist. +1",
			legs="Gleti's Breeches",
			feet="Gleti's Boots",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Mache Earring +1",
			right_ear="Mache Earring +1",
			left_ring="Ilabrat Ring",
			right_ring="Begrudging Ring",
    		back={ name="Rosmerta's Cape", augments={'Crit.hit rate+10',}},}	
		
		sets.WS["EleWS"] = {ammo="Ghastly Tathlum +1",
			head="Nyame Helm",				-- [Check.]
			body="Nyame Mail",				-- [Check.]
			hands="Jhakri Cuffs +2",		-- [Check.]
			legs="Amalric Slops +1",		-- [Check.]
			feet="Nyame Sollerets",			-- [Check.]
			neck="Incanter's Torque",		--VR Windy Neck.
			waist="Eschan Stone",			-- Hachi/O.Sash
			left_ear="Regal Earring",		-- [Check.]
			right_ear="Friomisi Earring",	-- [Check.]
			left_ring="Metamor. Ring +1",	-- [Check.]
			right_ring="Epaminondas's Ring",-- [Check.]
			back="Cornflower Cape",}
				sets.WS["Sanguine Blade"] = set_combine(sets.WS["EleWS"],{head="Pixie Hairpin +1",right_ring="Archon Ring"})

--{(Precast Sets>--	
	sets.PreCast = {}
			sets.PreCast.FastCast = {ammo="Impatiens",
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Taeon Tabard", augments={'Accuracy+23','"Dual Wield"+5',}},
			hands="Leyline Gloves",
			legs="Aya. Cosciales +2",
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
			neck="Incanter's Torque",
			waist="Witful Belt",
			left_ear="Loquac. Earring",
			right_ear="Etiolation Earring",
			right_ring="Lebeche Ring",
			back="Perimede Cape",}
				sets.PreCast.Ninjutsu = set_combine(sets.PreCast.FastCast,{neck="Magoraga Beads",body="Passion Jacket",})
				sets.PreCast['Enhancing Magic'] = set_combine(sets.PreCast.FastCast,{waist="Siegel Sash",})
				sets.PreCast.Stoneskin = set_combine(sets.PreCast.FastCast,{main="Pukulatmuj +1",waist="Siegel Sash",})

--{(Midcast Sets>--	
	sets.MidCast = { }
	
	sets.MidCast.SIRD = {ammo="Staunch Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Emphatikos Rope",
		left_ear="Thureous Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Ayanmo Ring",
		}
	
	sets.MidCast['Blue Magic'] = set_combine(sets.MidCast.SIRD,{head="Luh. Keffiyeh +1",
		body="Assim. Jubbah +2",
		legs="Mavi Tayt +2",
		feet="Luhlaza Charuqs +1",
		neck="Incanter's Torque",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Cornflower Cape",}) -- Skill+.

			sets.MidCast.Phys= {ammo="Amar Cluster",
				head="Nyame Helm", 
				body="Nyame Mail", 
				hands="Nyame Gauntlets", 
				legs="Nyame Flanchard", 
				feet="Nyame Sollerets",
				neck="Incanter's Torque",
				waist="Chaac Belt",
				left_ear="Digni. Earring",
				right_ear="Hermetic Earring",
				left_ring="Rajas Ring",
				right_ring="Apate Ring",
				back={ name="Rosmerta's Cape", augments={'Weapon skill damage +10%',}},}

			sets.MidCast.Macc = {ammo="Amar Cluster",
				head="Amalric Coif +1",
				body="Malignance Tabard",
				hands="Malignance Gloves",
				legs="Aya. Cosciales +2",
				feet="Malignance Boots",
				neck="Erra Pendant",
				waist="Eschan Stone",
				left_ear="Digni. Earring",
				right_ear="Crep. Earring",
				left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
				right_ring="Stikini Ring +1",
				back="Cornflower Cape",} --MustStickTheThings!
		
	-- Enfeebling Kits
		sets.MidCast['Enfeebling Magic']= sets.MidCast.Macc

		sets.MidCast['Dark Magic'] = set_combine(sets.MidCast.Macc,{neck="Erra Pendant",left_ring="Stikini Ring +1",right_ring="Kishar Ring",back="Perimede Cape",})

	-- Enhancing Magic Kits
		sets.MidCast['Enhancing Magic']= {main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','CHR+2','"Mag.Atk.Bns."+13',}},
			sub="Pukulatmuj +1",
			head="Carmine Mask",
			body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
			hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
			legs="Carmine Cuisses +1",
			feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +10',}},
			neck="Incanter's Torque",
			left_ear="Mimir Earring",
			right_ear="Andoaa Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Perimede Cape",}			
				sets.MidCast["Aquaveil"]=  set_combine(sets.MidCast['Enhancing Magic'],{head="Amalric Coif +1",hands="Regal Cuffs",legs="Shedir Seraweels",waist="Emphatikos Rope",})
				sets.MidCast["Stoneskin"]=  set_combine(sets.MidCast['Enhancing Magic'],{legs="Shedir Seraweels",hands="Stone Mufflers",neck="Nodens Gorget",waist="Siegel Sash",left_ear="Earthcry Earring",})

			sets.MidCast.Duration= set_combine(sets.MidCast['Enhancing Magic'],{main={ name="Colada", augments={'Enh. Mag. eff. dur. +4','CHR+2','"Mag.Atk.Bns."+13',}},
				head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
				legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},})
					sets.MidCast["Phalanx"]=  set_combine(sets.MidCast.Duration,{main="Sakpata's Sword",})

	-- Healing Kits
		sets.MidCast['Healing Magic']= set_combine(sets.MidCast.SIRD,{legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			neck="Incanter's Torque",
			left_ring="Haoma's Ring",
			right_ring="Sirona's Ring",})

			sets.MidCast.Cures = set_combine(sets.MidCast['Healing Magic'],{main="Bunzi's Rod",	--30%
				sub="Sakpata's Sword",			--DT/Stat
				ammo="White Tathlum",			--HP
				body="Shamash Robe",			--MND
				hands="Telchine Gloves",		--10%
				waist="Rumination Sash",		--MND
				left_ear="Regal Earring",		--MND
				right_ear="Etiolation Earring",	--HP
				left_ring="Metamor. Ring +1",	--MND
				right_ring="Lebeche Ring",		--3%
				back="Cornflower Cape",})		--MND/Skill
					sets.MidCast["White Wind"] = set_combine(sets.MidCast.Cures,{head="Nyame Helm",body="Nyame Mail",left_ring="Meridian Ring",back="Sokolski Mantle"})

	-- Elemental Kits
		sets.MidCast.Freenuke = {main="Maxentius",
			sub="Bunzi's Rod",
			ammo="Ghastly Tathlum +1",
			head="Jhakri Coronal +2",
			body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
			hands="Amalric Gages +1",
			legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
			feet="Jhakri Pigaches +2",
			neck="Incanter's Torque",
			waist="Eschan Stone",
			left_ear="Regal Earring",
			right_ear="Friomisi Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Stikini Ring +1",
			back="Cornflower Cape",}
			
		sets.MidCast.Cleave = set_combine(sets.MidCast.Freenuke,{ammo="Staunch Tathlum",
			head="Nyame Helm",
			feet="Nyame Sollerets",
			waist="Flume Belt",
			left_ring="Defending Ring",})		

		sets.MidCast.Burst = set_combine(sets.MidCast.Freenuke,{body="Samnuha Coat",
			hands="Amalric Gages +1",
			feet="Jhakri Pigaches +2",
			left_ring="Mujin Band",})

		--sets.MidCast.Treasure = {head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",}
			sets.MidCast['Stone']= set_combine(sets.MidCast.Freenuke,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Subduction']= set_combine(sets.MidCast.Freenuke,{body="Volte Jupon",})
			sets.MidCast['Diaga']= set_combine(sets.MidCast.SIRD,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})		
			sets.MidCast['Dia']= set_combine(sets.MidCast.SIRD,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Dia II']= set_combine(sets.MidCast.SIRD,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
		
		sets.MidCast['Divine Magic']= set_combine(sets.MidCast.Freenuke,{})
	
	sets.Static = {main='',sub='',range=''}

end	

--------------------
--{(Rules & Logic>--
--------------------
	function file_unload()
-- Keybinds.
		windower.send_command('unbind Numpad2 gs c C2') -- Backcycle; Armors.
		windower.send_command('unbind Numpad3 gs c C3') -- Backcycle; Weapons.
		
		windower.send_command('unbind Numpad4 gs c C4') -- Nuke
		windower.send_command('unbind Numpad6 gs c C6') -- Weapon Lock
		
		windower.send_command('unbind Numpad7 gs c C7') -- Idle
		windower.send_command('unbind Numpad8 gs c C8') -- Melee
		windower.send_command('unbind Numpad9 gs c C9') -- Weapon
		add_to_chat(158,' "Until we meet again, then." ')
	end	

	function is_am_active()
		return buffactive['Aftermath'] or buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'] 
	end

	function ObiCheck(spell)
		if (spell.skill == "Elemental Magic") or (spell.skill == "Dark Magic") or (spell.type == "WeaponSkill")
		or (spell.skill == "Healing Magic") or (Nukes:contains(spell.name)) or (spell.type == "WeaponSkill") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({waist="Hachirin-no-obi"})
			end
		end
	end

	function Diffusion()
		if (buffactive['Diffusion'])
			then equip({feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},})
		end
	end
	
	function Efflux()
		if (buffactive['Efflux'])
			then equip({})
		end
	end
	
	function ChainDamage()
		if (buffactive['Chain Affinity'])
			then equip({})
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
			equip(sets.WS[spell.english])
		-- Specific Stat Isolations.
			elseif WSSTRAtt:contains(spell.name) then
				equip(sets.WS["STR/Att"])
			elseif WSSTRMND:contains(spell.name) then
				equip(sets.WS["STR/MND"])
			elseif WSCrit:contains(spell.name) then
				equip(sets.WS["Crit/DEX/Att"])
			elseif WSElem:contains(spell.name) then
				equip(sets.WS["EleWS"])
			else equip(sets.WS["STR/Att"])	
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Flourish1" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Waltz" then 
		if JAWaltz:contains(spell.name) then
			equip(sets.JA.Waltz)
		end
	elseif spell.type == "Effusion" then
		equip(sets.MidCast[ElementalArray[ElementalIndex]])	
	end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>550 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function midcast(spell,action)
	if spell.action_type == 'Magic' then
		if sets.MidCast[spell.english] then
			equip(sets.MidCast[spell.english])
			elseif spell.skill == "Elemental Magic" then
				equip(sets.MidCast[ElementalArray[ElementalIndex]])
		-- Enhancing.
			elseif PotencyBuffs:contains(spell.name) then
				equip(sets.MidCast['Enhancing Magic'])
			elseif DurationBuffs:contains(spell.name) then
				equip(sets.MidCast.Duration)
			elseif ProShell:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{left_ring="Sheltered Ring",}))
			elseif Regens:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{main="Bolelabunga",body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},}))				
			elseif Refreshes:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{head="Amalric Coif +1",waist="Gishdubar Sash",}))
		-- Heals.
			elseif Heals:contains(spell.name) then
				if spell.target.type == 'SELF' then
					equip(set_combine(sets.MidCast.Cures,{waist="Gishdubar Sash",}))
				else equip(sets.MidCast.Cures) end
		-- Blue Magic Isolations.
			elseif Physical:contains(spell.name) then
				equip(sets.MidCast.Phys)
			elseif Nukes:contains(spell.name) then
				if (spell.english == "Tenebral Crush") or (spell.english == "Evryone. Grudge") then
					equip(set_combine(sets.MidCast[ElementalArray[ElementalIndex]],{head="Pixie Hairpin +1",right_ring="Archon Ring"}))
				else--if Nukes:contains(spell.name) then
					equip(sets.MidCast[ElementalArray[ElementalIndex]]) end
			elseif MAcc:contains(spell.name) then
				equip(sets.MidCast.Macc)
		-- Catch All.
			elseif sets.MidCast[spell.skill] then
				equip(sets.MidCast[spell.skill])
			else equip(sets.MidCast.Hate)
			end
		end
	-- Weathercheck.
		ObiCheck(spell)
	-- JAcheck.
		Efflux()
		ChainDamage()
		Diffusion()
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>550 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function aftercast(spell,action)
	if player.status =='Engaged' then
		equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
		else
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
			equip(equipSet)
		end	
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>550 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function status_change(new,old)
	if buffactive['Terror'] or buffactive['Stun'] or buffactive['Sleep'] or buffactive['Petrification'] then
        equip(sets.Idle.Defense)
		elseif new == 'Idle' then
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
		elseif new == 'Resting' then
			equip(sets.Resting)
		elseif new == 'Engaged' then
		equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
		equip(equipSet)
	end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>550 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

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
	--Burstswitch.
		elseif command == 'C4' then
			ElementalIndex = (ElementalIndex % #ElementalArray) +1
			status_change(player.status)
			add_to_chat(158,'Nuke Mode: ' ..ElementalArray[ElementalIndex])
	--Weapon Lock.
		elseif command == 'C6' then
			if Weapon == 'Weapon' then
				Weapon = 'None'
				add_to_chat(123,'Main, Sub, & Ranged : [unlocked]')
				send_command('gs enable main; gs enable sub; gs enable ranged')
			else
				Weapon = 'Weapon'
				add_to_chat(158,'Main, Sub, & Ranged : [locked]')
				send_command('gs disable main; gs disable sub; gs disable ranged')
			end	
		end
		status_change(player.status)
		texts.destroy(BlackMana)
		texts.destroy(WhiteMana)
		ManaBarsHUD()		
	end