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

SWEP.ViewModelFOV = 45
SWEP.flAimShoot = 3

SWEP.ViewModel = "models/weapons/c_v45.mdl"
SWEP.WorldModel = "models/weapons/FC3W/FC3v45w.mdl"

SWEP.vViewModelAim = Vector( -8.806, -4.18, 1.44 )
SWEP.vViewModelAimAngle = Vector( -2.166, -4.24, -3.333 )

SWEP.__VIEWMODEL_FULLY_MODELED__ = true

sound.Add {
	name = "Weapon_Cv45.MagIn",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "KRISSVector/MagIn.wav"
}
sound.Add {
	name = "Weapon_Cv45.MagOut",
	channel = CHAN_ITEM,
	soundlevel = 80,
	sound = "KRISSVector/MagOut.wav"
}
sound.Add {
	name = "Weapon_Cv45.Bolt",
	channel = CHAN_ITEM,
	soundlevel = 80,
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
