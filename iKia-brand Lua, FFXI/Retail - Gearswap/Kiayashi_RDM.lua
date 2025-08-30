--Last Edit; 8-8-25--
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.RDM |  --
--	|v.5.4.Baha |  --
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
			ManaScroll:path(string.format('%sHUD/RDM.png', windower.addon_path))
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
			RedMana:show()
		--Mage Toggles.
			WhiteMana = texts.new('Magic Settings: \n [4] Burst: ' ..ElementalArray[ElementalIndex].. ' \n [5] Enspell: ' ..EnspellArray[EnspellIndex].. ' \n [6] TP Lock: On/Off.', 
				{bg={visible=false}, flags={draggable=false},
				['pos'] = { ['x'] = 1510, ['y'] = 180},
				text = {size=13, font='Times New Roman'}})
			WhiteMana:color(255,255,255)
			WhiteMana:show()
	end

------------------
--{(Array Logic>--
------------------
	IdleIndex = 1 
	IdleArray = {"Movement","Defense",}
	EngagedIndex = 1 
	EngagedArray = {"Paper Shredder","Defense","Shield",}--"Enspell",}
	WeaponIndex = 1
	WeaponArray = {"Crocea","Excalibur","Almace","Tauret",	--"Naegling",
						"Maxentius","Magic",}

	ElementalIndex = 1
	ElementalArray = {"Freenuke", "Burst"}
	EnspellIndex = 1
	EnspellArray = {"On","Off",}
	
	TierIndex = 1
	TierArray = {"Low","High"}
	Weapon = 'None'
	
-- Keybinds.
	windower.send_command('bind Numpad1 gs c C1') -- Tier
	windower.send_command('bind Numpad2 gs c C2') -- Backcycle; Armors.
	windower.send_command('bind Numpad3 gs c C3') -- Backcycle; Weapons.
	
	windower.send_command('bind Numpad4 gs c C4') -- Nuke
	windower.send_command('bind Numpad5 gs c C5') -- Enspell
	windower.send_command('bind Numpad6 gs c C6') -- Weapon Lock
	
	windower.send_command('bind Numpad7 gs c C7') -- Idle
	windower.send_command('bind Numpad8 gs c C8') -- Melee
	windower.send_command('bind Numpad9 gs c C9') -- Weapon
	
-------------------------
--{(Talent Assignments>--
-------------------------

--{(Spell group maps, make sure everything is in the right place.>--
	PotencyBuffs = S{"Enfire","Enfire II","Enblizzard","Enblizzard II","Enaero","Enaero II","Enstone","Enstone II","Enthunder","Enthunder II","Enwater","Enwater II",
			"Blaze Spikes","Ice Spikes","Shock Spikes","Temper","Temper II",
			"Barfire","Barblizzard","Baraero","Barstone","Barthunder","Barwater","Barsleep","Barpoison","Barparalyze","Barblind","Barsilence","Barpetrify","Barvirus","Baramnesia",
			"Barfira","Barblizzara","Baraera","Barstonra","Barthundra","Barwatera","Barsleepra","Barpoisonra","Barparalyzra","Barblindra","Barsilencera","Barpetra","Barvira","Baramnesra",}
		Gains = S{"Gain-AGI","Gain-CHR","Gain-DEX","Gain-INT","Gain-MND","Gain-STR","Gain-VIT",} --Specify the hands.

	DurationBuffs = S{"Phalanx II","Reraise","Blink","Haste","Haste II","Flurry","Flurry II",
			"Firestorm","Hailstorm","Windstorm","Sandstorm","Thunderstorm","Rainstorm","Voidstorm","Aurorastorm",
			"Sneak","Invisible","Deodorize","Klimaform","Auspice",} -- Add more as needed.
		ProShell = S{"Protect","Protect II","Protect III","Protect IV","Protect V","Shell","Shell II","Shell III","Shell IV","Shell V",
			"Protectra","Protectra II","Protectra III","Protectra IV","Shellra","Shellra II","Shellra III","Shellra IV",} --Specify the rings.
		Regens = S{"Regen","Regen II","Regen III",} -- Specify Mainhand + Body.
		Refreshes = S{"Refresh","Refresh II","Refresh III",} -- Specify w.e it is that ups it.

	Hates = S{"Geist Wall","Blank Gaze","Chaotic Eye","Sound Blast","Jettatura",
			"Poison","Poison II","Poisonga","Banishaga","Flash","Gravity","Bio II",} -- Add more as needed.
	
	Heals = S{"Pollen","Wild Carrot","Magic Fruit","Healing Breeze",
			"Cure","Cure II","Cure III","Cure IV","Cure V",
			"Cura","Cura II","Curaga","Curaga II","Curaga III"} -- Should be all of them.
			
	BlueChain = S{"Power Attack","Battle Dance","Sprout Smack","Grand Slam","Uppercut","Bludgeon","Head Butt","Mandibular Bite","Queasyshroom","Wild Oats","Feather Storm","Helldive",
		"Jet Stream","Pinecone Bomb","Dimensional Death","Death Scissors","Screwdriver","Claw Cyclone","Sickle Slash","Seedspray","Terror Touch","Foot Kick","Smite of Rage",
		"Spiral Spin","Hydro Shot","Body Slam","Tail Slap","Frypan","Frenetic Rip","Spinal Cleave","Hysteric Barrage",}
	
	BlueBurst = S{"Sandspin","Cursed Sphere","Blastbomb","Bomb Toss","Ice Break","Corrosive Ooze",
		"Death Ray","Blitzstrahl","Maelstrom","Firespit","Regurgitation","Eyes On Me","Mysterious Light",}
	
--{(Waltz/JA group maps, if anything else weird appears, put it here.>--
	JAWaltz = S{"Curing Waltz","Curing Waltz II","Curing Waltz III","Divine Waltz","Healing Waltz",}	

--{(Weaponskill group maps, make sure everything is in the right place.>--
	WSSTRAtt = S{"Fast Blade","Flat Blade","Circle Blade","Shadowstitch","Skullbreaker","True Strike","Asuran Fists",}
	
	WSSTRMND = S{"Savage Blade","Knights of Round","Death Blossom","Requiescat","Black Halo","Judgement","Energy Drain","Energy Steal"}
	
	WSCrit = S{"Chant du Cygne","Wasp Sting","Viper Bite","Evisceration","Vorpal Blade"}
	
	WSElem = S{"Burning Blade","Red Lotus Blade","Shining Blade","Seraph Blade","Gust Slash","Cyclone","Aeolian Edge","Shining Strike","Seraph Strike","Flash Nova","Sanguine Blade"}

-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "Welcome back, Kai. Excalibur missed you." ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {ammo="Homiliary",
			head="Viti. Chapeau +3",
			body="Jhakri Robe +2",
			hands={ name="Chironic Gloves", augments={'"Refresh"+2',}},
			legs="Carmine Cuisses +1",
			feet="Nyame Sollerets",
			waist="Flume Belt",			
			 neck="Bathy Choker +1",
			 left_ear="Infused Earring",
			 right_ear="Etiolation Earring",
			 right_ring="Chirich Ring +1",
			 left_ring="Karieyh Ring",
			back={ name="Sucellos's Cape", augments={'DEX+20','"Dbl.Atk."+10',}}}
			-- DEF: 1060+ProV(230) DT: 7% DT, 14% PDT, 3% MDT. Refresh+10, Regen+8, Regain+5.

		sets.Idle.Defense = {ammo="Staunch Tathlum",
			head="Nyame Helm",
			body="Shamash Robe",
			hands="Nyame Gauntlets",
			legs="Carmine Cuisses +1",
			feet="Nyame Sollerets",
			neck="Bathy Choker +1",
			waist="Carrier's Sash",
			left_ear="Eabani Earring",
			right_ear="Etiolation Earring",
			left_ring="Defending Ring",
			right_ring="Chirich Ring +1",
			back={ name="Sucellos's Cape", augments={'DEX+20','"Dbl.Atk."+10',}}}
			-- DEF: 1219+ProV(230) DT: 33% DT, 20% PDT, 3% MDT. Refresh+3, Regen+7. Ailment Resist.
			
		sets.Idle.Kiting = set_combine(sets.Idle.Defense,{ammo="Eluder's Sachet",
			body="Nyame Mail",
			waist="Flume Belt",			
			right_ear="Infused Earring",			
			back={ name="Sucellos's Cape", augments={'Chance of successful block +5',}},})
			-- DEF: 1400+ProV(230) DT: 40% DT, 4% PDT, ForcedShield+10. Regen+8. Block Rate +5. Crit Floor.

--{(Melee Sets>--
	sets.Engaged = {}
		sets.Engaged["Paper Shredder"] = {ammo="Coiste Bodhar",
			head="Malignance Chapeau",
			body="Ayanmo Corazza +2",
			hands="Bunzi's Gloves",
			legs="Volte Tights",
			feet="Carmine Greaves +1",
			neck="Anu Torque",
			waist="Sailfi Belt +1",
			left_ear="Sherida Earring",
			right_ear="Cessance Earring",
			left_ring="Petrov Ring",
			right_ring="Hetairoi Ring",
			back={ name="Sucellos's Cape", augments={'DEX+20','"Dbl.Atk."+10',}},}
			-- Acc: 1118 DT: 30+Offhand. DA: 41%+Belt, TA: 4%+TemperII.
			
			sets.Engaged["Paper Shredder"].DW = set_combine(sets.Engaged["Paper Shredder"],{body="Malignance Tabard",
				feet={ name="Taeon Boots", augments={'"Dual Wield"+5',}},
				left_ear="Suppanomimi",
				right_ear="Crep. Earring",
				left_ring="Ilabrat Ring",
				right_ring="Chirich Ring +1",})
				-- Acc: 1149 DT: 33+Offhand.

		sets.Engaged.Defense = {ammo="Crepuscular Pebble",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Bunzi's Gloves",
			legs="Bunzi's Pants",
			feet="Leth. Houseaux +3",
			neck="Clotharius Torque",
			waist="Eschan Stone",
			left_ear="Sherida Earring",
			right_ear="Crep. Earring",
			left_ring="Defending Ring",
			right_ring="Chirich Ring +1",
			back={ name="Sucellos's Cape", augments={'DEX+20','"Dbl.Atk."+10',}},}
			-- Acc: 1209 DT: 55+Offhand.
			
			sets.Engaged["Defense"].DW = set_combine(sets.Engaged.Defense,{
				feet={ name="Taeon Boots", augments={'"Dual Wield"+5',}},
				left_ear="Suppanomimi",})
				-- Acc: 1186 DT: 55+Offhand.
			
		sets.Engaged.Shield = {main={ name="Excalibur", augments={'Path: A',}}, -- Rate+10
			sub="Sacro Bulwark", 			-- Rate+15
			ammo="Eluder's Sachet",			-- Crit Rate-5%, DT PLUS 2%.
			head="Nyame Helm",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Atro. Boots +3", 			-- Rate+10
			neck="Loricate Torque +1",
			waist="Flume Belt",	
			left_ear="Thureous Earring", 	-- Rate+2
			right_ear="Eabani Earring",
			left_ring="Ilabrat Ring",
			right_ring="Chirich Ring +1",
			back={ name="Sucellos's Cape", augments={'Chance of successful block +5',}},}
			-- Acc: 1084, DT: 39+10ForcedShield.
			
			sets.Engaged.Shield2 = set_combine(sets.Engaged.Shield,{neck = "Warder's Charm +1",waist="Carrier's Sash",})
			-- Magic option.
			
		--	Subtle Blow DT; DT-47%, high M.Def, high Enspell, 33SB1 5SB2. 1177 Acc.
			-- 	sets.Engaged.Enspell = {ammo="Sroda Tathlum",head="Umuthi Hat",body="Lethargy Sayon +2",hands="Aya. Manopolas +2",legs="Viti. Tights +3",feet="Nyame Sollerets",
			--	neck="Bathy Choker +1",waist="Sailfi Belt +1",left_ear="Sherida Earring",right_ear="Digni. Earring",
			--	left_ring="Chirich Ring",right_ring="Chirich Ring +1",back={ name="Sucellos's Cape", augments={'"Dbl.Atk."+10','Damage taken-5%',}},}
				--	sets.Engaged["Enspell"].DW = set_combine(sets.Engaged.Enspell,{feet={ name="Taeon Boots", augments={'"Dual Wield"+5',}},right_ear="Suppanomimi",})
		
		--	Subtle Blow EnII; For when it needs to actually not know I'm here. 21% Haste. (Thuellaic Ecu+1, +2%, Hasty Pinion +1, +2%.)
		 	--	sets.Engaged.Enspell = {main="Crocea Mors",sub="Forfend +1",ammo="Sroda Tathlum",head="Umuthi Hat",body="Viti. Tabard +3",hands="Aya. Manopolas +2",legs="Viti. Tights +3",
		 	--	feet="Leth. Houseaux +3",neck="Bathy Choker +1",left_ear="Sherida Earring",right_ear="Digni. Earring",left_ring="Chirich Ring",right_ring="Chirich Ring +1", back="Ghostfyre Cape",}
		-- 	The En2 Crack Set.
			--	sets.Engaged.Enspell = {main="Crocea Mors",sub="Forfend +1",ammo="Sroda Tathlum",head="Umuthi Hat",body="Viti. Tabard +3",hands="Aya. Manopolas +2",legs="Viti. Tights +3",
			--	feet="Leth. Houseaux +3",neck="Incanter's Torque",waist="Olympus Sash",left_ear="Mimir Earring",right_ear="Andoaa Earring",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1", back="Ghostfyre Cape",}		
			
		-- The WoC Enspell-M.Acc Special.
			--	sets.Engaged.WoC = {ammo="Regal Gem",head="Leth. Chappel +2",body="Lethargy Sayon +2",hands="Leth. Ganth. +2",legs="Bunzi's Pants",feet="Leth. Houseaux +3",
			--	neck={ name="Dls. Torque +2", augments={'Path: A',}},waist={ name="Sailfi Belt +1", augments={'Path: A',}},right_ear="Crep. Earring",left_ear="Digni. Earring",
			--	left_ring="Chirich Ring",right_ring="Chirich Ring +1",back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
			--	sets.Engaged.WoC.DW = sets.Engaged.WoC


--{(Weapons.>--	
	sets.Crocea 	= {main="Crocea Mors",sub="Diamond Aspis",}	--Enspell.
	sets.Excalibur	= {main="Excalibur",sub="Sacro Bulwark",}	--Tank.
	sets.Almace		= {main="Almace",sub="Diamond Aspis",}		--Fencer.
	sets.Maxentius	= {main="Maxentius",sub="Diamond Aspis",}	--2k-Hold.
	--sets.Naegling	= {main="Naegling",sub="Diamond Aspis",}	--2k-Hold.
	sets.Tauret		= {main="Tauret",sub="Sacro Bulwark",}		--Cleave.
	sets.Magic		= {main="Crocea Mors",sub="Diamond Aspis",}	-- Here to prevent breaking.	
	
	sets.Crocea.DW 		= {main="Crocea Mors",sub="Gleti's Knife",}	--Gleti's is fine.
	--	sets.Excalibur.DW	= {main="Excalibur",sub="Sakpata's Sword",}	--Preserved for corner cases/augments later.
	sets.Excalibur.DW	= {main="Excalibur",sub="Gleti's Knife",}	--Laugh.
	sets.Almace.DW		= {main="Almace",sub="Gleti's Knife",}	--Crit.
	sets.Maxentius.DW	= {main="Maxentius",sub="Thibron",}		--TP-Bonus.
	--sets.Naegling.DW	= {main="Naegling",sub="Thibron",}		--TP-Bonus.
	sets.Tauret.DW		= {main="Tauret",sub="Gleti's Knife",}	--Crit.
	--	Pick one based on current need.
	--	sets.Magic.DW	= {main="Crocea Mors",sub="Bunzi's Rod",}	--Sanguine.
		sets.Magic.DW	= {main="Crocea Mors",sub="Daybreak",}		--Seraph/Shining.
	--	sets.Magic.DW	= {main="Crocea Mors",sub="Thibron",}		--Red Lotus.	
	
	sets.NukeDW		= {main="Bunzi's Rod",sub="Daybreak",}	-- Nuke set for DW.
	
--{(JA Sets>--	
	sets.JA = {}

		sets.JA["Chainspell"] = {body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},}
		
		sets.JA["Provoke"] = {-- ammo="AnyEmn+2",
			head="Rabid Visor",						-- Halitus.
			body="Emet Harness +1",					-- [BiS.]
			--hands="Dux Fng. Gnt. +1", 			-- Currently DNE, find some.
			legs="Zoar Subligar +1",				-- [BiS.]
			--feet="Rager Ledel. +1", 				-- WoE.
			neck="Warder's Charm +1",				-- Sybartic's Necklace (10 vs 8)
			waist="Chaac Belt",						-- Trance Belt.
			left_ear="Cryptic Earring",				-- [BiS.]
			right_ear="Friomisi Earring",			-- Trux (BCNM) or Pluto +1.
			left_ring="Petrov Ring",				-- Options; https://www.ffxiah.com/search/item?&slots[]=24576&jobs[]=32&description=Enmity%2B5#adv
			right_ring="Begrudging Ring",			-- BiS, but risky. Is fine.
			back={ name="Sucellos's Cape", augments={'Enmity+10',}},} -- [BiS.]
				sets.JA["Animated Flourish"] = set_combine(sets.JA["Provoke"],{})
				
		sets.JA.Waltz = {ammo="Staunch Tathlum",
			head="C. Palug Crown",
			body="Shamash Robe",
			hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
			legs="Dashing Subligar",
			feet="Malignance Boots",
			neck="Loricate Torque +1",
			waist="Chaac Belt",
			left_ear="Regal Earring",
			right_ear="Roundel Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Defending Ring",
			back="Kumbira Cape",}
			
		sets.JA.Time = {sub="Diamond Aspis",}

--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
	
		sets.WS["STR/Att"] = {ammo="Crepuscular Pebble",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet="Leth. Houseaux +3",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear="Sherida Earring",
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			left_ring="Epaminondas's Ring",
			right_ring="Ilabrat Ring",
			back={ name="Sucellos's Cape", augments={'STR+20','Weapon skill damage +10%',}},}
				sets.WS["Asuran Fists"] = set_combine(sets.WS["STR/Att"],{left_ear="Mache Earring +1",right_ear="Mache Earring +1"})
			
		sets.WS["STR/MND"] = {ammo="Coiste Bodhar",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet="Leth. Houseaux +3",
			neck="Dls. Torque +2",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear="Regal Earring",										-- Test: Sherida Earring, DA+, STR+.
			right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			left_ring="Epaminondas's Ring",
			right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},	-- Test: Ilabrat Ring, Att+.
			back={ name="Sucellos's Cape", augments={'STR+20','Weapon skill damage +10%',}},}
			
		sets.WS["Crit/DEX/Att"] = {ammo="Yetshila +1",
			head={ name="Blistering Sallet +1", augments={'Path: A',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			--body={ name="Agony Jerkin +1", augments={'Path: A',}},
			hands="Malignance Gloves",
			legs="Zoar Subligar +1",
			feet="Thereoid Greaves",
			neck="Fotia Gorget",
			waist="Fotia Belt",
			right_ear="Mache Earring +1",
			left_ear="Sherida Earring",
			left_ring="Ilabrat Ring",
			right_ring="Begrudging Ring",
			back={ name="Sucellos's Cape", augments={'DEX+20',}},}	
				--Fix cape.
		
		sets.WS["EleWS"] = {ammo="Sroda Tathlum",
			head="Leth. Chappel +2",		--AF3+3
			body="Nyame Mail",				-- [Check.]
			hands="Jhakri Cuffs +2",		-- [Check.]
			legs="Amalric Slops +1",		-- [Check.] AF3+3, maybe.
			feet="Leth. Houseaux +3",		-- [Check.]
			neck="Mizu. Kubikazari",		--VR Windy Neck.
			waist="Eschan Stone",			--O.Sash, Hachirin.
			right_ear="Malignance Earring",	-- [Check.]
			left_ear="Regal Earring",		-- [Check.]
			left_ring="Metamor. Ring +1",	-- [Check.]
			right_ring="Freke Ring",		-- [Check.]
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Weapon skill damage +10%',}},} --WSD/MAB.
				sets.WS["Sanguine Blade"] = set_combine(sets.WS["EleWS"],{head="Pixie Hairpin +1",right_ring="Archon Ring"})
				sets.WS["Aeolian Edge"] = set_combine(sets.WS["EleWS"],{head="Nyame Helm",left_ear="Moonshade Earring",left_ring="Epaminondas's Ring",})

		sets.WS["Empyreal Arrow"] = {ammo="Beryllium Arrow",
			head="Malignance Chapeau",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			legs="Volte Tights",
			feet="Malignance Boots",
			 neck="Marked Gorget",
			 waist="Yemaya Belt",
			left_ear="Telos Earring",
			 right_ear="Enervating Earring",
			--left_ring="Cacoethic Ring +1",
			right_ring="Karieyh Ring",
			back={ name="Sucellos's Cape", augments={'STR+20','Weapon skill damage +10%',}},} --Malig, and ranged acc.

--{(Precast Sets>--	
	sets.PreCast = {}
		sets.PreCast.FastCast = {ammo="Impatiens", --QM+2%
			head="Atrophy Chapeau +3", --FC+14%; +3 = 16.
			body="Viti. Tabard +3", --FC+15%
			hands="Leyline Gloves", --FC+5%, Augment+3%.
			legs="Volte Brais", --FC+8%
			feet="Carmine Greaves +1", --FC+8%
			neck="Incanter's Torque",
			waist="Witful Belt", --QM+3% --FC+3%
			left_ear="Loquac. Earring", --FC+2%
			right_ear="Etiolation Earring", --FC+1%
			left_ring="Lebeche Ring", --QM+1%
			right_ring="Kishar Ring", --FC+4%
			back="Perimede Cape",} --QM+4%
				sets.PreCast.Ninjutsu = set_combine(sets.PreCast.FastCast,{neck="Magoraga Beads",})
				sets.PreCast.Stoneskin = set_combine(sets.PreCast.FastCast,{main="Pukulatmuj +1",head="Umuthi Hat",legs="Querkening Brais",waist="Siegel Sash",})
				sets.PreCast['Impact']= set_combine(sets.PreCast.FastCast, {head=empty, body="Twilight Cloak",})
				sets.PreCast['Dispelga']= set_combine(sets.PreCast.FastCast, {main="Daybreak",})

		sets.PreCast.RA = {range="Ullr",ammo="Beryllium Arrow",}
		
--{(Midcast Sets>--	
	sets.MidCast = { }
	
	sets.MidCast.SIRD = {	-- Set to be used as base for mid-combat Stone and Aquaveil, and others as needed.
		sub="Sacro Bulwark",			--SIRD+7	DT-10
		ammo="Staunch Tathlum",			--SIRD+10	DT-2
		head="Nyame Helm",				-- ->		DT-7	[or, Aqua+2]
		body="Ros. Jaseran +1",			--SIRD+25
		hands="Chironic Gloves",		--SIRD+20			[or, Aqua+2/SS+30]
		legs="Bunzi's Pants",			--SIRD+20	DT-9	[or, Aqua+1/SS+35]
		feet="Nyame Sollerets", 		-- ->		DT-7
		neck="Loricate Torque +1",		--SIRD+5	DT-6
		waist="Emphatikos Rope",		--SIRD+12			Aqua+1!
		left_ear="Magnetic Earring",	--SIRD+8
		right_ear="Etiolation Earring",	-- ->		MDT-3	[or, SS+10/Duration+7]
		left_ring="Defending Ring",		-- ->		DT-10
		right_ring="Freke Ring",		--SIRD+10
		back={ name="Sucellos's Cape", augments={'Damage taken-5%',}},}
	
	-- Enfeebling Kits
		sets.MidCast['Enfeebling Magic']= {main={ name="Crocea Mors", augments={'Path: C',}},	-- The Pure Skill Set, for High Skill Cap Spells.
			sub="Ammurapi Shield",
			ammo="Regal Gem",
			head="Viti. Chapeau +3",
			body="Atrophy Tabard +3",
			hands="Leth. Ganth. +2",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+9','Mag. Acc.+15',}},
			feet="Vitiation Boots +3",
			neck="Incanter's Torque",
			waist="Rumination Sash",
			left_ear="Regal Earring",
			right_ear="Snotra Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +8','Enh. Mag. eff. dur. +20',}},}
				sets.MidCast['Distract III']= set_combine(sets.MidCast['Enfeebling Magic'],{neck="Dls. Torque +2",right_ring="Kishar Ring",left_ring="Metamor. Ring +1",})	-- Super High Skill Cap: 610
				sets.MidCast['Frazzle III']= set_combine(sets.MidCast['Enfeebling Magic'],{neck="Dls. Torque +2",left_ring="Metamor. Ring +1",})	-- Super High Skill Cap: 625
		
		sets.MidCast['Enfeebling Magic'].High={main="Daybreak",
			sub="Ammurapi Shield",
			ranged="Ullr",
			head="Atrophy Chapeau +3",
			body="Atrophy Tabard +3",
			hands="Leth. Ganth. +2",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+15',}},
			feet="Vitiation Boots +3",
			neck="Dls. Torque +2",
			waist="Obstinate Sash",
			left_ear="Regal Earring",
			right_ear="Snotra Earring",
			right_ring="Stikini Ring +1",
			left_ring="Stikini Ring +1",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Weapon skill damage +10%',}},}
				sets.MidCast['Impact']= set_combine(sets.MidCast['Enfeebling Magic'].High, 
					{head=empty,body="Twilight Cloak",legs="Leth. Fuseau +2",feet="Leth. Houseaux +3",left_ear="Malignance Earring",})
				sets.MidCast['Dispel']= set_combine(sets.MidCast['Enfeebling Magic'].High, {neck="Dls. Torque +2",})
				sets.MidCast['Dispelga']= set_combine(sets.MidCast['Enfeebling Magic'].High, {main="Daybreak",neck="Dls. Torque +2",})
				
		sets.MidCast['Enfeebling Magic'].Low = set_combine(sets.MidCast['Enfeebling Magic'].High,{ranged=empty,ammo="Regal Gem",
			head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
			hands="Regal Cuffs",
			body="Lethargy Sayon +2",
			legs="Leth. Fuseau +2",
			feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
			neck="Dls. Torque +2",
			right_ear="Snotra Earring",
			right_ring="Kishar Ring",})

		sets.MidCast['Dark Magic'] = set_combine(sets.MidCast['Enfeebling Magic'].High,{range="",ammo="Regal Gem",head="Merlinic Hood",legs="Merlinic Shalwar",feet="Merlinic Crackows", --Drain/Aspir Potency Augments.
			neck="Erra Pendant",left_ring="Stikini Ring +1",right_ring="Kishar Ring",back="Perimede Cape",})
				sets.MidCast['Stun']= set_combine(sets.MidCast['Enfeebling Magic'].High, {neck="Erra Pendant"})
		
	-- Enhancing Magic Kits
		sets.MidCast['Enhancing Magic']= {main="Pukulatmuj +1",
			sub="Forfend +1",
			head="Befouled Crown",
			body="Viti. Tabard +3",
			hands="Viti. Gloves +3",
			legs="Atrophy Tights +3",
			feet="Leth. Houseaux +3",
			neck="Incanter's Torque",
			waist="Olympus Sash",
			left_ear="Mimir Earring",
			right_ear="Andoaa Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back={ name="Ghostfyre Cape", augments={'Enha.mag. skill +8','Enh. Mag. eff. dur. +20',}},} --(Max10)

			sets.MidCast.Duration= set_combine(sets.MidCast['Enhancing Magic'],{main="Colada",
				sub="Ammurapi Shield",
				head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
				legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
				neck="Dls. Torque +2",
				right_ear="Lethargy Earring",
				waist="Embla Sash",})
					sets.MidCast["Phalanx"] = set_combine(sets.MidCast.Duration,{main="Sakpata's Sword",head={ name="Chironic Hat", augments={'Phalanx +4'}},
						hands={ name="Chironic Gloves", augments={'Phalanx +5'}},body={ name="Chironic Doublet", augments={'Phalanx +5',}},
						legs={ name="Chironic Hose", augments={'Phalanx +5'}},feet={ name="Chironic Slippers", augments={'Phalanx +4'}},})
					sets.MidCast["Aquaveil"] = set_combine(sets.MidCast.Duration,{head="Amalric Coif +1",legs="Shedir Seraweels",hands="Regal Cuffs",waist="Emphatikos Rope",})
					sets.MidCast["Stoneskin"] = set_combine(sets.MidCast.Duration,{hands="Stone Mufflers",legs="Shedir Seraweels",neck="Nodens Gorget",waist="Siegel Sash",left_ear="Earthcry Earring",})

			sets.MidCast.Composure= set_combine(sets.MidCast.Duration,{main="Colada",
				head={ name="Leth. Chappel +2",},
				body={ name="Lethargy Sayon +2",},
				legs={ name="Leth. Fuseau +2",},
				feet={ name="Leth. Houseaux +3",},
				neck="Dls. Torque +2",}) 

	-- Healing Kits
		sets.MidCast['Healing Magic']= set_combine(sets.MidCast.SIRD,{head="Vanya Hood", -- +10%
			body="Viti. Tabard +3",
			legs="Atrophy Tights +3",	-- 11%
			feet="Vanya Clogs", 		-- +5%
			neck="Incanter's Torque",
			left_ring="Haoma's Ring",
			right_ring="Sirona's Ring",})

			sets.MidCast.Cures = set_combine(sets.MidCast['Healing Magic'],{ammo="Regal Gem", -- MND.
				body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",feet="Kaykaus Boots +1", -- +23%-I, +8%-II
				waist="Rumination Sash", --Sacro/Luminary, MND.
				left_ear="Regal Earring",
				right_ear="Malignance Earring",
				back={ name="Sucellos's Cape", augments={'MND+20',}},})

	-- Elemental Kits
		sets.MidCast.Freenuke = {main="Daybreak",
			sub="Culminus",
			ammo="Ghastly Tathlum +1",
			head="Leth. Chappel +2",
			body="Amalric Doublet +1",
			hands="Amalric Gages +1",
			legs="Amalric Slops +1",
			feet="Leth. Houseaux +3", 
			neck="Dls. Torque +2",
			waist="Eschan Stone",	--Sacro Belt.
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring="Metamor. Ring +1",
			right_ring="Freke Ring",
			back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}

		sets.MidCast.Burst = {main="Bunzi's Rod",
			sub="Ammurapi Shield",
			ammo="Ghastly Tathlum +1",
			head="Ea Hat",
			body="Ea Houppelande",
			hands="Amalric Gages +1",
			legs="Ea Slops",
			feet="Leth. Houseaux +3",
			neck="Mizu. Kubikazari",
			waist="Eschan Stone",	--Sacro Belt.
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring="Mujin Band",
			right_ring="Freke Ring",
			back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
			
		sets.MidCast.AoE = {main="Bunzi's Rod",	--bby nukes.
			sub="Culminus",
			ammo="Ghastly Tathlum +1",
			head="C. Palug Crown",
			body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
			hands="Leth. Ganth. +2",
			legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
			feet="Leth. Houseaux +3",
			neck="Mizu. Kubikazari",
			waist="Eschan Stone",
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Freke Ring",
			back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}

	-- Kits for Shenanigans.
		sets.MidCast['Blue Magic']= {ammo="Regal Gem",
			head="Atrophy Chapeau +3",
			body="Malignance Tabard",
			hands="Kaykaus Cuffs +1",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+9','Mag. Acc.+15',}},
			feet="Malignance Boots",
			neck="Erra Pendant",
			waist="Eschan Stone",
			left_ear="Malignance Earring",
			right_ear="Digni. Earring",
			right_ring="Stikini Ring +1",
			left_ring="Metamor. Ring +1",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Weapon skill damage +10%',}},}
				sets.MidCast['Cocoon'] = sets.MidCast.SIRD

		sets.MidCast.BlueChain = {ammo="Amar Cluster",head="Malignance Chapeau",body="Malignance Tabard",hands="Malignance Gloves",
			legs="Carmine Cuisses +1",feet="Malignance Boots",neck="Incanter's Torque",waist="Eschan Stone",
			right_ear="Mache Earring +1",left_ear="Mache Earring +1",left_ring="Chirich Ring +1",right_ring="Chirich Ring +1",
			back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}

		--sets.MidCast.Treasure = {head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",}
			sets.MidCast['Stone']= set_combine(sets.MidCast.Freenuke,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",}) 	-- Alexander HTBF.
			sets.MidCast['Diaga']= set_combine(sets.MidCast['Enfeebling Magic'].Low,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})		
			sets.MidCast['Dia']= set_combine(sets.MidCast['Enfeebling Magic'].Low,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Dia II']= set_combine(sets.MidCast['Enfeebling Magic'].Low,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Dia III']= set_combine(sets.MidCast['Enfeebling Magic'].Low,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Inundation']= set_combine(sets.MidCast['Enfeebling Magic'].Low,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
		
		sets.MidCast['Divine Magic']= set_combine(sets.MidCast.Freenuke,{main="Daybreak",feet={ name="Chironic Slippers", augments={'Magic burst dmg.+12%','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},})
		
		sets.MidCast["Geomancy"] = set_combine(sets.MidCast.SIRD,{neck="Incanter's Torque",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",})
	
		sets.MidCast.Hate = --set_combine(sets.MidCast.SIRD,
			{head="Rabid Visor",body="Emet Harness +1",hands="Nyame Gauntlets",legs="Zoar Subligar +1",neck="Warder's Charm +1",waist="Chaac Belt",
			left_ear="Cryptic Earring",right_ear="Friomisi Earring",left_ring="Petrov Ring",right_ring="Begrudging Ring",back={ name="Sucellos's Cape", augments={'Chance of successful block +5',}}
			,}--) -- Emn+48~55
			
		--RDM Cleaving/Shield Sets.
		sets.MidCast.AquaTank = set_combine(sets.MidCast.SIRD,{head="Amalric Coif +1",waist="Emphatikos Rope",hands="Regal Cuffs",})
		sets.MidCast.StoneTank = set_combine(sets.MidCast.SIRD,{hands="Stone Mufflers",neck="Nodens Gorget",waist="Siegel Sash",right_ear="Earthcry Earring",})
		sets.MidCast.CureTank = set_combine(sets.MidCast.SIRD,{body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",feet="Kaykaus Boots +1",waist="Flume Belt",
			right_ear="Roundel Earring",right_ring="Lebeche Ring",})

		sets.MidCast.RA = {range="Ullr",ammo="Beryllium Arrow",}

	sets.Static = {main='',sub='',range=''}

end	

--------------------
--{(Rules & Logic>--
--------------------
	function file_unload()
-- Keybinds.
		windower.send_command('unbind Numpad1 gs c C1') -- Tier
		windower.send_command('unbind Numpad2 gs c C2') -- Backcycle; Armors.
		windower.send_command('unbind Numpad3 gs c C3') -- Backcycle; Weapons.
		
		windower.send_command('unbind Numpad4 gs c C4') -- Nuke
		windower.send_command('unbind Numpad5 gs c C5') -- Enspell
		windower.send_command('unbind Numpad6 gs c C6') -- Weapon Lock
		
		windower.send_command('unbind Numpad7 gs c C7') -- Idle
		windower.send_command('unbind Numpad8 gs c C8') -- Melee
		windower.send_command('unbind Numpad9 gs c C9') -- Weapon
		add_to_chat(158,' "Until we meet again, then." ')
	end	

	function is_am_active()
		return buffactive['Aftermath'] or buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'] 
	end

	function HandleOffhand()
		if (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
		-- Shield TP Isolation.
			if EngagedIndex == 3 then
				equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
			else
				equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]].DW,sets[WeaponArray[WeaponIndex]].DW))
			end
		end
	end

	function IdleOffhand()
		if EngagedIndex == 3 then
				equip(set_combine(sets.Idle.Kiting,sets[WeaponArray[WeaponIndex]]))
		elseif (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
			if EngagedIndex == 3 then
				equip(set_combine(sets.Idle.Kiting,sets[WeaponArray[WeaponIndex]]))
			else
				equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]].DW))
			end
		end
	end
	
	function NukeOffhand()
		if (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
		-- Shield TP Isolation. Primarily there just to ensure shit doesn't go sideways.
			if EngagedIndex == 3 then
				equip(set_combine(sets.MidCast[ElementalArray[ElementalIndex]],sets[WeaponArray[WeaponIndex]]))
			else
				equip(set_combine(sets.MidCast[ElementalArray[ElementalIndex]],sets.NukeDW))
			end
		end
	end
	
	function MidCastVibeCheck(spell)
		if (EngagedIndex == 3) then
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
	
-- Enspell elemental logic.
	function get_current_enelement()
		-- Thanks Teg. <3
		if buffactive[94] or buffactive[277] then
			return "Fire"
		elseif buffactive[95] or buffactive[278] then
			return "Ice"
		elseif buffactive[96] or buffactive[279] then
			return "Wind"
		elseif buffactive[97] or buffactive[280] then
			return "Earth"
		elseif buffactive[98] or buffactive[281] then
			return "Lightning"
		elseif buffactive[99] or buffactive[282] then
			return "Water"
		else
			return nil
		end
	end
	
	function get_negative_enelement()
		-- Thanks Teg. <3
		if buffactive[94] or buffactive[277] then
			return "Water"
		elseif buffactive[95] or buffactive[278] then
			return "Fire"
		elseif buffactive[96] or buffactive[279] then
			return "Ice"
		elseif buffactive[97] or buffactive[280] then
			return "Wind"
		elseif buffactive[98] or buffactive[281] then
			return "Earth"
		elseif buffactive[99] or buffactive[282] then
			return "Lightning"
		else
			return nil
		end
	end

	function get_weather_intensity()
		return gearswap.res.weather[world.weather_id].intensity
	end

	function equip_enspell_obi()
		-- Thanks Teg. <3
		local enspell = get_current_enelement()
		local negelement = get_negative_enelement()
		local bonus = 0

		if not enspell then
			return
		end
		
		if not negelement then
			return
		end

	--Bonus calculation.
		if enspell == world.day_element then
			bonus = bonus + 10
		end

		if enspell == world.weather_element then
			if get_weather_intensity() == 2 then
				bonus = bonus + 25
			else
				bonus = bonus + 10
			end
		end

		if negelement == world.day_element then
			bonus = bonus - 10
		end

		if negelement == world.weather_element then
			if get_weather_intensity() == 2 then
				bonus = bonus - 25
			else
				bonus = bonus - 10
			end
		end
	-- End crunch.
	--send_command('@input /echo Weather Mult: '..bonus)
		if (EnspellIndex ~= 2) then
			if get_current_enelement() ~= nil then	
			-- An Enspell is [ On ].
				equip({ammo="Sroda Tathlum",hands="Aya. Manopolas +2",}) end
			if (bonus > 0) then
			-- Day or Weather is [ On ].
				equip({ammo="Sroda Tathlum",hands="Aya. Manopolas +2",waist="Hachirin-no-Obi",}) end
			if (bonus > 19) then
			-- Personal Day Matching Buffs are [ On ].
				equip({ammo="Sroda Tathlum",hands="Aya. Manopolas +2",waist="Hachirin-no-Obi",head="Umuthi Hat",}) end
			if (bonus > 29) then
			-- The stars have aligned, and we are as tiny gods.
				equip({ammo="Sroda Tathlum",hands="Aya. Manopolas +2",waist="Hachirin-no-Obi",head="Umuthi Hat",legs="Viti. Tights +3",}) end
		end
	end

	function ObiCheck(spell)
		if (spell.skill == "Elemental Magic") or (spell.skill == "Dark Magic") or (spell.skill == "Healing Magic") or (spell.type == "WeaponSkill") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({waist="Hachirin-no-obi"})
			end
		end
	end

	function SaboPaws()
		if (buffactive['Saboteur']) 
			then equip({hands="Leth. Ganth. +2",})
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
	elseif spell.action_type == "Ranged Attack" then
		equip(sets.PreCast.RA)
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
			-- Weathercheck.
			ObiCheck(spell)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		else 
			equip(set_combine(sets.MidCast.Hate,sets.JA.Time))
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
	else	-- The "Kia needs to build hate" clause. Also includes timer++.
		if (spell.type == "Step") or (spell.type == "Flourish1") or (spell.type == "Flourish2") or (spell.type == "Samba") then
			equip(sets.MidCast.Hate)
		else
			equip(set_combine(sets.MidCast.Hate,sets.JA.Time))
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
	if spell.action_type == "Ranged Attack" then
		equip(sets.MidCast.RA)
	elseif	spell.action_type == 'Magic' then
		if sets.MidCast[spell.english] then
			if buffactive.Accession and spell.english == 'Phalanx' then
				equip(sets.MidCast.Duration)
			else equip(sets.MidCast[spell.english]) 
			end
		elseif spell.skill == "Elemental Magic" then
			if spell.name:contains('ga') or spell.name:contains('ra') then
				equip(set_combine(sets.MidCast.AoE))
			else 
				equip(sets.MidCast[ElementalArray[ElementalIndex]])
				NukeOffhand()
			end
		elseif spell.skill == "Enfeebling Magic" then
			equip(sets.MidCast['Enfeebling Magic'][TierArray[TierIndex]])
			SaboPaws()
		elseif PotencyBuffs:contains(spell.name) then
			equip(sets.MidCast['Enhancing Magic'])
		elseif Gains:contains(spell.name) then
			equip(set_combine(sets.MidCast['Enhancing Magic'],{hands="Viti. Gloves +3",}))
		elseif DurationBuffs:contains(spell.name) then
			if buffactive.Composure and spell.target.type ~= 'SELF' then
				equip(sets.MidCast.Composure) 
			else equip(sets.MidCast.Duration) end
		elseif ProShell:contains(spell.name) then
			if buffactive.Composure and spell.target.type ~= 'SELF' then
				equip(set_combine(sets.MidCast.Composure,{})) 
			else equip(set_combine(sets.MidCast.Duration,{left_ring="Sheltered Ring",})) end					
		elseif Regens:contains(spell.name) then
			if buffactive.Composure and spell.target.type ~= 'SELF' then
				equip(set_combine(sets.MidCast.Composure,{main="Bolelabunga",body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},})) 
			else equip(set_combine(sets.MidCast.Duration,{main="Bolelabunga",body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},})) end						
		elseif Refreshes:contains(spell.name) then
			if buffactive.Composure and spell.target.type ~= 'SELF' then
				equip(set_combine(sets.MidCast.Composure,{head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +2",})) 
			else equip(set_combine(sets.MidCast.Duration,{head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +2",waist="Gishdubar Sash",})) end		
		elseif Heals:contains(spell.name) then
			if spell.target.type == 'SELF' then
				equip(set_combine(sets.MidCast.Cures,{waist="Gishdubar Sash",}))
			else equip(sets.MidCast.Cures) end
		elseif Hates:contains(spell.name) then
			equip(sets.MidCast.Hate)
		elseif spell.skill == "Blue Magic" then
			if BlueChain:contains(spell.name) then
				equip(sets.MidCast.BlueChain) --Chain Affinity Spells.
			elseif BlueBurst:contains(spell.name) then
				equip(sets.MidCast[ElementalArray[ElementalIndex]]) --Burst Affinity Spells.
			else equip(sets.MidCast['Blue Magic']) end		
		elseif sets.MidCast[spell.skill] then
			equip(sets.MidCast[spell.skill])
		else equip(sets.MidCast.Hate)
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
		equip_enspell_obi()
		else
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
			IdleOffhand()
			equip(equipSet)
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
			equip_enspell_obi()
			if (player.equipment.main =='Karambit') or (player.equipment.main =='Hep. Baghnakhs') then
				equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],{left_ear="Mache Earring +1",right_ear="Mache Earring +1"}))
			end
		equip(equipSet)
	end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
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
	--Buffs.
		elseif command == 'C5' then
			EnspellIndex = (EnspellIndex % #EnspellArray) +1
			status_change(player.status)
			add_to_chat(158,'Enspell Focus: ' ..EnspellArray[EnspellIndex])
	--Severity Gauge.
		elseif command == 'C1' then
			TierIndex = (TierIndex % #TierArray) +1
			status_change(player.status)
			add_to_chat(158,'Content Selection: ' ..TierArray[TierIndex])	
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
		texts.destroy(RedMana)
		texts.destroy(WhiteMana)
		ManaBarsHUD()		
	end