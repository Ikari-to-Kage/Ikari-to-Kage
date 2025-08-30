-----------------------------------------------------------
--{(Local Variables - These may expand and change.>--
-----------------------------------------------------------
local Idle = {
	-- Keybind: #7
	[1] = 'Standard',			-- Defense/Movement/Regenerations.
	[2] = 'MaxDT',				-- Max.DT
	[3] = 'Sync',					-- 40ish Gear Set for BCNMs.
	
}
local Melee = {
	-- Keybind: #8
	[1] = 'Standard',		-- Haste > Acc.
	[2] = 'MaxDT',			-- Max.DT
	[3] = 'Accuracy',		-- Acc. > Haste
	[4] = 'Sync',			-- Currently: 40cap.
}
local Weapon = {
	-- Keybind: #9
	[1] = 'Spear',			-- If it flies...
	[2] = 'Staff',			-- Gimme your MP.
	[3] = 'Sync',			-- Currently: 40cap.
}
local OutsideNation = {
	-- Keybind: #2
	[1] = 'Home',			[2] = 'Away',
}
local Settings = {	
	-- Local defaults.
	Idle = 1,
	Melee = 1,
	Weapon = 1,
	OutsideNation = 1,
}

----------------------------------------
--{(Spell/Weaponskill Set Assignments>--
----------------------------------------
--{(Spell Group Maps, add more groups as needed.>--
local EnhancingEffect = T{ 'Phalanx', 'Ice Spikes', 'Blaze Spikes', 
    'Enaero', 'Enblizzard', 'Enfire', 'Enstone', 'Enthunder', 'Enwater',
	'Reraise', 'Warp', 'Raise',};	-- MP conserves.

--{(Weaponskill group maps, make sure everything is in the right place.>--
local wsSTR = T{"Double Thrust","Leg Sweep","Skewer","Wheeling Thrust","Impulse Drive",
		"Heavy Swing","Shell Crusher","Full Swing",}
local wsDEX = T{"Penta Thrust","Vorpal Thrust",}		
local wsMND = T{"Spirit Taker","Retribution",}
local wsMAG = T{"Thunder Thrust","Raiden Thrust",
		"Earth Crusher","Rock Crusher","Starburst","Sunburst",}

--{(Subjob groupings.>--
local NoMPSubs = T{"THF","WAR","SAM","NIN","MNK","RNG","BRD",}
local HBTriggers = T{"RDM","WHM","BLM","BLU","DRK","PLD",}

local profile = {};
-----------------------
--{(Gear Assignments>--
-----------------------
local sets = {
--{(Idle Sets>--
    Idle_Standard_MP = {												range="",						ammo="Hedgehog Bomb",
		head="Darksteel Cap +1",		neck="Jeweled Collar",			ear1="Loquac. Earring",			ear2="Ethereal Earring",
		body="Drachen Mail",			hands="Dst. Mittens +1",		ring1="Woodsman Ring",  		ring2="Sattva Ring",
		back="Fed. Army Mantle",		waist="Wyrm Belt",				legs="Blood Cuisses",			feet="Blood Greaves"
	},
		Idle_Standard_HP = {	-- HP replacement overlays for no-MP subjobs.
			ammo="Happy Egg", ear1="Beastly Earring", ear2="Merman's Earring", hands="Drachen Fng. Gnt.", back="Amemet Mantle +1",			
		},
	
	Idle_MaxDT_MP = {													range="",						ammo="Hedgehog Bomb",
		head="Darksteel Cap +1",		neck="Jeweled Collar",			ear1="Loquac. Earring",			ear2="Ethereal Earring",
		body="Dst. Harness +1",			hands="Dst. Mittens +1",		ring1="Woodsman Ring",  		ring2="Sattva Ring",
		back="Fed. Army Mantle",		waist="Wyrm Belt",				legs="Blood Cuisses",			feet="Blood Greaves"
    },
		Idle_MaxDT_HP = {	-- HP replacement overlays for no-MP subjobs.
			ammo="Happy Egg", ear1="Beastly Earring", ear2="Merman's Earring", back="Amemet Mantle +1",
		},
--	
--{(Engaged Sets - Acc/Haste Priorities.>--
	Melee_Standard_MP = {												range="",						ammo="Phtm. Tathlum",
		head="Darksteel Cap +1",		neck="Peacock Amulet",			ear1="Brutal Earring",			ear2="Ethereal Earring",
		body="Assault Jerkin",			hands="Dusk Gloves",			ring1="Woodsman Ring",  		ring2="Sattva Ring",
		back="Amemet Mantle +1",		waist="Swift Belt",				legs="Dst. Subligar +1",		feet="Dusk Ledelsens"
	},
		Melee_Standard_HP = {	-- HP replacement overlays for no-MP subjobs. May be extensive, may not.
			ammo="Happy Egg",
		},
--		
	Melee_MaxDT_MP = {													range="",						ammo="Phtm. Tathlum",
		head="Darksteel Cap +1",		neck="Peacock Amulet",			ear1="Merman's Earring",		ear2="Ethereal Earring",
		body="Dst. Harness +1",			hands="Dusk Gloves",			ring1="Woodsman Ring",  		ring2="Sattva Ring",
		back="Amemet Mantle +1",		waist="Swift Belt",				legs="Dst. Subligar +1",		feet="Dusk Ledelsens"
	},
		Melee_MaxDT_HP = {
			ammo="Happy Egg",
		},
--	
	Melee_Accuracy_MP = {												range="",						ammo="Phtm. Tathlum",
        head="Optical Hat",				neck="Peacock Amulet",			ear1="Beastly Earring",			ear2="Ethereal Earring",
		body="Scorpion Harness",		hands="Dusk Gloves",			ring1="Woodsman Ring",  		ring2="Woodsman Ring",
		back="Amemet Mantle +1",		waist="Swift Belt",				legs="Drachen Brais",			feet="Dusk Ledelsens"
	},
		Melee_Accuracy_HP = {
			ammo="Happy Egg",
		},
--	
--{(/Sync Sets - CURRENTLY 40 CAP.>--
    Idle_Sync_MP = {													range="",						ammo="Morion Tathlum",
        head="Mrc.Cpt. Headgear",		neck="Peacock Amulet",			ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
		body="Mrc.Cpt. Doublet",		hands="Battle Gloves",			ring1="Woodsman Ring",  		ring2="Sattva Ring",
		back="",						waist="Warrior's Belt +1",		legs="Savage Loincloth",		feet="Bounding Boots"
    }, -- ^ Currently 40cap idle.
		Idle_Sync_HP = {
			ammo="Happy Egg", head="Walkure Mask",  body="Brigandine", legs="Bastokan Subligar",
		},	-- /SAM for 50.
--
    Melee_Sync_MP = {													range="",						ammo="Morion Tathlum",
        head="Mrc.Cpt. Headgear",		neck="Peacock Amulet",			ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
		body="Mrc.Cpt. Doublet",		hands="Battle Gloves",			ring1="Woodsman Ring",			ring2="Sattva Ring",
		back="",						waist="Warrior's Belt +1",		legs="Bastokan Subligar",		feet="Bounding Boots"
    }, 
		Melee_Sync_HP = {
			ammo="Happy Egg", head="Walkure Mask", body="Brigandine", legs="Bastokan Subligar", waist="Swift Belt",
		},	-- /SAM for 50.
--
--{(Weapons for melee purposes.>--
	Weapon_Spear 	= {main="Gae Bolg",		sub="",},
	Weapon_Staff 	= {main="Earth Staff",	sub="",},
	Weapon_Sync 	= {main="Peregrine",	sub="",},	-- Royal Jelly.
--{(Isolated Weapons for /mage purposes.>--
	Weapon_Rest		= {main="Dark Staff",	sub="",		ammo="Hedgehog Bomb",},
	
--{(Weaponskill Sets>--	Double check for MP Conservations later.
    Strength = {														range="",						ammo="",
        head="Walkure Mask",    		neck="Spike Necklace",    		ear1="Beastly Earring",			ear2="Merman's Earring",
        body="Drachen Mail",    		hands="Bastokan Mittens",		ring1="Woodsman Ring",			ring2="Woodsman Ring",
		back="Amemet Mantle +1",	   	waist="Wyrm Belt",		  		legs="Barone Cosciales",  		feet="Rutter Sabatons"
    },	-- Skewer/Wheeling, STR > Att.
    Dexterity = {														range="",						ammo="",
        head="Optical Hat",    			neck="Peacock Amulet",    		ear1="Beastly Earring",			ear2="Merman's Earring",
		body="Assault Jerkin",	    	hands="Battle Gloves",			ring1="Woodsman Ring",			ring2="Woodsman Ring",
        back="Amemet Mantle +1",	   	waist="Wyrm Belt",		  		legs="Wyrm Brais",    			feet="Blood Greaves"
    },	-- Penta, Acc > Stat.
    Mind = {															range="",						ammo="",
        head="Walkure Mask",    		neck="Justice Badge",    		ear1="Minuet Earring",			ear2="Merman's Earring",
        body="Scorpion Harness",    	hands="Savage Gauntlets",		ring1="Saintly Ring",   		ring2="Saintly Ring",
        back="",    					waist="Sword Belt",  			legs="",						feet="Savage Gaiters"
    },	-- Staff shit.
    Magic = {															range="",						ammo="Morion Tathlum",
        head="Walkure Mask",			neck="Spike Necklace",    		ear1="Morion Earring",			ear2="Morion Earring",
        body="Scorpion Harness",    	hands="Savage Gauntlets",   	ring1="Eremite's Ring",  		ring2="Eremite's Ring",
        back="",    					waist="",   					legs="",    					feet="Savage Gaiters"
    },	-- Zap stuff.
	
--{(JA/Jump Sets>--	[ Acquire Jump TP Bonus Pieces. Double check for MP Conservations.]
	['Jump'] = {														range="",						ammo="Happy Egg",
        head="Optical Hat",    			neck="Spike Necklace",    		ear1="Beastly Earring",			ear2="Merman's Earring",
        body="Scorpion Harness",    	hands="Bastokan Mittens",		ring1="Woodsman Ring",  		ring2="Sattva Ring",
        back="Amemet Mantle +1",		waist="Wyrm Belt",				legs="Barone Cosciales",		feet="Drachen Greaves"
    },	-- VIT+.
	['High Jump'] = {													range="",						ammo="Happy Egg",
        head="Optical Hat",    			neck="Spike Necklace",    		ear1="Beastly Earring",			ear2="Merman's Earring",
        body="Scorpion Harness",    	hands="Bastokan Mittens",		ring1="Woodsman Ring",   		ring2="Woodsman Ring",
        back="Amemet Mantle +1",		waist="Wyrm Belt",				legs="Barone Cosciales",		feet="Drachen Greaves"
    },	-- STR+.
	['Ancient Circle'] = {
		legs = 'Drachen Brais',
	},
	['Call Wyvern'] = {
		body = 'Wyrm Mail',
	},
	DragonBreath = {	-- Ammend accordingly.
		--head = 'Wym. Armet +1',
		head = 'Wyrm Armet',
		body = 'Wyvern Mail',
		--hands = 'Ostreger Mitts',
        legs = 'Drachen Brais',
		--legs = 'Drn. Brais +1',
		--feet = 'Homam Gambieras',
	},
	
--{(Casting Sets>--
    HPThresh = {														range="",						ammo="",
	    head="Drachen Armet",    		neck="",    					ear1="Loquac. Earring",			ear2="",
        body="Savage Separates",    	hands="Dusk Gloves",		   	ring1="Bomb Queen Ring", 		ring2="Sattva Ring",
        back="",    					waist="Warrior's Belt +1",   	legs="Drachen Brais",   	 	feet="Dusk Ledelsens"
    },
	Haste = {															range="",						ammo="",
        head="",    					neck="",    					ear1="Loquac. Earring",   		ear2="",
        body="",						hands="Dusk Gloves",		   	ring1="Bomb Queen Ring", 		ring2="Sattva Ring",
        back="",    					waist="Quick Belt", 		  	legs="Drachen Brais",   	 	feet="Dusk Ledelsens"
    },	-- Repair this as MP grows to allow for things like RR casting without it breaking.

	hMP = {																range="",						ammo="",
        head="",						neck="",    					ear1="",    					ear2="",
        body="",						hands="",				    	ring1="",    					ring2="",
        back="",    					waist="",    					legs="",    					feet=""	
	},

    Enhancing = {	-- Pretty much exclusively for like, 5 buffs that we do not use as triggers.
        head="",    					neck="Enhancing Torque",   		ear1="",    					ear2="Geist Earring",
        body="",    					hands="Savage Gauntlets",   	ring1="Saintly Ring",   		ring2="Saintly Ring",
        back="",    					waist="",   					legs="Savage Loincloth",    	feet=""
    },

--{(Miscellaneous Useful Sets.>--
	Hate = {															range="",						ammo="",
        head="Pumpkin Head II",    		neck="",    					ear1="",    					ear2="",
        body="",						hands="",    					ring1="",						ring2="Sattva Ring",
        back="",    					waist="",    					legs="",    					feet=""
	},
	StealthCast = {
		Hands = 'Dream Mittens +1',
		Feet = 'Dream Boots +1',
		Back = 'Skulker\'s Cape', 
	},
	Gorget = {
		neck="Stone Gorget",
	},
}

profile.OnLoad = function()
    gSettings.AllowAddSet = false;	-- Put your own in it, do not risk a string fail.
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad7 /lac fwd Idle_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad8 /lac fwd Engaged_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad9 /lac fwd Weapon_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad2 /lac fwd Nation_Cycle');
	gFunc.Message(' Raiden! :D ');
end

profile.OnUnload = function()
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad7');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad8');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad9');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad2');
	gFunc.Message(' Naptime for stabcat. ');
end

profile.HandleCommand = function(args)
	-- Keybind: #7
	if (args[1] == 'Idle_Cycle') then
		Settings.Idle = Settings.Idle + 1;
		if (Settings.Idle > #Idle) then
			Settings.Idle = 1;
		end
		gFunc.Message('Idle Set: ' .. Idle[Settings.Idle]);
	end
	-- Keybind: #8
	if (args[1] == 'Engaged_Cycle') then
		Settings.Melee = Settings.Melee  + 1;
		if (Settings.Melee > #Melee) then
			Settings.Melee = 1;
		end
		gFunc.Message('Engaged Set: ' .. Melee[Settings.Melee]);
	end 
	-- Keybind: #9
	if (args[1] == 'Weapon_Cycle') then
		Settings.Weapon = Settings.Weapon  + 1;
		if (Settings.Weapon > #Weapon) then
			Settings.Weapon = 1;
		end
		gFunc.Message('Weapon Set: ' .. Weapon[Settings.Weapon]);
	end 
	
	-- Keybind: #2
	if (args[1] == 'Nation_Cycle') then
		Settings.OutsideNation = Settings.OutsideNation + 1;
		if (Settings.OutsideNation > #OutsideNation) then
			Settings.OutsideNation = 1;
		end
		gFunc.Message('Home or Away? : ' .. OutsideNation[Settings.OutsideNation]);	
	end
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	local petAction = gData.GetPetAction();
	
	if (petAction ~= nil) then
        gFunc.EquipSet(sets.DragonBreath);
		return;
	end
	
	if (player.Status == 'Engaged') then
		gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon]);
		gFunc.EquipSet('Melee_' .. Melee[Settings.Melee] ..'_MP');
		if (NoMPSubs:contains(player.SubJob)) then
			gFunc.EquipSet('Melee_' .. Melee[Settings.Melee] ..'_HP');
		end
		
	elseif (player.Status =='Resting') then
		gFunc.EquipSet(sets.hMP);
		if (HBTriggers:contains(player.SubJob)) and (player.TP <= 100) then
			gFunc.EquipSet(sets.Weapon_Rest);
		end
		
	else
		gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon]);
		gFunc.EquipSet('Idle_' .. Idle[Settings.Idle] ..'_MP');
		if (NoMPSubs:contains(player.SubJob)) then
			gFunc.EquipSet('Idle_' .. Idle[Settings.Idle] ..'_HP');
		end
	end
end

profile.HandleAbility = function()
	local action = gData.GetAction();
	
	if (action.Name == "Steady Wing") or (action.Name == "Spirit Link") then
		gFunc.EquipSet(sets.DragonBreath);
		return;
	elseif (sets[action.Name] ~= nil) then
		gFunc.EquipSet(sets[action.Name])
	end	
	
	if(action.Name == 'Provoke') then
		gFunc.EquipSet(sets.Hate);
	end
end

profile.HandlePrecast = function()	
	gFunc.EquipSet(sets.Haste);
	gFunc.EquipSet(sets.HPThresh);
end

profile.HandleMidcast = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();

	-- Default Gear.
	gFunc.EquipSet(sets.Haste);
--	gFunc.EquipSet(sets.HPThresh);

	-- Specific Isolations.
	if (action.Skill == 'Enhancing Magic') then
		if (action.Name == 'Sneak') or (action.Name == 'Invisible')then
			gFunc.EquipSet(sets.StealthCast);
		elseif (EnhancingEffect:contains(action.Name)) then
			gFunc.EquipSet(sets.Enhancing);
			if (action.Name == 'Stoneskin') then
				gFunc.EquipSet(sets.Gorget);
			end
		else
			gFunc.EquipSet(sets.Haste);
			gFunc.EquipSet(sets.HPThresh);
		end
	elseif (action.Name == 'Utsusemi: Ichi' or action.Name == 'Utsusemi: Ni') then
		gFunc.EquipSet(sets.Haste);
	end
end

profile.HandleWeaponskill = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	--local environ = gData.GetEnvironment(); -- Return once Obi's are mine.
	
	if (wsSTR:contains(action.name)) then
        gFunc.EquipSet(sets.Strength);
	elseif (wsDEX:contains(action.name)) then
        gFunc.EquipSet(sets.Dexterity);
	elseif (wsMND:contains(action.name)) then
        gFunc.EquipSet(sets.Mind);
	elseif (wsMAG:contains(action.name)) then
        gFunc.EquipSet(sets.Magic);
	end 
end

profile.HandlePreshot = function()
end
profile.HandleMidshot = function()
end
profile.HandleItem = function()
end
profile.Sets = sets;
return profile;