--Last Edit; 8-8-25--
--	*-----------*  --
--	| Welcome <3|  --
--	|  iKia.GEO |  --
--	|  v.2.Baha |  --
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
	IdleArray = {"Movement","Defense",}
	EngagedIndex = 1 
	EngagedArray = {"General","Defense",}
	WeaponIndex = 1
	WeaponArray = {"Maxentius","Staff",}

	ElementalIndex = 1
	ElementalArray = {"Freenuke", "Burst"}

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
			"Protectra","Protectra II","Protectra III","Shellra","Shellra II","Shellra III",} --Specify the rings.
		Regens = S{"Regen","Regen II","Regen III",} -- Specify Mainhand + Body.
		Refreshes = S{"Refresh",} -- Specify w.e it is that ups it.
		
	NukeLow = S{"Stone II","Stone III","Aero","Aero II","Aero III","Fire","Fire II","Fire III", --"Stone" pulled for TH.
			"Blizzard","Blizzard II","Blizzard III","Water","Water II","Water III","Thunder","Thunder II","Thunder III",
			"Pyrohelix","Anemohelix","Cryohelix","Geohelix","Hydrohelix","Ionohelix","Luminohelix","Noctohelix",}

	Heals = S{"Cure","Cure II","Cure III","Cure IV","Cure V",
			"Cura","Cura II","Curaga","Curaga II","Curaga III"} -- Should be all of them.
	
--{(Waltz/JA group maps, if anything else weird appears, put it here.>--
	JAWaltz = S{"Curing Waltz","Curing Waltz II","Curing Waltz III","Divine Waltz","Healing Waltz",}	

--{(Weaponskill group maps, make sure everything is in the right place.>--
	WSSTRAtt = S{"Shattersoul","Full Swing","Shell Crusher","Heavy Swing",
				"Skullbreaker","True Strike","Realmrazer",}	--Club.
	
	WSSTRMND = S{"Retribution","Spirit Taker","Exudation",
				"Judgement","Black Halo",}	--Club.
	
	WSCrit = S{"Hexa Strike",}
	
	WSElem = S{"Cataclysm","Sunburst","Starburst","Earth Crusher","Rock Crusher",
				"Shining Strike","Seraph Strike","Flash Nova"}	--Club.	
	
-----------------------
--{(Gear Assignments>--
-----------------------

function get_sets()
-- Initiate HUD.
	ManaScrollHUD()
	ManaBarsHUD()
	add_to_chat(158,' "Ohai! Bubbles today? :3" ')
	
--{(Idle Sets>--
	sets.Idle = {}
		sets.Idle.Movement = {range="Dunna",
			head="Befouled Crown",
			body="Jhakri Robe +2",
			hands="Volte Gloves",
			legs="Assiduity Pants +1",
			feet="Geo. Sandals +2",
			neck="Bathy Choker +1",
			waist="Embla Sash",
			left_ear="Infused Earring",
			right_ear="Etiolation Earring",
			left_ring="Stikini Ring +1",
			right_ring="Chirich Ring +1",
			back="Mecisto. Mantle",}
			--back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10','Pet: "Regen"+5',}},}

		sets.Idle.Defense = {head="Nyame Helm",
			body="Shamash Robe",	-- This is a thing. 
			legs="Nyame Flanchard",
			hands="Nyame Gauntlets",
			neck="Loricate Torque +1",	
			right_ring="Defending Ring",}
			
			-- https://www.ffxiah.com/members/item-sets/?id=400297 Set to Overlay, account accordingly.
		sets.Idle.Pet =	{--main={ name="Solstice", augments={'Pet: Damage taken -4%',}},
			head="Azimuth Hood +2",			-- Regen+3~4.
			--body={ name="Telchine Chas.", augments={'Pet: "Regen"+3','Pet: Damage taken -3%',}},	-- Update out once neck.
			hands="Geo. Mitaines +2", 		-- DT-12%/13.
			legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -3%',}},
			feet="Bagua Sandals +2",		-- Regen+5.
			neck="Bagua Charm +1",		-- Regen+5.
			waist="Isa Belt",				-- Regen +1/DT-3%.
			left_ear="Hypaspist Earring",	-- DT-5%.
			back={ name="Nantosuelta's Cape", augments={'Pet: "Regen"+10',}},}

--{(Melee Sets>--
	sets.Engaged = {}
		sets.Engaged.General = {range="Dunna",	-- Never changes.
			head="Blistering Sallet +1",
			body="Nyame Mail",
			hands="Gazu Bracelets +1",
			legs="Jhakri Slops +2",
			feet="Azimuth Gaiters +2",
			neck="Clotharius Torque",			-- Combatants.
			waist="Windbuffet Belt +1",
			left_ear="Cessance Earring",
			right_ear="Brutal Earring",
			left_ring="Chirich Ring +1",
			right_ring="Chirich Ring +1",
			back="Nantosuelta's Cape",}
			
			sets.Engaged["General"].DW = set_combine(sets.Engaged.General,{left_ear="Suppanomimi",right_ear="Eabani Earring",})

		sets.Engaged.Defense = set_combine(sets.Engaged.General,{
			head="Azimuth Hood +2",
			legs="Nyame Flanchard",
			neck="Loricate Torque +1",
			right_ring="Defending Ring",})
			
			sets.Engaged["Defense"].DW = set_combine(sets.Engaged.Defense,{left_ear="Suppanomimi",right_ear="Eabani Earring",})

--{(Weapons.>--	
	
	sets.Maxentius	= {main="Maxentius",		sub="Genmei Shield",	range="Dunna",	ammo=empty,}
	sets.Staff		= {main="Malignance Pole",	sub="Khonsu",			range="Dunna",	ammo=empty,}
	
	sets.Maxentius.DW	= {main="Maxentius",	sub="Blurred Rod +1",	range="Dunna",	ammo=empty,}
	sets.Staff.DW 		= sets.Staff
	
	sets.NukeDW		= {main="Bunzi's Rod",sub="Daybreak",}	-- Nuke set for DW.
	
--{(JA Sets>--	
	sets.JA = {}

		sets.JA["Life Cycle"] 	= {body="Geomancy Tunic +1",back="Nantosuelta's Cape",} -- Max HP effects This.
		sets.JA["Full Circle"]	= {head="Azimuth Hood +2",}
		--sets.JA["Bolster"] 		= {body="Bagua Tunic +3",}
		sets.JA["Radial Arcana"] = {feet="Bagua Sandals +2",}
		sets.JA["Mending Halation"] = {legs="Bagua Pants +2",}
			
		sets.JA.Waltz = {
			head="C. Palug Crown",
			body="Shamash Robe",
			hands="Telchine Gloves",
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
	
	-- DEBUG ALL WS
		sets.WS["STR/Att"] = {	-- Misc defaults.
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Fotia Gorget",	-- Find better. 
			waist="Grunfeld Rope",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Epaminondas's Ring", 
			}	

		
		sets.WS["STR/MND"] = {	-- Halo.
			head={ name="Nyame Helm", augments={'Path: B',}},
			body={ name="Nyame Mail", augments={'Path: B',}},
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Fotia Gorget",	-- Find better. 
			waist="Grunfeld Rope",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ear="Regal Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Epaminondas's Ring", 
			}
		
		-- Yes, it gets it's own.
		sets.WS["Hexa Strike"] = {
			head={ name="Blistering Sallet +1", augments={'Path: A',}},
			body={ name="Nyame Mail", augments={'Path: B',}},	-- Look at AF(w.e)+3's, they may be better.
			hands={ name="Nyame Gauntlets", augments={'Path: B',}},
			legs={ name="Nyame Flanchard", augments={'Path: B',}},
			feet={ name="Nyame Sollerets", augments={'Path: B',}},
			neck="Fotia Gorget",
			waist="Fotia Belt",
			left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
			right_ear="Telos Earring",
			left_ring="Begrudging Ring",
			right_ring="Hetairoi Ring",
			}
		
		sets.WS["EleWS"] = {
			head="C. Palug Crown",
			body="Nyame Mail",
			hands="Nyame Gauntlets",
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
		sets.PreCast.FastCast = {head="Merlinic Hood",
			body="Agwu's Robe",
			hands="Volte Gloves",
			legs="Volte Brais",
			feet="Regal Pumps +1",
			waist="Embla Sash",
			left_ring="Kishar Ring",
			right_ring="Lebeche Ring",
			left_ear="Loquac. Earring",
			right_ear="Malignance Earring",
			back="Perimede Cape",}
				sets.PreCast['Impact']= set_combine(sets.PreCast.FastCast, {head=empty, body="Twilight Cloak",})
				sets.PreCast['Dispelga']= set_combine(sets.PreCast.FastCast, {main="Daybreak",})

--{(Midcast Sets>--	
	sets.MidCast = { }
	
	sets.MidCast.SIRD = {head="Nyame Helm",	-- ->		DT-7	[or, Aqua+2]
		body="Ros. Jaseran +1",				--SIRD+25
		hands="Amalrick Gages +1",			--SIRD+11			[or, Aqua+2/SS+30]
		legs="Querkening Brais",			--SIRD+15			[or, Aqua+1/SS+35]
		feet="Nyame Sollerets", 			-- ->		DT-7
		neck="Loricate Torque +1",			--SIRD+5	DT-6
		waist="Emphatikos Rope",			--SIRD+12			Aqua+1!
		left_ear="Magnetic Earring",		--SIRD+8
		right_ear="Etiolation Earring",		-- ->		MDT-3	[or, SS+10]
		left_ring="Defending Ring",			-- ->		DT-10
		right_ring="Freke Ring",			--SIRD+10
		}
	
	-- Geomancy Kits
		sets.MidCast.Geo = {
			head="Azimuth Hood +2",		--Skill+
			--body="Bagua Tunic +3",	--Skill+
			hands="Geo. Mitaines +2",
			neck="Incanter's Torque",	-- Neck+2.
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Lifestream Cape",}
		
		sets.MidCast.Indi = {main={ name="Gada", augments={'Indi. eff. dur. +7',}},
			head="Azimuth Hood +2",		--Skill+
			--body="Bagua Tunic +3",	--Skill+
			hands="Geo. Mitaines +2",	
			legs="Bagua Pants +2",		--+18s
			feet="Azimuth Gaiters +2",		--+15s
			neck="Incanter's Torque",	-- Neck +2.
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Lifestream Cape",}	--+18s
	
	-- Enfeebling Kits		
		sets.MidCast['Enfeebling Magic']= {main="Daybreak",
			sub="Ammurapi Shield",
			head="Amalric Coif +1",
			body="Shamash Robe",
			hands="Regal Cuffs",
			legs="Jhakri Slops +2",
			feet="Bagua Sandals +2",
			neck="Incanter's Torque",
			waist="Obstinate Sash",
			left_ear="Regal Earring",
			right_ear="Malignance Earring",
			left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
			right_ring="Kishar Ring",} --actually care here.
					sets.MidCast['Impact']= set_combine(sets.MidCast['Enfeebling Magic'], {head=empty,body="Twilight Cloak",left_ear="Malignance Earring",})
					sets.MidCast['Dispelga']= set_combine(sets.MidCast['Enfeebling Magic'], {main="Daybreak",})

		sets.MidCast['Dark Magic'] = set_combine(sets.MidCast['Enfeebling Magic'],{head="Merlinic Hood",legs="Merlinic Shalwar",feet="Merlinic Crackows", --Drain/Aspir Potency Augments.
			neck="Erra Pendant",left_ring="Stikini Ring +1",right_ring="Kishar Ring",back="Perimede Cape",})

	-- Enhancing Magic Kits
		sets.MidCast['Enhancing Magic']= {main={ name="Gada", augments={'Enh. Mag. eff. dur. +6',}},
			sub="Ammurapi Shield",
			head="Befouled Crown",
			body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
			hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
			legs="Shedir Seraweels",
			feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
			neck="Incanter's Torque",
			waist="Olympus Sash",
			left_ear="Mimir Earring",
			right_ear="Andoaa Earring",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",
			back="Perimede Cape",}
				sets.MidCast["Phalanx"] = set_combine(sets.MidCast['Enhancing Magic'],{}) --Pure skill+.
				sets.MidCast["Aquaveil"]=  set_combine(sets.MidCast['Enhancing Magic'],{legs="Shedir Seraweels",waist="Emphatikos Rope",})
				sets.MidCast["Stoneskin"]=  set_combine(sets.MidCast['Enhancing Magic'],{legs="Shedir Seraweels",hands="Stone Mufflers",neck="Nodens Gorget",waist="Siegel Sash",left_ear="Earthcry Earring",})

			sets.MidCast.Duration= set_combine(sets.MidCast['Enhancing Magic'],{
				head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
				body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
				hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +9',}},
				legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
				feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +10',}},
				waist="Embla Sash",})

	-- Healing Kits
		sets.MidCast['Healing Magic']= set_combine(sets.MidCast.SIRD,{
			head={ name="Vanya Hood", augments={'Healing magic skill +20',}},
			feet={ name="Vanya Clogs", augments={'Healing magic skill +20',}},
			neck="Incanter's Torque",
			left_ring="Stikini Ring +1",
			right_ring="Stikini Ring +1",})

			sets.MidCast.Cures = set_combine(sets.MidCast['Healing Magic'],{main="Daybreak",
				head="Vanya Hood",
				hands="Telchine Gloves",})

	-- Elemental Kits
		sets.MidCast.Freenuke = {main="Daybreak",
				sub="Ammurapi Shield",
				head="C. Palug Crown",
				body="Amalric Doublet +1",
				hands="Amalric Gages +1",
				legs="Amalric Slops +1",
				feet="Merlinic Crackows",	--15+40.
				neck="Incanter's Torque",
				waist="Eschan Stone",
				left_ear="Regal Earring",
				right_ear="Malignance Earring",
				left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
				right_ring="Freke Ring",}
				
				sets.MidCast.Freenuke.Low = set_combine(sets.MidCast.Freenuke,{
					sub="Culminus",head="Agwu's Cap",body="Agwu's Robe",legs="Agwu's Slops",})

		sets.MidCast.Burst = set_combine(sets.MidCast.Freenuke,{main="Bunzi's Rod",
				body="Agwu's Robe",
				hands="Amalric Gages +1",
				legs="Agwu's Slops",
				neck="Mizu. Kubikazari",
				left_ring="Mujin Band",})

				sets.MidCast.Burst.Low = set_combine(sets.MidCast.Burst,{sub="Culminus",head="Agwu's Cap",})

		sets.MidCast['Stone']= set_combine(sets.MidCast.Freenuke,{head="White Rarab Cap +1",body="Volte Jupon",waist="Chaac Belt",})
		sets.MidCast['Diaga']= set_combine(sets.MidCast.Potency,{head="White Rarab Cap +1",body="Volte Jupon",waist="Chaac Belt",})		
		sets.MidCast['Dia']= set_combine(sets.MidCast.Potency,{head="White Rarab Cap +1",body="Volte Jupon",waist="Chaac Belt",})
		sets.MidCast['Dia II']= set_combine(sets.MidCast.Potency,{head="White Rarab Cap +1",body="Volte Jupon",waist="Chaac Belt",})
		
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
		add_to_chat(158,' "...Dammit, ran out of soap." ')
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

	function NukeOffhand()
		if (player.sub_job:lower() == 'dnc') or (player.sub_job:lower() == 'nin') then
			equip(set_combine(sets.MidCast[ElementalArray[ElementalIndex]],sets.NukeDW))
		end
	end

	function ObiCheck(spell)
		if (spell.skill == "Elemental Magic") or (spell.skill == "Dark Magic") or (spell.skill == "Healing Magic") or (spell.type == "WeaponSkill") then
			if (spell.element == world.day_element) or (spell.element == world.weather_element) then
				equip({waist="Hachirin-no-obi"})
			end
		end
	end

	function pet_change(pet,gain)
		if gain == false and pet.name then
			windower.add_to_chat(50,' !! Geo-bubble Popped !! ^;.;^ ')
			status_change(player.status)
		else 
			--windower.add_to_chat(50,' Bubble obtained? ')
			status_change(player.status)
		end
	end
	
	-- Look at these, potentially debug them.
	
	function GeoBubbleIdleCheck()
		if pet.isvalid == true then
			--windower.add_to_chat(50,' Bubble obtained. -> putting things on.')
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets.Idle.Pet))
			if WeaponIndex == 1 then
				equip({main="Solstice",})
			end
		end
	end
	
	function GeoBubbleBapCheck()
		if pet.isvalid then
			--equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]].DW,sets[WeaponArray[WeaponIndex]].DW))
			-- this one is gonna be way more indepth if we rework it, adapt accordingly. For now, it works fine.
			equip({head="Azimuth Hood +2",feet="Bagua Sandals +2"}) -- [PetRegen+9~]
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
				if NukeLow:contains(spell.name) then
					equip(sets.MidCast[ElementalArray[ElementalIndex]].Low)
				else
					equip(sets.MidCast[ElementalArray[ElementalIndex]]) 
				end
			NukeOffhand()
		-- Enhancing.
			elseif PotencyBuffs:contains(spell.name) then
				equip(sets.MidCast['Enhancing Magic'])
			elseif DurationBuffs:contains(spell.name) then
				equip(sets.MidCast.Duration)
			elseif ProShell:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{left_ring="Sheltered Ring",}))
			elseif Regens:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{main="Bolelabunga",body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},}))				
			elseif Refreshes:contains(spell.name) then
				equip(set_combine(sets.MidCast.Duration,{waist="Gishdubar Sash",}))
		-- Geomancy.
			elseif spell.skill == "Geomancy" then
				if spell.name:startswith('Geo-') then
					equip(sets.MidCast.Geo) end
				if spell.name:startswith('Indi-') then
					equip(sets.MidCast.Indi) 
					if player.sub_job:lower() == 'dnc' then
						equip(set_combine(sets.MidCast.Indi,{sub="Solstice",}))
				end
			end
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
		HandleOffhand()
		GeoBubbleBapCheck()
		else
			equip(set_combine(sets.Idle[IdleArray[IdleIndex]],sets[WeaponArray[WeaponIndex]]))
			IdleOffhand()
			GeoBubbleIdleCheck()
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
			IdleOffhand()
			GeoBubbleIdleCheck()
		elseif new == 'Resting' then
			equip(sets.Resting)
		elseif new == 'Engaged' then
			equip(set_combine(sets.Engaged[EngagedArray[EngagedIndex]],sets[WeaponArray[WeaponIndex]]))
			HandleOffhand()
			GeoBubbleBapCheck()
		equip(equipSet)
		--registers here, for some reason...
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