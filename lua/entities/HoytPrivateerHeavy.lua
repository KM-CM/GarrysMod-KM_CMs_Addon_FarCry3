AddCSLuaFile()
DEFINE_BASECLASS "BaseActorPlayer"

scripted_ents.Register( ENT, "HoytPrivateerHeavy" )

list.Set( "NPC", "HoytPrivateerHeavyGunner", {
	Name = "#HoytPrivateerHeavyGunner",
	Class = "HoytPrivateerHeavy",
	Category = "#HoytsPrivateers",
	Weapons = { "MKG" }
} )

if CLIENT then return end

if !CLASS_HOYT_PRIVATEERS then Add_NPC_Class "CLASS_HOYT_PRIVATEERS" end
ENT.iDefaultClass = CLASS_HOYT_PRIVATEERS

ENT.GAME_flHeadshotDamageMultiplier = 2

ENT.m_sDefaultCombatSchedule = "CombatHeavy"

ENT.flWalkSpeed = 75
ENT.flJogSpeed = 100
ENT.flTopSpeed = ENT.flJogSpeed

function ENT:Initialize()
	self:SetModel "models/player/privateer_1.mdl"
	self:SetHealth( 100 )
	self:SetMaxHealth( 100 )
	self:SetPlayerColor( Vector( .66, .66, .66 ) )
	BaseClass.Initialize( self )
end

function ENT:OnTakeDamage( dDamage )
	//	if dDamage:IsBulletDamage() then
		if self.ELastHitGroup == HITGROUP_HEAD then
			dDamage:ScaleDamage( math.Remap( dDamage:GetDamage(), 0, self:Health(), .1, 1 / 3 ) )
		else
			dDamage:ScaleDamage( math.Remap( dDamage:GetDamage(), 0, self:Health(), .01, .05 ) )
		end
	//	end
	BaseClass.OnTakeDamage( self, dDamage )
end
