AddCSLuaFile()
DEFINE_BASECLASS "BaseProjectile"

scripted_ents.Register( ENT, "RookIslandsBowArrow" )

if !SERVER then return end

local CEntity = FindMetaTable "Entity"
local CEntity_GetTable = CEntity.GetTable

local CEntity_SetHealth = CEntity.SetHealth

local FVPHYSICS_NO_IMPACT_DMG = FVPHYSICS_NO_IMPACT_DMG

function ENT:Initialize()
	self:SetModel "models/weapons/FC3W/FC3Arrow.mdl"
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:GetPhysicsObject():AddGameFlag( FVPHYSICS_NO_IMPACT_DMG )
	CEntity_SetHealth( self, 85 )
end

function ENT:Touch( pHitEntity )
	if self.m_bStuck && self:GetPhysicsObject():GetVelocity():Length() <= 256 then return end
	if IsValid( pHitEntity ) then
		local dDamage = DamageInfo()
		dDamage:SetAttacker( self:GetOwner() )
		dDamage:SetDamage( self:Health() )
		dDamage:SetDamageType( DMG_SLASH )
		local v = self:GetTouchTrace().HitPos
		dDamage:SetDamagePosition( v )
		local f = pHitEntity.SetLastHitGroup
		if f then
			local vStart = self:GetPos() + self:OBBCenter()
			local trNew = util.TraceLine {
				start = vStart,
				endpos = vStart + ( v - vStart ):GetNormalized() * 999999,
				filter = function( pEntity ) return pEntity == pHitEntity end
			}
			if trNew.Entity == pHitEntity then
				f( pHitEntity, trNew.HitGroup )
			end
		end
		pHitEntity:TakeDamageInfo( dDamage )
		self:SetParent( pHitEntity )
		local t = pHitEntity.GAME_tIWantACallBackWhenThisIsRemoved
		if !t then t = {} pHitEntity.GAME_tIWantACallBackWhenThisIsRemoved = t end
		table.insert( t, function()
			if !IsValid( self ) then return end
			self:SetParent( NULL )
			self.m_bStuck = nil
		end )
	end
	self.m_bStuck = true
end

local CEntity_Health = CEntity.Health

function ENT:OnTakeDamage( dDamage )
	local MyTable = CEntity_GetTable( self )
	if MyTable.bDead then return 0 end
	local f = CEntity_Health( self ) - dDamage:GetDamage()
	CEntity_SetHealth( self, f )
	if f <= 0 then MyTable.bDead = true self:Remove() return 0 end
end
