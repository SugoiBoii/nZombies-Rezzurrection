AddCSLuaFile()

ENT.Base = "nz_zombiebase_moo"
ENT.Type = "nextbot"
ENT.Category = "Brainz"
ENT.Author = "Lolle/Moo"
ENT.Spawnable = true

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EmergeSequenceIndex")
	self:NetworkVar("Bool", 1, "Decapitated")
	self:NetworkVar("Bool", 2, "Alive")
end


if CLIENT then return end -- Client doesn't really need anything beyond the basics

ENT.SpeedBasedSequences = true
ENT.IsMooZombie = true
ENT.RedEyes = true

ENT.Models = {
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_honorguard_a.mdl", Skin = 0, Bodygroups = {0,0}},
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_honorguard_b.mdl", Skin = 0, Bodygroups = {0,0}},
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_honorguard_c.mdl", Skin = 0, Bodygroups = {0,0}},
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_honorguard_d.mdl", Skin = 0, Bodygroups = {0,0}},
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_shirtless_a.mdl", Skin = 0, Bodygroups = {0,0}},
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_shirtless_b.mdl", Skin = 0, Bodygroups = {0,0}},
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_tanktop_a.mdl", Skin = 0, Bodygroups = {0,0}},
	{Model = "models/moo/_codz_ports/t9/moo_codz_t9_tanktop_b.mdl", Skin = 0, Bodygroups = {0,0}},
}

local spawnslow = {"nz_spawn_ground_ad_v2", "nz_spawn_ground_climbout_fast"}
local spawnfast = {"nz_spawn_ground_quickrise_v1", "nz_spawn_ground_quickrise_v2", "nz_spawn_ground_quickrise_v3"}

ENT.DeathSequences = {
	"nz_death_f_1",
	"nz_death_f_2",
	"nz_death_f_3",
	"nz_death_f_4",
	"nz_death_f_5",
	"nz_death_f_11",
	"nz_death_f_12",
}
ENT.ElectrocutionSequences = {
	"nz_death_elec_1",
	"nz_death_elec_2",
	"nz_death_elec_3",
	"nz_death_elec_4",
}

local AttackSequences = {
	{seq = "nz_attack_stand_ad_1", dmgtimes = {0.75, 1.25}},
	{seq = "nz_attack_stand_au_1", dmgtimes = {0.75, 1.25}},
}

local WalkAttackSequences = {
	{seq = "nz_walking_attack_v1", dmgtimes = {1.45}},
	{seq = "nz_walking_attack_v2", dmgtimes = {1.4}},
	{seq = "nz_walking_attack_v3", dmgtimes = {0.75}},
	{seq = "nz_walking_attack_v4", dmgtimes = {1.65}},
	{seq = "nz_walking_attack_v5", dmgtimes = {1.85}},
}

local RunAttackSequences = {
	{seq = "nz_running_attack_v1", dmgtimes = {0.75}},
	{seq = "nz_running_attack_v2", dmgtimes = {0.75}},
	{seq = "nz_running_attack_v3", dmgtimes = {0.70}},
	{seq = "nz_running_attack_v4", dmgtimes = {0.80}},
	{seq = "nz_running_attack_v5", dmgtimes = {0.75}},
}

local SprintAttackSequences = {
	{seq = "nz_sprinting_attack_v1", dmgtimes = {0.40}},
	{seq = "nz_sprinting_attack_v2", dmgtimes = {0.85}},
	{seq = "nz_sprinting_attack_v3", dmgtimes = {0.50}},
	{seq = "nz_sprinting_attack_v4", dmgtimes = {0.40}},
	{seq = "nz_sprinting_attack_v5", dmgtimes = {0.35}},
}

local SuperSprintAttackSequences = {
	{seq = "nz_supersprinting_attack_v1", dmgtimes = {0.40}},
	{seq = "nz_supersprinting_attack_v2", dmgtimes = {0.35}},
	{seq = "nz_supersprinting_attack_v3", dmgtimes = {0.45}},
	{seq = "nz_supersprinting_attack_v4", dmgtimes = {0.40}},
}

local JumpSequences = {
	{seq = "nz_barricade_trav_walk_1", speed = 25, time = 2.7},
	{seq = "nz_barricade_trav_walk_2", speed = 25, time = 2.7},
	{seq = "nz_barricade_trav_walk_3", speed = 15, time = 2},
	{seq = "nz_barricade_trav_walk_4", speed = 15, time = 2},
}
local RunJumpSequences = {
	{seq = "nz_barricade_run_1", speed = 35, time = 1},
}
local SprintJumpSequences = {
	{seq = "nz_barricade_sprint_1", speed = 50, time = 1},
	{seq = "nz_barricade_sprint_2", speed = 30, time = 1},
}

local walksounds = {
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_05.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_06.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_07.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_08.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_09.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_10.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_11.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_12.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_13.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_14.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_15.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_16.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_17.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_18.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_19.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_20.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_21.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_22.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_1/amb_23.mp3"),

	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_05.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_06.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_07.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_08.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_09.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_10.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_11.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_12.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_13.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_14.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_15.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_16.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_17.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_18.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_19.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_20.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_21.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_2/amb_22.mp3"),

	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_05.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_06.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_07.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_08.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/amb/series_3/amb_09.mp3"),
}

local runsounds = {
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_05.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_06.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_07.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_08.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_09.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_10.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_1/sprint_11.mp3"),

	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_05.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_06.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_07.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_08.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_09.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_10.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_2/sprint_11.mp3"),

	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_05.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_06.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_07.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_08.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_09.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_10.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/sprint/series_3/sprint_11.mp3"),
}

ENT.ActStages = {
	[1] = {
		act = ACT_WALK,
		minspeed = 0,
		attackanims = AttackSequences,
		barricadejumps = JumpSequences,
	},
	[2] = {
		act = ACT_WALK_ANGRY,
		minspeed = 50,
		attackanims = WalkAttackSequences,
		barricadejumps = JumpSequences,
	},
	[3] = {
		act = ACT_RUN,
		minspeed = 75,
		attackanims = RunAttackSequences,
		barricadejumps = RunJumpSequences,
	},
	[4] = {
		act = ACT_SPRINT,
		minspeed = 145,
		attackanims = SprintAttackSequences,
		barricadejumps = SprintJumpSequences,
	},
	[5] = {
		act = ACT_SUPERSPRINT,
		minspeed = 220,
		attackanims = SuperSprintAttackSequences,
		barricadejumps = SprintJumpSequences,
	},
}

ENT.SequenceTables = {
	{Threshold = 0, Sequences = {
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_ad5",
				"nz_walk_ad6",
				"nz_walk_au_goose",
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		},
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_au5",
				"nz_walk_au6",
				"nz_walk_au_goose", -- This is the goosestep walk aka marching anim that german soldier zombies use.
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		}
	}},
	{Threshold = 30, Sequences = {
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_ad1",
				"nz_walk_ad2",
				"nz_walk_ad3",
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		},
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_au1",
				"nz_walk_au2",
				"nz_walk_au3",
				"nz_walk_au13",
				"nz_walk_au15",
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		}
	}},
	{Threshold = 45, Sequences = {
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_ad19",
				"nz_walk_ad23",
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		},
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_au10",
				"nz_walk_au11",
				"nz_walk_au12",
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		}
	}},
	{Threshold = 55, Sequences = {
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_ad4",
				"nz_walk_ad7",
				"nz_walk_ad20",
				"nz_walk_ad21",
				"nz_walk_ad22",
				"nz_walk_ad24",
				"nz_walk_ad25",
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		},
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_walk_au4",
				"nz_walk_au7",
				"nz_walk_au8",
				"nz_walk_au20",
				"nz_walk_au21",
				"nz_walk_au23",
			},
			LowgMovementSequence = {
				"nz_walk_lowg_v1",
				"nz_walk_lowg_v2",
				"nz_walk_lowg_v3",
				"nz_walk_lowg_v4",
			},
			PassiveSounds = {walksounds},
		}
	}},
	{Threshold = 65, Sequences = {
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_run_ad8",
				"nz_run_ad11",
				"nz_walk_fast_ad1",
				"nz_walk_fast_ad2",
				"nz_walk_fast_ad3",
			},
			LowgMovementSequence = {
				"nz_run_lowg_v1",
				"nz_run_lowg_v2",
				"nz_run_lowg_v3",
				"nz_run_lowg_v4",
			},
			PassiveSounds = {walksounds},
		},
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_run_au5",
				"nz_walk_fast_au1",
				"nz_walk_fast_au2",
				"nz_walk_fast_au3",
			},
			LowgMovementSequence = {
				"nz_run_lowg_v1",
				"nz_run_lowg_v2",
				"nz_run_lowg_v3",
				"nz_run_lowg_v4",
			},
			PassiveSounds = {walksounds},
		}
	}},
	{Threshold = 85, Sequences = {
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_run_ad7",
				"nz_run_ad20",
				"nz_run_ad21",
				"nz_run_ad22",
				"nz_run_ad24",
			},
			LowgMovementSequence = {
				"nz_run_lowg_v1",
				"nz_run_lowg_v2",
				"nz_run_lowg_v3",
				"nz_run_lowg_v4",
			},
			PassiveSounds = {runsounds},
		},
		{
			SpawnSequence = {spawnslow},
			MovementSequence = {
				"nz_run_au20",
				"nz_run_au22",
			},
			LowgMovementSequence = {
				"nz_run_lowg_v1",
				"nz_run_lowg_v2",
				"nz_run_lowg_v3",
				"nz_run_lowg_v4",
			},
			PassiveSounds = {runsounds},
		}
	}},
	{Threshold = 110, Sequences = {
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_run_ad1",
				"nz_run_ad2",
				"nz_run_ad3",
				"nz_run_ad4",
				"nz_run_ad12",
				"nz_run_ad14",
				"nz_run_ad23",
			},
			LowgMovementSequence = {
				"nz_run_lowg_v1",
				"nz_run_lowg_v2",
				"nz_run_lowg_v3",
				"nz_run_lowg_v4",
			},
			PassiveSounds = {runsounds},
		},
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_run_au1",
				"nz_run_au2",
				"nz_run_au3",
				"nz_run_au4",
				"nz_run_au9",
				"nz_run_au11",
				"nz_run_au13",
				"nz_run_au21",
				"nz_run_au23",
				"nz_run_au24",
			},
			LowgMovementSequence = {
				"nz_run_lowg_v1",
				"nz_run_lowg_v2",
				"nz_run_lowg_v3",
				"nz_run_lowg_v4",
			},
			PassiveSounds = {runsounds},
		}
	}},
	{Threshold = 150, Sequences = {
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_sprint_ad1",
				"nz_sprint_ad2",
				--"nz_sprint_ad3",
				--"nz_sprint_ad4",
				"nz_sprint_ad5",
				"nz_sprint_ad21",
				"nz_sprint_ad22",
				"nz_sprint_ad23",
				"nz_sprint_ad24",
			},
			LowgMovementSequence = {
				"nz_sprint_lowg_v1",
				"nz_sprint_lowg_v2",
				"nz_sprint_lowg_v3",
				"nz_sprint_lowg_v4",
			},
			PassiveSounds = {runsounds},
		},
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_sprint_au1",
				"nz_sprint_au2",
				--"nz_sprint_au3",
				--"nz_sprint_au4",
				"nz_sprint_au20",
				"nz_sprint_au21",
				"nz_sprint_au22",
				"nz_sprint_au25",
			},
			LowgMovementSequence = {
				"nz_sprint_lowg_v1",
				"nz_sprint_lowg_v2",
				"nz_sprint_lowg_v3",
				"nz_sprint_lowg_v4",
			},
			PassiveSounds = {runsounds},
		}
	}},
	{Threshold = 195, Sequences = {
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_fast_sprint_v1",
				"nz_fast_sprint_v2",
			},
			LowgMovementSequence = {
				"nz_sprint_lowg_v1",
				"nz_sprint_lowg_v2",
				"nz_sprint_lowg_v3",
				"nz_sprint_lowg_v4",
			},
			PassiveSounds = {runsounds},
		},
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_fast_sprint_v3",
				"nz_fast_sprint_v4",
			},
			LowgMovementSequence = {
				"nz_sprint_lowg_v1",
				"nz_sprint_lowg_v2",
				"nz_sprint_lowg_v3",
				"nz_sprint_lowg_v4",
			},
			PassiveSounds = {runsounds},
		}
	}},
	{Threshold = 210, Sequences = {
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_supersprint_ad1",
				"nz_supersprint_ad2",
				"nz_supersprint_ad3",
				"nz_supersprint_ad4",
				"nz_supersprint_ad5",
				"nz_supersprint_ad6",
				"nz_supersprint_ad7",
				"nz_supersprint_ad8",
				"nz_supersprint_ad9",
				"nz_supersprint_ad10",
				"nz_supersprint_ad11",
				"nz_supersprint_ad12",
				"nz_supersprint_ad13",
			},
			LowgMovementSequence = {
				"nz_supersprint_lowg",
			},
			PassiveSounds = {runsounds},
		},
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_supersprint_au1",
				"nz_supersprint_au2",
				"nz_supersprint_au3",
				"nz_supersprint_au4",
				"nz_supersprint_au6",
				"nz_supersprint_au8",
				"nz_supersprint_au9",
				"nz_supersprint_au12",
				"nz_supersprint_au20",
				"nz_supersprint_au21",
				"nz_supersprint_au25",
			},
			LowgMovementSequence = {
				"nz_supersprint_lowg",
			},
			PassiveSounds = {runsounds},
		}
	}},
	{Threshold = 280, Sequences = {
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_crazysprint_v1",
				"nz_crazysprint_v2",
			},
			LowgMovementSequence = {
				"nz_supersprint_lowg",
			},
			PassiveSounds = {runsounds},
		},
		{
			SpawnSequence = {spawnfast},
			MovementSequence = {
				"nz_crazysprint_v1",
				"nz_crazysprint_v2",
			},
			LowgMovementSequence = {
				"nz_supersprint_lowg",
			},
			PassiveSounds = {runsounds},
		}
	}}
}

ENT.TauntSequences = {
	"nz_taunt_v1",
	"nz_taunt_v2",
	"nz_taunt_v3",
	"nz_taunt_v4",
	"nz_taunt_v5",
	"nz_taunt_v6",
	"nz_taunt_v7",
	"nz_taunt_v8",
	"nz_taunt_v9"
}
ENT.IdleSequence = "nz_idle_ad"
ENT.DanceSequence = "nz_goofyah_v"..math.random(1,6).."" -- Yes this plays... Where and how, I will not tell you!
ENT.AttackHitSounds = {
	"nz/zombies/attack/player_hit_0.wav",
	"nz/zombies/attack/player_hit_1.wav",
	"nz/zombies/attack/player_hit_2.wav",
	"nz/zombies/attack/player_hit_3.wav",
	"nz/zombies/attack/player_hit_4.wav",
	"nz/zombies/attack/player_hit_5.wav"
}

ENT.PainSounds = {
	"nz/zombies/death/nz_flesh_impact_1.wav",
	"nz/zombies/death/nz_flesh_impact_2.wav",
	"nz/zombies/death/nz_flesh_impact_3.wav",
	"nz/zombies/death/nz_flesh_impact_4.wav"
}

ENT.DeathSounds = {
	"nz_moo/zombies/vox/_2k20/death/death_00.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_01.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_02.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_03.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_04.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_05.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_06.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_07.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_08.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_09.mp3",
	"nz_moo/zombies/vox/_2k20/death/death_10.mp3"
}

ENT.ElecSounds = {
	"nz_moo/zombies/vox/_2k20/elec/series_1/elec_00.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_1/elec_01.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_1/elec_02.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_1/elec_03.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_1/elec_04.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_1/elec_05.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_1/elec_06.mp3",

	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_00.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_01.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_02.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_03.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_04.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_05.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_06.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_2/elec_07.mp3",

	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_00.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_01.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_02.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_03.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_04.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_05.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_06.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_07.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_08.mp3",
	"nz_moo/zombies/vox/_2k20/elec/series_3/elec_09.mp3",
}

ENT.NukeDeathSounds = {
	"nz_moo/zombies/vox/nuke_death/soul_00.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_01.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_02.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_03.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_04.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_05.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_06.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_07.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_08.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_09.mp3",
	"nz_moo/zombies/vox/nuke_death/soul_10.mp3"
}

ENT.AttackSounds = {
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_00.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_01.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_02.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_03.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_04.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_05.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_06.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_07.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_08.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_09.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_10.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_11.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_12.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_1/attack_13.mp3",

	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_00.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_01.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_02.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_03.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_04.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_05.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_06.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_07.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_08.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_09.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_10.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_11.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_12.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_13.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_14.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_15.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_16.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_17.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_2/attack_18.mp3",

	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_00.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_01.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_02.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_03.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_04.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_05.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_06.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_07.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_08.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_09.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_10.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_11.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_12.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_13.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_14.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_15.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_16.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_17.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_18.mp3",
	"nz_moo/zombies/vox/_2k20/attack/series_3/attack_19.mp3"
}

ENT.BehindSoundDistance = 200 -- When the zombie is within 200 units of a player, play these sounds instead
ENT.BehindSounds = {
	Sound("nz_moo/zombies/vox/_2k20/behind/series_1/behind_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_1/behind_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_1/behind_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_1/behind_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_1/behind_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_1/behind_05.mp3"),

	Sound("nz_moo/zombies/vox/_2k20/behind/series_2/behind_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_2/behind_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_2/behind_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_2/behind_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_2/behind_04.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_2/behind_05.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_2/behind_06.mp3"),
	
	Sound("nz_moo/zombies/vox/_2k20/behind/series_3/behind_00.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_3/behind_01.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_3/behind_02.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_3/behind_03.mp3"),
	Sound("nz_moo/zombies/vox/_2k20/behind/series_3/behind_04.mp3"),
}

function ENT:StatsInitialize()
	if SERVER then
	self:SetNoDraw(true) --This hides the brief "Default Pose" the zombie does before doing the spawn anim
		if nzRound:GetNumber() == -1 then
			self:SetRunSpeed( math.random(30, 300) )
			self:SetHealth( math.random(100, 1500) )
		else
			local speeds = nzRound:GetZombieSpeeds()
			if speeds then
				self:SetRunSpeed( nzMisc.WeightedRandom(speeds) )
			else
				self:SetRunSpeed( 100 )
			end
			self:SetHealth( nzRound:GetZombieHealth() or 75 )
		end

		--Preselect the emerge sequnces for clientside use
		self:SetBodygroup( 1 ,math.random(0,2))
		self:SetBodygroup( 2 , math.random(0,4))
	end
end

function ENT:SpecialInit()
	if CLIENT then
	end
end

function ENT:OnSpawn()
	if self:ZombieWaterLevel() >= 1 then
		ParticleEffect("water_splash_0"..math.random(1,3).."",self:GetPos(),self:GetAngles(),self)
		self:EmitSound("nz/zombies/spawn/zm_spawn_dirt"..math.random(2)..".wav")
	else
		ParticleEffect("bo3_zombie_spawn",self:GetPos(),self:GetAngles(),self)
		self:EmitSound("nz/zombies/spawn/zm_spawn_dirt"..math.random(2)..".wav")
	end


	self:SetSpecialAnimation(true)
	local seq = self:SelectSpawnSequence()
	if seq then
		self:SetNoDraw(false)
		self:PlaySequenceAndWait(seq)
		self:SetSpecialAnimation(false)
	end
end