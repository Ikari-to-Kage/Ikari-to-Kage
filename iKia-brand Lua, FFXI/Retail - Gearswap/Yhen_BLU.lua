--Last Edit; 10-03-22
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.BLU |  --
--	| v.2.75cap |  --
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
	end

------------------
--{(Array Logic>--
------------------
	IdleIndex = 1 
	IdleArray = {"Movement","Campaign",}
	EngagedIndex = 1 
	EngagedArray = {"General","Learn","Campaign",}
	WeaponIndex = 1
	WeaponArray = {"Sword","Club",}

	Weapon = 'None'
	
-- Keybinds.
	windower.send_command('bind Numpad2 gs c C2') -- Backcycle; Armors.
	windower.send_command('bind Numpad3 gs c C3') -- Backcycle; Weapons.
	
	windower.send_command('bind Numpad6 gs c C6') -- Weapon Lock
	
	windower.send_command('bind Numpad7 gs c C7') -- Idle
	windower.send_command('bind Numpad8 gs c C8') -- Melee
	windower.send_command('bind Numpad9 gs c C9') -- Weapon
	
-------------------------
--{(Talent Assignments>--
-------------------------

--{(Weaponskill groupings.)}--

	WSSTRAtt = S{"Fast Blade","Flat Blade","Circle Blade","Skullbreaker","True Strike","Vorpal Blade","Expiacion"}
	
	WSSTRMND = S{"Savage Blade","Black Halo","Judgement"}
	
	WSElem = S{"Burning Blade","Red Lotus Blade","Shining Blade","Seraph Blade","Shining Strike","Seraph Strike","Flash Nova","Sanguine Blade"}
	
--{(Spell groupings.)}--
	
	STR = S{"Battle Dance","Uppercut","Dimensional Death","Death Scissors","Vertical Cleave","Spinal Cleave", --PureSTR
		"Head Butt","Mandibular Bite","Queasyshroom", --STRINT
		"Screwdriver","Ram Charge","Frypan","Bludgeon",} --STRMND -CHR
	
	DEX = S{"Claw Cyclone","Sickle Slash","Seedspray","Hysteric Barrage", --PureDEX
		"Terror Touch","Foot Kick","Smite of Rage","Frenetic Rip","Asuran Claws","Disseverment", --DEXSTR
		"Wild Oats","Feather Storm","Helldive","Jet Stream","Spiral Spin","Hydro Shot","Pinecone Bomb",} --AGI
	
	VIT = S{"Sprout Smack","Grand Slam","Body Slam","Sub-zero Smash","Tail Slap","Power Attack","Cannonball",}  --VIT and VITSTR
	
	Heals = S{"Pollen","Wild Carrot","Magic Fruit","Exuviation"} --MNDVIT
	
	Nukes = S{"Sandspin","Cursed Sphere","Blastbomb","Bomb Toss","Ice Break","Corrosive Ooze", --INT
		"Death Ray","Blitzstrahl","Maelstrom","Firespit", --INTMND
		"Regurgitation","Mind Blast","Magic Hammer", --MND
		"Eyes On Me","Mysterious Light",} --CHR
	
	Breath = S{"Poison Breath","Magnetite Cloud","Hecatomb Wave","Radiant Breath","Flying Hip Press","Bad Breath","Frost Breath","Heat Breath","Self-Destruct",} --HP.

-----------------------
--{(Gear Assignments>--
-----------------------
function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "Welcome back, Azulmagia." ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {
		    ammo="White Tathlum",
			body="Ixion Cloak",
			hands="River Gauntlets",
			legs="Blood Cuisses",
			feet="Blood Greaves",
			neck="Orochi Nodowa",
			waist="Ninurta's Sash",
			left_ear="Crimson Earring",
			right_ear="Crimson Earring",
			left_ring="Galdr Ring",
			right_ring="Zilant Ring",
			back="Umbra Cape",}
			
			sets.Idle.Campaign = set_combine(sets.Idle.Refresh,{hands="Orcish Gauntlets",feet="Karasutengu",back="Fourth Mantle",}) --Refresh neck!
		
		sets.Resting = { } --Whenever the hell we put this together...

--{(Melee Sets>--
	sets.Engaged = {}
		sets.Engaged.General = {main="Antea",
			sub="Genbu's Shield",
		    ammo="White Tathlum",
			head="Acubens Helm",
			body="Mirke Wardecors",
			hands="Dusk Gloves +1",
			legs="Homam Cosciales", 	--Desul's haste+3/DA+2
			feet="Homam Gambieras",
			neck="Fortitude Torque",
			waist="Ninurta's Sash",
			left_ear="Suppanomimi", 	
			right_ear="Brutal Earring", 
			left_ring="Ecphoria Ring",	-- Mars? Zilant?
			right_ring="Rajas Ring", 
			back="Cuchulain's Mantle",} --Max Haste/Multi.

			sets.Engaged.Learn = set_combine(sets.Engaged.General,{head="Mirage Keffiyeh",body="Magus Jubbah +1",hands="Magus Bazubands",}) --Learning toggle. Blood Greaves.
			
			sets.Engaged.Campaign = set_combine(sets.Engaged.General,{feet="Karasutengu",right_ring="Patronus Ring",back="Fourth Mantle",}) --Campaign!

--{(Weapons.>--	
	
	sets.Sword	= {main="Antea",sub="Genbu's Shield",}
	sets.Club	= {main="Grandeur",sub="Harpy Shield",}
	
	sets.Sword.DW	= {main="Soulsaber",sub="Antea",}
	sets.Club.DW	= {main="Grandeur",sub="Antea",}
	
--{(JA Sets>--	
	sets.JA = {}

		sets.JA["Azure Lore"] = { }
		
		sets.Waltz = {ammo="Sonia's Plectrum",neck="Shield Collar",}		

--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
	
		sets.WS["STR/Att"] = {ammo="Charitoni Sling",
			head="Voyager Sallet",
			body={ name="Mirke Wardecors", augments={'"Dbl.Atk."+2','"Store TP"+4 "Subtle Blow"+4',}},
			hands="Alkyoneus's Brc.",
			legs="Mirage Shalwar",
			feet="Adsilio Boots +1",
			neck="Fortitude Torque",
			waist="Virtuoso Belt",
			left_ear="Suppanomimi",
			right_ear="Brutal Earring",
			left_ring="Strigoi Ring",
			right_ring="Rajas Ring", 
			back="Cerb. Mantle +1",} --90% Of Everything. Think about Expiacion. Strig/Diamond?
		
		sets.WS["STR/MND"] = {ammo="White Tathlum",
			head="Voyager Sallet",
			body={ name="Mirke Wardecors", augments={'"Dbl.Atk."+2','"Store TP"+4 "Subtle Blow"+4',}},
			hands="Alkyoneus's Brc.",
			legs="Jet Seraweels",
			feet="River Gaiters",
			neck="Fortitude Torque",
			waist="Salire Belt",
			left_ear="Suppanomimi",
			right_ear="Brutal Earring",
			left_ring="Strigoi Ring",
			right_ring="Aqua Ring",
			back="Cerb. Mantle +1",} --Savage~ Blade~. 
	
		sets.WS["EleWS"] = {ammo="White Tathlum",	--Vert Gem, for HP overflow.
			head="Magus Keffiyeh",		--Mori
			body="Mrgn. Cotehardie",	--Mori
			hands="Cobra Gloves",		--Mori
			legs="Jet Seraweels",		--Mori
			feet="River Gaiters",		--Mori
				neck="Fortitude Torque", 	--* CANNOT CHANGE. (Skill+7)
			waist="Salire Belt",
				left_ear="Suppanomimi", 	--* CANNOT CHANGE. (Skill+5)
			right_ear="Novio Earring",	-- Thanks, Khanyan.
			left_ring="Aqua Ring",
			right_ring="Galdr Ring",
			back="Hecate's Cape",} 		--Sanguine and others.

--{(Precast Sets>--	
	sets.PreCast = {}
		sets.PreCast.FastCast = {head="Acubens Helm", --6%Haste. Anwig5%FC.
			body="Ebur Talar", 			--5%FC
			hands="Dusk Gloves +1", 	--4%Haste
			legs="Homam Cosciales", 	--5%FC/3%Haste
			feet="Homam Gambieras", 	--3%Haste
			waist="Ninurta's Sash", 	--6%Haste
			left_ear="Loquacious Earring", --2%FC.
			}
--{(Midcast Sets - BLU Focal.>--	
	sets.MidCast = { }
		sets.MidCast['Blue Magic'] = {head="Mirage Keffiyeh",body="Magus Jubbah +1",legs="Magus Shalwar",feet="Blood Greaves",} -- Skill+. (Legs=SIRD)
			sets.MidCast["MP Drainkiss"] = set_combine(sets.MidCast['Blue Magic'],{main="Chatoyant Staff"})

		sets.MidCast.STR= {ammo="Charitoni Sling",
			head="Voyager Sallet",
			body="Magus Jubbah +1",
			hands="Alkyoneus's Brc.",
			legs="Mirage Shalwar",
			feet="Adsilio Boots +1",
			neck="Justice Torque",
			waist="Virtuoso Belt",
			left_ear="Pixie Earring",
			--right_ear={ name="Diamond Earring", augments={'"Mag.Atk.Bns."+2','AGI+1',}},
			left_ring="Mars's Ring",
			right_ring="Rajas Ring", 
			back="Cerb. Mantle +1",} -- STR+ specialty spells.

		sets.MidCast.DEX= {ammo="Charitoni Sling",
			head="Voyager Sallet",
			body="Magus Jubbah +1",
			hands="Mirage Bazubands",
			legs="Mirage Shalwar",
			feet="Adsilio Boots +1",
			neck="Justice Torque",
			waist="Virtuoso Belt",
			right_ear="Pixie Earring",
			--left_ear={ name="Diamond Earring", augments={'"Mag.Atk.Bns."+2','AGI+1',}},
			left_ring="Zilant Ring",
			right_ring="Rajas Ring", 
			back="Cuchulain's Mantle",} -- STR/DEX+ specialty spells.
		
		sets.MidCast.VIT= {ammo="Charitoni Sling",
			head="Voyager Sallet",
			body="Magus Jubbah +1",
			hands="Alkyoneus's Brc.",
			legs="Mirage Shalwar",
			feet="Adsilio Boots +1",
			neck="Fortitude Torque",
			waist="Virtuoso Belt",
			--left_ear="Pixie Earring",
			right_ear={ name="Diamond Earring", augments={'"Mag.Atk.Bns."+2','AGI+1',}},
			left_ring="Mars's Ring",	-- Corneus.
			right_ring="Rajas Ring",
			back="Cerb. Mantle +1",} -- STR/VIT+ specialty spells.
				sets.MidCast["Cannonball"] = set_combine(sets.MidCast.VIT,{
					head="Mirage Keffiyeh",
					hands="Dusk Gloves +1",
					legs="Blood Cuisses",
					feet="Blood Greaves",
					right_ear="Cassie Earring",
					left_ear="Pagondas Earring",
					left_ring="Aqua Ring",
					right_ring="Serket Ring",
					back="Cerb. Mantle +1",}) -- Every point of defense I can put in this that's not already there.
	
		sets.MidCast.HP= {ammo="White Tathlum",
			head="Mirage Keffiyeh",	--Breath Mod.
			body="Blood Scale Mail",
			hands="River Gauntlets",
			legs="Blood Cuisses",
			feet="Blood Greaves",
			waist="Salire Belt",
			left_ear="Crimson Earring",
			right_ear="Crimson Earring",
			right_ring="Bloodbead Ring",
			--left_ring="Veela Ring",	-- Get it.
			back="Gigant Mantle",} -- HP+, breath modifiers.

		sets.MidCast.Magic = {main="Chatoyant Staff",
			sub="Succubus Grip",
			ammo="White Tathlum",
			head=empty,
			body="Ixion Cloak",
			hands="Cobra Gloves",
			legs="Jet Seraweels",
			feet="River Gaiters",
			neck="Prudence Torque",
			waist="Salire Belt",
			left_ear="Novio Earring",
			right_ear="Moldavite Earring",
			left_ring="Karka Ring",
			right_ring="Galdr Ring",
			back="Dew Silk Cape +1",} --Magic spells, MND/MAB+/INT.

		sets.MidCast['Elemental Magic']= {main="Chatoyant Staff",
			sub="Succubus Grip",
			ammo="White Tathlum",
			head=empty,
			body="Ixion Cloak",
			hands="Cobra Gloves",
			legs="Jet Seraweels",
			feet="River Gaiters",
			neck="Prudence Torque",
			waist="Salire Belt",
			left_ear="Novio Earring",
			right_ear="Moldavite Earring",
			left_ring="Karka Ring",
			right_ring="Galdr Ring",
			back="Merciful Cape",} --INT/MAB+.
			
		sets.MidCast['Dark Magic'] = {main="Chatoyant Staff",
			head="Nashira Turban", --SIRD10%, M.Acc+.
			--body="", --Nash body Skill+5
			legs="Magus Shalwar", --SIRD10%
			feet="Karasutengu", --SIRD15%
			sub="Succubus Grip",
			neck="Prudence Torque",
			waist="Crimson Belt", 	-- +2/+20 in Campaign.
			back="Merciful Cape",} 	-- Drain+.		
		
		sets.MidCast['Healing Magic']= {main="Chatoyant Staff",	
			sub="Succubus Grip",	
			head=empty,
			body="Ixion Cloak",
			hands="River Gauntlets",
			legs="Jet Seraweels",
			feet="River Gaiters",
			neck="Justice Badge",
			waist="Salire Belt",
			left_ring="Karka Ring",
			right_ring="Aqua Ring",
			back="Dew Silk Cape +1",} --MND/Potency/Skill+.
		
		sets.MidCast['Enhancing Magic']= {neck="Enhancing Torque",left_ear="Augment. Earring",back="Merciful Cape",}
		
		sets.MidCast['Divine Magic']= {} -- Ha. Just here to prevent breaking.
	
		sets.MidCast.Hate = {} -- Emn+. If it ever happens. Apply to Voke/Flourish.

		sets.MidCast['Diaga']= {head="White Rarab Cap +1",}
		sets.MidCast['Dia']= {head="White Rarab Cap +1",}
		sets.MidCast['Dia II']= {head="White Rarab Cap +1",}
			
		sets.Static = {main='',sub='',range=''}
end	

--------------------
--{(Rules & Logic>--
--------------------
	function file_unload()
-- Keybinds.
		windower.send_command('unbind Numpad2 gs c C2') -- Backcycle; Armors.
		windower.send_command('unbind Numpad3 gs c C3') -- Backcycle; Weapons.
		
		windower.send_command('unbind Numpad6 gs c C6') -- Weapon Lock
		
		windower.send_command('unbind Numpad7 gs c C7') -- Idle
		windower.send_command('unbind Numpad8 gs c C8') -- Melee
		windower.send_command('unbind Numpad9 gs c C9') -- Weapon
		add_to_chat(158,' "You\'ll be back, dear... Mishi will miss you." ')
	end	

	function is_am_active()
		return buffactive['Aftermath'] or buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'] 
	end

	function HandleOffhand()
		if (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]].DW))
		end
	end
	
	function IdleOffhand()
		if (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]].DW))
		end
	end

	function ObiCheck(spell)
		if (spell.skill == "Elemental Magic") or (spell.skill == "Dark Magic") or (spell.skill == "Healing Magic") or (Nukes:contains(spell.name)) then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({waist="Hachirin-no-obi"})
			end
		end
	end
	
	function CampaignSTR() -- Thanks Iffy. > >; <3Ifirus of Asura/Sylph
		if (buffactive['Allied Tags']) 
			then equip({neck="Bull Necklace"})
		end
	end
	
	function CampaignVIT() -- Thanks Iffy. > >; <3Ifirus of Asura/Sylph
		if (buffactive['Allied Tags']) 
			then equip({neck="Shield Collar"})
		end
	end
	
	function CampaignIdle() -- Thanks Iffy. > >; <3Ifirus of Asura/Sylph
		if (buffactive['Allied Tags']) 
			then equip({hands="Orcish Gauntlets",feet="Karasutengu",back="Fourth Mantle",})
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
						CampaignSTR()
					elseif WSSTRMND:contains(spell.name) then
						equip(sets.WS["STR/MND"])
						CampaignSTR()
					elseif WSElem:contains(spell.name) then
						if (spell.element == world.day_element) or (spell.element == world.weather_element) then
						equip(set_combine(sets.WS["EleWS"],{waist="Hachirin-no-Obi"}))
					else
						equip(sets.WS["EleWS"])
					end
				else equip(sets.WS["STR/Att"])
					CampaignSTR()
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
			if player.tp>200 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function midcast(spell,action)
		if spell.action_type == 'Magic' then
			if sets.MidCast[spell.english] then
				equip(sets.MidCast[spell.english])
					elseif Heals:contains(spell.name) then 
						equip(set_combine(sets.MidCast['Healing Magic'],sets.MidCast['Blue Magic'],{}))
					elseif STR:contains(spell.name) then
						equip(sets.MidCast.STR)
						CampaignSTR()
					elseif DEX:contains(spell.name) then
						equip(sets.MidCast.DEX)
						CampaignSTR()
					elseif VIT:contains(spell.name) then
						equip(sets.MidCast.VIT)
						CampaignVIT()						
					elseif Nukes:contains(spell.name) then
						equip(sets.MidCast.Magic)
					elseif Breath:contains(spell.name) then
						equip(sets.MidCast.HP)
					--elseif Hates:contains(spell.name) then
					--	equip(sets.MidCast.Hate)			
				elseif sets.MidCast[spell.skill] then
					equip(sets.MidCast[spell.skill])
				
			end 
		end
	-- Weathercheck.
		ObiCheck(spell)
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>200 or is_am_active() then
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
			CampaignIdle()
			equip(equipSet)
		end	
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>200 or is_am_active() then
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
			CampaignIdle()
		elseif new == 'Resting' then
			equip(sets.Resting)
		elseif new == 'Engaged' then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
			HandleOffhand()
		equip(equipSet)
	end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>200 or is_am_active() then
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
		ManaBarsHUD()		
	end