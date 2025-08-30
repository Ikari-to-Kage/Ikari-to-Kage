--Last Edit; 12-29-23-
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.DNC |  --
--	|v.4.3.Fuck |  --
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
			ManaScroll:path(string.format('%sHUD/PurpleHUD.png', windower.addon_path))
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
			WhiteMana = texts.new('Magic Settings: \n [6] TP Lock: On/Off.', 
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
	EngagedArray = {"Shredder","Defender",}
	WeaponIndex = 1
	WeaponArray = {"Tauret","Karambit",}

	TierIndex = 1
	TierArray = {"Low","High"}
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

--{(Weaponskill group maps, make sure everything is in the right place.>--

	WSDex = S{"Wasp Sting","Viper Bite","Dancing Edge","Rudra's Storm",
		"Exenterator","Shark Bite",}	-- AGI
	WSStr = S{"Pyrric Kleos","Circle Blade","Fast Blade",
		"Combo","Raging Fists","Dragon Kick","Spinning Attack",
		"Asuran Fists","Tornado Kick","One Inch Punch",}	-- VIT
	WSMag = S{"Shoulder Tackle","Flat Blade","Shadowbind",}
	WSCrit = S{"Evisceration","Vorpal Blade","Backhand Blow",}
	WSElem = S{"Gust Slash","Cyclone","Aeolian Edge",
		"Burning Blade","Red Lotus Blade","Shining Blade","Seraph Blade","Sanguine Blade",}
	
--{(Ability Groups. tl;dr, basically menu copy-pasta.>--

	JAWaltz = S{"Curing Waltz","Curing Waltz II","Curing Waltz III","Curing Waltz IV","Curing Waltz V","Divine Waltz","Divine Waltz II","Healing Waltz",}
	JASteps = S{"Quickstep","Box Step","Stutter Step","Feather Step",}
	JASambas = S{"Drain Samba","Drain Samba II","Drain Samba III","Aspir Samba","Aspir Samba II","Haste Samba",}
	JAJigs = S{"Spectral Jig","Chocobo Jig","Chocobo Jig II",}

-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "Remember; No one is watching." ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {ammo="Staunch Tathlum",
			head="Meghanada Visor +2",
			body="Ashera Harness",
			hands="Gleti's Gauntlets",
			legs="Meg. Chausses +2",
			feet="Tandava Crackows",
			waist="Chaac Belt",
			 neck="Bathy Choker +1",
			 right_ear="Infused Earring",
			 left_ear="Etiolation Earring",
			 left_ring="Chirich Ring +1",
			 right_ring="Karieyh Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','HP+25','Attack+4','DEF+13',}},}
		
		sets.Idle.Defense = set_combine(sets.Idle.Movement,{
			head="Nyame Helm",
			legs="Gleti's Breeches",
			feet="Gleti's Boots",
			neck="Loricate Torque +1",
			waist="Carrier's Sash",
			left_ring="Defending Ring",})

--{(Melee Sets>--
	sets.Engaged = {}
	
	sets.Engaged.Shredder = {ammo="Yamarang",
		head="Adhemar Bonnet +1",
		body="Horos Casaque +3",
		hands="Adhemar Wristbands +1",
		legs="Samnuha Tights",
		feet="Horos Toe Shoes +3",
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back={ name="Toetapper Mantle", augments={'"Store TP"+2','"Dual Wield"+3','"Rev. Flourish"+30',}},}	--STP Ambu.
	
	sets.Engaged.Defender = set_combine(sets.Engaged.Shredder,{
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		right_ear="Brutal Earring",
		right_ring="Defending Ring",})
		
		-- Accuracy [Defense]: 1170 -- DT [Defense]: 32DT, +10PDT, Cape+10. [Total: 52]
	
--{(Weapons.>--	
	sets.Tauret 	= {main="Tauret",sub="Gleti's Knife",}
	sets.Karambit	= {main="Karambit",sub=empty,}
	
--{(JA Sets>--	
	sets.JA = { }

	sets.JA.Trance = {head="Etoile Tiara +2"}
	sets.JA["Saber Dance"] = {legs="Horos Tights +3"}	-- Needs testing for duration/activation.
	sets.JA["Fan Dance"] = {hands="Etoile Bangles +2"}	-- Needs testing. 
	sets.JA["No Foot Rise"] = {body="Horos Casaque +3"}	-- Gives TP!
	
	-- Flourish Logics.
	sets.JA["Animated Flourish"] = {head="Rabid Visor",body="Emet Harness +1",legs="Zoar Subligar +1",neck="Warder's Charm +1",
		left_ear="Cryptic Earring",right_ear="Friomisi Earring",left_ring="Begrudging Ring",right_ring="Petrov Ring",} --Emn+
			sets.JA["Provoke"] = set_combine(sets.JA["Animated Flourish"],{})
	sets.JA["Violent Flourish"] = {ammo="Yamarang",head="Malignance Chapeau",body="Horos Casaque +3",hands="Malignance Gloves",legs="Horos Tights +3",
		feet="Malignance Boots",neck="Etoile Gorget +1",waist="Eschan Stone",left_ear="Hermetic Earring",right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",right_ring="Metamor. Ring +1",back="Senuna's Mantle",}
			sets.JA["Desperate Flourish"] = set_combine(sets.JA["Violent Flouish"],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
		
	sets.JA["Reverse Flourish"] = {hands="Macu. Bangles +1",back="Toetapper Mantle",}
	sets.JA["Wild Flourish"] = { }
	
	sets.JA["Climactic Flourish"] = {head="Maculele Tiara +1",}	--Equip on Strike.
	sets.JA["Striking Flourish"] = {body="Maculele Casaque",}	--Equip on Strike.
	sets.JA["Ternary Flourish"] = {}
	
	-- Step Logics.
	sets.JA.Steps = {hands="Maxixi Bangles +2",feet="Horos Toe Shoes +3",}
		sets.JA["Feather Step"] = set_combine(sets.JA.Steps,{feet="Macu. Toe Shoes",})
	
	-- Additional Logics.
	sets.JA.Sambas = {head="Maxixi Tiara +1",}
	sets.JA.Jigs = {legs="Horos Tights +3",}--feet="Maxixi Toe Shoes",} Only need one.
	sets.JA.Waltz = {ammo="Yamarang",	--5%
		head="Etoile Tiara +2", --head="Anwig Salade",
		body="Maxixi Casaque +3",		--19%
		hands="Nyame Gauntlets",		--CHR, +HP
		legs="Dashing Subligar",		--10%, Blink.
		feet="Maxixi Toe Shoes",		--10%, 14 at cap.
		neck="Etoile Gorget +1",		--7%
		waist="Chaac Belt",				--CHR
		left_ear="Thureous Earring",	--+HP
		right_ear="Eabani Earring",		--+HP
		left_ring="Metamor. Ring +1",	--CHR, -HP
		right_ring="Meridian Ring",		--+HP
		back="Toetapper Mantle",}		--5%, overload.
	
--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
	
	sets.WSDex = {ammo="Coiste Bodhar",	-- Keyed to ["Rudra's Storm"].
		head="Nyame Helm",				-- Empy+3.
		body="Nyame Mail",				-- WSD+11%~
		hands="Nyame Gauntlets",		-- WSD+7%~+Att > 10%.
		legs="Horos Tights +3",			-- WSD+10%
		feet="Nyame Sollerets",			-- WSD+7%~
		neck="Etoile Gorget +1",
		waist="Grunfeld Rope",			-- Kentarch Belt +1 AUGMENTED.
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",	-- Lol, JSE+1/2 ear.
		left_ring="Ilabrat Ring",		-- Attack rarely capped.
		right_ring="Regal Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Weapon skill damage +10%',}},}

	sets.WSCrit = {ammo="Charis Feather",-- Keyed to ["Evisceration"].
		head="Blistering Sallet +1",	-- C+10%
		body="Gleti's Cuirass",			-- C+8%
		hands="Gleti's Gauntlets",		-- C+6%
		legs="Gleti's Breeches",		-- C+7%
		feet="Gleti's Boots",			-- C+4%
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Sherida Earring",
		left_ring="Begrudging Ring",	-- C+5%
		right_ring="Regal Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Weapon skill damage +10%',}},}	-- Check into Rate+.
	
	sets.WSStr = {ammo="Coiste Bodhar",	-- Keyed to ["Pyrrhic Kleos"]. Raw stat power, amend as needed.
		head="Lustratio Cap +1",	-- Evaluate once AF3+3 Hat.
		body="Horos Casaque +3",	-- Evaluate once AF3+3.
		hands="Nyame Gauntlets",	-- Evaluate once AF3+3 Hands.
		legs="Horos Tights +3",		-- Evaluate once Gleti's high rank, AF3+3.
		feet="Lustra. Leggings +1",	-- Stupidly highest STR/DEX item ever.
		neck="Etoile Gorget +1",
		waist="Fotia Belt",
		left_ear="Mache Earring +1",-- JSE if we ever get it. 
		right_ear="Sherida Earring",
		left_ring="Ilabrat Ring",
		right_ring="Regal Ring", 
		back={ name="Senuna's Mantle", augments={'DEX+20','Weapon skill damage +10%',}},}
	
	sets.WSMagAcc = sets.JA["Violent Flourish"]	-- Debuff WS, makes sure they hit.
	
	sets.WSElem = {ammo="Yamarang", --Aeolian.
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Etoile Gorget +1",
		waist="Eschan Stone",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Senuna's Mantle", augments={'DEX+20','Weapon skill damage +10%',}},}	-- it can stay.

--{(Precast Sets>--	
	sets.PreCast = { }
	
	sets.PreCast.FastCast = {ammo="Impatiens",
		--head="Herculean Helm",
		body="Taeon Tabard",
		hands="Leyline Gloves",
		legs="Taeon Tights",
		feet="Horos Toe Shoes +3",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		right_ring="Lebeche Ring",}
			sets.PreCast.Ninjutsu = set_combine(sets.PreCast.FastCast,{neck="Magoraga Beads",body="Passion Jacket",})

--{(Midcast Sets>--	
	sets.MidCast = { }
	
	sets.AllSkill = {neck="Incanter's Torque",right_ring="Stikini Ring +1",left_ring="Stikini Ring +1",}

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
		add_to_chat(158,' "Show\'s over? ; ; Sad day." ')
	end	

	function is_am_active()
		return buffactive['Aftermath'] or buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'] 
	end
	
	function ClimCheck() -- Thanks Iffy. > >; <3Ifirus of Asura/Sylph
		if (buffactive['Climactic Flourish'])
			then equip({head="Maculele Tiara +1",body="Meg. Cuirie +2",})
		end
	end
	
	function HandleFixes()	-- Nit pick this. 
		if (player.sub_job:lower() == 'sam') then
			if EngagedIndex == 1 then
				equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]],{right_ear="Brutal Earring",}))
			else
				equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
			end
		end
		if (player.equipment.main =='Karambit') or (player.equipment.main =='Hep. Baghnakhs') then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],{left_ear="Mache Earring +1",right_ear="Mache Earring +1"}))
		end
	end

	function precast(spell,action)
	--send_command('@input /echo '..spell.action) --< DOES NOT WORK FOR RANGED.
		if spell.action_type == 'Magic' then 
			if sets.PreCast[spell.skill] then
				equip(sets.PreCast[spell.skill])
			else
				equip(sets.PreCast.FC)
			end
		elseif spell.type == "WeaponSkill" then 
			if sets.WS[spell.english] then
				equip (sets.WS[spell.english]) 
					ClimCheck()
				-- Main madness.
				elseif WSDex:contains(spell.name) then
					equip(sets.WSDex)
				elseif WSStr:contains(spell.name) then
					equip(sets.WSStr)
				elseif WSCrit:contains(spell.name) then
					equip(sets.WSCrit)
				-- Extra goodies.
				elseif WSMag:contains(spell.name) then
					equip(sets.WSMagAcc)
				elseif WSElem:contains(spell.name) then
					equip(sets.WSElem)
				else equip(sets.WSStr)	-- Catch-all.
				ClimCheck() -- Check for redundancies.
			end 
		elseif spell.type == "JobAbility" then 
			if sets.JA[spell.english] then
				equip (sets.JA[spell.english]) 
			end
		elseif spell.type ~= "JobAbility" then 
			if sets.JA[spell.name] then
				equip(sets.JA[spell.name]) 
				ClimCheck()
					elseif JAWaltz:contains(spell.name) then
						equip(sets.JA.Waltz)
					elseif JASteps:contains(spell.name) then
						equip(sets.JA.Steps)
					elseif JASambas:contains(spell.name) then
						equip(sets.JA.Sambas)
					elseif JAJigs:contains(spell.name) then
						equip(sets.JA.Jigs)
			end
			elseif sets.MidCast[spell.skill] then
				equip(sets.MidCast[spell.skill])
			else equip(sets.JA["Animated Flourish"])
		end
	end

	function midcast(spell,action)
	--send_command('@input /echo '..spell.action_type) --< WORKS FOR RANGED.
		if spell.action_type == 'Magic' then
			if sets.MidCast[spell.skill] then
				equip(sets.MidCast[spell.skill])
			else equip(sets.AllSkill) end
		end
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
			ClimCheck()
		else
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
			equip(equipSet)
		end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
		status_change(player.status)
		buff_change(buff,gain)
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
			ClimCheck()
			HandleFixes()
		end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end
	
	function buff_change(buff,gain) --Thanks Dele!
	if buff == 'Climactic Flourish' then
		if gain 
			then equip({head="Maculele Tiara +1",body="Meg. Cuirie +2",})
		else 
			end
		end
	end
	
--{(Toggles.>--

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
			status_change(player.status)
		end
		status_change(player.status)
		texts.destroy(BlackMana)
		texts.destroy(WhiteMana)
		ManaBarsHUD()		
	end