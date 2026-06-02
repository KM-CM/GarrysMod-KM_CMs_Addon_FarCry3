// 3747

AddCSLuaFile()
DEFINE_BASECLASS "BaseActorPlayer"

scripted_ents.Register( ENT, "HumanHoytPrivateerDefender" )

list.Set( "NPC", "HumanHoytPrivateerDefender", {
	Name = "#HumanHoytPrivateerDefender",
	Class = "HumanHoytPrivateerDefender",
	Category = "Humans",
	Weapons = { "P416" }
} )

sound.Add {
	name = "HoytPrivateerDefenderSpot",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"HoytPrivateer/Defender/ThoughYouCouldHide.wav",
		"HoytPrivateer/Defender/TargetSpotted.wav",
		"HoytPrivateer/Defender/TargetSpotted2.wav",
		"HoytPrivateer/Defender/ISeeYouThereMotherfucker.wav",
		"HoytPrivateer/Defender/HeyTargets.wav",
		"HoytPrivateer/Defender/TargetOverThere.wav",
		"HoytPrivateer/Defender/TargetSighted.wav"
	}
}

sound.Add {
	name = "HoytPrivateerDefenderAttackingTaunt",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"HoytPrivateer/Defender/ImGonnaMakeYouBleed.wav",
		"HoytPrivateer/Defender/YouGotNoChanceManNoChance.wav",
		"HoytPrivateer/Defender/YoureDead.wav",
	}
}

// UNUSED
sound.Add {
	name = "HoytPrivateerDefenderEfficiencyTaunt",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"HoytPrivateer/Defender/EyAveYouBeenDoingThisLong.wav",
		"HoytPrivateer/Defender/StopWastingBulletsAndHitMe.wav",
		"HoytPrivateer/Defender/EyWouldItHelpIfIStoodStill.wav",
		"HoytPrivateer/Defender/KhahDamnYouSuck.wav",
		"HoytPrivateer/Defender/MaybeIShootMyselfSoYouDontFeelSoBad.wav"
	}
}

sound.Add {
	name = "HoytPrivateerDefenderAdvancing",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"HoytPrivateer/Defender/AdvancingCoverMe.wav",
		"HoytPrivateer/Defender/Advancing.wav",
		"HoytPrivateer/Defender/ImComingForYou.wav",
		"HoytPrivateer/Defender/MovingIntoPositionGiveMeOverwatch.wav"
	}
}

sound.Add {
	name = "HoytPrivateerDefenderStartle",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"HoytPrivateer/Defender/HolyCrap.wav",
		"HoytPrivateer/Defender/WhatTheHell.wav",
		"HoytPrivateer/Defender/Woah.wav"
	}
}

sound.Add {
	name = "HoytPrivateerDefenderPinned",
	channel = CHAN_VOICE,
	level = 150,
	pitch = 100,
	sound = {
		"HoytPrivateer/Defender/HelpImPinned.wav",
		"HoytPrivateer/Defender/ImPinnedDown.wav"
	}
}

if !SERVER then return end

if !CLASS_HOYT_PRIVATEERS then Add_NPC_Class "CLASS_HOYT_PRIVATEERS" end
ENT.iDefaultClass = CLASS_HOYT_PRIVATEERS

function ENT:DLG_Spot() self:EmitSound "HoytPrivateerDefenderSpot" end
function ENT:DLG_Advancing() self:EmitSound "HoytPrivateerDefenderAdvancing" end
function ENT:DLG_FiringAtAnExposedTarget() self:EmitSound "HoytPrivateerDefenderAttackingTaunt" end
function ENT:DLG_Suppressing() self:EmitSound "HoytPrivateerDefenderAttackingTaunt" end
function ENT:DLG_Startle() self:EmitSound "HoytPrivateerDefenderStartle" end
function ENT:DLG_Pinned() self:EmitSound "HoytPrivateerDefenderPinned" end

function ENT:Initialize()
	self:SetModel "models/player/privateer_1.mdl"
	// Expensive ass vest
	self:SetHealth( 175 )
	self:SetMaxHealth( 175 )
	self:SetPlayerColor( Vector( 1, 1, 0 ) )
	BaseClass.Initialize( self )
end
