-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
	state.RangedMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Match','Normal','Proc')
	state.IdleMode:options('Normal','Refresh')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Daggers')

	state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
	state.AmbushMode = M(false, 'Ambush Mode')

------------------------------------------------------------------
-- Reusable gear table
------------------------------------------------------------------
-- Artifact Armor (AF)
------------------------------------------------------------------
   gear.artifact.head  = {head="Pill. Bonnet +1"}
   gear.artifact.body  = {body="Pillager's Vest +1"}
   gear.artifact.hands = {hands="Pill. Armlets +1"}
   gear.artifact.legs  = {legs="Pill. Culottes +1"}
   gear.artifact.feet  = {feet="Pill. Poulaines +1"}

------------------------------------------------------------------
-- Relic Armor
------------------------------------------------------------------
   gear.relic_head  = {head=""}
   gear.relic_body  = {body=""}
   gear.relic_hands = {hands="Plun. Armlets +1"}
   gear.relic_legs  = {legs=""}
   gear.relic_feet  = {feet=""}

------------------------------------------------------------------
-- Empyrean Armor
------------------------------------------------------------------
   gear.empyrean.head  = {head=""}
   gear.empyrean.body  = {body=""}
   gear.empyrean.hands = {hands=""}
   gear.empyrean.legs  = {legs=""}
   gear.empyrean.feet  = {feet="Skulk. Poulaines +1"}

------------------------------------------------------------------
-- JSE Capes
------------------------------------------------------------------
	gear.stp_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = {name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}
------------------------------------------------------------------
-- JSE Earrings
------------------------------------------------------------------

------------------------------------------------------------------
-- Augmented gear
------------------------------------------------------------------

	-- Additional local binds
	send_command('bind ^` input /ja "Flee" <me>')
	send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
	send_command('bind !backspace input /ja "Hide" <me>')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Special sets (required by rules)
	--------------------------------------

	sets.TreasureHunter = {hands="Plunderer's Armlets +1",waist="Chaac Belt",feet="Skulk. Poulaines +1"}
	sets.Kiting = {}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {}
	
	sets.buff['Sneak Attack'] = {}
	sets.buff['Trick Attack'] = {"Pill. Armlets +1"}

	-- Extra Melee sets.  Apply these on top of melee sets.
	sets.Knockback = {}
	sets.Suppa = {}
	sets.DWEarrings = {}
	sets.DWMax = {}
	sets.Ambush = {}
	
	-- Weapons sets
	sets.weapons.Daggers = {main="Taming Sari",sub="Gleti's Knife"}
	
	sets.precast.Step = {ammo="Yamarang",
		head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Cessance Earring",ear2="Mache Earring +1",
		body="Pillager's Vest +1",hands="Adhemar Wristbands +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet="Plun. Poulaines +1"}
		
	sets.precast.JA['Violent Flourish'] = {ammo="Yamarang",
		head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Cessance Earring",ear2="Mache Earring +1",
		body="Pillager's Vest +1",hands="Adhemar Wristbands +1",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back=gear.stp_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet="Plun. Poulaines +1"}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Collaborator'] = {} -- "Skulker's Bonnet"
	sets.precast.JA['Accomplice'] = {} -- "Skulker's Bonnet"
	sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
	sets.precast.JA['Hide'] = {body="Pillager's Vest +1"}
	sets.precast.JA['Conspirator'] = {} -- body="Skulker's Vest"
	sets.precast.JA['Steal'] = {feet="Pillager's Poulaines +1"}
	sets.precast.JA['Mug'] = {}
	sets.precast.JA['Despoil'] = {} -- legs="Skulker's Culottes",feet="Skulk. Poulaines +1"
	sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
	sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}

	sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
	sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {ammo="Yamarang",
		head="Mummu Bonnet +2",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
		body="Passion Jacket",hands="Adhemar Wristbands +1",ring1="Defending Ring",ring2="Valseur's Ring",
		back="Moonbeam Cape",waist="Chaac Belt",legs="Samnuha Tights",feet="Plun. Poulaines +1"}

	sets.Self_Waltz = {ring1="Asklepian Ring"}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}


	-- Fast cast sets for spells
	sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})


	-- Ranged snapshot gear
	sets.precast.RA = {}


	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Seeth. Bomblet +1",
		head="Pill. Bonnet +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
		body=gear.herculean_ws_body,hands="Meg. Gloves +2",ring1="Ilabrat Ring",ring2="Karieyh Ring",
		back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"}
		
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Combatant's Torque",ear1="Mache Earring +1",ear2="Odr Earring",body="Meg. Cuirie +2",waist="Olseni Belt",legs="Meg. Chausses +2"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {})
	sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {body="Meg. Cuirie +2"})
	sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",legs="Pill. Culottes +1"})
	sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +1",legs="Pill. Culottes +1"})
	sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2",hands="Pill. Armlets +1",legs="Pill. Culottes +1"})
	
	sets.precast.WS["Evisceration"] = set_combine(sets.precast.WS, {ammo="Yetshila +1",head="Adhemar Bonnet +1",ear2="Odr Earring",neck="Fotia Gorget",hands="Mummu Wrists +2",ring1="Begrudging Ring",waist="Fotia Belt",legs="Pill. Culottes +1",feet="Mummu Gamash. +2"}) -- body="Abnoba Kaftan",
	sets.precast.WS["Evisceration"].Acc = set_combine(sets.precast.WS.Acc, {ammo="Yetshila +1",head="Mummu Bonnet +2",ring1="Begrudging Ring",neck="Fotia Gorget",hands="Mummu Wrists +2",waist="Fotia Belt",legs="Mummu Kecks +2",feet="Mummu Gamash. +2"}) -- body="Sayadio's Kaftan",
	sets.precast.WS["Evisceration"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",legs="Pill. Culottes +1"})
	sets.precast.WS["Evisceration"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",hands="Pill. Armlets +1",legs="Pill. Culottes +1"})
	sets.precast.WS["Evisceration"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",head="Adhemar Bonnet +1",body="Meg. Cuirie +2",hands="Pill. Armlets +1",legs="Pill. Culottes +1"})

	sets.precast.WS.Proc = {}

	sets.precast.WS['Last Stand'] = sets.precast.WS
	sets.precast.WS['Empyreal Arrow'] = sets.precast.WS['Last Stand']
		
	sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
		head=gear.herculean_fc_head,neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Dingir Ring",
		back=gear.wsd_jse_back,waist="Chaac Belt",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"}

	sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}

	--------------------------------------
	-- Midcast sets
	--------------------------------------

	sets.midcast.FastRecast = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring"}

	-- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

	-- Ranged gear

	sets.midcast.RA = {}

	sets.midcast.RA.Acc = {}

	--------------------------------------
	-- Idle/resting/defense sets
	--------------------------------------

	-- Resting sets
	sets.resting = {}

	sets.HPDown = {ammo="Staunch Tathlum +1",
		head="Pixie Hairpin +1",neck="Loricate Torque +1",ear1="Ethereal Earring",ear2="Genmei Earring",
		body=empty,hands=empty,ring1="Metamorph Ring +1",ring2="Mephitas's Ring +1",
		back="Null Shawl",waist="Cornelia's Belt",legs=empty,feet=empty}
	
	sets.HPMax = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Null Loop",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Kunaji Ring",ring2="K'ayres Ring",
		back="Engulfer Cape +1",waist="Plat. Mog Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

	sets.idle = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +1"}

	sets.idle.Refresh = {ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Sibyl Scarf",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Mekosu. Harness",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.Sphere = set_combine(sets.idle, {})

	sets.idle.Weak = set_combine(sets.idle, {})

	-- Defense sets

	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.stp_jse_back,waist="Flume Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +1"}

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Meg. Cuirie +2",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.stp_jse_back,waist="Engraved Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +1"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head=gear.herculean_fc_head,neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Vengeful Ring",ring2="Purity Ring",
		back=gear.stp_jse_back,waist="Engraved Belt",legs="Meg. Chausses +2",feet="Plun. Poulaines +1"}


	--------------------------------------
	-- Melee sets  
	--------------------------------------

	-- Normal melee group
	sets.engaged = {ammo="Ginsen",
		head="Adhemar Bonnet +1",neck="Erudit. Necklace",ear1="Dedition Earring",ear2="Sherida Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Petrov Ring",ring2="Epona's Ring",
		back=gear.stp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Plun. Poulaines +1"}
		
	sets.engaged.Acc = {ammo="Yamarang",
		head="Pill. Bonnet +1",neck="Combatant's Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Pillager's Vest +1",hands="Adhemar Wrist. +1",ring1="Ilabrat Ring",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Olseni Belt",legs="Pill. Culottes +1",feet=gear.herculean_ta_acc_feet}

	sets.engaged.DT = {ammo="Aurgelmir Orb +1",
		head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +1"}

	sets.engaged.Acc.DT = {ammo="Staunch Tathlum",
		head="Adhemar Bonnet +1",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Odr Earring",
		body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=gear.stp_jse_back,waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Plun. Poulaines +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(4, 1)
end

function user_job_lockstyle()
	windower.chat.input('/lockstyleset 002')
end

autows_list = {['Aeneas']="Rudra's Storm",['Aeolian']='Aeolian Edge',['Savage']='Savage Blade',['Throwing']="Rudra's Storm",['SwordThrowing']='Savage Blade',['Evisceration']='Evisceration',['ProcWeapons']='Wasp Sting',['Bow']='Empyreal Arrow'}