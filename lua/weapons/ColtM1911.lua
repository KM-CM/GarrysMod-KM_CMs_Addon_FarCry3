DEFINE_BASECLASS "BaseBulletWeapon"

SWEP.Category = "Pistols"
SWEP.PrintName = "#ColtM1911"
SWEP.Purpose = "Colt M1911."
SWEP.ViewModel = "models/weapons/c_1911.mdl"
SWEP.WorldModel = "models/weapons/FC3W/FC3191w.mdl"
function SWEP:GetReloadActivity( bOneInTheChamber ) return bOneInTheChamber && ACT_VM_RELOAD || ACT_VM_RELOAD_EMPTY end
SWEP.Primary.ClipSize = 7
SWEP.Primary.DefaultClip = 7
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "Pistol"
SWEP.Primary_flSpreadX = .0084
SWEP.Primary_flSpreadY = .0084
SWEP.Primary_flDamage = 30
SWEP.Primary_flDelay = .05454545454
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = ""
SWEP.Spawnable = true
SWEP.Slot = 1
SWEP.vViewModelAim = Vector( -7.202, -5.2, 2.4 )
SWEP.vViewModelAimAngle = Vector( -1.364, -.051 )
SWEP.Crosshair = "Pistol"
SWEP.WPN_SPRINT = WPN_PISTOL
SWEP.WPN_SHOOT = WPN_PISTOL
SWEP.flRecoil = 2
SWEP.flSideWaysRecoilMin = -.2
SWEP.flSideWaysRecoilMax = .2
SWEP.flRecoilGrowMin = .4
SWEP.flRecoilGrowMax = .85
SWEP.sAimSound = "BaseWeapon_Aim_Pistol"
SWEP.sHoldType = "Pistol"
SWEP.__VIEWMODEL_FULLY_MODELED__ = true
SWEP.flAimShoot = 6
SWEP.flCoverX = -6
SWEP.flSwayStabilizer = .5

sound.Add {
	name = "ColtM1911Shot",
	channel = CHAN_WEAPON,
	level = 150,
	pitch = { 90, 100 },
	sound = "ColtM1911/Fire.wav"
}
SWEP.sSound = "ColtM1911Shot"

sound.Add {
	name = "ColtM1911ShotAuto",
	channel = CHAN_AUTO,
	level = 150,
	pitch = { 90, 100 },
	sound = "ColtM1911/Fire.wav"
}
SWEP.sSoundAuto = "ColtM1911ShotAuto"

sound.Add {
	name = "Weapon_C1911.Magin",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "ColtM1911/MagIn.wav"
}
sound.Add {
	name = "Weapon_C1911.Magout",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "ColtM1911/MagOut.wav"
}
sound.Add {
	name = "Weapon_C1911.Bolt",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "ColtM1911/Bolt.wav"
}

function SWEP:DrawWorldModel()
	self:DrewWorldModelAndUsedRenderOverrides()
	local pOwner = self:GetOwner()
	if !IsValid( pOwner ) then self:DrawModel() return end
	local tHand = pOwner:GetAttachment( pOwner:LookupAttachment "anim_attachment_rh" )
	local ang = tHand.Ang
	local vOffset = ang:Right() * .55 + ang:Forward() * -2 + ang:Up() * -.5
	ang:RotateAroundAxis( ang:Forward(), 10 )
	self:SetRenderOrigin( tHand.Pos + vOffset )
	self:SetRenderAngles( ang )
	self:DrawModel()
end
