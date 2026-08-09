DEFINE_BASECLASS "BaseBulletWeapon"

SWEP.Category = "Submachine Guns"
SWEP.PrintName = "#KRISSVector"
SWEP.Purpose = "KRISS Vector."
SWEP.Primary.ClipSize = 40
SWEP.Primary.DefaultClip = 40
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary_flSpreadX = .0092
SWEP.Primary_flSpreadY = .0092
SWEP.Primary_flDelay = .05
SWEP.Primary_flDamage = 30
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = ""
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Weight = 1
SWEP.Slot = 2
SWEP.DrawAmmo = true
SWEP.Crosshair = "SubMachineGun"
SWEP.sAimSound = "BaseWeapon_Aim_SubMachineGun"
SWEP.sHoldType = "SMG"

SWEP.flAimShoot = 3

SWEP.ViewModel = "models/weapons/c_v45.mdl"
SWEP.WorldModel = "models/weapons/FC3W/FC3v45w.mdl"

SWEP.vViewModelAim = Vector( -9, -4.16, 1.42 )
SWEP.vViewModelAimAngle = Vector( -2.166, -4.24, -3.333 )

SWEP.__VIEWMODEL_FULLY_MODELED__ = true

sound.Add {
	name = "Weapon_Cv45.MagIn",
	channel = CHAN_ITEM,
	level = 80,
	sound = "KRISSVector/MagIn.wav"
}
sound.Add {
	name = "Weapon_Cv45.MagOut",
	channel = CHAN_ITEM,
	level = 80,
	sound = "KRISSVector/MagOut.wav"
}
sound.Add {
	name = "Weapon_Cv45.Bolt",
	channel = CHAN_ITEM,
	level = 80,
	sound = "KRISSVector/Bolt.wav"
}

function SWEP:GetReloadActivity( bOneInTheChamber ) return bOneInTheChamber && ACT_VM_RELOAD || ACT_VM_RELOAD_EMPTY end

sound.Add {
	name = "KRISSVectorShot",
	channel = CHAN_WEAPON,
	level = 150,
	pitch = { 90, 110 },
	sound = "^KRISSVectorShot.wav"
}
SWEP.sSound = "KRISSVector/Fire"

sound.Add {
	name = "KRISSVectorShotAuto",
	channel = CHAN_AUTO,
	level = 150,
	pitch = { 90, 110 },
	sound = "^KRISSVector/Fire.wav"
}
SWEP.sSoundAuto = "KRISSVectorShotAuto"

function SWEP:DrawWorldModel()
    self:DrewWorldModelAndUsedRenderOverrides()
    local pOwner = self:GetOwner()
    if !IsValid( pOwner ) then self:DrawModel() return end
    local tHand = pOwner:GetAttachment( pOwner:LookupAttachment "anim_attachment_rh" ) if !tHand then return end
    local ang = tHand.Ang
    local vOffset = ang:Right() + ang:Forward() * -13 + ang:Up() * 2
    ang:RotateAroundAxis( ang:Right(), 10 )
    self:SetRenderOrigin( tHand.Pos + vOffset )
    self:SetRenderAngles( ang )
    self:DrawModel()
end

SWEP.m_bNoNormalShootAnimation = true

if SERVER then return end

local math_abs = math.abs
local math_sin = math.sin
local RealTime = RealTime
VIEWMODEL_CAMERA_ANIMATIONS[ "models/weapons/c_v45.mdl" ] = {
	reload = function( pViewModel, vTarget, vTargetAngle )
		local flCycle = pViewModel:GetCycle()
		if flCycle < .25 then
			vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
		elseif flCycle < .3 then
			vTargetAngle[ 1 ] = vTargetAngle[ 1 ] - 1
		elseif flCycle > .6 && flCycle < .7 then
			vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
		end
		if flCycle < .8 then
			vTargetAngle[ 3 ] = vTargetAngle[ 3 ] + math_abs( math_sin( RealTime() * 6 ) ) * 2
		end
	end,
	reload_E = function( pViewModel, vTarget, vTargetAngle )
		local flCycle = pViewModel:GetCycle()
		if flCycle < .25 then
			vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
		elseif flCycle < .5 then
			vTargetAngle[ 1 ] = vTargetAngle[ 1 ] - 1
		elseif flCycle > .5 && flCycle < .8 then
			vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2
		end
		if flCycle > .69 && flCycle < .79 then vTargetAngle[ 1 ] = vTargetAngle[ 1 ] + 2 end
		if flCycle < .85 then
			vTargetAngle[ 3 ] = vTargetAngle[ 3 ] + math_abs( math_sin( RealTime() * 6 ) ) * 2
		end
	end
}
