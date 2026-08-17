DEFINE_BASECLASS "BaseBulletWeapon"

SWEP.Category = "Revolvers"
SWEP.PrintName = "#TaurusModel44"
SWEP.Purpose = "Taurus Model 44."
SWEP.ViewModel = "models/weapons/c_44magnum.mdl"
SWEP.WorldModel = "models/weapons/fc3w/fc344m.mdl"
SWEP.Primary.ClipSize = 6 // Duh
SWEP.Primary.DefaultClip = 6
SWEP.Primary.Automatic = false
SWEP.m_bAllowOneInTheChamber = false
SWEP.Primary.Ammo = "357"
SWEP.Primary_flSpreadX = .0084
SWEP.Primary_flSpreadY = .0084
SWEP.Primary_flDamage = 120
SWEP.Primary_flDelay = .15
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = ""
SWEP.Spawnable = true
SWEP.Slot = 1
SWEP.vViewModelAim = Vector( -6.001, -2.891, .68 )
SWEP.vViewModelAimAngle = Vector( -.551, 1.919, 0 )
SWEP.ViewModelFOV = 48
SWEP.Crosshair = "Revolver"
SWEP.WPN_SPRINT = WPN_PISTOL
SWEP.WPN_SHOOT = WPN_PISTOL
SWEP.flRecoil = 5
SWEP.sAimSound = "BaseWeapon_Aim_Pistol"
SWEP.sHoldType = "Revolver"
SWEP.__VIEWMODEL_FULLY_MODELED__ = true

sound.Add {
	name = "TaurusModel44Shot",
	channel = CHAN_WEAPON,
	level = 150,
	pitch = { 90, 100 },
	sound = "^TaurusModel44/Fire.wav"
}
SWEP.sSound = "TaurusModel44Shot"

sound.Add {
	name = "TaurusModel44ShotAuto",
	channel = CHAN_AUTO,
	level = 150,
	pitch = { 90, 100 },
	sound = "^TaurusModel44/Fire.wav"
}
SWEP.sSoundAuto = "TaurusModel44ShotAuto"

sound.Add {
	name = "Weapon_Cmagnum.Magin",
	channel = CHAN_ITEM,
	level = 80,
	sound = "TaurusModel44/MagIn.wav"
}
sound.Add {
	name = "Weapon_Cmagnum.Magout",
	channel = CHAN_ITEM,
	level = 80,
	sound = "TaurusModel44/MagOut.wav"
}
sound.Add {
	name = "Weapon_Cmagnum.Open",
	channel = CHAN_ITEM,
	level = 80,
	sound = "TaurusModel44/Open.wav"
}
sound.Add {
	name = "Weapon_Cmagnum.Close",
	channel = CHAN_ITEM,
	level = 80,
	sound = "TaurusModel44/Close.wav"
}

function SWEP:DrawWorldModel()
    self:DrewWorldModelAndUsedRenderOverrides()
    local pOwner = self:GetOwner()
    if !IsValid( pOwner ) then self:DrawModel() return end
    local tHand = pOwner:GetAttachment( pOwner:LookupAttachment "anim_attachment_rh" ) if !tHand then return end
    local ang = tHand.Ang
    local vOffset = ang:Right() * .55 + ang:Forward() * -2 + ang:Up() * -.5
    ang:RotateAroundAxis( ang:Forward(), 10 )
    self:SetRenderOrigin( tHand.Pos + vOffset )
    self:SetRenderAngles( ang )
    self:DrawModel()
end

if CLIENT then
	local math_abs = math.abs
	local math_sin = math.sin
	local RealTime = RealTime
	VIEWMODEL_CAMERA_ANIMATIONS[ "models/weapons/c_44magnum.mdl" ] = {
		reload = function( pViewModel, vTarget, vTargetAngle )
			local flCycle = pViewModel:GetCycle()
			if flCycle < .1 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
			elseif flCycle < .2 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] - 2
			elseif flCycle < .25 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
			elseif flCycle < .3 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] - 2
			elseif flCycle < .4 then
			elseif flCycle > .4 && flCycle < .8 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
			end
			if flCycle > .68 && flCycle < .78 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
			end
			if flCycle > .8 && flCycle < .85 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] - 1
				vTargetAngle[ 2 ] = vTargetAngle[ 2 ] + 1
			elseif flCycle >= .85 && flCycle < .9 then
				vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 1
				vTargetAngle[ 2 ] = vTargetAngle[ 2 ] - 1
			end
			if flCycle < .66 then
				vTargetAngle[ 3 ] = vTargetAngle[ 3 ] + math_abs( math_sin( RealTime() * 4 ) ) * 2
			end
		end
	}
end
