function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.CastingMode:options('Normal','Resistant','AoE')
	state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Naegling','Aeneas','DualWeapons','DualNaegling','DualTauret','DualAeolian')

	------------------------------------------------------------------
	-- Artifact Armor (AF)
	------------------------------------------------------------------
	gear.artifact_head = {name="Brioso Roundlet +3"}
	gear.artifact_body = {name="Brioso Justaucorps +3"}	
	gear.artifact_hands = {name="Brioso Cuffs +3"}
	gear.artifact_legs = {name="Brioso Cannions +3"}
	gear.artifact_feet = {name="Brioso Slippers +3"}
	------------------------------------------------------------------
	-- Relic Armor 
	------------------------------------------------------------------
	gear.relic_body = {name="Bihu Justaucorps +1"}	
	gear.relic_legs = {name="Bihu Cannions +1"} -- +1 only
	gear.relic_feet = {name="Bihu Slippers +1"}
	------------------------------------------------------------------
	-- empyrean Armor
	------------------------------------------------------------------
	gear.empyrean_head = {name="Fili Calot +1"}
	gear.empyrean_body = {name="Fili Hongreline +1"}	
	gear.empyrean_hands = {name="Fili Manchettes +1"}
	gear.empyrean_legs = {name="Fili Rhingrave +1"}
	gear.empyrean_feet = {name=gear.empyrean_feet}
	------------------------------------------------------------------
	-- JSE Capes
	------------------------------------------------------------------	
	gear.idle_jse_back = {name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity-10','Damage taken-5%',}}
	gear.fc_jse_back = {name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	------------------------------------------------------------------
	-- Instruments
	------------------------------------------------------------------	
	gear.instrument_idle = { name="Linos", augments={'Mag. Evasion+15','"Regen"+2','HP+20',}}
	gear.instrument_quickmagic = { name="Linos", augments={'Occ. quickens spellcasting +4%',}}
	gear.instrument_fastcast = { name="Linos", augments={'"Fast Cast"+5',}}	
	gear.instrument_tp = { name="Linos", augments={'Accuracy+20','"Store TP"+4','Quadruple Attack +3',}}
	gear.instrument_ws = {  name="Linos", augments={'Accuracy+15 Attack+15','Weapon skill damage +3%','STR+8',}}
	gear.instrument_mab = {  name="Linos", augments={'Mag.Atk.Bns."+15','Weapon skill damage +3%','INT+8',}}

	info.ExtraSongInstrument = 'Blurred Harp +1'
	-- How many extra songs we can keep from Daurdabla/Terpander
	info.ExtraSongs = 1
	
	-- Set this to false if you don't want to use custom timers.
	state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !f7 gs c cycle CarnMode')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Naegling = {main="Naegling",sub="Genmei Shield"}

	sets.buff.Sublimation = {waist="Embla Sash"}
	sets.buff.DTSublimation = {waist="Embla Sash"}
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Marin Staff +1",sub="Clerisy Strap +1",range=gear.instrument_fastcast,
		head=gear.empyrean_head,neck="Voltsurge Torque",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Rahab Ring",
		back=gear.fc_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet=gear.relic_feet}
		
	sets.precast.FC.DT = {main="Marin Staff +1",sub="Clerisy Strap +1",range=gear.instrument_fastcast,
		head=gear.empyrean_head,neck="Voltsurge Torque",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Rahab Ring",
		back=gear.fc_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet=gear.relic_feet}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.BardSong = {main="Marin Staff +1",sub="Clerisy Strap +1",range="Blurred Harp +1",ammo="empty",
		head=gear.empyrean_head,neck="Aoidos' Matinee",ear1="Aoidos' Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Rahab Ring",
		back=gear.fc_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet=gear.relic_feet}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC.SongDebuff.Resistant = set_combine(sets.precast.FC.BardSong,{range="Blurred Harp +1"})
	sets.precast.FC.Lullaby = {range="Marsyas"}
	sets.precast.FC.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'] = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'] = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet=gear.relic_feet}
	sets.precast.JA.Troubadour = {body=gear.relic_body}
	sets.precast.JA['Soul Voice'] = {legs=gear.relic_legs}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Grunfeld Rope",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS.Acc = {ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS['Savage Blade'] = {ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Rufescent Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Sailfi Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Aurgelmir Orb +1",
		head="Cath Palug Crown",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
		body="Chironic Doublet",hands=gear.chironic_enfeeble_hands,ring1="Metamorph Ring +1",ring2="Shiva Ring +1",
		back=gear.melee_jse_back,waist="Refoccilation Stone",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Telos Earring"}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main="Marin Staff +1",sub="Clerisy Strap +1",range=gear.instrument_fastcast,
		head=gear.empyrean_head,neck="Voltsurge Torque",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Prolix Ring",ring2="Rahab Ring",
		back=gear.fc_jse_back,waist="Witful Belt",legs="Aya. Cosciales +2",feet=gear.relic_feet}
	
	-- Gear set rules for Dummy Songs
	sets.midcast['Fowl Aubade'] = {range=info.ExtraSongInstrument,neck="Loricate torque +1"}
	sets.midcast['Herb Pastoral'] = {range=info.ExtraSongInstrument,neck="Loricate torque +1"}
	sets.midcast['Shining Fantasia'] = {range=info.ExtraSongInstrument,neck="Loricate torque +1"}
	sets.midcast["Scop's Operetta"] = {range=info.ExtraSongInstrument,neck="Loricate torque +1"}
	sets.midcast['Warding Round'] = {range=info.ExtraSongInstrument,neck="Loricate torque +1"}
	
	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {}
	sets.midcast.Lullaby = {range="Marsyas"}
	sets.midcast.Lullaby.Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby'].Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'].AoE = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'] = {range="Marsyas"}
	sets.midcast['Horde Lullaby II'].Resistant = {range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'].AoE = {range="Blurred Harp +1"}
	sets.midcast.Madrigal = {range="Gjallarhorn",head=gear.empyrean_head}
	sets.midcast.Paeon = {}
	sets.midcast.March = {range="Gjallarhorn",hands=gear.empyrean_hands}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {range="Gjallarhorn",body=gear.empyrean_body}
	sets.midcast.Minne = {range="Gjallarhorn",}
	sets.midcast.Threnody = {range="Gjallarhorn",neck="Elite Royal Collar"}
	sets.midcast.Carol = {range="Gjallarhorn",}
	sets.midcast["Sentinel's Scherzo"] = {feet=gear.empyrean_feet}
	sets.midcast['Magic Finale'] = {range="Blurred Harp +1"}
	sets.midcast.Mazurka = {range="Marsyas"}
	
	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Kali",sub="Genmei Shield",range="Blurred Harp +1",ammo=empty,
		head=gear.empyrean_head,neck="Mnbw. Whistle +1",ear1="Darkside Earring",ear2="Loquac. Earring",
		body=gear.empyrean_body,hands=gear.empyrean_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.fc_jse_back,waist="Kobo Obi",legs="Inyanga Shalwar +2",feet=gear.artifact_feet}
		
	sets.midcast.SongEffect.DW = {main="Kali",sub="Kali"} --Only weapons in this set. This set is overlayed onto  SongEffect

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Kali",sub="Culminus",range="Marsyas",ammo=empty,
		head=gear.artifact_head,neck="Mnbw. Whistle +1",ear1="Hermetic Earring",ear2="Digni. Earring",
		body=gear.artifact_body,hands=gear.artifact_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.fc_jse_back,waist="Porous Rope",legs=gear.empyrean_legs,feet=gear.artifact_feet}
		
	sets.midcast.SongDebuff.DW = {main="Kali",sub="Kali"} --Only weapons in this set. This set is overlayed onto  SongDebuff

	-- For song debuffs (accuracy primary, duration secondary)
	sets.midcast.SongDebuff.Resistant = {main="Daybreak",sub="Ammurapi Shield",range="Blurred Harp +1",ammo=empty,
		head="Inyanga Tiara +2",neck="Mnbw. Whistle +1",ear1="Hermetic Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.fc_jse_back,waist="Acuity Belt +1",legs="Inyanga Shalwar +2",feet="Aya. Gambieras +2"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main="Marin Staff +1",sub="Clerisy Strap +1",range="Blurred Harp +1",ammo="empty",
		head=gear.empyrean_head,neck="Voltsurge Torque",ear1="Hermetic Earring",ear2="Digni. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Prolix Ring",ring2="Rahab Ring",
		back=gear.fc_jse_back,waist="Witful Belt",legs=gear.empyrean_feet,feet="Aya. Gambieras +2"}

	-- Cast spell with normal gear, except using Daurdabla instead
	sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Serenity",sub="Curatio Grip",range=gear.instrument_fastcast,
		head="Kaykaus Mitra",neck="Loricate Torque +1",ear1="Gifted Earring",ear2="Mendi. Earring",
		body="Kaykaus Bliaut",hands="Kaykaus Cuffs",ring1="Janniston Ring",ring2="Naji's Loop",
		back="Tempered Cape +1",waist="Plat. Mog. Belt",legs="Kaykaus Tights",feet="Kaykaus Boots"}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",range=gear.instrument_fastcast,
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.fc_jse_back,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
		
	sets.midcast['Elemental Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",
		head="C. Palug Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Chironic Doublet",hands="Volte Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Gyve Trousers",feet=gear.chironic_nuke_feet}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Umbra Strap",range=gear.instrument_idle,ammo=empty,
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Flashward Earring",ear2="Eabani Earring",
		body="Ayanmo Corazza +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.idle_jse_back,waist="Carrier's Sash",legs="Aya. Cosciales +2",feet=gear.relic_feet}
	
	sets.idle = {main="Sangoma",sub="Genmei Shield",range=gear.instrument_idle,ammo=empty,
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Flashward Earring",ear2="Eabani Earring",
		body="Ayanmo Corazza +2",hands="Inyan. Dastanas +2",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.idle_jse_back,waist="Carrier's Sash",legs="Aya. Cosciales +2",feet=gear.relic_feet}
		
	sets.idle.NoRefresh = {main="Daybreak",sub="Genmei Shield",range=gear.instrument_idle,ammo=empty,
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet=gear.empyrean_feet}

	sets.idle.DT = {main="Daybreak",sub="Genmei Shield",range=gear.instrument_idle,ammo=empty,
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Defense sets

	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back="Moonlight Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.Kiting = {feet=gear.empyrean_feet}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.DT = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Windbuffet Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.engaged.Acc = {main="Aeneas",sub="Genmei Shield",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Digni. Earring",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Battlecast Gaiters"}
	sets.engaged.DW.DT = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	sets.engaged.DW.Acc = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}
	sets.engaged.DW.Acc.DT = {main="Aeneas",sub="Blurred Knife +1",ammo="Aurgelmir Orb +1",
		head="Nyame Helm",neck="Combatant's Torque",ear1="Suppanomimi",ear2="Telos Earring",
		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Ilabrat Ring",
		back=gear.melee_jse_back,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 1)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 001')
end

autows_list = {['Naegling']='Savage Blade',['Aeneas']="Rudra's Storm",['DualWeapons']="Rudra's Storm",['DualNaegling']='Savage Blade',['DualTauret']='Evisceration',
	 ['DualAeolian']='Aeolian Edge'}
