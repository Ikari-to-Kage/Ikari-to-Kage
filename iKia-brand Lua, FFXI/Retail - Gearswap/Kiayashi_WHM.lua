--Last Edit; 7-13-22-
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.WHM |  --
--	|v.4.0.Fuck |  --
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
			ManaScroll:path(string.format('%sHUD/SupportG.png', windower.addon_path))
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
			WhiteMana = texts.new('Magic Settings: \n [5] Regen: ' ..RegenArray[RegenIndex].. ' \n [6] TP Lock: On/Off.', 
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
	IdleArray = {"Movement","Defense",}
	EngagedIndex = 1 
	EngagedArray = {"Bapcat","Defense",}
	WeaponIndex = 1
	WeaponArray = {"Mew","Magic","Bap",} --"Maxentius",}

	RegenIndex = 1
	RegenArray = {"Recovery","Time"}
	
	TierIndex = 1
	TierArray = {"Low","High"}
	Weapon = 'None'
	
-- Keybinds.
	--windower.send_command('bind Numpad1 gs c C1') -- Tier
	windower.send_command('bind Numpad2 gs c C2') -- Backcycle; Armors.
	windower.send_command('bind Numpad3 gs c C3') -- Backcycle; Weapons.
	
	windower.send_command('bind Numpad5 gs c C4') -- Regen
	windower.send_command('bind Numpad6 gs c C6') -- Weapon Lock
	
	windower.send_command('bind Numpad7 gs c C7') -- Idle
	windower.send_command('bind Numpad8 gs c C8') -- Melee
	windower.send_command('bind Numpad9 gs c C9') -- Weapon
	
-------------------------
--{(Talent Assignments>--
-------------------------

--{(Spell group maps, make sure everything is in the right place.>--
	PotencyBuffs = S{"Enfire","Enfire II","Enblizzard","Enblizzard II","Enaero","Enaero II","Enstone","Enstone II","Enthunder","Enthunder II","Enwater","Enwater II",
			"Blaze Spikes","Ice Spikes","Shock Spikes",
			"Boost-AGI","Boost-CHR","Boost-DEX","Boost-INT","Boost-MND","Boost-STR","Boost-VIT",}
			
	Bars = S{"Barfire","Barblizzard","Baraero","Barstone","Barthunder","Barwater","Barsleep","Barpoison","Barparalyze","Barblind","Barsilence","Barpetrify","Barvirus","Baramnesia",
			"Barfira","Barblizzara","Baraera","Barstonra","Barthundra","Barwatera","Barsleepra","Barpoisonra","Barparalyzra","Barblindra","Barsilencera","Barpetra","Barvira","Baramnesra",}

	DurationBuffs = S{"Phalanx","Reraise","Reraise II","Reraise III","Reraise IV","Blink","Haste","Flurry","Auspice","Refresh",
			"Firestorm","Hailstorm","Windstorm","Sandstorm","Thunderstorm","Rainstorm","Voidstorm","Aurorastorm",
			"Sneak","Invisible","Deodorize","Klimaform",}
		ProShell = S{"Protect","Protect II","Protect III","Protect IV","Protect V","Shell","Shell II","Shell III","Shell IV","Shell V",
			"Protectra","Protectra II","Protectra III","Protectra IV","Protectra V","Shellra","Shellra II","Shellra III","Shellra IV","Shellra V",} -- Ring.
		Regens = S{"Regen","Regen II","Regen III","Regen IV",} -- Regen Specification Array.
		
	SkinHeals = S{"Cure","Cure II","Cure III","Cure IV","Cure V","Cure VI"}
	PotHeals = S{"Cura","Cura II","Cura III","Curaga","Curaga II","Curaga III","Curaga IV","Curaga V"}
	
	Debuffna = S{"Esuna","Erase","Poisona","Paralyna","Blindna","Silena","Stona","Viruna",}
	
--{(Weaponskill group maps, make sure everything is in the right place.>--

	WSSTRMND = S{"Black Halo","Judgement","Skullbreaker","True Strike","Mystic Boon","Hexa Strike","Realmrazer",
			"Shattersoul","Retribution","Spirit Taker","Full Swing","Shell Crusher","Heavy Swing",}
	
	WSElem = S{"Shining Strike","Seraph Strike","Flash Nova",
			"Cataclysm","Sunburst","Starburst","Earth Crusher","Rock Crusher",}
	
--{(Waltz/JA group maps, if anything else weird appears, put it here.>--

	JAWaltz = S{"Curing Waltz","Curing Waltz II","Curing Waltz III","Divine Waltz","Healing Waltz",}

-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "Why did you eat the tank buster, again?" ')
	
--{(Idle Sets>--
	sets.Idle = { }
	
		sets.Idle.Movement = {main="Daybreak",
			sub="Diamond Aspis",
			ammo="Homiliary",
			head={ name="Chironic Hat", augments={'"Refresh"+2',}},
			body="Shamash Robe",
			hands={ name="Chironic Gloves", augments={'"Refresh"+2',}},
			legs="Assid. Pants +1",
			feet="Herald's Gaiters",
			waist="Embla Sash",
			 neck="Bathy Choker +1",
			 right_ear="Infused Earring",
			 left_ear="Etiolation Earring",
			 left_ring="Chirich Ring +1",
			 right_ring="Karieyh Ring",
			back="Kumbira Cape",}

				sets.Idle.Defense = set_combine(sets.Idle.Movement,{sub="Genmei Shield",
					head="Nyame Helm",
					hands="Bunzi's Gloves",
					legs="Nyame Flanchard",
					feet="Nyame Sollerets",
					neck="Loricate Torque +1",
					waist="Carrier's Sash",})

		sets.Resting = sets.Idle.Movement

--{(Melee Sets>--
	sets.Engaged = { }
	
		sets.Engaged.Bapcat = {ammo="Amar Cluster",
			head="Aya. Zucchetto +2",
			body="Ayanmo Corazza +2",
			hands="Bunzi's Gloves",
			legs="Aya. Cosciales +2",
			feet="Aya. Gambieras +2",
			neck="Clotharius Torque",
			waist="Windbuffet Belt +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Chirich Ring",
			right_ring="Chirich Ring +1",
			back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
			
				sets.Engaged["Bapcat"].DW = set_combine(sets.Engaged.Bapcat,{waist="Shetal Stone",
					left_ear="Eabani Earring",
					right_ear="Suppanomimi",})

			sets.Engaged.Defense = set_combine(sets.Engaged.Bapcat,{ammo="Staunch Tathlum",
				neck="Loricate Torque +1",
				waist="Carrier's Sash",
				left_ear="Etiolation Earring",
				right_ear="Flashward Earring",
				right_ring="Ayanmo Ring",
				left_ring="Defending Ring",})
				
				sets.Engaged["Defense"].DW = set_combine(sets.Engaged.Defense,{waist="Shetal Stone",
					left_ear="Eabani Earring",
					right_ear="Suppanomimi",})
					
--{(Weapons.>--	
	sets.Mew 		= {main="Maxentius",sub="Diamond Aspis",}
	sets.Magic 		= {main="Daybreak",sub="Ammurapi Shield",}
	sets.Bap		= {main="Malignance Pole",sub="Khonsu"}
	
	sets.Mew.DW 	= {main="Maxentius",sub="Izcalli",}
	sets.Magic.DW 	= {main="Daybreak",sub="C. Palug Hammer",}
	sets.Bap.DW		= {main="Malignance Pole",sub="Khonsu"}
	
--{(JA Sets>--	
	sets.JA = {}

	sets.JA.Benediction = {body="Piety Bliaut +3",}
	--	sets.JA.Devotion = {} -- Relic+3 Hat.
	--	sets.JA.Martyr = {}
	--	sets.JA.["Afflatus Misery"] = {}
	--	sets.JA.["Afflatus Solace"] = {}
	
	sets.JA.Waltz = {ammo="Staunch Tathlum",
			head="C. Palug Crown",
			body="Shamash Robe",
			hands="Inyan. Dastanas +2",
			legs="Volte Brais",
			feet="Regal Pumps +1",
			neck="Loricate Torque +1",
			waist="Chaac Belt",
			left_ear="Regal Earring",
			right_ear="Roundel Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Defending Ring",
			back="Kumbira Cape",}

--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
	
		sets.WS["STR/MND"] = {ammo="Crepuscular Pebble",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck={ name="Clr. Torque +2", augments={'Path: A',}},
			waist="Grunfeld Rope",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Epaminondas's Ring",
			back={ name="Alaunus's Cape", augments={'Weapon skill damage +10%',}},}
		
		-- Yes, it gets it's own.
		sets.WS["Hexa Strike"] = {ammo="Amar Cluster",
			head={ name="Blistering Sallet +1", augments={'Path: A',}},
			body={ name="Piety Bliaut +3", augments={'Enhances "Benediction" effect',}},
			hands="Bunzi's Gloves",
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ear="Telos Earring",
			left_ring="Begrudging Ring",
			right_ring="Ilabrat Ring",
			back={ name="Alaunus's Cape", augments={'Weapon skill damage +10%',}},}
		
		sets.WS["EleWS"] = {ammo="Ghastly Tathlum +1",
			head="C. Palug Crown",
			body="Nyame Mail",
			hands="Bunzi's Gloves",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Mizu. Kubikazari",
			waist="Eschan Stone",
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			right_ring="Epaminondas's Ring",
			left_ring="Metamor. Ring +1",
			back="Toro Cape",}

--{(Precast Sets>--	
	sets.PreCast = {}
		sets.PreCast.FastCast = {ammo="Impatiens", --QM+2%
			head="Nahtirah Hat", --FC+10%
			body="Inyanga Jubbah +2", --FC+14%
			hands="Gendewitha Gages", --FC+7%
			legs="Volte Brais", --FC+8%
			feet="Regal Pumps +1", --FC+7%
			neck="Clr. Torque +2", --FC+10%
			waist="Witful Belt", --QM+3% --FC+3%
			left_ear="Loquac. Earring", --FC+2%
			right_ear="Etiolation Earring", --FC+1%
			left_ring="Lebeche Ring", --QM+1%
			right_ring="Kishar Ring", --FC+4%
			back="Perimede Cape",} --QM+4%			
				sets.PreCast.Stoneskin = set_combine(sets.PreCast.FastCast,{head="Umuthi Hat",legs="Querkening Brais",waist="Siegel Sash",})
				sets.PreCast['Impact']= set_combine(sets.PreCast.FastCast, {head=empty, body="Twilight Cloak",})
				sets.PreCast['Dispelga']= set_combine(sets.PreCast.FastCast, {main="Daybreak",})

--{(Midcast Sets>--	
	sets.MidCast = { }

	-- This set here specifically to hold Conserve MP, SIRD, and DT pieces for over laying with all other sets.
		sets.Conserve = {sub="Genmei Shield",	--PDT-10%
			ammo="Impatiens",	--SIRD-10%
			head="Vanya Hood",	-- Conserve MP+6, MDT-5%
			body="Kaykaus Bliaut +1",	-- Conserve MP+7
			hands="Chironic Gloves",	-- SIRD-20%
			legs="Querkening Brais",	-- SIRD-15%
			feet="Aya. Gambieras +2",	-- DT-3%
			neck="Loricate Torque +1", 	-- DT-6%, SIRD.
			waist="Rumination Sash",	-- SIRD-10%
			right_ear="Thureous Earring",	-- Shh. Block rate +2. 
			left_ear="Etiolation Earring",	-- MDT-3%
			right_ring="Freke Ring",		-- SIRD-10%
			left_ring="Defending Ring",-- DT-10%.
			back={ name="Alaunus's Cape", augments={'Phys. dmg. taken-10%',}},}
		
		sets.Debuffna = set_combine(sets.Conserve,{main="Piety Wand",head="Ebers Cap",hands="Ebers Mitts",neck="Clr. Torque +2",back="Mending Cape",})
	
	-- Healing Kits
		sets.MidCast['Healing Magic']= set_combine(sets.Conserve,{ammo="Impatiens",
			head={ name="Vanya Hood", augments={'Healing magic skill +20',}},
			body="Ebers Bliaut +1",
			hands="Inyan. Dastanas +2",
			legs="Th. Pantaloons +2",
			feet="Regal Pumps +1",
			neck="Incanter's Torque",
			left_ring="Haoma's Ring",
			right_ring="Sirona's Ring",}) -- Primary Use; Cursna.

				-- Full Potency, Non-Solace.
				sets.MidCast.Cures = set_combine(sets.MidCast['Healing Magic'],{main="Queller Rod",	--2
					body="Kaykaus Bliaut +1",	--4
					hands="Kaykaus Cuffs +1",	--S+4
					legs="Ebers Pant. +1",
					feet="Kaykaus Boots +1",	--S+2
					neck="Clr. Torque +2",
					waist="Emphatikos Rope",
					left_ear="Malignance Earring",
					right_ear="Regal Earring",
					left_ring="Metamor. Ring +1",
					back="Mending Cape",})
				
				-- Solace, Stoneskin.
				sets.MidCast.CureSkin = set_combine(sets.MidCast.Cures,{body="Ebers Bliaut +1",back="Alaunus's Cape",})

	-- Enhancing Magic Kits
		sets.MidCast['Enhancing Magic']= set_combine(sets.Conserve,{main="Gada",
			sub="Ammurapi Shield",
			head="Befouled Crown",
			body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
			hands="Inyan. Dastanas +2",
			legs="Shedir Seraweels",
			feet="Orsn. Duckbills +1", --119.
			neck="Incanter's Torque",
			waist="Embla Sash",
			left_ear="Mimir Earring",
			right_ear="Andoaa Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Perimede Cape",}) --Adoulin.

			sets.MidCast.Duration= set_combine(sets.MidCast['Enhancing Magic'],{head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
				hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
				legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
				feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +10',}},})
					sets.MidCast["Auspice"]=  set_combine(sets.MidCast.Duration,{feet="Orsn. Duckbills +1",}) --119 these.
					sets.MidCast["Aquaveil"]=  set_combine(sets.MidCast.Duration,{head="Chironic Hat",hands="Regal Cuffs",legs="Shedir Seraweels",waist="Emphatikos Rope",})
					sets.MidCast["Stoneskin"]=  set_combine(sets.MidCast.Duration,{legs="Shedir Seraweels",neck="Nodens Gorget",waist="Siegel Sash",left_ear="Earthcry Earring",})
					sets.MidCast["Phalanx"]=  set_combine(sets.MidCast.Duration,{head={ name="Chironic Hat", augments={'Phalanx +4'}},
						hands={ name="Chironic Gloves", augments={'Phalanx +5'}},body={ name="Chironic Doublet", augments={'Phalanx +5',}},
						legs={ name="Chironic Hose", augments={'Phalanx +5'}},feet={ name="Chironic Slippers", augments={'Phalanx +4'}},})

			sets.MidCast.Bars = set_combine(sets.MidCast['Enhancing Magic'],{main="Beneficius",
				head="Ebers Cap", --119.
				body="Ebers Bliaut +1",
				hands="Ebers Mitts", --119.
				legs="Shedir Seraweels", -- Relic+3.
				back="Alaunus's Cape",})

			-- Regen Array.
				sets.MidCast.Recovery = set_combine(sets.MidCast.Duration,{main="Bolelabunga",
					sub="Ammurapi Shield",
					head="Inyanga Tiara +2",
					body="Piety Bliaut +3",
					hands="Ebers Mitts", --119+1, +2s
					legs="Th. Pantaloons +2", --+3, +3s
					feet={ name="Telchine Pigaches", augments={'Song spellcasting time -7%','Enh. Mag. eff. dur. +10',}},
					waist="Embla Sash",})
				sets.MidCast.Time = set_combine(sets.MidCast.Duration,{
					hands="Ebers Mitts", --119+1, +2s
					legs="Th. Pantaloons +2",}) --+3, +3s

	-- Enfeebling Kits
		sets.MidCast['Enfeebling Magic']= set_combine(sets.Conserve,{sub="Ammurapi Shield",
			head="Inyanga Tiara +2",
			body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
			hands="Inyan. Dastanas +2",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+9','Mag. Acc.+15',}},
			feet="Aya. Gambieras +2",
			neck="Mizu. Kubikazari",
			waist="Obstinate Sash",
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring="Metamor. Ring +1",
			right_ring="Stikini Ring +1",
			back="Toro Cape",})
				sets.MidCast['Impact']= set_combine(sets.MidCast['Enfeebling Magic'], {head=empty, body="Twilight Cloak",})
				sets.MidCast['Dispelga']= set_combine(sets.MidCast['Enfeebling Magic'], {main="Daybreak",})

		sets.MidCast['Dark Magic'] = set_combine(sets.MidCast['Enfeebling Magic'],{ })
				sets.MidCast['Stun']= set_combine(sets.MidCast['Dark Magic'], { })

	-- Kits for Shenanigans.
		sets.MidCast['Divine Magic']= set_combine(sets.Conserve,{main="Daybreak",
			sub="Culminus",
			head="C. Palug Crown",
			body="Shamash Robe",
			hands="Bunzi's Gloves",
			legs="Bunzi's Pants",
			feet={ name="Chironic Slippers", augments={'Magic burst dmg.+12%',}},
			neck="Mizu. Kubikazari",
			waist="Eschan Stone",
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring="Mujin Band",
			right_ring="Freke Ring",
			back="Toro Cape",})
	
		sets.MidCast['Elemental Magic'] = sets.MidCast['Divine Magic']
		
		--sets.MidCast.Treasure = {head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",}
			sets.MidCast['Stone']= set_combine(sets.MidCast['Elemental Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",}) 	-- Alexander HTBF.
			sets.MidCast['Diaga']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})		
			sets.MidCast['Dia']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Dia II']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			
	sets.Static = {main='',sub='',range=''}

end	

--------------------
--{(Rules & Logic>--
--------------------
	function file_unload()
-- Keybinds.
		--windower.send_command('unbind Numpad1 gs c C1') -- Tier
		windower.send_command('unbind Numpad2 gs c C2') -- Backcycle; Armors.
		windower.send_command('unbind Numpad3 gs c C3') -- Backcycle; Weapons.
		
		windower.send_command('unbind Numpad5 gs c C4') -- Regen
		windower.send_command('unbind Numpad6 gs c C6') -- Weapon Lock
		
		windower.send_command('unbind Numpad7 gs c C7') -- Idle
		windower.send_command('unbind Numpad8 gs c C8') -- Melee
		windower.send_command('unbind Numpad9 gs c C9') -- Weapon
		add_to_chat(158,' "Try not to get killed while I\'m gone, yes?" ')
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
		if (spell.skill == "Elemental Magic") or (spell.skill == "Dark Magic") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({waist="Hachirin-no-obi"})
			end
		end
	end

	function CureCheck(spell)
		if (spell.skill == "Healing Magic") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({main="Chatoyant Staff",waist="Hachirin-no-obi"})
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
					elseif WSSTRMND:contains(spell.name) then
						equip(sets.WS["STR/MND"])
					elseif WSElem:contains(spell.name) then
						if (spell.element == world.day_element) or (spell.element == world.weather_element) then
							equip(set_combine(sets.WS["EleWS"],{waist="Hachirin-no-Obi"}))
						else
							equip(sets.WS["EleWS"])
						end
				else equip(sets.WS["STR/MND"])	
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
		if player.sub_job:lower() == 'dnc' then
			if player.tp>250 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>450 then
			equipSet = set_combine(equipSet, sets.Static)
		end
		equip(equipSet)
	end

	function midcast(spell,action)
		if spell.action_type == 'Magic' then
			if sets.MidCast[spell.english] then
				equip(sets.MidCast[spell.english])
				-- Random specific stuff.
					elseif PotencyBuffs:contains(spell.name) then
						equip(sets.MidCast['Enhancing Magic'])
					elseif Bars:contains(spell.name) then
						equip(sets.MidCast.Bars)
					elseif DurationBuffs:contains(spell.name) then
						equip(sets.MidCast.Duration)
					elseif ProShell:contains(spell.name) then
						equip(set_combine(sets.MidCast.Duration,{left_ring="Sheltered Ring",}))
				-- Healing Specifications.
					elseif Regens:contains(spell.name) then
						equip(sets.MidCast[RegenArray[RegenIndex]])
					elseif SkinHeals:contains(spell.name) then
						equip(sets.MidCast.CureSkin)
					elseif PotHeals:contains(spell.name) then
						equip(sets.MidCast.Cures)
					elseif Debuffna:contains(spell.name) then
						equip(sets.Debuffna)
				elseif sets.MidCast[spell.skill] then
					equip(sets.MidCast[spell.skill])
				end
			end 	
	-- Weathercheck.
		ObiCheck(spell)
		CureCheck(spell)
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
		if player.sub_job:lower() == 'dnc' then
			if player.tp>250 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>450 then
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
			IdleOffhand()
			equip(equipSet)
		end	
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
		if player.sub_job:lower() == 'dnc' then
			if player.tp>250 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>450 then
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
		if player.sub_job:lower() == 'dnc' then
			if player.tp>250 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>450 then
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
			RegenIndex = (RegenIndex % #RegenArray) +1
			status_change(player.status)
			add_to_chat(158,'Regen Focus: ' ..RegenArray[RegenIndex])
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