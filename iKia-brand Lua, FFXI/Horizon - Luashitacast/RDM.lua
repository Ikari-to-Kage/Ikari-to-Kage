-----------------------------------------------------------
--{(Local Variables - These may expand and change.>--
-----------------------------------------------------------
local Idle = {
	-- Keybind: #7
	[1] = 'Frontline',		-- Defense/Movement/Regenerations.
	[2] = 'Backline',		-- MP.idle
	[3] = 'MaxDT',			-- Max.DT Hybridized. Replace .PDT and .MDT.
	--[4] = 'Sync',			-- Sync gear.
	
}
local Melee = {
	-- Keybind: #8
	[1] = 'Standard',		-- Haste > Acc.
	[2] = 'Accuracy',		-- Acc. > Haste
	[3] = 'MaxDT',			-- Stop. Trying. To. Eat. Me.
	--[4] = 'Sync',			-- Sync gear.
}
local Weapon = {
	-- Keybind: #9
	[1] = 'Swords',			-- Gimme your face.
	[2] = 'Daggers',		-- Gimme your MP.
	[3] = 'Clubs',			-- Gimme your bones.
	--[4] = 'Sync',			-- Gimme your face.
}
local Elemental = {
	-- Keybind: #4
	[1] = 'Potency', 		[2] = 'Accuracy',
}
local Enfeebles = {
	-- Keybind: #1
	[1] = 'Potency',	[2] = 'Accuracy',
}
local OutsideNation = {
	-- Keybind: #2
	[1] = 'Home',			[2] = 'Away',
}
local ConvertMP = {
	-- Keybind: #3
	[1] = 580,	-- Melee
	[2] = 710, 	-- Mage
	[3] = 999,	-- Off.
	-- Set this to 'base idle' MP, adapt for multiple subjobs.
}
local TPLock = {
	-- Keybind: #6
	[1] = 250, 	[2] = 500,	[3] = 990,
}
local Settings = {	
	-- Local defaults.
	Idle = 1,
	Melee = 1,
	Weapon = 1,
	Elemental = 1,
	Enfeebles = 1,
	OutsideNation = 1,
	ConvertMP = 1,
	TPLock = 1,
}

----------------------------------------
--{(Spell/Weaponskill Set Assignments>--
----------------------------------------
--{(Spell Group Maps, add more groups as needed.>--
local MndDebuffsAccuracy = T{ 'Silence' };
local MndDebuffsPotency = T{ 'Slow', 'Paralyze', 'Slow II', 'Paralyze II' };
local IntDebuffsAccuracy = T{ 'Sleep', 'Sleep II', 'Sleepga', 'Bind', 'Gravity', 'Dispel', 'Poison', 'Poison II' };
local IntDebuffsPotency = T{ 'Blind', 'Blind II' };
local ElementalDebuffs = T{ 'Burn', 'Choke', 'Shock', 'Rasp', 'Drown', 'Frost' };
local EnhancingEffect = T{ 'Phalanx', 'Phalanx II', 'Ice Spikes', 'Shock Spikes', 'Blaze Spikes', 
	'Baraero', 'Baraera', 'Barblizzard', 'Barblizzara', 'Barfire', 'Barfira', 'Barstone', 'Barstona', 'Barthunder', 'Barthundara', 'Barwater', 'Barwatera',
	'Barsleep', 'Barsleepra', 'Barpoison', 'Barpoisonra', 'Barparalyze', 'Barparalyzra', 'Barblind', 'Barblindra', 'Barsilence', 'Barsilencera', 'Barpetrify', 'Barvirus',
    'Enaero', 'Enblizzard', 'Enfire', 'Enstone', 'Enthunder', 'Enwater',};

--{(Weaponskill group maps, make sure everything is in the right place.>--
local wsSTR = T{"Fast Blade","Flat Blade","Circle Blade","Vorpal Blade",
	"Shadowstitch","Skullbreaker","True Strike","Heavy Swing",}
local wsDEX = T{"Wasp Sting","Viper Bite","Evisceration",}	
local wsMND = T{"Savage Blade","Death Blossom","Judgement",}	
local wsMAG = T{"Burning Blade","Red Lotus Blade","Shining Blade","Seraph Blade",
		"Gust Slash","Cyclone","Energy Drain","Energy Steal","Shining Strike","Seraph Strike",
		"Starburst","Earth Crusher","Rock Crusher",}

local profile = {};
-----------------------
--{(Gear Assignments>--
-----------------------
local sets = {
--{(Idle Sets>--
    Idle_Frontline = {													range="",						ammo="Phtm. Tathlum",
		head="",						neck="Justice Badge",			ear1="Geist Earring",			ear2="Morion Earring",
		body="Royal Cloak",				hands="Dst. Mittens +1",		ring1="Sattva Ring",			ring2="Vilma's Ring",
		back="Cheviot Cape",			waist="Penitent's Rope",		legs="Dst. Subligar +1",		feet="Warlock's Boots"
    },	-- Refresh/Regen > DT. Sprinkle MP as you find it.
    Idle_Backline = {													range="",						ammo="Phtm. Tathlum",
		head=none,						neck="Justice Badge",			ear1="Geist Earring",			ear2="Morion Earring",
		body="Royal Cloak",				hands="Duelist's Gloves",		ring1="Sattva Ring",			ring2="Vilma's Ring",
		back="Cheviot Cape",			waist="Penitent's Rope",		legs="Savage Loincloth",		feet="Warlock's Boots"
    },	-- Refresh/MP > DT. Max MP where functionally allowed/sane.
	Idle_MaxDT = {														range="",						ammo="Phtm. Tathlum",
        head="Darksteel Cap +1",    	neck="Justice Badge",    		ear1="Geist Earring",    		ear2="Morion Earring",
        body="Dst. Harness +1",			hands="Dst. Mittens +1",		ring1="Sattva Ring",    		ring2="Sapphire Ring",
        back="Cheviot Cape",    		waist="Warrior's Belt +1",		legs="Dst. Subligar +1",    	feet="Warlock's Boots"
    },	-- See XIAH set. DT > All, placeholder MND+ for Magic Defense.
	--{(Idle to be altered or toggled as needed for BCNMs.>--
    Idle_Sync = {														range="",						ammo="Morion Tathlum",
		head="Silver Hairpin",			neck="Justice Badge",			ear1="Geist Earring",			ear2="Morion Earring",
		body="Brigandine",				hands="Savage Gauntlets",		ring1="Vilma's Ring",			ring2="Ether Ring",
		back="White Cape +1",			waist="Mrc.Cpt. Belt",			legs="Savage Loincloth",		feet="Savage Gaiters"
    },	-- ^ Currently 50cap.

--{(Melee Sets>--
	-- Where Acc, Attack, or Haste can not be found, place DT pieces.
	Melee_Standard = {													range="",						ammo="Phtm. Tathlum",
		head="Walkure Mask",			neck="Peacock Amulet",			ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
		body="Scorpion Harness",		hands="Dusk Gloves",			ring1="Woodsman Ring",			ring2="Woodsman Ring",
		back="Amemet Mantle",			waist="Quick Belt",				legs="Dst. Subligar +1",		feet="Dusk Ledelsens"
	},	-- Att+, Haste+. (Assault Jerkin?)
	Melee_Accuracy = {													range="",						ammo="",
        head="Walkure Mask",			neck="Peacock Amulet",			ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
		body="Scorpion Harness",		hands="Dusk Gloves",			ring1="Woodsman Ring",			ring2="Woodsman Ring",
		back="Amemet Mantle",			waist="Life Belt",				legs="Dst. Subligar +1",		feet="Dusk Ledelsens"
	},	-- Acc+, Haste+. 
	Melee_MaxDT = {														range="",						ammo="",
        head="Darksteel Cap +1",		neck="Peacock Amulet",			ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
		body="Dst. Harness +1",			hands="Dusk Gloves",			ring1="Sattva Ring",			ring2="Woodsman Ring",
		back="Cheviot Cape",			waist="Quick Belt",				legs="Dst. Subligar +1",		feet="Dusk Ledelsens"
	},	-- Mirror the MaxDT Idle, allow for marginal amounts of Haste. (Hands/Shoes/Belt, as Hands/Shoes are high defense.)
	--{(Idle to be altered or toggled as needed for BCNMs.>--
	Melee_Sync = {														range="",						ammo="Morion Tathlum",
		head="Walkure Mask",			neck="Peacock Amulet",			ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
		body="Brigandine",				hands="Battle Gloves",			ring1="Woodsman Ring",			ring2="Woodsman Ring",
		back="White Cape +1",			waist="Quick Belt",				legs="Republic Cuisses",		feet="Republic Greaves"
	},	-- ^ Currently 50cap.

--{(Weapons for melee purposes.>--
	Weapon_Swords 	= {main="Joyeuse",	sub="Genbu's Shield",},
		Weapon_Swords_DW 	= {main="Martial Anelace",	sub="Joyeuse",},
	Weapon_Daggers 	= {main="Dagger of Trials",	sub="Genbu's Shield",},	-- Blau?
		Weapon_Daggers_DW 	= {main="Dagger of Trials",		sub="Joyeuse",},
	Weapon_Clubs 	= {main="Solid Wand",	sub="Genbu's Shield",},
		Weapon_Clubs_DW 	= {main="Solid Wand",		sub="Yew Wand +1",},
	-- Sync Nonsense.
	Weapon_Sync 	= {main="Fencing Degen",	sub="Viking Shield",},
		Weapon_Sync_DW 	= {main="Buzzard Tuck",		sub="Hornetneedle",},
--{(Isolated Weapons for mage purposes.>--
	Weapon_Mage		= {main="Earth Staff",		sub="",							ammo="Phtm. Tathlum",},
	Weapon_Rest		= {main="Dark Staff",		sub="",							ammo="Phtm. Tathlum",},
	Weapon_WandINT	= {main="Solid Wand",		sub="Tortoise Shield",			ammo="Phtm. Tathlum",},
	Weapon_WandMND	= {main="Solid Wand",		sub="Tortoise Shield",			ammo="Phtm. Tathlum",},
	
--{(Weaponskill Sets>--
    Strength = {														range="",						ammo="",
        head="Mrc.Cpt. Headgear",    	neck="Spike Necklace",    		ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
        body="Savage Separates",    	hands="Bastokan Mittens",   	ring1="",   					ring2="",
        back="Amemet Mantle",   		waist="Sword Belt",  			legs="",    					feet="Savage Gaiters"
    },	-- Misc.
    Dexterity = {														range="",						ammo="",
        head="Mrc.Cpt. Headgear",    	neck="Spike Necklace",    		ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
        body="Brigandine",    			hands="Bastokan Mittens",   	ring1="Balance Ring",   		ring2="Balance Ring",
        back="Amemet Mantle",    		waist="Sword Belt",   			legs="",    					feet="Bounding Boots"
    },	-- Vorpal/Evis.
    Mind = {															range="",						ammo="",
        head="Walkure Mask",			neck="Justice Badge",    		ear1="Beetle Earring +1",		ear2="Beetle Earring +1",
        body="",    					hands="Savage Gauntlets",		ring1="Sapphire Ring",   		ring2="Sapphire Ring",
        back="Rainbow Cape",    		waist="Mrc.Cpt. Belt",   		legs="Warlock's Tights",    	feet="Warlock's Boots"
    },	-- Savage Blade.
    Magic = {															range="",						ammo="Morion Tathlum",
        head="Warlock's Chapeau",  		neck="Justice Badge",    		ear1="Morion Earring",			ear2="Morion Earring",
        body="",    					hands="Duelist's Gloves",		ring1="Diamond Ring",  			ring2="Diamond Ring",
        back="Rainbow Cape", 			waist="Mrc.Cpt. Belt",   		legs="",    					feet="Warlock's Boots"
    },	-- Cyclone.

--{(Precast Sets>--
    FastCast = {														range="",						ammo="",
        head="Warlock's Chapeau", 		neck="",    					ear1="",    					ear2="",
        body="Duelist's Tabard",		hands="",    					ring1="",    					ring2="",
        back="",    					waist="",    					legs="",    					feet=""
    },
	Haste = {															range="",						ammo="",
        head="",    					neck="",    					ear1="",    					ear2="",
        body="",						hands="Dusk Gloves", 			ring1="",    					ring2="",
        back="",    					waist="Quick Belt",    			legs="",    					feet="Dusk Ledelsens"
    },

--{(MP Conservation Sets>--
	Convert = {															range="",						ammo="Phtm. Tathlum",
	    head="Warlock's Chapeau", 		neck="",    					ear1="Geist Earring",    		ear2="Morion Earring",
        body="Duelist's Tabard",		hands="Duelist's Gloves",    	ring1="Astral Ring",			ring2="Ether Ring",
        back="Rainbow Cape",    		waist="",    					legs="Savage Loincloth",   		feet="Warlock's Boots"
	-- A set that focuses on matching MP to your HP, so you get as much MP as possible on return.
	-- THIS SET WILL BE USED AS A LOCK SET FOR SEVERAL CASTS, ADAPT ACCORDINGLY.
	},
	hMP = {																range="",						ammo="",
        head="Warlock's Chapeau",		neck="",    					ear1="",    					ear2="",
        body="Errant Hpl.",				hands="",    					ring1="",    					ring2="",
        back="",    					waist="",    					legs="",    					feet=""	
	-- tl,dr; dark staff and mp bits.
	},

--{(Support Skill Sets>--
    Enhancing = {
        head="Darksteel Cap +1",  		neck="Enhancing Torque",   		ear1="Geist Earring",   		ear2="",
        body="Warlock's Tabard",    	hands="Duelist's Gloves",   	ring1="Sapphire Ring",   		ring2="Sapphire Ring",
        back="Rainbow Cape",    		waist="",   					legs="Warlock's Tights",    	feet="Warlock's Boots"
    },
	Stoneskin = {	-- Isolated set including specific SIRD pieces to prevent interuption of the cast.	
        head="Darksteel Cap +1",		neck="Enhancing Torque",   		ear1="Geist Earring",    		ear2="",
        body="Warlock's Tabard",    	hands="Duelist's Gloves",   	ring1="Sapphire Ring",   		ring2="Sapphire Ring",
        back="Rainbow Cape",   			waist="",   					legs="Warlock's Tights",    	feet="Warlock's Boots"
	},	
	Healing = {
        head="Pumpkin Head",    		neck="Healing Torque",    		ear1="Geist Earring", 			ear2="",
        body="Duelist's Tabard",		hands="Wise Gloves",   			ring1="Sapphire Ring",   		ring2="Sapphire Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Warlock's Tights",    	feet="Warlock's Boots"
    },

--{(Control Skill Sets>--
	Enfeeb_MND_Potency = {												range="",						ammo="",
        head="",    					neck="Enfeebling Torque",  		ear1="Geist Earring",   		ear2="",
        body="Warlock's Tabard",    	hands="Wise Gloves",   			ring1="Sapphire Ring",   		ring2="Sapphire Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Errant Slops",	    	feet="Warlock's Boots"
	},
	Enfeeb_MND_Accuracy = {												range="",						ammo="",
        head="",    					neck="Enfeebling Torque",    	ear1="Geist Earring",    		ear2="",
        body="Warlock's Tabard",    	hands="Wise Gloves",   			ring1="Sapphire Ring",   		ring2="Sapphire Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Errant Slops",    		feet="Warlock's Boots"
	},
	Enfeeb_INT_Potency = {												range="",						ammo="Phtm. Tathlum",
        head="Warlock's Chapeau",    	neck="Enfeebling Torque",		ear1="Morion Earring",			ear2="Morion Earring",
        body="Warlock's Tabard",    	hands="Duelist's Gloves",   	ring1="Diamond Ring",  			ring2="Diamond Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Errant Slops",    		feet="Warlock's Boots"
	},
	Enfeeb_INT_Accuracy = {												range="",						ammo="Phtm. Tathlum",
        head="Warlock's Chapeau",    	neck="Enfeebling Torque",		ear1="Morion Earring",			ear2="Morion Earring",
        body="Warlock's Tabard",    	hands="Duelist's Gloves",   	ring1="Diamond Ring",  			ring2="Diamond Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Errant Slops",    		feet="Warlock's Boots"
	},
	
--{(Light/Dark>--	
	Divine = {															range="",						ammo="",
        head="",    					neck="",    					ear1="",    					ear2="",
        body="Errant Hpl.",				hands="",    					ring1="",    					ring2="",
        back="Rainbow Cape",    		waist="",    					legs="Errant Slops",    		feet=""
	},
	Dark = {															range="",						ammo="Phtm. Tathlum",
        head="Warlock's Chapeau",    	neck="Philomath Stole",			ear1="Morion Earring",			ear2="Morion Earring",
        body="",    					hands="Duelist's Gloves",   	ring1="Diamond Ring",  			ring2="Diamond Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Errant Slops",   			feet="Warlock's Boots"
	},
	Stun = {															range="",						ammo="",
        head="",    					neck="",    					ear1="",    					ear2="",
        body="",						hands="",    					ring1="",    					ring2="",
        back="",    					waist="",    					legs="",    					feet=""
	},
	
--{(Impersonating a BLM>--
	MaxINT = {															range="",						ammo="Phtm. Tathlum",
        head="Warlock's Chapeau",    	neck="Philomath Stole",			ear1="Morion Earring",			ear2="Morion Earring",
        body="Errant Hpl.",    			hands="Duelist's Gloves",   	ring1="Diamond Ring",  			ring2="Diamond Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Errant Slops",    		feet="Warlock's Boots"
	},
	Elemental_Potency = {												range="",						ammo="Phtm. Tathlum",
        head="Warlock's Chapeau",    	neck="Philomath Stole",			ear1="Morion Earring",			ear2="Morion Earring",
        body="Errant Hpl.",    			hands="Duelist's Gloves",   	ring1="Diamond Ring",  			ring2="Diamond Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",   		legs="Errant Slops",    		feet="Warlock's Boots"
	},
	Elemental_Accuracy = {												range="",						ammo="Phtm. Tathlum",
        head="Warlock's Chapeau",    	neck="Philomath Stole",			ear1="Morion Earring",			ear2="Morion Earring",
        body="Errant Hpl.",				hands="Duelist's Gloves",  		ring1="Diamond Ring",  			ring2="Diamond Ring",
        back="Rainbow Cape",    		waist="Penitent's Rope",    	legs="Errant Slops",    		feet="Warlock's Boots"
	},

--{(Miscellaneous Useful Sets.>--
	Hate = {															range="",						ammo="",
        head="Pumpkin Head II",    		neck="",    					ear1="",    					ear2="",
        body="",						hands="",    					ring1="",    					ring2="",
        back="",    					waist="",    					legs="",    					feet=""
	},
	DW = {
		waist="Sarashi",
		--insert various DW+ things here.
	},
	StealthCast = {
		Hands = 'Dream Mittens +1',
		Feet = 'Dream Boots +1',
		Back = 'Skulker\'s Cape', 
	},
	MstCstBracelets = {
		Hands = 'Mst.Cst. Bracelets',
	},
	UggPendant = {
		Neck = 'Uggalepih Pendant',
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
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad4 /lac fwd Elemental_Cycle');	
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad6 /lac fwd TP_Cycle');	
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad1 /lac fwd Enfeebles_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad2 /lac fwd Nation_Cycle');
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind Numpad3 /lac fwd Convert_Cycle');
	gFunc.Message(' Welcome back, Yhen. ');
end

profile.OnUnload = function()
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad7');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad8');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad9');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad4');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad6');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad1');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad2');
	AshitaCore:GetChatManager():QueueCommand(-1, '/unbind Numpad3');
	gFunc.Message(' See you next time. ');
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
	
	-- Keybind: #4
	if (args[1] == 'Elemental_Cycle') then
		Settings.Elemental = Settings.Elemental + 1;
		if (Settings.Elemental > #Elemental) then
			Settings.Elemental = 1;
		end
		gFunc.Message('Elemental Set: ' .. Elemental[Settings.Elemental]);	
	end
	-- Keybind: #6
	if (args[1] == 'TP_Cycle') then
		Settings.TPLock = Settings.TPLock + 1;
		if (Settings.TPLock > #TPLock) then
			Settings.TPLock = 1;
		end
		gFunc.Message('TP Lock Threshold: ' .. TPLock[Settings.TPLock]);	
	end
	
	-- Keybind: #1
	if (args[1] == 'Enfeebles_Cycle') then
		Settings.Enfeebles = Settings.Enfeebles + 1;
		if (Settings.Enfeebles > #Enfeebles) then
			Settings.Enfeebles = 1;
		end
		gFunc.Message('Enfeebling Set: ' .. Enfeebles[Settings.Enfeebles]);	
	end
	-- Keybind: #2
	if (args[1] == 'Nation_Cycle') then
		Settings.OutsideNation = Settings.OutsideNation + 1;
		if (Settings.OutsideNation > #OutsideNation) then
			Settings.OutsideNation = 1;
		end
		gFunc.Message('Home or Away? : ' .. OutsideNation[Settings.OutsideNation]);	
	end
	-- Keybind: #3
	if (args[1] == 'Convert_Cycle') then
		Settings.ConvertMP = Settings.ConvertMP + 1;
		if (Settings.ConvertMP > #ConvertMP) then
			Settings.ConvertMP = 1;
		end
		gFunc.Message('Convert MP Threshold: ' .. ConvertMP[Settings.ConvertMP]);	
	end
end

profile.HandleDefault = function()
	local player = gData.GetPlayer();
	
	if (player.Status == 'Engaged') then
		gFunc.EquipSet('Melee_' .. Melee[Settings.Melee]);
		gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon]);
		if (player.SubJob == 'DNC') or (player.SubJob == 'NIN') then
			gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon] .. '_DW');
			gFunc.EquipSet(sets.DW);
		end
	elseif (player.Status =='Resting') then
		gFunc.EquipSet(sets.hMP);
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.EquipSet(sets.Weapon_Rest);
		end
	else
		if (player.MP >= ConvertMP[Settings.ConvertMP]) then
			gFunc.EquipSet(sets.Convert);
		elseif ((Settings.Idle == 1) or (Settings.Idle == 4)) then --~= 2)) then --
			gFunc.EquipSet('Idle_' .. Idle[Settings.Idle]);
			gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon]);
			if (player.SubJob == 'DNC') or (player.SubJob == 'NIN') then
				gFunc.EquipSet('Weapon_' .. Weapon[Settings.Weapon] .. '_DW');
			end
		else
			gFunc.EquipSet('Idle_' .. Idle[Settings.Idle]);
			gFunc.EquipSet(sets.Weapon_Mage);
		end
	end
end

profile.HandleAbility = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	
	if(action.Name == 'Convert') then
		gFunc.EquipSet(sets.Convert);
	end
	if(action.Name == 'Provoke') then
		gFunc.EquipSet(sets.Hate);
	end	
end

profile.HandlePrecast = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	
	if (player.MP >= ConvertMP[Settings.ConvertMP]) then
	return
	else	-- Haste > Overlay Fastcast.
		gFunc.EquipSet(sets.Haste);
		gFunc.EquipSet(sets.FastCast);
	end
end

profile.HandleMidcast = function()
	local action = gData.GetAction();
	local player = gData.GetPlayer();
	local environ = gData.GetEnvironment();

-- Debuff checking.
	if (action.Skill == 'Enfeebling Magic') then
	-- Accuracy > Potency, these do not use wands at all.
        if (MndDebuffsAccuracy:contains(action.Name)) then
			gFunc.EquipSet(sets.Enfeeb_Mind_Accuracy);
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
			if (Settings.OutsideNation == 2) then
				gFunc.EquipSet(sets.MstCstBracelets);
			end
        end
        if	(IntDebuffsAccuracy:contains(action.Name)) then
            gFunc.EquipSet(sets.Enfeeb_INT_Accuracy);
				if (player.TP <= TPLock[Settings.TPLock]) then
					gFunc.Equip('main', ElementalStaff[action.Element]);
				end
			if (Settings.OutsideNation == 2) then
				gFunc.EquipSet(sets.MstCstBracelets);
			end
        end
		
	-- Potency is important.
        if	(MndDebuffsPotency:contains(action.Name)) then
			gFunc.EquipSet('Enfeeb_MND_' .. Enfeebles[Settings.Enfeebles]);
            if (Settings.Enfeebles == 2) then 
				if (player.TP <= TPLock[Settings.TPLock]) then
					gFunc.Equip('main', ElementalStaff[action.Element]);
				end
				if (Settings.OutsideNation == 2) then
					gFunc.EquipSet(sets.MstCstBracelets);
				end
            else
				if (Settings.Idle < 2) then -- Frontline.
					if (player.TP <= TPLock[Settings.TPLock]) then
						gFunc.EquipSet(sets.Weapon_WandMND);
					end
				else	-- Backline default.
					if (player.TP <= TPLock[Settings.TPLock]) then
						gFunc.Equip('main', ElementalStaff[action.Element]);
					end
				end
			end
        end
        if	(IntDebuffsPotency:contains(action.Name)) then
			gFunc.EquipSet('Enfeeb_INT_' .. Enfeebles[Settings.Enfeebles]);
            if (Settings.Enfeebles == 2) then 
				if (player.TP <= TPLock[Settings.TPLock]) then
					gFunc.Equip('main', ElementalStaff[action.Element]);
				end
				if (Settings.OutsideNation == 2) then
					gFunc.EquipSet(sets.MstCstBracelets);
				end
            else
				if (Settings.Idle < 2) then -- Frontline.
					if (player.TP <= TPLock[Settings.TPLock]) then
						gFunc.EquipSet(sets.Weapon_WandINT);
					end
				else	-- Backline default.
					if (player.TP <= TPLock[Settings.TPLock]) then
						gFunc.Equip('main', ElementalStaff[action.Element]);
					end
				end
			end
		end

-- Nuke checking. 
	elseif (action.Skill == 'Elemental Magic') then
		if (ElementalDebuffs:contains(action.Name)) then	
			gFunc.EquipSet(sets.MaxINT);
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
		else
			gFunc.EquipSet('Elemental_' .. Elemental[Settings.Elemental]);
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
			if (Settings.OutsideNation == 2) then
				gFunc.EquipSet(sets.MstCstBracelets);
			end
			if (gData.GetAction().MppAftercast <= 50) then
				gFunc.EquipSet(sets.UggPendant);
			end
		end

-- Banish.
	elseif (action.Skill == 'Divine Magic') then
		if (action.Name == 'Flash') then
			gFunc.EquipSet(sets.Hate);
			gFunc.EquipSet(sets.Haste);		
		else
			gFunc.EquipSet(sets.Divine);
		end
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.Equip('main', ElementalStaff[action.Element]);
		end	

-- Stun.
	elseif (action.Skill == 'Dark Magic') then
		if (action.Name == 'Stun') then
			gFunc.EquipSet(sets.Haste);	-- Recast helper.
			gFunc.EquipSet(sets.Stun);	-- Stick dammit.
		else
			gFunc.EquipSet(sets.Dark);
		end
		if (player.TP <= TPLock[Settings.TPLock]) then
			gFunc.Equip('main', ElementalStaff[action.Element]);
		end	
	
-- Cures.
	elseif (action.Skill == 'Healing Magic') then
		if (player.MP >= ConvertMP[Settings.ConvertMP]) then
			if (player.TP <= TPLock[Settings.TPLock]) then
				gFunc.Equip('main', ElementalStaff[action.Element]);
			end
		else
			if string.match(action.Name, 'Cur') then
				gFunc.EquipSet(sets.Healing);
				if (player.TP <= TPLock[Settings.TPLock]) then
					gFunc.Equip('main', ElementalStaff[action.Element]);
				end
			else
				gFunc.EquipSet(sets.Haste);
			end 
		end

-- Enhancing. 
	elseif (action.Skill == 'Enhancing Magic') then
		if (action.Name == 'Stoneskin') or (action.Name == 'Aquaveil') or (action.Name == 'Blink') then
			gFunc.EquipSet(sets.Stoneskin);	-- SIRD Non-interuption set with skill/MND.
		elseif (action.Name == 'Sneak') or (action.Name == 'Invisible')then
			gFunc.EquipSet(sets.StealthCast);
		elseif (EnhancingEffect:contains(action.Name)) then
			gFunc.EquipSet(sets.Enhancing);
		elseif (action.Name =='Refresh') or (action.Name =='Haste') then
			-- Dialation ring check goes here once/if relevant.
			gFunc.EquipSet(sets.Haste);
		else
			gFunc.EquipSet(sets.Haste);
		end
	
	elseif (action.Name == 'Utsusemi: Ichi' or action.Name == 'Utsusemi: Ni') then
		gFunc.EquipSet(sets.Haste);
		gFunc.EquipSet(sets.FastCast);
	end
	
	-- Catch all ObiCheck().
	if (action.Skill == 'Healing Magic') or (action.Skill == 'Elemental Magic') or (action.Skill == 'Enfeebling Magic') or (action.Skill == 'Dark Magic') then
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