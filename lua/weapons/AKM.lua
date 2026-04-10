DEFINE_BASECLASS "BaseBulletWeapon"

SWEP.Category = "Assault Rifles"
SWEP.PrintName = "#AKM"
SWEP.Instructions = "Primary to shoot."
SWEP.Purpose = "A weapon exclusive to the Rook Islands. Resembles an AK-74, AK-103, AKM, and Norinco Type 56-2 all at the same time."
SWEP.ViewModel = "models/weapons/c_ak47.mdl"
SWEP.WorldModel = "models/weapons/FC3W/FC3AK47w.mdl"
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "SMG1"
SWEP.Primary_flDelay = .09 // .08571428571
SWEP.Primary_flSpreadX = .0073
SWEP.Primary_flSpreadY = .0073
SWEP.Primary_flDamage = 40
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = ""
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Weight = 1
SWEP.Slot = 2
SWEP.DrawAmmo = true
SWEP.Crosshair = "Rifle"
SWEP.flRecoil = 1.6
SWEP.flSideWaysRecoilMin = -.34
SWEP.flSideWaysRecoilMax = .34
SWEP.flRecoilGrowMin = .66
SWEP.flRecoilGrowMax = 1
SWEP.sAimSound = "BaseWeapon_Aim_Rifle"
SWEP.sHoldType = "AR2"
SWEP.vViewModelAim = Vector( -6.304, -3.047, 1.236 )
SWEP.vViewModelAimAngle = Vector( -1.29, -1.453, -.784 )
SWEP.__VIEWMODEL_FULLY_MODELED__ = true

function SWEP:GetReloadActivity( bOneInTheChamber ) return bOneInTheChamber && ACT_VM_RELOAD || ACT_VM_RELOAD_EMPTY end

sound.Add {
	name = "AKMShot",
	channel = CHAN_WEAPON,
	level = 150,
	pitch = { 90, 110 },
	sound = "^AK47Shot.wav"
}
SWEP.sSound = "AKMShot"
//	sound.Add {
//		name = "AKMShotAuto",
//		channel = CHAN_AUTO,
//		level = 150,
//		pitch = { 90, 110 },
//		sound = "^AK47Shot.wav"
//	}
//	SWEP.sSoundAuto = "AKMShotAuto"

sound.Add {
	name = "Weapon_Cak47.Magin",
	channel = CHAN_ITEM,
	soundlevel = 100,
	sound = "AKM/MagIn.wav"
}
sound.Add {
	name = "Weapon_Cak47.Magout",
	channel = CHAN_ITEM,
	soundlevel = 100,
	sound = "AKM/MagOut.wav"
}
sound.Add {
	name = "Weapon_Cak47.Bolt",
	channel = CHAN_ITEM,
	soundlevel = 100,
	sound = "AKM/Bolt.wav"
}
sound.Add {
	name = "Weapon_Cak47.Move",
	channel = CHAN_ITEM,
	soundlevel = 100,
	sound = "AKM/Move.wav"
}
sound.Add {
	name = "Weapon_Cak47.Move2",
	channel = CHAN_ITEM,
	soundlevel = 100,
	sound = "AKM/Move2.wav"
}

list.Add( "NPCUsableWeapons", { class = "AKM", title = "#AKM", category = SWEP.Category } )

function SWEP:DrawWorldModel()
	self:DrewWorldModelAndUsedRenderOverrides()
	local pOwner = self:GetOwner()
	if !IsValid( pOwner ) then self:SetRenderOrigin( nil ) self:SetRenderAngles( nil ) self:DrawModel() return end
	local tHand = pOwner:GetAttachment( pOwner:LookupAttachment "anim_attachment_rh" )
	local ang = tHand.Ang
	local vOffset = ang:Right() * 2 + ang:Forward() * -13 + ang:Up() * 5
	ang:RotateAroundAxis( ang:Right(), 0 )
	ang:RotateAroundAxis( ang:Forward(), 10 )
	ang:RotateAroundAxis( ang:Up(), 0 )
	self:SetRenderOrigin( tHand.Pos + vOffset )
	self:SetRenderAngles( ang )
	self:DrawModel()
end
