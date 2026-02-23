function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Proc')
	state.CastingMode:options('Normal','Resistant','Proc','SIRD')
    state.IdleMode:options('Normal','PDT','MDT','MEVA','Aminon')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.BuffWeaponsMode = M{'Always','Never'}
	state.AutoBuffMode = M{['description'] = 'Auto Buff Mode','Off','Auto','AutoMelee','AutoMage'}
	state.Weapons:options('None','Naegling','Maxentius','Crocea','EnspellOnly','DualWeapons','DualWeaponsAcc','DualMaxentius','DualCrocea','DualMaxentiusAcc','DualEnspellOnly','BowMacc')
	state.WeaponSets:options('Default','Dual','Dynamis')

	weapon_sets = {
		['Default'] = {'None','Naegling','Maxentius','Crocea','EnspellOnly',"BowMacc"},
		['Dual'] = {'DualWeapons','DualWeaponsAcc','DualMaxentius','DualCrocea','DualMaxentiusAcc','DualEnspellOnly'},
		['Dynamis'] = {'DualCroceaSavageBlade','DualCrocea'},
	}

	default_weapons = 'Naegling'
	default_dual_weapons = 'DualWeapons'

	autows_list =  {['Naegling']='Savage Blade',['Maxentius']='Black Halo',['Crocea']='Sanguine Blade',['Tauret']='Aeolian Edge',['DualWeapons']='Savage Blade',['DualWeaponsAcc']='Savage Blade',
					['DualMaxentius']='Black Halo',['DualMaxentiusAcc']='Black Halo',['DualEvisceration']='Evisceration',['DualCrocea']='Sanguine Blade',['DualClubs']='Black Halo',
					['DualAeolian']='Aeolian Edge',['DualPrime']='Exenterator',['DualCroceaSavageBlade']="Savage Blade",['CroceaDaybreak']="Seraph Blade",["DualTauretCrocea"]="Aeolian Edge"}
	trust_list = {"Joachim","Ulmia","Qultada","Yoran-Oran (UC)","Selh'teus"}
	
------------------------------------------------------------------
-- Reusable gear table
------------------------------------------------------------------
-- Artifact Armor (AF)
------------------------------------------------------------------
	gear.artifact_head = {head="Atrophy Chapeau +3"}
	gear.artifact_body = {body="Atrophy Tabard +3"}	
	gear.artifact_hands = {hands="Atrophy Gloves +3"}
	gear.artifact_legs = {legs="Atrophy Tights +3"}
	gear.artifact_feet = {name=""}	
------------------------------------------------------------------
-- Relic Armor 
------------------------------------------------------------------
	gear.relic_head = {name="Viti. Chapeau +2"}
	gear.relic_body = {name="Viti. Tabard +2"}	
	gear.relic_hands = {name="Viti. Gloves +2"}
	gear.relic_legs = {name=""}
	gear.relic_feet = {name="Vitiation Boots +2"}
------------------------------------------------------------------
-- empyrean Armor
------------------------------------------------------------------
	gear.empyrean_head = {name="Leth. Chappel +1"}
	gear.empyrean_body = {name="Lethargy Sayon +1"}	
	gear.empyrean_hands = {name="Leth. Ganth. +2"}
	gear.empyrean_legs = {name="Leth. Fuseau +2"}
	gear.empyrean_feet = {name="Leth. Houseaux +2"}
------------------------------------------------------------------
-- JSE Capes
------------------------------------------------------------------
	gear.stp_jse_back = {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.int_jse_back = {name="Sucellos's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}}
	gear.mnd_jse_back = {name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.enmity_jse_back = {name="Sucellos's Cape",augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','Enmity-10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = {name="Sucellos's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}	
	
		-- Additional local binds
	send_command('bind @` gs c cycle ElementalMode')
	send_command('bind ^` gs c scholar dark')
	send_command('bind !` gs c scholar light')
	send_command('bind !backspace input /ja "Composure" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind @backspace input /ja "Spontaneity" <t>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling",sub="Sacro Bulwark",range=empty}
	sets.weapons.Crocea = {main="Crocea Mors",sub="Sacro Bulwark",range=empty}
	sets.weapons.Maxentius = {main="Maxentius",sub="Sacro Bulwark",range=empty}
	sets.weapons.DualWeapons = {main="Naegling",sub="Thibron",range=empty}
	sets.weapons.DualWeaponsAcc = {main="Naegling",sub="Gleti's Knife",range=empty}
	-- sets.weapons.DualPrime = {main="Mpu Gandring",sub="Gleti's Knife",range=empty}
	sets.weapons.DualEvisceration = {}
	sets.weapons.DualCrocea = {main="Crocea Mors",sub="Daybreak",range=empty}
	sets.weapons.EnspellOnly = {main="Esikuva",sub="Sacro Bulwark"}
	sets.weapons.DualEnspellOnly = {main="Esikuva",sub="Infiltrator"}
	sets.weapons.BowMacc = {range="Ullr",ammo=empty}
	sets.weapons.DualMaxentius = {main="Maxentius",sub="Thibron",range=empty}
	sets.weapons.DualMaxentiusAcc = {main="Maxentius",sub="Gleti's Knife",range=empty}
	
	--Temporary Weapon Sets for Dynamis RP
	sets.weapons.DualCroceaSavageBlade = {main="Crocea Mors",sub="Thibron"}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body=gear.relic_body}
	
	-- Steps (Pure Acc)
    sets.precast.Step = {}

	-- Violent Flourish (Macc & Acc)
    sets.precast.JA['Violent Flourish'] = {}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	sets.precast.FC = {range=empty,ammo="Impatiens",
		head=gear.artifact_head,ear1="Loquac. Earring",ear2="Malignance Earring",
		body=gear.relic_body,hands="Leyline Gloves",
		back="Perimede Cape",waist="Witful Belt",feet=gear.carmine_feet_path_d}
		
	sets.precast.FC.DT = {main="Sakpata's Sword",sub="Sacro Bulwark",ammo="Impatiens",
		head=gear.artifact_head,neck="Loricate Torque +1",ear1="Loquac. Earring",ear2="Malignance Earring",
		body=gear.relic_body,hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.FullFC = {ammo="Impatiens",
		head=gear.artifact_head,ear1="Malignance Earring",ear2="Leth. Earring +1",
		body=gear.relic_body,ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Aya. Cosciales +2",feet=gear.carmine_feet_path_d}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Sacro Bulwark"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {range=empty,ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Malignance Gloves",ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet=gear.empyrean_feet}
		
	sets.precast.WS.Proc = 	{range=empty,ammo="Hasty Pinion +1",
		head=gear.relic_head,neck="Combatant's Torque",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Vitiation tabard +2",hands=gear.artifact_hands,ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.wsd_jse_back,waist="Prosilio Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2 "}
		
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = {range=empty,ammo="Regal Gem",
		head=gear.relic_head,neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Vitiation tabard +2",hands="Viti. Gloves +2",ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.mnd_jse_back,waist="Sailfi Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.precast.WS['Chant Du Cygne'] = {range=empty,ammo="Regal Gem",
		head=gear.relic_head,neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Vitiation tabard +2",hands="Viti. Gloves +2",ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.mnd_jse_back,waist="Sailfi Belt +1",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = {range=empty,ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Dls. Torque +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Malignance Gloves",ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet=gear.empyrean_feet}
		
	sets.precast.WS['Black Halo'] = {range=empty,ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Dls. Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Malignance Gloves",ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet=gear.empyrean_feet}
		
	sets.precast.WS['Sanguine Blade'] = {range=empty,ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Archon Ring",
		back=gear.int_jse_back,waist="Refoccilation Stone",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.precast.WS['Seraph Blade'] = {range=empty,ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Archon Ring",
		back=gear.int_jse_back,waist="Refoccilation Stone",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.precast.WS['Shining Strike'] = sets.precast.WS['Seraph Blade'] 
	sets.precast.WS['Flash Nova'] = sets.precast.WS['Seraph Blade'] 
		
	sets.precast.WS['Aeolian Edge'] = {range=empty,ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
		body="Amalric Doublet +1",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Archon Ring",
		back=gear.int_jse_back,waist="Refoccilation Stone",legs="Amalric Slops +1",feet="Amalric Nails +1"}

	sets.precast.WS['Knights of Round'] = {range=empty,ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Malignance Gloves",ring1="Rufescent Ring",ring2="Karieyh Ring",
		back=gear.wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet=gear.empyrean_feet}
		
	sets.precast.WS['Red Lotus Blade'] = sets.precast.WS['Aeolian Edge']

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear2="Brutal Earring"}
	sets.AccMaxTP = {ear2="Telos Earring"}
	sets.MagicalMaxTP = {ear2="Friomisi Earring"}
	
	-- Midcast Sets

	-- Gear that converts elemental damage done to recover MP.	
--	sets.midcast.FastRecast = {main="Sakpata's Sword",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
--		head="Atrophy Chapeau +3",neck="Loricate Torque +1",ear1="Malignance Earring",ear2="Leth. Earring +1",
--		body="Viti. Tabard +3",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Freke Ring",
--		back=gear.mnd_enfeebling_jse_back,waist="Emphatikos Rope",legs="Bunzi's Pants",feet="Bunzi's Sabots"}

    sets.midcast.Cure = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1", -- Daybreak
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Beatific earring",ear2="Roundel Earring", -- Meili Earring / Mendicant's earring
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Menelaus's Ring",ring2="Stikini Ring +1 ",
        back=gear.enmity_jse_back,waist="Luminary Sash",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",range=empty,ammo="Regal Gem",
        head="Vanya Hood",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Bunzi's Robe",hands="Gende. Gages +1",ring1="Sirona's Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Atrophy Tights +3",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",range=empty,ammo="Hasty Pinion +1",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Beatific earring",ear2="Roundel Earring", -- Meili Earring / Mendicant's earring
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Menelaus's Ring",ring2="Stikini Ring +1 ",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
    sets.midcast.Cure.DT = {main="Daybreak",sub="Sacro Bulwark",range=empty,ammo="Staunch Tathlum +1",
        head="Kaykaus Mitra +1",neck="Loricate Torque +1",ear1="Beatific earring",ear2="Roundel Earring",
        body="Bunzi's Robe",hands="Kaykaus Cuffs +1",ring1="Defending Ring",ring2="Menelaus's Ring",
        back=gear.enmity_jse_back,waist="Luminary Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.midcast.Cursna = {main="Prelatic pole",sub="Curatio Grip",range=empty,ammo="Staunch Tathlum +1",
        head="Vanya Hood",neck="Debilis Medallion",ear1="Meili Earring",ear2="Beatific earring",
        body=gear.relic_body,hands="Kaykaus Cuffs +1",ring1="Menelaus's Ring",ring2="Haoma's Ring",
        back="Oretan. Cape +1",waist="Gishdubar Sash",legs=gear.artifact_legs,feet="Vanya Clogs"}

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
	sets.midcast['Enhancing Magic'] = {main="Colada",sub="Ammurapi Shield",range=empty,ammo="Staunch Tathlum +1",
		head=gear.carmine_head_path_d,neck="Dls. Torque +2",ear1="Andoaa Earring",ear2="Gifted Earring",
		body=gear.relic_body,hands="Viti. Gloves +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Ghostfyre cape",waist="Olympus Sash",legs=gear.artifact_legs,feet=gear.empyrean_feet}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.
	sets.buff.ComposureOther = {head=gear.empyrean_head,
		body=gear.empyrean_body,hands=gear.empyrean_hands,
		legs=gear.empyrean_legs,feet=gear.empyrean_feet}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.EnhancingSkill = {main="Pukulatmuj +1",head=gear.carmine_head_path_d,neck="Incanter's Torque",hands="Viti. Gloves +2",back="Ghostfyre Cape",waist="Olympus Sash",legs=gear.artifact_legs}
	sets.midcast.Refresh = {head="Amalric Coif +1",body=gear.artifact_body,legs=gear.empyrean_legs}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.BarStatus = {neck="Sroda Necklace"}
	sets.midcast.Temper = sets.EnhancingSkill
	sets.midcast.Temper.DW = set_combine(sets.midcast.Temper, {sub="Pukulatmuj"})
	sets.midcast.Enspell = sets.EnhancingSkill
	sets.midcast.Enspell.DW = set_combine(sets.midcast.Enspell, {sub="Pukulatmuj"})	
	sets.midcast.BoostStat = {hands=gear.relic_hands}
	sets.midcast.Stoneskin = {head="Umuthi Hat",neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.Phalanx = {main="Sakpata's Sword",neck="Incanter's Torque",ear2="Malignance Earring"}
	
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.Self_Phalanx = {main="Sakpata's Sword",head="Taeon Chapeau",body="Taeon Tabard",hands="Taeon Gloves",legs="Taeon Tights",feet="Taeon Boots",ammo="Staunch Tathlum +1"}
	sets.Self_Phalanx.DW = {main="Sakpata's Sword",sub="Egeking"}
	
	sets.midcast['Enfeebling Magic'] = {main="Maxentius",sub="Ammurapi Shield",range=empty,ammo="Regal Gem",
		head=gear.relic_head,neck="Dls. Torque +2",ear1="Snotra Earring",ear2="Malignance Earring",
		body=gear.empyrean_body,hands="Kaykaus Cuffs +1",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.mnd_jse_back,waist="Obstin. Sash",legs="Chironic Hose",feet=gear.relic_feet}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Maxentius",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head=gear.relic_head,neck="Dls. Torque +2",ear1="Snotra Earring",ear2="Malignance Earring",
		body=gear.empyrean_body,hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.mnd_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet=gear.relic_feet}
		
	sets.midcast['Enfeebling Magic'].DW = {main="Bunzi's Rod",sub="Maxentius"}
		
	sets.midcast.Sleep = set_combine(sets.midcast.DurationOnlyEnfeebling,{back=gear.int_jse_back, waist="Acuity Belt +1"})
		
	sets.midcast.Bind = set_combine(sets.midcast.DurationOnlyEnfeebling,{back=gear.int_jse_back, waist="Acuity Belt +1"})
	sets.midcast.Break = set_combine(sets.midcast.DurationOnlyEnfeebling,{back=gear.int_jse_back, waist="Acuity Belt +1"})
	sets.midcast['Dia III'] = sets.midcast.Sleep
	sets.midcast['Bio III'] = sets.midcast.Sleep
	sets.midcast.Inundation = sets.midcast.Sleep
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {legs=gear.merlinic_treasure_legs,feet=gear.chironic_treasure_feet})
	sets.midcast.Dia = set_combine(sets.midcast.Sleep, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.Sleep, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.Sleep, sets.TreasureHunter)
		
	sets.midcast.Sleep.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{back=gear.int_jse_back, waist="Acuity Belt +1"})
		
	sets.midcast.Bind.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{back=gear.int_jse_back, waist="Acuity Belt +1"})
	sets.midcast.Break.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant,{back=gear.int_jse_back, waist="Acuity Belt +1"})
	
	sets.midcast.Sleep.DW = {main="Bunzi's Rod",sub="Maxentius"}
	sets.midcast.Bind.DW = sets.midcast.Sleep.DW
	sets.midcast.Break.DW = sets.midcast.Sleep.DW

	sets.midcast.Dispel = sets.midcast['Enfeebling Magic'].Resistant
		
	sets.midcast.Dispel.DW = {main="Bunzi's Rod",sub="Maxentius"}
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
	sets.midcast.Dispelga.DW = {main="Daybreak",sub="Bunzi's Rod"}
	
	sets.midcast.Frazzle = sets.midcast['Enfeebling Magic'].Resistant
		
	sets.midcast.Distract = sets.midcast.Frazzle
		
	sets.midcast.Frazzle.Resistant = sets.midcast['Enfeebling Magic'].Resistant {range="Ullr",ammo=empty}
		
	sets.midcast.Distract.Resistant = sets.midcast.Frazzle.Resistant
		
	sets.midcast['Frazzle II'] = sets.midcast.Frazzle.Resistant
	sets.midcast.Frazzle.DW = {main="Bunzi's Rod",sub="Daybreak"}
	sets.midcast.Distract.DW = sets.midcast.Frazzle.DW
	
	sets.midcast.Addle = sets.midcast['Enfeebling Magic'].Resistant
		
	sets.midcast.Paralyze = sets.midcast.Addle
	sets.midcast.Slow = sets.midcast.Addle
	
	sets.midcast.Addle.Resistant = sets.midcast['Enfeebling Magic'].Resistant {main="Daybreak",sub="Ammurapi Shield"}
		
	sets.midcast.Paralyze.Resistant = sets.midcast.Addle.Resistant
	sets.midcast.Slow.Resistant = sets.midcast.Addle.Resistant
	
	sets.midcast.Addle.DW = {main="Bunzi's Rod",sub="Daybreak"}
	sets.midcast.Paralyze.DW = sets.midcast.Addle.DW
	sets.midcast.Slow.DW = sets.midcast.Addle.DW
	
	sets.midcast.Gravity = sets.midcast['Enfeebling Magic'].Resistant
		
	sets.midcast.Gravity.Resistant = sets.midcast['Enfeebling Magic'].Resistant
		
	sets.midcast.Gravity.DW = {main="Bunzi's Rod",sub="Maxentius"}
	
	sets.midcast.Poison = sets.midcast.Gravity
	sets.midcast.Poison.Resistant = sets.midcast.Gravity.Resistant
	sets.midcast.Poison.DW = sets.midcast.Gravity.DW
	
	sets.midcast.Blind = sets.midcast.Gravity
	sets.midcast.Blind.Resistant = sets.midcast.Gravity.Resistant
	sets.midcast.Blind.DW = sets.midcast.Gravity.DW
	
	sets.midcast.Silence = sets.midcast['Enfeebling Magic'].Resistant {main="Daybreak",sub="Ammurapi Shield",range="Ullr",ammo=empty}
		
	sets.midcast.Silence.Resistant = sets.midcast['Enfeebling Magic'].Resistant {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=empty}
		
	sets.midcast.Silence.DW = {main="Bunzi's Rod",sub="Daybreak"}
	
	--After Bunzi's is augmented it will probably win on low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",range=empty,ammo="Pemphredo Tathlum",
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring", -- Baetyl Pendant
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring", -- Freke Ring
        back=gear.int_jse_back,waist="Sacro Cord",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
	sets.midcast['Elemental Magic'].DT = {main="Bunzi's Rod",sub="Culminus",ammo="Staunch Tathlum +1",
		head="Amalric Coif +1",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Malignance Earring", 
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
		back=gear.nuke_jse_back,waist="Sacro Cord",legs="Bunzi's Pants",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=empty,
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring", -- Freke Ring
        back=gear.int_jse_back,waist="Sacro Cord",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,range=empty,ammo="Impatiens",
        head=gear.empyrean_head,neck="Dls. Torque +2",ear1="Malignance Earring",ear2="Loquac. Earring",
        body=gear.empyrean_body,hands=gear.empyrean_hands,ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.enmity_jse_back,waist="Flume Belt +1",legs=gear.empyrean_legs,feet=gear.empyrean_feet}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
		
	-- Gear that Recovers MP when nuking.
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",neck="Mizu. Kubikazari",hands="Bunzi's Gloves",ring1="Mujin Band"}
	sets.midcast['Elemental Magic'].DW = {main="Bunzi's Rod",sub="Daybreak"}
		
	sets.midcast.Impact = {main="Maxentius",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head=empty,neck="Dls. Torque +2",ear1="Snotra Earring",ear2="Malignance Earring", -- Snotra Earring Malignance Earring
		body="Twilight Cloak",hands="Kaykaus Cuffs +1",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.int_jse_back,waist="Acuity Belt +1 ",legs="Chironic Hose",feet=gear.relic_feet}

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring", -- Regal Earring Snotra Earring Malignance Earring
		body=gear.artifact_body,hands=gear.empyrean_hands,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.int_jse_back,waist="Luminary Sash",legs="Chironic Hose",feet="Amalric Nails +1"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",range="Ullr",ammo=empty,
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.artifact_body,hands=gear.empyrean_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.int_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet="Amalric Nails +1"}

	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Absorb-TP'] = sets.midcast['Dark Magic']
		
	sets.midcast['Absorb-TP'].Resistant = sets.midcast['Dark Magic']
		
	sets.midcast.Stun = {main="Maxentius",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head=gear.artifact_head,neck="Dls. Torque +2",ear1="Snotra Earring",ear2="Malignance Earring", -- Regal Earring Snotra Earring Malignance Earring
		body="Zendik Robe",hands=gear.empyrean_hands,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.int_jse_back,waist="Sailfi Belt +1",legs="Chironic Hose",feet="Amalric Nails +1"}
		
	sets.midcast.Stun.Resistant = {main="Maxentius",sub="Ammurapi Shield",range="Ullr",ammo=empty,
		head=gear.artifact_head,neck="Dls. Torque +2",ear1="Snotra Earring",ear2="Malignance Earring", -- Regal Earring Snotra Earring Malignance Earring
		body=gear.artifact_body,hands=gear.empyrean_hands,ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.int_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet="Amalric Nails +1"}
		
	sets.midcast.Stun.DW = {main="Bunzi's Rod",sub="Maxentius"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Ganth. +3"}
	
	sets.HPDown = {}
		
    sets.HPCure = {main="Bunzi's Rod",sub="Sors Shield",range=empty,ammo="Hasty Pinion +1",
        head="Gende. Caubeen +1",neck="Unmoving Collar +1",ear1="Gifted Earring",ear2="Mendi. Earring",
        body=gear.relic_body,hands="Kaykaus Cuffs",ring1="Gelatinous Ring +1",ring2="Meridian Ring",
        back="Ortania's cape +1",waist="Luminary Sash",legs=gear.carmine_legs_path_d,feet="Kaykaus Boots"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",range=empty,ammo="Impatiens",
		head=gear.relic_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Lengo Pants",feet=gear.chironic_refresh_feet}

	-- Idle sets
	sets.idle = {main="Colada",sub="Sacro Bulwark",range=empty,ammo="Homiliary",
		head=gear.relic_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Shamash Robe",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.PDT = {main="Sakpata's Sword",sub="Sacro Bulwark",range=empty,ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Patricus Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.MDT = {main="Daybreak",sub="Sacro Bulwark",range=empty,ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Carrier's Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
	sets.idle.MEVA = {main="Daybreak",sub="Sacro Bulwark",range=empty,ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Patricus Ring",
		back=gear.enmity_jse_back,waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.Aminon = {main="Daybreak",sub="Sacro Bulwark",range=empty,ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Null Shawl",waist="Null Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
	
	-- Defense sets
	sets.defense.PDT = {range=empty,ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Patricus Ring",
		back=gear.enmity_jse_back,waist="Flume Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {range=empty,ammo="Staunch Tathlum +1",
		head="Bunzi's Hat",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Bunzi's Robe",hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Carrier's Sash",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
		
    sets.defense.MEVA = {range=empty,ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Patricus Ring",
		back=gear.enmity_jse_back,waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.Kiting = {legs=gear.carmine_legs_path_d}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {ammo="Ginsen",
		head=gear.taeon_head_tp,neck="Anu Torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Kentarch Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.Acc = {
		head="Malignance Chapeau",neck="Anu Torque",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Carmine Greaves +1"}	

	sets.engaged.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Patricus Ring",
		back="Moonlight Cape",waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Battlecast Gaiters"}
		
	sets.engaged.Acc.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Patricus Ring",
		back="Moonlight Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Battlecast Gaiters"}
		
	sets.engaged.DW = {ammo="Ginsen",
		head=gear.taeon_head_tp,neck="Anu Torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Combatant's Torque",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.stp_jse_back,waist="Olseni Belt",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DW.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
		back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Acc.DT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Eabani Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Ilabrat Ring",
		back="Moonlight Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.EnspellOnly = {
		head="Aya. Zucchetto +2",neck="Dls. Torque +2",ear1="Eabani Earring",ear2="Digni. Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Metamor. Ring +1",ring2="Ramuh Ring +1",
		back="Ghostfyre Cape",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.engaged.EnspellOnly.Acc = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Dls. Torque +2",ear1="Eabani Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Ghostfyre Cape",waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}		

	sets.engaged.DualEnspellOnly = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Dls. Torque +2",ear1="Eabani Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Ghostfyre Cape",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
		
	sets.engaged.DualEnspellOnly.Acc = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Dls. Torque +2",ear1="Eabani Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back="Ghostfyre Cape",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Malignance Boots"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    set_macro_page(1, 12)
end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function user_job_lockstyle()
	if player.sub_job == 'SCH' then
		if state.Buff['Light Arts'] or state.Buff['Addendum: White'] then
			windower.chat.input('/lockstyleset 001')
		elseif state.Buff['Dark Arts'] or state.Buff['Addendum: Black'] then
			windower.chat.input('/lockstyleset 002')
		else
			windower.chat.input('/lockstyleset 004')
		end
	elseif player.sub_job == 'NIN' or player.sub_job == 'DNC' then
		windower.chat.input('/lockstyleset 020')
	end
end

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		{Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	},
	
	AutoMelee = {
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	When='Combat'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Combat'},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	When='Combat'},
		--{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	When='Combat'},
	},
	
	AutoMage = {
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	When='Always'},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	When='Always'},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	When='Always'},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		When='Always'},
		{Name='Blink',			Buff='Blink',			SpellID=53,		When='Always'},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		When='Always'},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		When='Always'},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		When='Always'},
	},
	
	Default = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Gain-MND',		Buff='MND Boost',		SpellID=491,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	FullMeleeBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		--{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		--{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		--{Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		--{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},		
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
	},

	Odin = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	HybridCleave = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx II',		Buff='Phalanx',			SpellID=107,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
}