function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.HybridMode:options('Normal', 'PDT')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Godhands','Pole','Barehanded')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None'}

    update_melee_groups()

------------------------------------------------------------------
-- Reusable gear table
------------------------------------------------------------------
-- Artifact Armor (AF)
------------------------------------------------------------------
   gear.artifact.head  = {head="Anchorite's Crown"}
   gear.artifact.body  = {body="Anch. Cyclas +2"}
   gear.artifact.hands = {hands="Anchorite's Gloves"}
   gear.artifact.legs  = {legs="Anch. Hose +3"}
   gear.artifact.feet  = {feet="Anch. Gaiters +3"}
------------------------------------------------------------------
-- Relic Armor
------------------------------------------------------------------
   gear.relic_head  = {head="Hes. Crown"}
   gear.relic_body  = {body="Hes. Cyclas"}
   gear.relic_hands = {hands="Hes. Gloves +3"}
   gear.relic_legs  = {legs="Hes. Hose +3"}
   gear.relic_feet  = {feet="Hes. Gaiters +3"}
------------------------------------------------------------------
-- Empyrean Armor
------------------------------------------------------------------
   gear.empyrean.head  = {head="Bhikku Crown +2"}
   gear.empyrean.body  = {body="Bhikku Cyclas +2"}
   gear.empyrean.hands = {hands="Bhikku Gloves +1"}
   gear.empyrean.legs  = {legs="Bhikku Hose +2"}
   gear.empyrean.feet  = {feet="Bhikku Gaiters +2"}
------------------------------------------------------------------
-- JSE Capes
------------------------------------------------------------------
   gear.tp_back     = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
   gear.tp_str_back = { name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
   gear.tp_back_alt = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','System: 1 ID: 640 Val: 4',}}
   gear.pdt_back    = { name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
   gear.vit_back    = { name="Segomo's Mantle", augments={'VIT+20','VIT+10',}}
   gear.fc_back     = { name="Segomo's Mantle", augments={'"Fast Cast"+10',}}
------------------------------------------------------------------
-- JSE Earrings
------------------------------------------------------------------

------------------------------------------------------------------
-- Augmented gear
------------------------------------------------------------------

	-- Additional local binds
	send_command('bind ^` input /ja "Boost" <me>')
	send_command('bind !` input /ja "Perfect Counter" <me>')
	send_command('bind ^backspace input /ja "Mantra" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs on use
	sets.precast.JA['Hundred Fists'] = {legs=gear.relic_legs}
	sets.precast.JA['Boost'] = {hands=gear.artifact.hands}
	sets.precast.JA['Boost'].OutOfCombat = {gear.artifact.hands}
	sets.precast.JA['Dodge'] = {feet=gear.artifact.feet}
	sets.precast.JA['Focus'] = {head=gear.artifact.head}
	sets.precast.JA['Counterstance'] = {gear.relic_feet}
	sets.precast.JA['Footwork'] = {}
	sets.precast.JA['Formless Strikes'] = {body=gear.relic_body}
	sets.precast.JA['Mantra'] = {feet=gear.relic_feet}

	sets.precast.JA['Chi Blast'] = {}
	
	sets.precast.JA['Chakra'] = {
	     neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
	     body=gear.artifact.body,hands=gear.relic_hands,ring1="Regal Ring",ring2="Gelatinous Ring +1",
	     back=gear.vit_back,legs="Nyame Flanchard",feet=gear.empyrean.feet}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}
		
	sets.precast.Flourish1 = {}


	-- Fast cast sets for spells
	
	sets.precast.FC = {}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})

       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Coiste Bodhar",
	     head="Mpaca's Cap",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Schere Earring",
	     body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
	     back=gear.tp_str_back,waist="Fotia Belt",legs="Mpaca's Hose",feet="Mpaca's Boots"}
	sets.precast.WSAcc = {ammo="Falcon Eye",neck="Combatant's Torque",ear1="Cessance Earring",ring2="Ramuh Ring +1",body="Malignance Tabard",waist="Olseni Belt",feet="Malignance Boots"}
	sets.precast.WS.Acc = set_combine(sets.precast.WS, sets.precast.WSAcc)

	-- Specific weaponskill sets.
	sets.precast.WS['Shell Crusher']   = set_combine(sets.precast.WS, {})
	sets.precast.WS['Raging Fists']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Howling Fist']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Asuran Fists']    = set_combine(sets.precast.WS, {})
	sets.precast.WS["Ascetic's Fury"]  = set_combine(sets.precast.WS, {})
	sets.precast.WS["Victory Smite"]   = set_combine(sets.precast.WS, {})
	sets.precast.WS['Shijin Spiral']   = set_combine(sets.precast.WS, {})
	sets.precast.WS['Dragon Kick']     = set_combine(sets.precast.WS, {})
	sets.precast.WS['Tornado Kick']    = set_combine(sets.precast.WS, {})
	sets.precast.WS['Spinning Attack'] = set_combine(sets.precast.WS, {})

	sets.precast.WS["Raging Fists"].Acc = set_combine(sets.precast.WS["Raging Fists"], sets.precast.WSAcc)
	sets.precast.WS["Howling Fist"].Acc = set_combine(sets.precast.WS["Howling Fist"], sets.precast.WSAcc)
	sets.precast.WS["Asuran Fists"].Acc = set_combine(sets.precast.WS["Asuran Fists"], sets.precast.WSAcc)
	sets.precast.WS["Ascetic's Fury"].Acc = set_combine(sets.precast.WS["Ascetic's Fury"], sets.precast.WSAcc, {})
	sets.precast.WS["Victory Smite"].Acc = set_combine(sets.precast.WS["Victory Smite"], sets.precast.WSAcc, {})
	sets.precast.WS["Shijin Spiral"].Acc = set_combine(sets.precast.WS["Shijin Spiral"], sets.precast.WSAcc)
	sets.precast.WS["Dragon Kick"].Acc = set_combine(sets.precast.WS["Dragon Kick"], sets.precast.WSAcc)
	sets.precast.WS["Tornado Kick"].Acc = set_combine(sets.precast.WS["Tornado Kick"], sets.precast.WSAcc)

	sets.precast.WS['Cataclysm'] = set_combine(sets.precast.WS, {})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}
	
	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})
		
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {body=gear.relic_body,ring2="Sheltered Ring"}
	

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
	     head="Mpaca's Cap",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Odnowa Earring +1",
	     body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Chirich Ring +1",ring2="Karieyh Ring",
	     back=gear.pdt_back,waist="Moonbow Belt +1",legs="Mpaca's Hose",feet="Mpaca's Boots"}

	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Warden's Ring",
		back=gear.pdt_back,waist="Moonbow Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Shadow Ring",
		back=gear.pdt_back,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Shadow Ring",
		back=gear.pdt_back,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee sets
	sets.engaged = {ammo="Coiste Bodhar",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},neck="Mnk. Nodowa +2",ear1="Sherida Earring",ear2="Telos Earring",
		body="Mpaca's Doublet",hands="Mpaca's Gloves",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=gear.pdt_back,waist="Moonbow Belt +1",legs="Mpaca's Hose",feet="Malignance Boots"}
	sets.engaged.Acc = {ammo="Coiste Bodhar",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},neck="Mnk. Nodowa +2",ear1="Sherida Earring",ear2="Telos Earring",
		body=gear.empyrean.body,hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Gere Ring",
		back=gear.tp_back,waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

		-- Defensive melee hybrid sets
	sets.engaged.PDT = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Acc.PDT = {ammo="Falcon Eye",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back="Moonlight Cape",waist="Olseni Belt",legs="Malignance Tights",feet="Malignance Boots"}

		-- Hundred Fists/Impetus melee set mods
	
	sets.engaged.HF = set_combine(sets.engaged, {})
	sets.engaged.Acc.HF = set_combine(sets.engaged.Acc, {})

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	sets.buff.Impetus = {body=gear.empyrean.body}
	sets.buff.Footwork = {}
	sets.buff.Boost = {} --waist="Ask Sash"
	
	sets.FootworkWS = {}
	sets.DayIdle = {}
	sets.NightIdle = {}
    sets.Knockback = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
	-- Weapons sets
	sets.weapons.Godhands = {main="Godhands"}
	sets.weapons.Barehanded = {main=empty}
	sets.weapons.Staff = {main="Malignance Pole",sub="Kupayoplp"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 2)
end