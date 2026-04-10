DEFINE_BASECLASS "BaseBulletWeapon"

SWEP.Category = "Assault Rifles"
SWEP.PrintName = "#P416"
SWEP.Purpose = "Patriot Ordnance Factory P416."

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
SWEP.Primary_flDelay = .07058823529

SWEP.flRecoil = 1.5

SWEP.Slot = 2
SWEP.Crosshair = "Rifle"
SWEP.sHoldType = "AR2"
SWEP.flAimShoot = 2

SWEP.vSprint = Vector( 1.228, 1.358, -1.94 )
SWEP.vSprintAngle = Vector( -5, 34.167, -20 )

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
	soundlevel = 80,
	sound = "P416/MagIn.wav"
}
sound.Add {
	name = "Weapon_Cp416.MagOut",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "P416/MagOut.wav"
}
sound.Add {
	name = "Weapon_Cp416.Bolt",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "P416/Bolt.wav"
}

SWEP.vViewModelAim = Vector( -8.009, -3.961, .239 )
SWEP.vViewModelAimAngle = Vector( .216, -1.073, -.357 )

function SWEP:DrawWorldModel()
	self:DrewWorldModelAndUsedRenderOverrides()
	local pOwner = self:GetOwner()
	if !IsValid( pOwner ) then self:SetRenderOrigin( nil ) self:SetRenderAngles( nil ) self:DrawModel() return end
	local tHand = pOwner:GetAttachment( pOwner:LookupAttachment "anim_attachment_rh" )
	local ang = tHand.Ang
	local vOffset = ang:Right() * 1 + ang:Forward() * 0 + ang:Up() * 0
	ang:RotateAroundAxis( ang:Right(), 90 )
	ang:RotateAroundAxis( ang:Forward(), 180 )
	ang:RotateAroundAxis( ang:Up(), 0 )
	self:SetRenderOrigin( tHand.Pos + vOffset )
	self:SetRenderAngles( ang )
	self:DrawModel()
end
