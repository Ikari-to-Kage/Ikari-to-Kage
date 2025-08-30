--Last Edit; 7ish-25-
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.DRG |  --
--	|  v.3.Baha |  --
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
	EngagedArray = {"General","Defense","Solitude"}
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
				--left_ring="Shadow Ring",	-- Magic Annul.
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
		
		sets.Engaged.General = {ammo="Coiste Bodhar",
			head="Flam. Zucchetto +2",
			body="Gleti's Cuirass",			-- Peltast's Plackart +3, Pushes us back to 4 hit. Also shares snacks with Raiden, which is Important.
			hands="Gleti's Gauntlets",
			legs="Ptero. Brais +3", 
			feet="Flam. Gambieras +2",
			neck="Anu Torque",
			waist="Sailfi Belt +1",
			left_ear="Cessance Earring",
			right_ear="Sherida Earring",
			left_ring="Niqmaddu Ring",
			right_ring="Petrov Ring",		-- When Body is upgraded, look at Regal. Or Defending. 
			back={ name="Brigantia's Mantle", augments={'DEX+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		-- Accuracy >> [Trishula: 1296] [Naegling: 1220] 			-- Multi-hit >> [DA: 34+15%] [TA: 7%] [QA: 3%]
		-- To-Hit-# >> [Trishula: 5 * 239/SAM50+] [Naegling: 10 * 108/WAR50+]	(When Peltast's Plackart+3 : 4 * 252/SAM50+, 9 * 115/WAR50+)
		-- DmgReduc >> [Me: PDT-26%] [Rai: DT-8% PDT-11%] 			-- Defense >> [Def: 1351~] [Eva: 881~]
		
		sets.Engaged.Defense = {ammo="Crepuscular Pebble",
			head="Hjarrandi Helm",			-- DT10, DA7, STP7
			body="Gleti's Cuirass",			-- PDT9, DA4
			hands="Gleti's Gauntlets",		-- PDT7, P.DT8
			legs="Ptero. Brais +3", 		-- STP10, P.PDT11
			feet="Flam. Gambieras +2",		-- STP6, DA6
			neck="Dgn. Collar +1",			-- P.PDT20
			waist="Sailfi Belt +1",			-- TA2, DA5, eventually.
			left_ear="Telos Earring",		-- DA1, STP5
			right_ear="Sherida Earring",	-- DA5, STP5
			left_ring="Niqmaddu Ring",		-- QA3
			right_ring="Defending Ring",	-- DT10
			back={ name="Brigantia's Mantle", augments={'DEX+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		-- Accuracy >> [Trishula: 1300] [Naegling: 1225]  				-- Multi-hit >> [DA: 37+15%] [TA: 2%] [QA: 3%]
		-- To-Hit-# >> [Trishula: 5 * 231/SAM50+] [Naegling: 10 * 104/WAR50+] HASTE: 22% Listed. Raiden is normally Enough.
		-- DmgReduc >> [Me: DT-23%, PDT-26%] [Rai: DT-28%, PDT-11%] 	-- Defense >> [Def: 1379~] [Eva: 868~]

			sets.Engaged.Solitude = set_combine(sets.Engaged.Defense,{
					--ammo="Coiste Bodhar",
				hands="Gleti's Gauntlets",
					--hands="Pel. Vambraces +2",
				neck="Anu Torque",
				left_ear="Cessance Earring",
					--left_ear="Brutal Earring", --Maybe.
				})	-- Someone made me eat Raiden. They will pay.

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

	sets.JA["Jump"] = {ammo="Coiste Bodhar",	--STP+3, DA+3
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
	
		sets.WSStr = {ammo="Coiste Bodhar", 		-- Stat/Att. 	[Stardiver.]
			head="Ptero. Armet +3",					-- Stat/Att, TA+4
			body="Nyame Mail",						-- WSD+11, SC+7, DA+4
			hands="Ptero. Fin. G. +3",				-- Stat/Att, WSD+10.	-- Peltast's possibily better?
			legs="Nyame Flanchard",					-- WSD+8, SC+6
			feet="Nyame Sollerets",					-- WSD+7, SC+5
			neck="Fotia Gorget", waist="Fotia Belt",-- [check]
			left_ear="Moonshade Earring",			-- [check]
			right_ear="Thrud Earring",				-- Stat, WSD+3.
			left_ring="Niqmaddu Ring",				-- Stat, QA+3
			right_ring="Royal Ring",				-- Stat/Att.
			back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},}

		sets.WSSkCh = {ammo="Knobkierrie", 			-- WSD+6. 	[Cam's/Sonic/WSD/SC+.]
			head="Ptero. Armet +3",					-- Stat/Att, TA+4. Peltast's is better, by far.
			body="Nyame Mail",						-- WSD+11, SC+7, DA+4
			hands="Ptero. Fin. G. +3",				-- Stat/Att, WSD+10. To +4.
			legs="Nyame Flanchard",					-- WSD+8, SC+6
			feet="Nyame Sollerets",					-- WSD+7, SC+5
			neck="Dgn. Collar +1", waist="Sailfi Belt +1",
			left_ear="Moonshade Earring",			-- [check] Peltast's +2 if we ever get it.
			right_ear="Thrud Earring",				-- Stat, WSD+3.
			left_ring="Niqmaddu Ring",				-- Stat, QA+3
			right_ring="Royal Ring",				-- Stat/Att.
			back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}

		sets.WSCrit = {ammo="Coiste Bodhar", 		-- Stat/Att. 	[CritPlz, w/<3, Drakesbane.]
			head="Blistering Sallet +1", 			-- HOW'D I MISS THIS? FOR HOW LONG???
			body="Gleti's Cuirass",					-- Crit%+8.
			hands="Gleti's Gauntlets",				-- Crit%+6.
			legs="Gleti's Breeches",				-- Crit%+7.
			feet="Thereoid Greaves",				-- Crit%+4, Dmg+5.
			neck="Dgn. Collar +1", waist="Sailfi Belt +1",
			left_ear="Moonshade Earring", 			-- [check]
			right_ear="Pel. Earring +1",			-- +2 if it ever lives. Right only.
			left_ring="Niqmaddu Ring",				-- Niqmaddu Ring.
			right_ring="Begrudging Ring",			-- Crit%+5, Regal Ring.
			back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},} --Crit+Cape.
			
		sets.WSElem = {ammo="Knobkierrie",			-- Exactly what it says on the tin. Not used often at all.
			head="Nyame Helm",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			neck="Fotia Gorget",
			waist="Fotia Belt",
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
			body="Taeon Tabard",
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

		sets.HealingBreath = {head="Ptero. Armet +3",	-- Breath+28
			body="Acro Surcoat", 		-- Breath +7, M.Acc.+24
			hands="Acro Gauntlets", 	-- Breath +8, M.Acc.+18 
			legs="Vishap Brais +3",		-- HP+27%
			feet="Ptero. Greaves +3",	-- HP+290.
			neck="Dgn. Collar +1",		-- Level+1.
			waist="Incarnation Sash", 	-- M.Acc+15.
			right_ear="Pel. Earring +1",-- Level+1.
			--left_ring="Shadow Ring",	-- Magic Annul.
			right_ring="Defending Ring",-- DT-10% cause this set is MADE OF PAPER--
			back={ name="Updraft Mantle", augments={'STR+5','Pet: Breath+10','Pet: Damage taken -1%',}},}

		sets.ElementalBreath = sets.HealingBreath 
		-- Take a look, genuinely, at Gleti's/AF3+3 M.Acc bumps. Maybe in non augment breath spots?
		-- BG Wiki: Tatang for for info.
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