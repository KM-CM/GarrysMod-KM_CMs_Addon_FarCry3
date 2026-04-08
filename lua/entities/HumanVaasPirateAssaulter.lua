AddCSLuaFile()
DEFINE_BASECLASS "BaseActorPlayer"
	
scripted_ents.Register( ENT, "HumanVaasPirateAssaulter" )

list.Set( "NPC", "HumanVaasPirateAssaulter", {
	Name = "#HumanVaasPirateAssaulter",
	Class = "HumanVaasPirateAssaulter",
	Category = "Humans",
	Weapons = { "AKM" }
} )

// UNUSED
sound.Add {
	name = "VaasPirateAssaulterSearching",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/ICantBelieveILostHim_Motherfucker.wav"
	}
}

sound.Add {
	name = "VaasPirateAssaulterSpot",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/IFoundHim.wav",
		"VaasPirate/Assaulter/IFoundYou.wav",
		"VaasPirate/Assaulter/Gotchu.wav",
		"VaasPirate/Assaulter/GotchuFucker.wav",
		"VaasPirate/Assaulter/HahaIGotchu.wav",
		"VaasPirate/Assaulter/ISeeHimHesThere.wav",
		"VaasPirate/Assaulter/ISeeHimHesThere2.wav",
		"VaasPirate/Assaulter/HesRightHere.wav",
	}
}

sound.Add {
	name = "VaasPirateAssaulterStartle",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/DaaamnMothafuckah.wav",
		"VaasPirate/Assaulter/OhMyGod.wav",
		"VaasPirate/Assaulter/HolyShit.wav",
		"VaasPirate/Assaulter/Aah.wav",
		"VaasPirate/Assaulter/Aah2.wav",
		"VaasPirate/Assaulter/Oh.wav",
		"VaasPirate/Assaulter/HolyFuckingShit.wav",
		"VaasPirate/Assaulter/UhAhAhAh.wav",
		"VaasPirate/Assaulter/Hoh.wav",
		"VaasPirate/Assaulter/Fuck.wav", // F O C K
		"VaasPirate/Assaulter/Aha.wav",
		"VaasPirate/Assaulter/SonOfABitch.wav",
	}
}

// UNUSED
sound.Add {
	name = "VaasPirateAssaulterRunFire",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/RunFire.wav"
	}
}

sound.Add {
	name = "VaasPirateAssaulterAdvancing",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/ImMoving.wav",
		"VaasPirate/Assaulter/ImMoving2.wav",
		"VaasPirate/Assaulter/ImMoving3.wav",
		"VaasPirate/Assaulter/ImComingForYou.wav",
		"VaasPirate/Assaulter/ImComingForYou2.wav"
	}
}

sound.Add {
	name = "VaasPirateAssaulterSuppressed",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/ShitShit.wav",
		"VaasPirate/Assaulter/ShitShit2.wav",
		"VaasPirate/Assaulter/ShitShit3.wav",
		"VaasPirate/Assaulter/FuckFuckFuckFuckFuckFuuck.wav",
		"VaasPirate/Assaulter/Shiiiit.wav",
		"VaasPirate/Assaulter/Shiiit.wav",
		"VaasPirate/Assaulter/NoNoNo.wav",
		"VaasPirate/Assaulter/Shit.wav",
		"VaasPirate/Assaulter/Shit2.wav",
	}
}

sound.Add {
	name = "VaasPirateAssaulterPinned",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/ImPinnedDown.wav",
		"VaasPirate/Assaulter/ImPinnedDown2.wav",
		"VaasPirate/Assaulter/ImPinnedDown3.wav",
		"VaasPirate/Assaulter/ImPinnedDown4.wav",
		"VaasPirate/Assaulter/HelpImGettingHolesHere.wav",
		"VaasPirate/Assaulter/HelpImGettingHolesHere2.wav",
	}
}

sound.Add {
	name = "VaasPirateAssaulterAttackingTaunt",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/ImGonnaEatchuAlive.wav",
		"VaasPirate/Assaulter/ImGonnaEatchuAlive2.wav",
		"VaasPirate/Assaulter/ImGonnaEatchuAlive3.wav",
		"VaasPirate/Assaulter/ImGonnaEatchuAlive4.wav",
		"VaasPirate/Assaulter/ImNotScaredOfYou_Asshole.wav",
		"VaasPirate/Assaulter/ImNotScaredOfYouAsshole.wav",
		"VaasPirate/Assaulter/ImNotScaredOfYouAsshole2.wav",
		"VaasPirate/Assaulter/ImNotScaredOfYouAsshole3.wav",
		"VaasPirate/Assaulter/SuckOnSomeBullets_Bitch.wav",
		"VaasPirate/Assaulter/SuckOnSomeBullets_Bitch2.wav",
		"VaasPirate/Assaulter/SuckOnSomeBulletsBitch.wav",
		"VaasPirate/Assaulter/YoureDead.wav",
		"VaasPirate/Assaulter/YoureDead2.wav",
		"VaasPirate/Assaulter/YoureDead3.wav",
		"VaasPirate/Assaulter/YoureDeadNow.wav",
		"VaasPirate/Assaulter/YoureMine.wav",
		"VaasPirate/Assaulter/YoureMineNow.wav",
		"VaasPirate/Assaulter/IAintEvenStartedYet.wav",
		"VaasPirate/Assaulter/IAintEvenStartedYet2.wav",
		"VaasPirate/Assaulter/IAintEvenStartedYet3.wav",
		"VaasPirate/Assaulter/WatchMeTakeHimDown.wav"
	}
}

// UNUSED
sound.Add {
	name = "VaasPirateAssaulterEfficiencyTaunt",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/ManYouSuck.wav",
		"VaasPirate/Assaulter/StopMeMotherfuckerStopMe.wav",
		"VaasPirate/Assaulter/StopMeMotherfuckerStopMe2.wav",
	}
}

// UNUSED
sound.Add {
	name = "VaasPirateAssaulterCharge",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"VaasPirate/Assaulter/Chaarge.wav",
		"VaasPirate/Assaulter/Chyaaarge.wav",
		// Technically from the Shotgunner... I think. But who cares?
		"VaasPirate/Assaulter/ChaaargeHaaahahaha.wav",
		// Ditto
		"VaasPirate/Assaulter/ChaaargeOoohohohohoho.wav",
		// This isn't a "CHAAAAAARGEEEEEEEEE"... I'd say still counts lol
		"VaasPirate/Assaulter/ComeOnLetsGetHim.wav",
		// Also ditto (ditto ditto? xD)
		"VaasPirate/Assaulter/ComeOnLetsGetHim2.wav",
		// Ditto ditto ditto
		"VaasPirate/Assaulter/GetHimComeOn.wav",
	}
}

if !SERVER then return end

// Don't forget they're dumbasses
ENT.Moving_WEAPON_STANCE = WEAPON_STANCE_HIP

if !CLASS_VAAS_PIRATES then Add_NPC_Class "CLASS_VAAS_PIRATES" end
ENT.iDefaultClass = CLASS_VAAS_PIRATES

function ENT:DLG_Suppressed() self:EmitSound "VaasPirateAssaulterSuppressed" end
function ENT:DLG_Pinned() self:EmitSound "VaasPirateAssaulterPinned" end
function ENT:DLG_Advancing() self:EmitSound "VaasPirateAssaulterAdvancing" end
function ENT:DLG_FiringAtAnExposedTarget() self:EmitSound "VaasPirateAssaulterAttackingTaunt" end
function ENT:DLG_Suppressing() self:EmitSound "VaasPirateAssaulterAttackingTaunt" end
function ENT:DLG_Charge() self:EmitSound "VaasPirateAssaulterCharge" BaseClass.DLG_Charge( self ) end
function ENT:DLG_Spot() self:EmitSound "VaasPirateAssaulterSpot" end
function ENT:DLG_Startle() self:EmitSound "VaasPirateAssaulterStartle" end

function ENT:Initialize()
	self:SetModel( "models/player/fc3pirate_" .. math.random( 1, 10 ) .. ".mdl" )
	self:SetHealth( 100 )
	self:SetMaxHealth( 100 )
	self:SetPlayerColor( Vector( 1, 0, 0 ) )
	BaseClass.Initialize( self )
end
