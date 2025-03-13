--Last Edit; 7-13-22-
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.DRG |  --
--	|v.3.0.Fuck |  --
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
	IdleArray = {"Movement","Defense","Sacrilege"}
	EngagedIndex = 1 
	EngagedArray = {"General","Defense","Solitude"}--"Accuracy",} --"Solitude"}
	WeaponIndex = 1
	WeaponArray = {"Trishula","Beatstick","Suffering",}

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

	WSStr = S{"Stardiver","Impulse Drive","Wheeling Thrust","Penta Thrust","Double Thrust",
		"Fast Blade","Circle Blade","Shattersoul","Spirit Taker","Full Swing","Heavy Swing",}
	WSSkCh = S{"Camlann's Torment","Sonic Thrust","Retribution","Savage Blade",} --WSD+/SC+.
	WSCrit = S{"Drakesbane","Vorpal Thrust","Skewer","Vorpal Blade",}
	WSElem = S{"Thunder Thrust","Raiden Thrust","Sunburst","Starburst","Earth Crusher","Rock Crusher","Cataclysm",
		"Burning Blade","Red Lotus Blade","Shining Blade","Seraph Blade","Sanguine Blade",}
	WSMacc = S{"Leg Sweep","Flat Blade","Shell Crusher",} --M.acc gear.

-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "Raiden! :D I missed you. <3" ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {
			ammo="Staunch Tathlum",			-- DT-2%
			head="Valorous Mask",			-- Regain+3
			body="Gleti's Cuirass",			-- Regain+3
			hands="Gleti's Gauntlets",		-- Regain+2
			legs="Carmine Cuisses +1",		-- Movement
			feet="Ptero. Greaves +3",		-- Pet Regen+7
			 neck="Bathy Choker +1",		-- Regen+3
			 right_ear="Infused Earring",	-- Regen+1
			 left_ear="Etiolation Earring",	-- HP/MP+50
			 left_ring="Chirich Ring +1",	-- Regen+2
			 right_ring="Karieyh Ring",		-- Regain+5
			waist="Carrier's Sash",			-- Ele. Res.
			back="Updraft Mantle",}			-- Pet HP+

			sets.Idle.Defense = set_combine(sets.Idle.Movement,{
				head="Nyame Helm", 			-- DT-7%
				body="Nyame Mail",			-- DT-9%
				 hands="Gleti's Gauntlets",	-- PDT-7%, WyDT-8%
				 legs="Ptero. Brais +3",	-- WyPDT-11%
				feet="Nyame Sollerets",		-- DT-7%
				 neck="Dgn. Collar +1",		-- Pet, DT-20%
				left_ring="Shadow Ring",	-- Magic Annul.
				right_ring="Defending Ring",-- DT-10%
				back={ name="Brigantia's Mantle", augments={'Phys. dmg. taken-10%',}},})
			-- DmgReduc >> [Me: DT-35%, PDT-17%] [Rai: DT-28%, PDT-11%]
			
			sets.Idle.Sacrilege = set_combine(sets.Idle.Defense,{body="Ptero. Mail +3", -- Surge+.
				legs="Vishap Brais +3",		-- HP+.
				feet="Ptero. Greaves +3",	-- HP+.
				neck="Dgn. Collar +1",		-- Lv.+
				left_ear="Pel. Earring +1", -- Lv.+
				back="Updraft Mantle",})	-- HP+.
				
--{(Melee Sets>--
	sets.Engaged = {}
		
		sets.Engaged.General = {ammo="Ginsen",
			head="Flam. Zucchetto +2",
			body={ name="Valorous Mail", augments={'Accuracy+29','"Store TP"+8'}},
			hands="Flam. Manopolas +2",
			legs="Ptero. Brais +3",
			feet="Flam. Gambieras +2",
			neck="Anu Torque",
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			right_ear="Sherida Earring",
			left_ear="Cessance Earring",
			left_ring="Chirich Ring +1",
			right_ring="Petrov Ring",
			back={ name="Brigantia's Mantle", augments={'DEX+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		-- Accuracy >> [Trishula: 1316] [Naegling: 1240] -- To-Hit-# >> [Trishula: 4 * 271/SAM] [Naegling: 8 * 126/WAR]
		-- DmgReduc >> [Me: PDT-12%] [Rai: PDT-11%] -- Defense >> [Def: 1275~] [Eva: 790~]
		
		sets.Engaged.Defense = {ammo="Crepuscular Pebble",
			head="Hjarrandi Helm",
			body={ name="Gleti's Cuirass", augments={'Path: A',}},
			hands="Gleti's Gauntlets",
			legs={ name="Ptero. Brais +3", augments={'Enhances "Strafe" effect',}},
			feet="Flam. Gambieras +2",
			neck={ name="Dgn. Collar +1", augments={'Path: A',}},
			waist={ name="Sailfi Belt +1", augments={'Path: A',}},
			left_ear="Cessance Earring",
			right_ear="Sherida Earring",
			left_ring="Chirich Ring +1",
			right_ring="Defending Ring",
			back={ name="Brigantia's Mantle", augments={'DEX+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		-- Accuracy >> [Trishula: 1297] [Naegling: 1221] -- To-Hit-# >> [Trishula: 5 * 228/SAM] [Naegling: 10 * 102/WAR]
		-- DmgReduc >> [Me: DT-23%, PDT-26%] [Rai: DT-28%, PDT-11%] -- Defense >> [Def: 1380~] [Eva: 870~] -- HASTE: 22% Listed.

			sets.Engaged.Solitude = set_combine(sets.Engaged.Defense,{
					--ammo="Coiste Bodhar",
				hands="Gleti's Gauntlets",
					--hands="Pel. Vambraces +2",
				neck="Anu Torque",
				left_ear="Cessance Earring",
					--left_ear="Brutal Earring", --Maybe.
				})
			-- To Replace .Acc. Maintains DT, way more DA, lower acc than standard DT.

		sets.Engaged.Accuracy = set_combine(sets.Engaged.General,{ammo="Amar Cluster",
				body="Flamma Korazin +2",
				legs="Flamma Dirs +2",
				neck={ name="Dgn. Collar +1", augments={'Path: A',}},
				left_ear="Mache Earring +1",
				right_ear="Mache Earring +1",
				right_ring="Cacoethic Ring +1",})
		-- Accuracy >> [Trishula: 1360] [Naegling: 1284] -- To-Hit-# >> [Trishula: 5 * 234/SAM] [Naegling: 10 * 105/WAR]
		-- DmgReduc >> [Me: PDT-10%] [Rai: DT-20%] -- Defense >> [Def: 1340~] [Eva: 830~]
		

--{(Weapons.>--	
	sets.Trishula 	= {main="Trishula",sub="Utu Grip",}
	sets.Beatstick	= {main="Malignance Pole",sub="Utu Grip",}
	sets.Suffering	= {main="Naegling",sub="Mercenary's Targe",}
	
--{(JA Sets>--	
	sets.JA = { }

	sets.JA["Call Wyvern"] = {body="Ptero. Mail +3"}
	sets.JA["Ancient Circle"] = {legs="Vishap Brais +3"} 
	sets.JA["Spirit Link"] = {head="Vishap Armet", feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},} --Causes HP drain.
	sets.JA["Angon"] = {ammo="Angon",hands="Ptero. Fin. G. +3",
			head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",} --Also TH4! 

	sets.JA["Jump"] = {ammo="Ginsen",			--STP+3
		head="Hjarrandi Helm",					--STP+7, DA+6
		body={ name="Valorous Mail", augments={'"Store TP"+8',}}, --DA+2
		hands="Sulev. Gauntlets +2",			--DA+6
		legs="Ptero. Brais +3",					--STP+10
		feet="Flam. Gambieras +2",				--STP+6, DA+6
		neck="Anu Torque",						--STP+7
		waist="Sailfi Belt +1",					--DA+5, TA+3, when finished.
		right_ear="Sherida Earring",			--STP+5, DA+5
		left_ear="Cessance Earring",			--STP+3, DA+3
		left_ring="Chirich Ring +1",			--STP+6
		right_ring="Petrov Ring",				--STP+5, DA+1
		back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}
			sets.JA["High Jump"] = set_combine(sets.JA["Jump"],{})
			sets.JA["Soul Jump"] = set_combine(sets.JA["Jump"],{})
			sets.JA["Spirit Jump"] = set_combine(sets.JA["Jump"],{})

	-- Wyvern Max HP -> Steady Wing & Spirit Surge Shield/HP+ Potency.
	sets.JA["Spirit Surge"] = {body="Ptero. Mail +3",legs="Vishap Brais +3",feet="Ptero. Greaves +3",neck="Dgn. Collar +1",back="Updraft Mantle",left_ear="Pel. Earring +1"}
		
	sets.JA["Steady Wing"] = {legs="Vishap Brais +3",feet="Ptero. Greaves +3",neck="Dgn. Collar +1",back="Updraft Mantle",left_ear="Pel. Earring +1"}
	
	sets.JA["Provoke"] = {head="Rabid Visor",body="Emet Harness +1",legs="Zoar Subligar +1",neck="Warder's Charm +1",
		left_ear="Cryptic Earring",right_ear="Friomisi Earring",left_ring="Begrudging Ring",right_ring="Petrov Ring",} --Emn+

--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
	
		sets.WSStr = {ammo="Knobkierrie", 			-- WSD+6. 	[Stardiver.]
			head="Ptero. Armet +3",					-- [check]
			body="Ptero. Mail +3",					-- [check]
			hands="Sulev. Gauntlets +2",			-- [check]
			legs="Sulev. Cuisses +2",				-- [check]
			feet="Flam. Gambieras +2",				-- [check]
			neck="Fotia Gorget", waist="Fotia Belt",-- [check]
			left_ear="Moonshade Earring",			-- [check]
			right_ear="Sherida Earring",			-- [check]
			left_ring="Apate Ring",					-- Niqmaddu Ring
			right_ring="Petrov Ring",				-- Regal Ring
			back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}

		sets.WSSkCh = {ammo="Knobkierrie", 			-- WSD+6. 	[Cam's/Sonic/WSD/SC+.]
			head="Ptero. Armet +3",					-- [check]
			body="Nyame Mail",						-- WSD+~
			hands="Ptero. Fin. G. +3",				-- WSD+10.
			legs="Vishap Brais +3",					-- WSD+10.
			feet="Sulev. Leggings +2",				-- WSD+7.
			neck="Fotia Gorget", waist="Fotia Belt",-- [check]
			left_ear="Moonshade Earring",			-- [check]
			right_ear="Thrud Earring",				-- WSD+3.
			left_ring="Epaminondas's Ring",			-- WSD+5.
			right_ring="Karieyh Ring",				-- WSD+3.
			back={ name="Brigantia's Mantle", augments={'STR+20','STR+10','Weapon skill damage +10%',}},}
		--body="Sulevia's Plate. +2", 			-- Skillchain+7.
		--hands="Valorous Mitts",	 			-- Skillchain+5, Aug+3.
		--right_ring="Mujin Band", 				-- Skillchain+5.

		sets.WSCrit = {ammo="Knobkierrie", 			-- WSD+6. 	[CritPlz, w/<3, Drakesbane.]
			head={ name="Valorous Mask", augments={'Weapon skill damage +4%',}}, --Blistering.
			body="Gleti's Cuirass",					-- Crit%+8.
			hands="Gleti's Gauntlets",				-- Crit%+6.
			legs="Lustratio Subligar +1",			-- Crit%+3.
			feet="Thereoid Greaves",				-- Crit%+4, Dmg+5.
			neck="Fotia Gorget", waist="Sailfi Belt +1",
			left_ear="Thrud Earring", 				-- [check]
			right_ear="Sherida Earring",			-- [check]
			left_ring="Apate Ring",					-- Niqmaddu Ring.
			right_ring="Begrudging Ring",			-- Crit%+5, Regal Ring.
			back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},} --Crit+Cape.
			
		sets.WSElem = {ammo="Knobkierrie",
			head="Nyame Helm",
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Ptero. Fin. G. +3", augments={'Enhances "Angon" effect',}},
			legs="Vishap Brais +3",
			feet="Sulev. Leggings +2",
			neck="Fotia Gorget",
			waist="Eschan Stone",
			left_ear="Friomisi Earring",
			right_ear="Hermetic Earring",
			left_ring="Epaminondas's Ring",
			right_ring="Karieyh Ring",
			back="Toro Cape",}
				sets.WS["Sanguine Blade"] = set_combine(sets.WSElem,{head="Pixie Hairpin +1",right_ring="Archon Ring"})
				sets.WS["Cataclysm"] = set_combine(sets.WSElem,{head="Pixie Hairpin +1",right_ring="Archon Ring"})
			
		sets.WSMacc = {ammo="Knobkierrie",head="Flam. Zucchetto +2",body="Flamma Korazin +2",hands="Flam. Manopolas +2",
			legs="Flamma Dirs +2",feet="Flam. Gambieras +2",neck="Fotia Gorget",waist="Fotia Belt",left_ear="Moonshade Earring",
			right_ear="Hermetic Earring",left_ring="Karieyh Ring",right_ring="Flamma Ring",
			back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},}

--{(Precast Sets>--	
	sets.PreCast = { }
		sets.PreCast.FastCast = {ammo="Impatiens", --QM+2%
			head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
			body={ name="Taeon Tabard", augments={'Accuracy+23','"Dual Wield"+5',}},
			hands="Leyline Gloves", --FC+5%, Augment+3%.
			--legs={ name="Blood Cuisses", augments={'"Fast Cast"+5','Evasion+4','"Mag.Def.Bns."+4',}}, --Cause intimidating myself is fun.
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
			waist="Sailfi Belt +1",
			left_ear="Etiolation Earring",
			right_ear="Loquac. Earring",
			right_ring="Lebeche Ring",} --QM+2%

--{(Midcast Sets>--	
	sets.MidCast = { }
	
		sets.BreathTrigger = {head="Vishap Armet", --AF1 Head, HP+ gear to prevent accidental breaking of the trigger.
			ammo="Staunch Tathlum",
			body="Flamma Korazin +2",
			hands="Gleti's Gauntlets",
			legs="Flamma Dirs +2",
			feet="Flam. Gambieras +2",
			neck="Bathy Choker +1",
			waist="Carrier's Sash",
			left_ear="Etiolation Earring",
			right_ear="Eabani Earring",
			left_ring="Defending Ring",} 
		
		sets.MidCast['Enhancing Magic']= set_combine(sets.BreathTrigger,{head="Carmine Mask",legs="Carmine Cuisses +1",
			neck="Incanter's Torque",left_ear="Andoaa Earring",right_ear="Mimir Earring",left_ring="Stikini Ring +1",right_ring="Stikini Ring +1",}) --Skill Total: +63.
				sets.MidCast["Stoneskin"]=  set_combine(sets.MidCast['Enhancing Magic'],{hands="Stone Mufflers",})
				sets.MidCast["Barfire"]= set_combine(sets.BreathTrigger,{})
			
		sets.MidCast['Stone']= set_combine(sets.BreathTrigger,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})

		sets.HealingBreath = {head={ name="Ptero. Armet +3", augments={'Enhances "Deep Breathing" effect',}},
			body={ name="Acro Surcoat", augments={'Pet: Mag. Acc.+24','Pet: Breath+7','Pet: Damage taken -4%',}},
			hands={ name="Acro Gauntlets", augments={'Pet: Mag. Acc.+18','Pet: Breath+8','Pet: Damage taken -4%',}},
			legs="Vishap Brais +3",
			feet={ name="Ptero. Greaves +3", augments={'Enhances "Empathy" effect',}},
			neck="Dgn. Collar +1",
			waist="Incarnation Sash", --M.acc+.
			back={ name="Updraft Mantle", augments={'STR+5','Pet: Breath+10','Pet: Damage taken -1%',}},
			left_ear="Pel. Earring +1"}

		sets.ElementalBreath = sets.HealingBreath -- One day, when Gleti's Boots are non-bugged, replace this.
			Breath = sets.HealingBreath

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
		add_to_chat(158,' "Fair well for now, Raiden. Have a good nap. <3" ')
	end	

	function is_am_active()
		return buffactive['Aftermath'] or buffactive['Aftermath: Lv.1'] or buffactive['Aftermath: Lv.2'] or buffactive['Aftermath: Lv.3'] 
	end

--	function HandleEngage()		-- Retained for possible future reapplication, Thanks Temas.
--		Engage = EngagedArray[EngagedIndex]
--		Tier = TierArray[TierIndex]

--		--print(Engage..Tier)
--		equip(set_combine(sets.Engaged[Engage..Tier],sets[WeaponArray[WeaponIndex]]))
--	end

	function precast(spell,action)
		if spell.action_type == 'Magic' then 
			if sets.PreCast[spell.skill] then
				equip(sets.PreCast[spell.skill])
			else
				equip(sets.PreCast.FC)
			end
		elseif spell.type == "WeaponSkill" then 
			if sets.WS[spell.english] then
				equip (sets.WS[spell.english]) 
					elseif WSStr:contains(spell.name) then
						equip(sets.WSStr) --Stardiver.
					elseif WSSkCh:contains(spell.name) then
						equip(sets.WSSkCh)
					elseif WSCrit:contains(spell.name) then
						equip(sets.WSCrit)
					elseif WSElem:contains(spell.name) then
						equip(sets.WSElem)
					elseif WSMacc:contains(spell.name) then
						equip(sets.WSMacc)
				else equip(sets.WSStr)
			end 
		elseif spell.type == "JobAbility" then 
			if sets.JA[spell.english] then
				equip (sets.JA[spell.english]) 
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
			if sets.MidCast[spell.skill] then
				equip(sets.MidCast[spell.skill])
			else equip(sets.BreathTrigger) end
		end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

	function aftercast(spell,action)
	if pet_midaction() then return
		elseif player.status =='Engaged' then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
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
		end
		if petcast == true then 
			equip(Breath)
		end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
			if player.tp>750 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		equip(equipSet)
	end

--{(Pet Functions.>--

	function pet_change(pet,gain)
		if gain == false and pet.name then
			windower.add_to_chat(50,' *!*!* D: OH NU! '..string.upper(pet.name)..' HAS FALLEN!! ^TwT^ *!*!*')
		end
	end

	function pet_midcast(spell)
		if string.find(spell.name,' Breath') then
			if string.find(spell.name,'Healing') then 
				Breath = sets.HealingBreath
			else
				Breath = sets.ElementalBreath
			end
			petcast = true
			status_change(player.status)	
			windower.send_command('wait 1.2;gs c petcast')
		end
	end

	function pet_status_change(new,old)
		if new ~= "Engaged" then
			petcast = false
		end
	end
	
	function pet_aftercast(spell,action)
		if player.status =='Engaged' then 
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
			else
				equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
				equip(equipSet)
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
		elseif command == 'petcast' and petcast then --Back to the regularly scheduled programing, because something stopped my breath... again.
			petcast = false
			status_change(player.status)
		end
		status_change(player.status)
		texts.destroy(BlackMana)
		texts.destroy(WhiteMana)
		ManaBarsHUD()		
	end