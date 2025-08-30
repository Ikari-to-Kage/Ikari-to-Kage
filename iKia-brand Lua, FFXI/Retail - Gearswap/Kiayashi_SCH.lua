--Last Edit; 7ish-25-
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.SCH |  --
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
			WhiteMana = texts.new('Magic Settings: \n [4] Burst: ' ..ElementalArray[ElementalIndex].. ' \n [5] Regen: ' ..RegenArray[RegenIndex].. ' \n [6] TP Lock: On/Off.', 
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
	EngagedArray = {"General","Defense",}
	WeaponIndex = 1
	WeaponArray = {"Maxentius","Magic","Staff",}
	
	RegenIndex = 1
	RegenArray = {"Recovery","Time"}

	ElementalIndex = 1
	ElementalArray = {"Freenuke", "Burst"}

	Weapon = 'None'
	
-- Keybinds.
	windower.send_command('bind Numpad2 gs c C2') -- Backcycle; Armors.
	windower.send_command('bind Numpad3 gs c C3') -- Backcycle; Weapons.
	
	windower.send_command('bind Numpad4 gs c C4') -- Nuke
	windower.send_command('bind Numpad5 gs c C5') -- Regen
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

	DurationBuffs = S{"Reraise","Reraise II","Reraise III","Blink","Haste","Flurry","Sneak","Invisible","Deodorize","Klimaform","Animus Minuo","Animus Augeo","Embrava",}
		ProShell = S{"Protect","Protect II","Protect III","Protect IV","Protect V","Shell","Shell II","Shell III","Shell IV","Shell V",
			"Protectra","Protectra II","Protectra III","Protectra IV","Shellra","Shellra II","Shellra III","Shellra IV",} --Specify the rings.
		Storms = S{"Firestorm","Hailstorm","Windstorm","Sandstorm","Thunderstorm","Rainstorm","Voidstorm","Aurorastorm",
			"Firestorm II","Hailstorm II","Windstorm II","Sandstorm II","Thunderstorm II","Rainstorm II","Voidstorm II","Aurorastorm II",}
		Regens = S{"Regen","Regen II","Regen III","Regen IV","Regen V",} -- Specify Regen+.
		Refreshes = S{"Refresh",} -- Specify w.e it is that ups it.
		
	NukeLow = S{"Stone II","Stone III","Aero","Aero II","Aero III","Fire","Fire II","Fire III", --Stone 1 pulled for TH.
			"Blizzard","Blizzard II","Blizzard III","Water","Water II","Water III","Thunder","Thunder II","Thunder III",
			"Anemohelix","Anemohelix II","Cryohelix","Cryohelix II","Geohelix","Geohelix II","Hydrohelix","Hydrohelix II",
			"Ionohelix","Ionohelix II","Luminohelix","Luminohelix II","Noctohelix","Noctohelix II","Pyrohelix","Pyrohelix II",}

	Heals = S{"Cure","Cure II","Cure III","Cure IV","Cure V",
			"Cura","Cura II","Curaga","Curaga II","Curaga III"} -- Should be all of them.
	
--{(Waltz/JA group maps, if anything else weird appears, put it here.>--
	JAWaltz = S{"Curing Waltz","Curing Waltz II","Curing Waltz III","Divine Waltz","Healing Waltz",}	

--{(Weaponskill group maps, make sure everything is in the right place.>--
	WSSTRAtt = S{"Shattersoul","Full Swing","Shell Crusher","Heavy Swing",
				"Skullbreaker","True Strike","Realmrazer",
				"Wasp Sting","Viper Bite","Shark Bite",}
		
	WSSTRMND = S{"Retribution","Spirit Taker","Exudation",
				"Judgement","Black Halo",}
	
	WSElem = S{"Cataclysm","Sunburst","Starburst","Earth Crusher","Rock Crusher","Omniscience",
				"Shining Strike","Seraph Strike","Flash Nova",
				"Gust Slash","Cyclone","Aeolian Edge","Energy Drain","Energy Steal",}
	
-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "Studying again..?" ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {
			ammo="Homiliary",				--Refresh+
			head={ name="Chironic Hat", augments={'"Refresh"+2',}},
			body="Jhakri Robe +2",			--Refresh+
			hands={ name="Chironic Gloves", augments={'"Refresh"+2',}},
			legs="Assid. Pants +1",			--Refresh+
			feet="Herald's Gaiters",		--Movement.
			neck="Bathy Choker +1",			--HP/Regen+
			waist="Embla Sash",				--Sub+
			left_ear="Etiolation Earring",
			right_ear="Infused Earring",
			left_ring="Chirich Ring +1",
			right_ring="Chirich Ring",
			back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','HP+25','Attack+4','DEF+13',}},} --Upgrade cape/belt. Back is HP.
		
		sets.Idle.Defense = set_combine(sets.Idle.Movement,{head="Nyame Helm",
			body="Shamash Robe",
			hands="Nyame Gauntlets",
			legs="Nyame Flanchard",
			neck="Loricate Torque +1",		-- Good.
			right_ear="Flashward Earring",	-- Etheral Dmg>Mp?
			right_ring="Defending Ring",})

--{(Melee Sets>--
	sets.Engaged = {}
		sets.Engaged.General = {ammo="Amar Cluster",
			head={ name="Blistering Sallet +1", augments={'Path: A',}},
			body="Agwu's Robe",			-- AF3+2
			hands="Nyame Gauntlets",	-- ^?
			legs="Nyame Flanchard",		-- ^?
			feet="Arbatel Loafers +2",
			neck="Clotharius Torque", 	-- Skill Torque.
			waist="Windbuffet Belt +1",
			left_ear="Cessance Earring",
			right_ear="Telos Earring",
			left_ring="Chirich Ring +1",
			right_ring="Chirich Ring",
			back="Relucent Cape",}

		sets.Engaged.Defense = set_combine(sets.Engaged.General,{ammo="Staunch Tathlum",
			body="Nyame Mail",
			legs="Nyame Flanchard",
			feet="Nyame Sollerets",
			left_ear="Crep. Earring",
			right_ring="Cacoethic Ring +1",
			neck="Loricate Torque +1",})

--{(Weapons.>--	
	
	sets.Maxentius	= {main="Maxentius",sub="Genmei Shield",}
	sets.Magic		= {main="Daybreak",sub="Ammurapi Shield",}
	sets.Staff		= {main="Malignance Pole",sub="Rose Strap"}
	
	sets.Maxentius.DW= {main="Maxentius",sub="Daybreak",right_ear="Suppanomimi",left_ear="Eabani Earring",}
	sets.Magic.DW	= {main="Maxentius",sub="Daybreak",right_ear="Suppanomimi",left_ear="Eabani Earring",}
	sets.Staff.DW 	= sets.Staff
	
--{(JA Sets>--	
	sets.JA = {}

		sets.JA["Tabula Rasa"] = {legs=" "} --Grab a blue box for time+.
		sets.JA["Enlightenment"] = {body="Peda. Gown +3"}
		
		sets.JA.Waltz = { }	

--{(WS Sets - By Stat, specialty as needed.>--
	sets.WS = { }
		sets.WS["STR/Att"] = {ammo="Crepuscular Pebble",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Caro Necklace",
			waist="Grunfeld Rope",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Epaminondas's Ring",}	

		sets.WS["STR/MND"] = {ammo="Crepuscular Pebble",
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Caro Necklace",
			waist="Grunfeld Rope",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Epaminondas's Ring",}
		
		sets.WS["EleWS"] = {ammo="Sroda Tathlum",
			head="C. Palug Crown",
			body="Nyame Mail",
			hands="Jhakri Cuffs +2",
			legs="Amalric Slops +1",
			feet="Nyame Sollerets",
			neck="Mizu. Kubikazari",
			waist="Eschan Stone",
			right_ear="Malignance Earring",
			left_ear="Regal Earring",		
			left_ring="Metamor. Ring +1",	
			right_ring="Freke Ring",		
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}
				sets.WS["Cataclysm"] = set_combine(sets.WS["EleWS"],{head="Pixie Hairpin +1",left_ring="Archon Ring"})
				sets.WS["Omniscience"] = set_combine(sets.WS["EleWS"],{head="Pixie Hairpin +1",left_ring="Archon Ring"})

--{(Precast Sets>--	
	sets.PreCast = {}
		sets.PreCast.FastCast = {ammo="Impatiens",
			head="Amalric Coif +1",
			body="Agwu's Robe",
			hands="Gendewitha Gages",
			legs="Volte Brais",
			feet="Regal Pumps +1",
			neck="Incanter's Torque",
			waist="Embla Sash",
			right_ear="Infused Earring",
			left_ear="Eabani Earring",
			left_ring="Lebeche Ring",
			right_ring="Kishar Ring",
			back="Perimede Cape",}
					sets.PreCast['Elemental Magic'] = set_combine(sets.PreCast.FastCast,{ })
					sets.PreCast['Enfeebling Magic'] = set_combine(sets.PreCast.FastCast,{ })
					sets.PreCast['Enhancing Magic']= set_combine(sets.PreCast.FastCast,{ })
					sets.PreCast['Healing Magic']= set_combine(sets.PreCast.FastCast,{ })
					sets.PreCast['Dark Magic']= set_combine(sets.PreCast.FastCast,{ })
					sets.PreCast['Impact']= set_combine(sets.PreCast.FastCast,{head=empty, body="Twilight Cloak",})
					sets.PreCast['Dispelga']= set_combine(sets.PreCast.FastCast, {main="Daybreak",})

--{(Midcast Sets>--	
	sets.MidCast = { }
	
	sets.MidCast.SIRD = {ammo="Staunch Tathlum",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Emphatikos Rope",
		right_ear="Thureous Earring",
		left_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Ayanmo Ring",}
	
	-- Enfeebling Kits
		sets.MidCast['Enfeebling Magic']= {main="Daybreak",
			sub="Ammurapi Shield",
			ammo="Savant's Treatise",
			head="Amalric Coif +1",
			body="Shamash Robe",
			hands="Regal Cuffs",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','INT+9','Mag. Acc.+15',}},
			feet="Arbatel Loafers +2",
			neck="Incanter's Torque",
			waist="Obstinate Sash",
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Kishar Ring",
			back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}
				sets.MidCast['Impact']= set_combine(sets.MidCast['Enfeebling Magic'], {head=empty,body="Twilight Cloak",right_ring="Archon Ring"})
				sets.MidCast['Dispelga']= set_combine(sets.MidCast['Enfeebling Magic'], {main="Daybreak",head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
		
		
		sets.MidCast['Dark Magic'] = set_combine(sets.MidCast['Enfeebling Magic'],{head="Merlinic Hood",legs="Merlinic Shalwar",feet="Merlinic Crackows", --Drain/Aspir Potency Augments.
			neck="Erra Pendant",left_ring="Stikini Ring +1",right_ring="Kishar Ring",back="Perimede Cape",})
				sets.MidCast['Stun']= set_combine(sets.MidCast['Enfeebling Magic'], {neck="Erra Pendant"})

	-- Enhancing Magic Kits
		sets.MidCast['Enhancing Magic']= {main="Gada",
				sub="Ammurapi Shield",
				ammo="Savant's Treatise",
				head="Befouled Crown",
				body="Peda. Gown +3",
				hands="Telchine Gloves",
				legs="Telchine Braconi",
				feet="Telchine Pigaches",
				waist="Embla Sash",
				left_ear="Mimir Earring",
				right_ear="Andoaa Earring",
				left_ring="Stikini Ring +1",
				right_ring="Stikini Ring +1",
				back="Perimede Cape",}
				
			sets.MidCast.Duration= set_combine(sets.MidCast['Enhancing Magic'],{head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},})
					sets.MidCast["Phalanx"]=  set_combine(sets.MidCast.Duration,{head={ name="Chironic Hat", augments={'Phalanx +4'}},
						hands={ name="Chironic Gloves", augments={'Phalanx +5'}},body={ name="Chironic Doublet", augments={'Phalanx +5',}},
						legs={ name="Chironic Hose", augments={'Phalanx +5'}},feet={ name="Chironic Slippers", augments={'Phalanx +4'}},})
					sets.MidCast["Aquaveil"]=  set_combine(sets.MidCast.Duration,{head="Amalric Coif +1",legs="Shedir Seraweels",hands="Regal Cuffs",waist="Emphatikos Rope",})
					sets.MidCast["Stoneskin"]=  set_combine(sets.MidCast.Duration,{legs="Shedir Seraweels",neck="Nodens Gorget",waist="Siegel Sash",left_ear="Earthcry Earring",})

			sets.MidCast.Recovery = set_combine(sets.MidCast.Duration,{main="Bolelabunga",
					head="Arbatel Bonnet +2",
					body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
					back="Bookworm's Cape",})
			sets.MidCast.Time = set_combine(sets.MidCast.Duration,{
					body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
					back="Lugh's Cape",})

	-- Healing Kits
		sets.MidCast['Healing Magic']= set_combine(sets.MidCast.SIRD,{head={ name="Vanya Hood", augments={'Healing magic skill +20',}}, -- +10%
			body="Peda. Gown +3",
			feet={ name="Vanya Clogs", augments={'Healing magic skill +20',}}, -- +5%
			neck="Incanter's Torque",
			left_ring="Haoma's Ring",
			right_ring="Sirona's Ring",})

			sets.MidCast.Cures = set_combine(sets.MidCast['Healing Magic'],{body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",feet="Kaykaus Boots +1", -- +23%-I, +8%-II
				legs={ name="Chironic Hose", augments={'"Cure" potency +11%',}},
				waist="Rumination Sash", --Sacro/Luminary, MND.
				left_ear="Regal Earring",
				right_ear="Malignance Earring",})

	-- Elemental Kits
		sets.MidCast.Freenuke = {main="Daybreak",
				sub="Ammurapi Shield",
				ammo="Ghastly Tathlum +1",
				head="C. Palug Crown",
				body="Amalric Doublet +1",
				hands="Amalric Gages +1",
				legs="Amalric Slops +1",
				feet="Arbatel Loafers +2",
				neck="Incanter's Torque",
				waist="Eschan Stone",
				left_ear="Regal Earring",
				right_ear="Malignance Earring",
				left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
				right_ring="Freke Ring",
				back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},}
				
				sets.MidCast.Freenuke.Low = set_combine(sets.MidCast.Freenuke,{sub="Culminus",back="Bookworm's Cape",head="Agwu's Cap",body="Agwu's Robe",legs="Agwu's Slops",})--Helix.

			sets.MidCast.Burst = set_combine(sets.MidCast.Freenuke,{main="Bunzi's Rod",
				head="Peda. M.Board +3",
				body="Agwu's Robe",
				hands="Amalric Gages +1",
				legs="Agwu's Slops",
				neck="Mizu. Kubikazari",-- JSENeck.
				left_ring="Mujin Band",})

				sets.MidCast.Burst.Low = set_combine(sets.MidCast.Burst,{sub="Culminus",back="Bookworm's Cape",})--Helix. JSE neck one day.

			sets.MidCast['Stone']= set_combine(sets.MidCast.Freenuke,{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Diaga']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})		
			sets.MidCast['Dia']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
			sets.MidCast['Dia II']= set_combine(sets.MidCast['Enfeebling Magic'],{head="Volte Cap",body="Volte Jupon",waist="Chaac Belt",})
		
		sets.MidCast.Divine= {main="Daybreak",feet={ name="Chironic Slippers", augments={'Magic burst dmg.+12%','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},}
	
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
		windower.send_command('unbind Numpad4 gs c C4') -- Regen
		windower.send_command('unbind Numpad6 gs c C6') -- Weapon Lock
		
		windower.send_command('unbind Numpad7 gs c C7') -- Idle
		windower.send_command('unbind Numpad8 gs c C8') -- Melee
		windower.send_command('unbind Numpad9 gs c C9') -- Weapon
		add_to_chat(158,' "Ahh, time to go. More coffee?" ')
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
		if (spell.skill == "Elemental Magic") or (spell.skill == "Dark Magic") or (spell.skill == "Healing Magic") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({waist="Hachirin-no-obi"})
			end
		end
	end
	
	function CureCheck(spell)
		if (spell.skill == "Healing Magic") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({main="Chatoyant Staff",sub="Enki Strap",waist="Hachirin-no-obi"})
			end
		end
	end
	
	function PerpIman()
		if (buffactive['Perpetuance'] or buffactive['Immanence']) 
			then equip({hands="Arbatel Bracers +2"})
		end
	end
	
	function Sublimation()
		if (buffactive['Sublimation: Activated']) 
			then equip({waist="Embla Sash", body="Peda. Gown +3",--head="Acad. Mortarboard"
				left_ear="Etiolation Earring",left_ring="Meridian Ring",right_ring="K'ayres Ring",})
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
		if get_current_enelement() ~= nil then	
		-- An Enspell is [ On ].
			equip({ammo="Sroda Tathlum",}) end
		if (bonus > 0) then
		-- Day or Weather is [ On ].
			equip({ammo="Sroda Tathlum",waist="Hachirin-no-Obi",}) end
		if (bonus > 19) then
		-- Personal Day Matching Buffs are [ On ].
			equip({ammo="Sroda Tathlum",waist="Hachirin-no-Obi",head="Umuthi Hat",}) end
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
				elseif WSSTRMND:contains(spell.name) then
					equip(sets.WS["STR/MND"])
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
		if player.sub_job:lower() == 'dnc' then
			if player.tp>350 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>1000 then
			equipSet = set_combine(equipSet, sets.Static)
		end
		equip(equipSet)
	end

	function midcast(spell,action)
	if spell.action_type == 'Magic' then
		if sets.MidCast[spell.english] then
			if buffactive.Accession and spell.english == 'Phalanx' then
				equip(sets.MidCast.Duration)
			else equip(sets.MidCast[spell.english]) end
		elseif spell.skill == "Elemental Magic" then
			if NukeLow:contains(spell.name) then
				equip(sets.MidCast[ElementalArray[ElementalIndex]].Low)
				if (spell.english == "Noctohelix") or (spell.english == "Noctohelix II") then
					equip(set_combine(sets.MidCast[ElementalArray[ElementalIndex]].Low,{head="Pixie Hairpin +1",right_ring="Archon Ring"})) end
				if (spell.english == "Luminohelix") or (spell.english == "Luminohelix II") then
					equip(set_combine(sets.MidCast[ElementalArray[ElementalIndex]].Low,{main="Daybreak"})) end	
			else
				equip(sets.MidCast[ElementalArray[ElementalIndex]]) end
		elseif spell.skill == "Divine Magic" then
			equip(set_combine(sets.MidCast[ElementalArray[ElementalIndex]],sets.MidCast.Divine))
		-- Enhancing.
			elseif PotencyBuffs:contains(spell.name) then
				equip(sets.MidCast['Enhancing Magic'])
			elseif DurationBuffs:contains(spell.name) then
				equip(sets.MidCast.Duration)
			elseif ProShell:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{left_ring="Sheltered Ring",}))
			elseif Regens:contains(spell.name) then
				equip(sets.MidCast[RegenArray[RegenIndex]])		
			elseif Refreshes:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{head="Amalric Coif +1",waist="Gishdubar Sash",}))
			elseif Storms:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{feet="Peda. Loafers"}))
		-- Heals.
			elseif Heals:contains(spell.name) then
				if spell.target.type == 'SELF' then
					equip(set_combine(sets.MidCast.Cures,{waist="Gishdubar Sash",}))
				else equip(sets.MidCast.Cures) end
		-- Catch All.
			elseif sets.MidCast[spell.skill] then
				equip(sets.MidCast[spell.skill])	
		end
	end 
	-- Weathercheck.
		ObiCheck(spell)
		CureCheck(spell)
	-- JAcheck.
		PerpIman()
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
		if player.sub_job:lower() == 'dnc' then
			if player.tp>350 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>1000 then
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
			equip(equipSet)
			IdleOffhand()
			Sublimation()
		end	
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
		if player.sub_job:lower() == 'dnc' then
			if player.tp>350 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>1000 then
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
			Sublimation()
		elseif new == 'Resting' then
			equip(sets.Resting)
		elseif new == 'Engaged' then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
			HandleOffhand()
			equip_enspell_obi()
		equip(equipSet)
	end
	-- Anti-TP Wipe Conditioning.
		equipSet = {}
		if player.sub_job:lower() == 'dnc' then
			if player.tp>350 or is_am_active() then
				equipSet = set_combine(equipSet, sets.Static)
			end
		elseif player.tp>1000 then
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
	--Regen.
		elseif command == 'C5' then
			RegenIndex = (RegenIndex % #RegenArray) +1
			status_change(player.status)
			add_to_chat(158,'Regen Focus: ' ..RegenArray[RegenIndex])
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