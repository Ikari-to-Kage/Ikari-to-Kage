-----------------------------------------------------------
--{(Local Variables - These may expand and change.>--
-----------------------------------------------------------
local Idle = {
	-- Keybind: F9
	[1] = 'Support',		-- Max.MP priority, Refresh, Regen if it's available.
	[2] = 'Fishies',		-- Do not catch the trees.
}
local Weapon = {
	-- Keybind: F10
	[1] = 'Staff',			-- Probably an earth/terra's staff.
	[2] = 'Murder',			-- Whatever you wish to actually hit things with.
}
local Melee = {
	-- Keybind: F11
	[1] = 'Haste',			-- Haste > Acc.
	--[2] = 'Accuracy',		-- Acc. > Haste.
}
local TPLock = {
	-- Keybind: F12
	[1] = 250, 				-- Wish to murder.
	[2] = 1000,				-- Dump TP for all spells unless I have a WS locked, loaded, and in the chamber.
}
local Overflow = {
	-- No keybind. This is here purely to prevent you from dumping the excess MP from resting.
	-- Change this number to what your MidCast MP is; you will have to test and find this number for yourself.
	-- I recommend going 10~15pts above the actual number. Or 50 if you use MP food.
	[1] = 675,
}
-- No touchy-touchy. These can make things go weird, but you can allocate the default of the above by changing 1's to 2's.
local Settings = {
	Idle = 1, Weapon = 1, Melee = 1, TPLock = 1, Overflow = 1,
}

----------------------------------------
--{(Spell/Weaponskill Set Assignments>--
----------------------------------------
--{(Spell Group Maps, add more groups as needed.>--
local MndDebuffs = T{ 'Slow', 'Paralyze', 'Silence', 'Repose' };
local IntDebuffs = T{ 'Sleep', 'Sleep II', 'Sleepga', 'Bind', 'Gravity', 'Dispel', 'Poison', 'Poison II', 'Blind' };
local ElementalDebuffs = T{ 'Burn', 'Choke', 'Shock', 'Rasp', 'Drown', 'Frost' };
local EnhancingEffect = T{ 'Phalanx', 'Ice Spikes', 'Shock Spikes', 'Blaze Spikes', 'Enaero', 'Enblizzard', 'Enfire', 'Enstone', 'Enthunder', 'Enwater', 
	'Barsleep', 'Barsleepra', 'Barpoison', 'Barpoisonra', 'Barparalyze', 'Barparalyzra', 'Barblind', 'Barblindra', 'Barsilence', 'Barsilencera', 'Barpetrify', 'Barpetra', 'Barvirus', 'Barvira',}
local Barspells = T{ 'Baraero', 'Baraera', 'Barblizzard', 'Barblizzara', 'Barfire', 'Barfira', 'Barstone', 'Barstona', 'Barthunder', 'Barthundara', 'Barwater', 'Barwatera', };	-- Elemental Bar Spell ++.
local CureSingle = T{ 'Cure', 'Cure II', 'Cure III', 'Cure IV', 'Cure V' };
local CureParty = T{ 'Curaga', 'Curaga II', 'Curaga III', 'Curaga IV', 'Cura' };

--{(Weaponskill group maps, make sure everything is in the right place.>--	Yes, it's weird. HORIZON IS WIERD.
local wsSTR = T{"Skullbreaker","True Strike","Judgement","Heavy Swing","Full Swing","Shell Crusher",
		"Shining Strike","Seraph Strike","Earth Crusher","Rock Crusher",	-- Hybrids that no longer work like sane WS's, idk what to tell you.
		"Hexa Strike","Black Halo","Retribution",}	-- Halo and Retribution are both 50% MND, but the MND WS set may have significant STR penalities, thus here.
local wsMND = T{"Energy Drain","Energy Steal","Shadowstitch","Spirit Taker",}	-- MND > All. MP Returning. SPIRIT TAKER CAN MISS.
local wsMAG = T{"Cyclone","Starburst","Sunburst",}	-- MAB > All.

local profile = {};
-----------------------
--{(Gear Assignments>--
-----------------------
local sets = {
--{(Idle Sets>--
    Idle_Support = {													range="",						ammo="Morion Tathlum",
		head="",						neck="Justice Badge",			ear1="Geist Earring",			ear2="Morion Earring",
		body="Royal Cloak",				hands="Savage Gauntlets",		ring1="Vilma's Ring",  			ring2="Astral Ring",
		back="White Cape +1",			waist="Mrc.Cpt. Belt",			legs="Savage Loincloth",		feet="Savage Gaiters"
    },
	Idle_Fishies = {													range="Halcyon Rod",			ammo="",
		head="Healer's Cap",			neck="Justice Badge",			ear1="Geist Earring",			ear2="Morion Earring",
		 body="Angler's Tunica",		 hands="Angler's Gloves",		ring1="Vilma's Ring",  			ring2="Astral Ring",
		back="White Cape +1",			waist="Mrc.Cpt. Belt",			 legs="Angler's Hose",			 feet="Angler's Boots"
		-- Copy your Support Idle, replace relevant pieces with Fishing++. Make sure your Ranged/Ammo slots are EMPTY, so you don't screw with rods/bait.
    },

--{(Melee Sets>--
	-- Where Acc, Attack, or Haste can not be found, place DT pieces.
	Melee_Haste = {														range="",						ammo="Happy Egg",
		head="Crow Beret",				neck="Peacock Amulet",			ear1="Geist Earring",			ear2="Morion Earring",
		body="Crow Jupon",				hands="Battle Gloves",			ring1="Woodsman Ring",			ring2="Woodsman Ring",
		back="White Cape +1",			waist="Swift Belt",				legs="Healer's Pantaloons",		feet="Savage Gaiters"
	},	-- Haste > Acc. (Nashira > Hauby)
	Melee_Accuracy = {
	
	},	-- Acc > Haste. (Hauby > Nashira)
	DW = {
	
	},	-- Items that enhance Dual Wield, like Stealth Earring. Will over-lap your normal melee sets when needed.
--{(Weapons for melee purposes.>--
	Weapon_Staff 	= {main="Earth Staff",		sub="",},
		Weapon_Staff_DW 	= {main="Earth Staff",		sub="",},
	Weapon_Murder 	= {main="Arcana Breaker",	sub="Tortoise Shield",},
		Weapon_Murder_DW 	= {main="Arcana Breaker",	sub="Blessed Hammer",},

--{(Isolated Weapons for mage purposes.>--
	Weapon_Rest		= {main="Dark Staff",		sub="",},
	
--{(Weaponskill Sets>--
    Strength = {														range="",						ammo="",
        head="Mrc.Cpt. Headgear",    	neck="Spike Necklace",			ear1="Geist Earring",    		ear2="Moldavite Earring",
        body="Savage Separates",    	hands="Savage Gauntlets",		ring1="Saintly Ring",   		ring2="Saintly Ring",
        back="White Cape +1",    		waist="Mrc.Cpt. Belt",   		legs="Savage Loincloth",		feet="Savage Gaiters"	
    },
    Mind = {															range="",						ammo="",
        head="Healer's Cap",    		neck="Justice Badge",			ear1="Geist Earring",    		ear2="Moldavite Earring",
        body="Savage Separates",    	hands="Savage Gauntlets",		ring1="Saintly Ring",   		ring2="Saintly Ring",
        back="White Cape +1",    		waist="Mrc.Cpt. Belt",   		legs="Savage Loincloth",		feet="Savage Gaiters"		
    },
    Magic = {															range="",						ammo="",
        head="Mrc.Cpt. Headgear",    	neck="Justice Badge",			ear1="Geist Earring",    		ear2="Moldavite Earring",
        body="Savage Separates",    	hands="Savage Gauntlets",		ring1="Saintly Ring",   		ring2="Saintly Ring",
        back="White Cape +1",    		waist="Mrc.Cpt. Belt",   		legs="Savage Loincloth",		feet="Savage Gaiters"	
    },

--{(Precast Sets>--
	-- 10% FC = 2.5% recast. Account Accordingly. [Recast = RC * (RC-FC) * (RC-Haste)]
	-- Generally, your MidCast will use one, or both of these. Recast will be your Haste+ gear, in the absense of Large Amounts of Fast Cast+. If you lack Haste, but have FC, use it.
    FastCast = {
	
    },
	Recast = {
	
    },
	CureCasting = {
		-- Cure Casting Down pieces.
	},

--{(MP Conservation Sets>--
	-- 'Overflow' will be toggled once your MP regenerates above what your Overflow Setting is set for. It will be accordingly maintained when you stand up from resting, as you will likely be over that threshold.
	-- Overflow should be very similar to your hMP set-- only prioritizing MP+ over MP-Healed.
	MPOverflow = {														range="",						ammo="Morion Tathlum",
		head="",						neck="Justice Badge",			ear1="Geist Earring",			ear2="Morion Earring",
		body="Royal Cloak",				hands="Savage Gauntlets",		ring1="Vilma's Ring",  			ring2="Astral Ring",
		back="White Cape +1",			waist="Mrc.Cpt. Belt",			legs="Savage Loincloth",		feet="Healer's Duckbills"
	},
	hMP = {
	-- tl,dr; dark staff and hMP bits. MP where you cannot put the other.
	},
	
--{(Glitterbox.>--
	Healing = {
        head="Crow Beret",				neck="Justice Badge",			ear1="Geist Earring",			ear2="",
		body="Crow Jupon",				hands="Savage Gauntlets",		ring1="Vilma's Ring",  			ring2="Saintly Ring",
		back="White Cape +1",			waist="Mrc.Cpt. Belt",			legs="Savage Loincloth",		feet=""
    },	-- ^ Cure Power. Skill is not as effective as Raw MND. Account for Emn-. (A lot of Emn-.)
	HealingAoE = {
        head="Crow Beret",				neck="Justice Badge",			ear1="Geist Earring",			ear2="",
		body="Crow Jupon",				hands="Savage Gauntlets",		ring1="Vilma's Ring",  			ring2="Saintly Ring",
		back="White Cape +1",			waist="Mrc.Cpt. Belt",			legs="Savage Loincloth",		feet=""
    },	-- Prioritize Emn-, as AoE's will generate a LOT of hate. Recommend reading up in the discord.
	HealingSkill = {
	
    },	-- ^ Cursna set. Skill+, Skill+, and more Skill+. Haste/Recast where you can't.

--{(Support Skill Sets>--
	Enhancing = {
        head="Healer's Cap",			neck="Enhancing Torque",   		ear1="Geist Earring",    		ear2="",
        body="",    					hands="Savage Gauntlets",   	ring1="Vilma's Ring",   		ring2="Saintly Ring",
        back="White Cape +1",    		waist="",   					legs="Savage Loincloth",    	feet=""
    },	-- Skill+ > MND+, MP+ so you don't sink your cap.
	Stoneskin = {	-- Isolated set including specific SIRD pieces to prevent interuption of the cast.	
        head="Healer's Cap",    		neck="Stone Gorget",   			ear1="Geist Earring",    		ear2="",
        body="",				    	hands="Savage Gauntlets",   	ring1="Vilma's Ring",   		ring2="Saintly Ring",
        back="White Cape +1",   		waist="Mrc.Cpt. Belt",   		legs="Savage Loincloth",    	feet="Healer's Duckbills"
	},
	Regeneration = {
	
	},	-- Fun fact, Regens are not Healing Spells. They're Enhancing. Place pieces that directly enhance Regen Potency/Duration here. They'll be used accordingly.
	BarPlus = {
	
	},	-- ^ Put the pieces that Enhance Elemental Barspells here, they will be applied over the Enhancing Skill + pieces.
	
--{(Control Skill Sets>--
	MaxMND = {															range="",						ammo="",
        head="Healer's Cap",    		neck="Justice Badge",    		ear1="Geist Earring", 			ear2="",
        body="",				    	hands="Savage Gauntlets",   	ring1="Saintly Ring",   		ring2="Saintly Ring",
        back="White Cape +1",    		waist="Mrc.Cpt. Belt",   		legs="Savage Loincloth",		feet=""
	},
	MaxINT = {															range="",						ammo="Morion Tathlum",
        head="",				    	neck="",						ear1="Morion Earring",			ear2="Morion Earring",
        body="",    					hands="",   					ring1="Eremite's Ring",   		ring2="Eremite's Ring",
        back="Black Cape +1",    		waist="Mrc.Cpt. Belt",   		legs="",    					feet="Healer's Duckbills"
	},	
	Enfeebling = {
		neck="Enfeebling Torque",
		-- Skill++. Overlaps the below, only skill+.
	},
	Elemental = {
		-- Any Elemental Skill+ pieces.
		ear2="Moldavite Earring",
	},
	Dark = {
		-- Stun will never happen, but throw your Skill+ here anyway.
	},		
	Divine = {															range="",						ammo="",
        head="Healer's Cap",    		neck="Justice Badge",			ear1="Geist Earring",    		ear2="Moldavite Earring",
        body="Crow Jupon",    			hands="Savage Gauntlets",		ring1="Saintly Ring",   		ring2="Saintly Ring",
        back="White Cape +1",    		waist="Mrc.Cpt. Belt",   		legs="Healer's Pantaloons",		feet="Savage Gaiters"	
	},	-- If I don't need my sunglasses at night to watch it go off, it's not bright enough. (' ' )

--{(Miscellaneous Useful Sets. Can be generally left alone.>--
	StealthCast = {
		--Hands = 'Dream Mittens +1',
		--Feet = 'Dream Boots +1',
		--Back = 'Skulker\'s Cape', 
	},
	UggPendant = {
		--Neck = 'Uggalepih Pendant',
	},
}

local ElementalStaff = {	-- Includes NQ lines for toggling as needed, because I ain't rich like that.
    --['Fire'] = 'Vulcan\'s Staff',
    ['Fire'] = 'Fire Staff',
	--['Earth'] = 'Terra\'s Staff',
	['Earth'] = 'Earth Staff',
    --['Water'] = 'Neptune\'s Staff',
	['Water'] = 'Water Staff',
    --['Wind'] = 'Auster\'s Staff',
	['Wind'] = 'Wind Staff',
    --['Ice'] = 'Aquilo\'s Staff',
	['Ice'] = 'Ice Staff',
    --['Thunder'] = 'Jupiter\'s Staff',
	['Thunder'] = 'Thunder Staff',
    --['Light'] = 'Apollo\'s Staff',
	['Light'] = 'Light Staff',
    --['Dark'] = 'Pluto\'s Staff'
	['Dark'] = 'Dark Staff'
};

local ElementalObi = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin Obi'
};

local DayElementTable = {
    ['Firesday'] = 'Fire',
    ['Earthsday'] = 'Earth',
    ['Watersday'] = 'Water',
    ['Windsday'] = 'Wind',
    ['Iceday'] = 'Ice',
    ['Lightningday'] = 'Thunder',
    ['Lightsday'] = 'Light',
    ['Darksday'] = 'Dark'
};

function ObiCheck(spell)
    local element = spell.Element;
    local zone = gData.GetEnvironment();
    
    local badEle = {
        ['Fire'] = 'Water',
        ['Earth'] = 'Wind',
        ['Water'] = 'Thunder',
        ['Wind'] = 'Ice',
        ['Ice'] = 'Fire',
        ['Thunder'] = 'Earth',
        ['Light'] = 'Dark',
        ['Dark'] = 'Light'
    };
    
    local weight = 0;
    
    --Day Comparison
    if (DayElementTable[zone.Day] == element) then
        weight = weight + 1;
    elseif (DayElementTable[zone.Day] == badEle[element]) then
        weight = weight - 1;
    end
    
    --Weather Comparison
    if string.find(zone.Weather, element) then
        if string.find(zone.Weather, 'x2') then
            weight = weight + 2;
        else
            weight = weight + 1;
        end
    elseif string.find(zone.Weather, badEle[element]) then
        if string.find(zone.Weather, 'x2') then
            weight = weight - 2;
        else
            weight = weight - 1;
        end
    end    
    
    return weight;
end

profile.OnLoad = function()
    gSettings.AllowAddSet = false;	-- Put your own in it, do not risk a string fail.	
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad7 /lac fwd Idle_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad8 /lac fwd Engaged_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad9 /lac fwd Weapon_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad6 /lac fwd TP_Cycle');
	gFunc.Message(' Bell-stick WHEN?! ');
end

profile.OnUnload = function()
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad7');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad8');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad9');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad6');
	gFunc.Message(' "Hope you\'re keeping well, friend." ');
end

profile.HandleCommand = function(args)
	-- Keybind: F9
	if (args[1] == 'Idle_Cycle') then
		Settings.Idle = Settings.Idle + 1;
		if (Settings.Idle > #Idle) then
			Settings.Idle = 1;
		end
		gFunc.Message('Idle Set: ' .. Idle[Settings.Idle]);
	end
	-- Keybind: F10
	if (args[1] == 'Weapon_Cycle') then
		Settings.Weapon = Settings.Weapon  + 1;
		if (Settings.Weapon > #Weapon) then
			Settings.Weapon = 1;
		end
		gFunc.Message('Weapon Set: ' .. Weapon[Settings.Weapon]);
	end
	-- Keybind: F11
	if (args[1] == 'Engaged_Cycle') then
		Settings.Melee = Settings.Melee  + 1;
		if (Settings.Melee > #Melee) then
			Settings.Melee = 1;
		end
		gFunc.Message('Engaged Set: ' .. Melee[Settings.Melee]);
	end 	
	-- Keybind: F12
	if (args[1] == 'TP_Cycle') then
		Settings.TPLock = Settings.TPLock + 1;
		if (Settings.TPLock > #TPLock) then
			Settings.TPLock = 1;
		end
		gFunc.Message('TP Lock Threshold: ' .. TPLock[Settings.TPLock]);	
	end
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	
	if (player.Status == 'Engaged') then
		gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon]);
		if (player.SubJob == 'DNC') or (player.SubJob == 'NIN') then
			gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon] .. '_DW');
			gFunc.EquipSet(sets.DW);
		end
		if (player.MP >= Overflow[Settings.Overflow]) then
			gFunc.EquipSet(sets.MPOverflow);
		else
			gFunc.EquipSet('Melee_' .. Melee[Settings.Melee])
		end	
	elseif (player.Status =='Resting') then
		gFunc.EquipSet(sets.hMP);
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.EquipSet(sets.Weapon_Rest);
		end
		if (player.MP >= Overflow[Settings.Overflow]) then
			gFunc.EquipSet(sets.MPOverflow);
		end
	else
		if (player.MP >= Overflow[Settings.Overflow]) then
			gFunc.EquipSet(sets.MPOverflow);
		else
			gFunc.EquipSet('Idle_' .. Idle[Settings.Idle]);
			gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon]);
			if (player.SubJob == 'DNC') or (player.SubJob == 'NIN') then
				gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon] .. '_DW');
			end
		end
	end
end

profile.HandlePrecast = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	
	if (player.MP >= Overflow[Settings.Overflow]) then
		return	-- If MP is overthreshold, keep that MP by not messing with the gear. Does not involve weapons.
	else
		gFunc.EquipSet(sets.MPOverflow);	-- MP conservation attempts.
		gFunc.EquipSet(sets.Recast);
		gFunc.EquipSet(sets.FastCast);
	end
	if (CureSingle:contains(action.Name)) or (CureParty:contains(action.Name)) then
        gFunc.EquipSet('CureCasting');
    end    
end

profile.HandleMidcast = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	local environ = gData.GetEnvironment();

-- MP Conservation Check.
	if (player.MP >= Overflow[Settings.Overflow]) then
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.Equip('main', ElementalStaff[action.Element]);
		end
		return	-- If MP is over threshold, keep that MP by not messing with the gear.
	end
-- Enfeebling Magic.
	if (action.Skill == 'Enfeebling Magic') then
        if (MndDebuffs:contains(action.Name)) then
			gFunc.EquipSet(sets.MaxMND);	-- MND+.
			gFunc.EquipSet(sets.Enfeebling);-- Skill+.
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
        end
        if	(IntDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.MaxINT);	-- INT+.
			gFunc.EquipSet(sets.Enfeebling);-- Skill+.
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
        end
	end
-- Enhancing. 
	if (action.Skill == 'Enhancing Magic') then
		-- Specific isolations.
		if (action.Name == 'Stoneskin') or (action.Name == 'Aquaveil') or (action.Name == 'Blink') then
			gFunc.EquipSet(sets.Stoneskin);	-- Skill+, Mind+ to 'cap', then Spell Interuption Down where you can.
		elseif (action.Name == 'Sneak') or (action.Name == 'Invisible') then
			gFunc.EquipSet(sets.StealthCast);
		-- General sets.
		elseif string.contains(action.Name, 'Regen') then 
			gFunc.EquipSet(sets.Recast);	-- Faster Recasts? <Yes, please.>
			gFunc.EquipSet(sets.Regeneration);	-- Worth. Every. Penny.
		elseif (Barspells:contains(action.Name)) then
			gFunc.EquipSet(sets.Enhancing);	-- First skill++...
			gFunc.EquipSet(sets.BarPlus);	-- Then overlap with Elemental Resistance Augments.
		elseif (EnhancingEffect:contains(action.Name)) then
			gFunc.EquipSet(sets.Enhancing);	-- All the other barspells, and various scaling buffs.
		else
			gFunc.EquipSet(sets.Recast);	-- Haste catches on this one.
		end
	end
-- Healing Logic.
	if (action.Skill == 'Healing Magic') then
		if (CureSingle:contains(action.Name)) then
			gFunc.EquipSet(sets.Healing);
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
		elseif (CureParty:contains(action.Name)) then
			gFunc.EquipSet(sets.HealingAoE);
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
		elseif (action.Name == 'Cursna') then
			gFunc.EquipSet(sets.Recast);		-- Anti-Recast-Suck.
			gFunc.EquipSet(sets.HealingSkill);	-- Skill+ for better Doom'na.
		else 
			gFunc.EquipSet(sets.Recast);		-- Just make the recast not suck. Erase, Debuff'na, etc.
		end
	end
-- "Wretched and Divine"... and other Miscellaneous Skills.
	if (action.Skill == 'Divine Magic') then
		gFunc.EquipSet(sets.Divine);
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.Equip('main', ElementalStaff[action.Element]);
		end
		if (gData.GetAction().MppAftercast <= 50) then
			gFunc.EquipSet(sets.UggPendant);
		end
	end
	if (action.Skill == 'Elemental Magic') then
		gFunc.EquipSet(sets.MaxINT);	-- INT+.
		gFunc.EquipSet(sets.Elemental);	-- Skill+.
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.Equip('main', ElementalStaff[action.Element]);
		end
		if (gData.GetAction().MppAftercast <= 50) then
			gFunc.EquipSet(sets.UggPendant);
		end
	end
	if (action.Skill == 'Dark Magic') then
		gFunc.EquipSet(sets.MaxINT);	-- INT+.
		gFunc.EquipSet(sets.Dark);		-- Skill+.
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.Equip('main', ElementalStaff[action.Element]);
		end	
	end	
-- Shadows Overwrite.
	if (action.Name == 'Utsusemi: Ichi' or action.Name == 'Utsusemi: Ni') then
		gFunc.EquipSet(sets.Recast);
	end
-- Catch all ObiCheck().
	if (action.Skill == 'Healing Magic') or (action.Skill == 'Divine Magic') or 
		(action.Skill == 'Elemental Magic') or (action.Skill == 'Enfeebling Magic') or (action.Skill == 'Dark Magic') then
		if ObiCheck(action) >= 1 then
			gFunc.Equip('waist', ElementalObi[action.Element]);
		end
	end	
end

profile.HandleWeaponskill = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	--local environ = gData.GetEnvironment(); -- Return once Obi's are mine.
	
	if (wsSTR:contains(action.name)) then
        gFunc.EquipSet(sets.Strength);
	elseif (wsMND:contains(action.name)) then
        gFunc.EquipSet(sets.Mind);
	elseif (wsMAG:contains(action.name)) then
        gFunc.EquipSet(sets.Magic);
	end 
end

profile.HandleAbility = function()
	--local action = gData.GetAction();
	--local player = gData.GetPlayer();	
	-- Nothing of relevance in this era. You may functionally ignore this until WoTG, unless you start using Provoke.	
end
profile.HandlePreshot = function()
end
profile.HandleMidshot = function()
end
profile.HandleItem = function()
end
profile.Sets = sets;
return profile;