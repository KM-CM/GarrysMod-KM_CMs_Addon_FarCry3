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
SWEP.Primary_flDelay = .4
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = ""
SWEP.Spawnable = true
SWEP.Slot = 1
SWEP.vViewModelAim = Vector( -6.001, -2.891, .68 )
SWEP.vViewModelAimAngle = Vector( -.551, 1.919, 0 )
SWEP.ViewModelFOV = 48
SWEP.Crosshair = "Revolver"
SWEP.bPistolSprint = true
SWEP.flRecoil = 12
SWEP.flSideWaysRecoilMin = -.2
SWEP.flSideWaysRecoilMax = .2
SWEP.flRecoilGrowMin = .4
SWEP.flRecoilGrowMax = .85
SWEP.sAimSound = "BaseWeapon_Aim_Pistol"
SWEP.sHoldType = "Revolver"
SWEP.__VIEWMODEL_FULLY_MODELED__ = true
SWEP.flAimShoot = 1

sound.Add {
	name = "TaurusModel44Shot",
	channel = CHAN_WEAPON,
	volume = .5,
	level = 150,
	pitch = { 90, 100 },
	sound = "^TaurusModel44/Fire.wav"
}
SWEP.sSound = "TaurusModel44Shot"

sound.Add {
	name = "TaurusModel44ShotAuto",
	channel = CHAN_AUTO,
	volume = .5,
	level = 150,
	pitch = { 90, 100 },
	sound = "^TaurusModel44/Fire.wav"
}
SWEP.sSoundAuto = "TaurusModel44ShotAuto"

sound.Add {
	name = "Weapon_Cmagnum.Magin",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "TaurusModel44/MagIn.wav"
}
sound.Add {
	name = "Weapon_Cmagnum.Magout",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "TaurusModel44/MagOut.wav"
}
sound.Add {
	name = "Weapon_Cmagnum.Open",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "TaurusModel44/Open.wav"
}
sound.Add {
	name = "Weapon_Cmagnum.Close",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "TaurusModel44/Close.wav"
}
