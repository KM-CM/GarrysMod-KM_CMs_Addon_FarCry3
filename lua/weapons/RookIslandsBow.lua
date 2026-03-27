// TODO: Use the same infinite ammo type system as grenades use (pOwner.GAME_tItemCounts)

DEFINE_BASECLASS "BaseWeapon"

SWEP.Category = "Bows"
SWEP.PrintName = "#RookIslandsBow"
SWEP.Instructions = "Primary to shoot."
SWEP.Purpose = "A bow from the Rook Islands."
SWEP.ViewModel = "models/weapons/c_bow.mdl"
SWEP.WorldModel = "models/weapons/c_bow.mdl"
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = false
SWEP.m_bAllowOneInTheChamber = false
SWEP.Primary.Ammo = ""
SWEP.Primary_flDelay = 2
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = ""
SWEP.Spawnable = true
SWEP.Slot = 3
SWEP.ViewModelFOV = 54
SWEP.Crosshair = "Rifle"
SWEP.bSpecial = true
SWEP.vViewModelAim = Vector( -2.524, -5.231, 3.21 )
SWEP.vViewModelAimAngle = Vector( 0, -7.081, -47.355 )
SWEP.__VIEWMODEL_FULLY_MODELED__ = true
SWEP.flCustomZoomFoV = 40

function SWEP:Initialize() self:SetHoldType "SMG" end

sound.Add {
	name = "RookIslandsBowShot",
	channel = CHAN_AUTO,
	level = 70,
	pitch = { 90, 100 },
	sound = {
		"RookIslandsBow/1.wav",
		"RookIslandsBow/2.wav",
		"RookIslandsBow/3.wav"
	}
}
SWEP.sSound = "RookIslandsBowShot"

sound.Add {
    name = "Weapon_Cbow.Insert",
    channel = CHAN_ITEM,
    level = 80,
    sound = "RookIslandsBow/Insert.wav"
}

sound.Add {
    name = "Weapon_Cbow.Pull",
    channel = CHAN_ITEM,
    level = 80,
    sound = "RookIslandsBow/Pull.wav"
}

sound.Add {
    name = "Weapon_Cbow.Rest",
    channel = CHAN_ITEM,
    level = 80,
    sound = "RookIslandsBow/Rest.wav"
}

sound.Add {
    name = "Weapon_Cbow.Draw",
    channel = CHAN_ITEM,
    level = 80,
    sound = "RookIslandsBow/Draw.wav"
}

function SWEP:PullBackStart( f ) self.m_flPullBackStart = tonumber( f ) end
function SWEP:PullBackEnd( f ) self.m_flPullBackEnd = tonumber( f ) end

SWEP.flArrowVelocity = 4096

local math_Remap = math.Remap

function SWEP:Think()
	local pOwner = self:GetOwner()
	if !IsValid( pOwner ) || !pOwner:IsPlayer() then return end
	if self.m_bPullBack then
		if !pOwner:KeyDown( IN_ATTACK ) then
			self:CallOnClient "PullBackStart"
			self:CallOnClient "PullBackEnd"
			self:SendWeaponAnim( ACT_VM_PRIMARYATTACK )
			self.m_bPullBack = nil
			self:EmitSound "RookIslandsBowShot"
			local f = self:SequenceDuration()
			self:CallOnClient( "ReloadTime", f )
			self:SetNextPrimaryFire( CurTime() + f )
			if CLIENT then return end
			local pArrow = ents.Create "RookIslandsBowArrow"
			pArrow:SetPos( pOwner:GetShootPos() )
			local dDirection = self:GetAimVector()
			pArrow:SetAngles( dDirection:Angle() )
			pArrow:SetOwner( pOwner )
			pArrow:Spawn()
			local pPhys = pArrow:GetPhysicsObject()
			if IsValid( pPhys ) then
				local f = self.m_flPullBackEnd
				if CurTime() <= f then
					pPhys:AddVelocity( dDirection * math_Remap( CurTime(), self.m_flPullBackStart, f, 0, self.flArrowVelocity ) )
				else pPhys:AddVelocity( dDirection * self.flArrowVelocity ) end
			end
		end
	end
end

function SWEP:PrimaryAttack()
	if !self:CanPrimaryAttack() then return end
	self.m_bPullBack = true
	local f = CurTime()
	self:CallOnClient( "PullBackStart", f )
	self.m_flPullBackStart = f
	self:SendWeaponAnim( ACT_VM_PULLBACK )
	f = f + self:SequenceDuration()
	self:CallOnClient( "PullBackEnd", f )
	self.m_flPullBackEnd = f
end

function SWEP:Reload()
	if !self.m_bPullBack || CurTime() <= self.m_flPullBackEnd then return end
	self:CallOnClient "PullBackStart"
	self:CallOnClient "PullBackEnd"
	self:SendWeaponAnim( ACT_VM_HAULBACK )
	self.m_bPullBack = nil
	local f = self:SequenceDuration()
	self:CallOnClient( "ReloadTime", f )
	self:SetNextPrimaryFire( CurTime() + f )
end

local math_max = math.max
function SWEP:GatherCrosshairSpread( MyTable, bForceIdentical )
	local flSpreadX, flSpreadY
	local v = MyTable.Primary_flSpreadX
	if v then flSpreadX = v end
	local v = MyTable.Primary_flSpreadY
	if v then flSpreadY = v end
	local flInaccuracy = MyTable.flCrosshairInAccuracy * ( MyTable.vViewModelAim && MyTable.flAimMultiplier || 1 )
	local f = MyTable.m_flPullBackEnd
	if f then
		if CurTime() <= f then
			flInaccuracy = math_Remap( CurTime(), MyTable.m_flPullBackStart, f, flInaccuracy, .015 )
		else flInaccuracy = .015 end
	end
	if MyTable.bCrosshairSizeIdentical || bForceIdentical then
		local v = math_max( flSpreadX || flSpreadY, flSpreadY || flSpreadX ) + flInaccuracy
		return v, v
	end
	return flSpreadX + flInaccuracy, flSpreadY + flInaccuracy
end
