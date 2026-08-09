// NOTE: Dunia II most likely uses looping gunfire sounds, I have no idea. This is why this P416 sounds shit.
// I cannot really do anything about the sound without Buu342, as I don't have Far Cry 3 installed, nor do I know how to rip sounds.

DEFINE_BASECLASS "BaseBulletWeapon"

SWEP.Category = "Assault Rifles"
SWEP.PrintName = "#P416"
SWEP.Purpose = "Patriot Ordnance Factory P416."
SWEP.WPN_SPRINT = WPN_RIFLEUP
SWEP.WPN_SHOOT = WPN_RIFLEUP

SWEP.sAimSound = "BaseWeapon_Aim_Rifle"

SWEP.Spawnable = true

SWEP.ViewModel = "models/weapons/c_p416.mdl"
SWEP.WorldModel = "models/weapons/FC3W/FC3416w.mdl"

function SWEP:GetReloadActivity( bOneInTheChamber ) return bOneInTheChamber && ACT_VM_RELOAD || ACT_VM_RELOAD_EMPTY end

SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary_flSpreadX = .006
SWEP.Primary_flSpreadY = .006
SWEP.Primary_flDamage = 30
SWEP.Primary_flDelay = 60 / 750

SWEP.flRecoil = 1.5

SWEP.Slot = 2
SWEP.Crosshair = "Rifle"
SWEP.sHoldType = "AR2"
SWEP.flAimShoot = 4
SWEP.flAimShootTurn = .04
SWEP.flSwayStabilizer = .6

SWEP.__VIEWMODEL_FULLY_MODELED__ = true

sound.Add {
	name = "P416Fire",
	channel = CHAN_WEAPON,
	level = 150,
	pitch = { 90, 100 },
	sound = "P416/Fire.wav"
}
SWEP.sSound = "P416Fire"
sound.Add {
	name = "P416FireAuto",
	channel = CHAN_AUTO,
	level = 150,
	pitch = { 90, 100 },
	sound = "P416/Fire.wav"
}
SWEP.sSoundAuto = "P416FireAuto"

sound.Add {
	name = "Weapon_Cp416.MagIn",
	channel = CHAN_ITEM,
	level = 80,
	sound = "P416/MagIn.wav"
}
sound.Add {
	name = "Weapon_Cp416.MagOut",
	channel = CHAN_ITEM,
	level = 80,
	sound = "P416/MagOut.wav"
}
sound.Add {
	name = "Weapon_Cp416.Bolt",
	channel = CHAN_ITEM,
	level = 80,
	sound = "P416/Bolt.wav"
}

SWEP.vViewModelAim = Vector( -8.009, -3.961, .239 )
SWEP.vViewModelAimAngle = Vector( .216, -1.073, -.357 )

function SWEP:DrawWorldModel()
	self:DrewWorldModelAndUsedRenderOverrides()
	local pOwner = self:GetOwner()
	if !IsValid( pOwner ) then self:SetRenderOrigin( nil ) self:SetRenderAngles( nil ) self:DrawModel() return end
	local tHand = pOwner:GetAttachment( pOwner:LookupAttachment "anim_attachment_rh" ) if !tHand then return end
	local ang = tHand.Ang
	local vOffset = ang:Right() * 1 + ang:Forward() * 0 + ang:Up() * 0
	ang:RotateAroundAxis( ang:Right(), 90 )
	ang:RotateAroundAxis( ang:Forward(), 180 )
	ang:RotateAroundAxis( ang:Up(), 0 )
	self:SetRenderOrigin( tHand.Pos + vOffset )
	self:SetRenderAngles( ang )
	self:DrawModel()
end
