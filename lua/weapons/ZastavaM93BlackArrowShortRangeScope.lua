DEFINE_BASECLASS "BaseBulletWeapon"

SWEP.Category = "#Category.SniperRifles"
SWEP.PrintName = "#ZastavaM93BlackArrowShortRangeScope"
SWEP.Instructions = "Primary to shoot."
SWEP.ViewModel = "models/weapons/c_z93.mdl"
SWEP.WorldModel = "models/weapons/FC3W/fc3z93w.mdl"
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 10
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "357"
SWEP.Primary_flDelay = 13 / 6 // Aka 2.1666666559047
SWEP.Primary_flSpreadX = .00036
SWEP.Primary_flSpreadY = .00036
SWEP.Primary_flDamage = 80
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo = ""
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Weight = 1
SWEP.Slot = 3
SWEP.DrawAmmo = true
SWEP.Crosshair = "Sniper"
SWEP.flRecoil = 10
SWEP.flSideWaysRecoilMin = -.34
SWEP.flSideWaysRecoilMax = .34
SWEP.flRecoilGrowMin = .66
SWEP.flRecoilGrowMax = 1
SWEP.sAimSound = "BaseWeapon_Aim_Rifle"
SWEP.sHoldType = "AR2"
SWEP.vViewModelAim = Vector( -2.84, -5.347, .68 )
SWEP.__VIEWMODEL_FULLY_MODELED__ = true
SWEP.bSniper = true
SWEP.sAnimationSet = "Sniper"

SWEP.flZoomFoVMin = 20
SWEP.flZoomFoVMax = 6
SWEP.flCustomZoomFoV = SWEP.flZoomFoVMin

function SWEP:FreezeMovement()
	local owner = self:GetOwner()
	if owner:KeyDown( IN_ZOOM ) && ( owner:KeyDown( IN_ATTACK2 ) || owner:KeyReleased( IN_ATTACK2 ) ) then return true end
end

function SWEP:SetCustomZoomFoV( v ) self.flCustomZoomFoV = tonumber( v ) end

function SWEP:Tick()
	local owner = self:GetOwner()
	if CLIENT && owner != LocalPlayer() then return end
	local cmd = owner:GetCurrentCommand()
	if !cmd:KeyDown( IN_ATTACK2 ) || !cmd:KeyDown( IN_ZOOM ) then return end
	self.flCustomZoomFoV = math.Clamp( self.flCustomZoomFoV + cmd:GetMouseY() * FrameTime() * 6.6, self.flZoomFoVMax, self.flZoomFoVMin )
	self:CallOnClient( "SetCustomZoomFoV", self.flCustomZoomFoV )
end

function SWEP:GetReloadActivity( bOneInTheChamber ) return bOneInTheChamber && ACT_VM_RELOAD || ACT_VM_RELOAD_EMPTY end

sound.Add {
	name = "ZastavaM93BlackArrowShot",
	channel = CHAN_WEAPON,
	level = 150,
	pitch = { 90, 110 },
	sound = "ZastavaM93BlackArrow/Fire.wav"
}
SWEP.sSound = "ZastavaM93BlackArrowShot"

sound.Add {
    name = "Weapon_Cz93.Boltback",
    channel = CHAN_ITEM,
    soundlevel = 80,
    sound = "ZastavaM93BlackArrow/BoltBack.wav"
}
sound.Add {
    name = "Weapon_Cz93.Boltforward",
    channel = CHAN_ITEM,
    soundlevel = 80,
    sound = "ZastavaM93BlackArrow/BoltForward.wav"
}
sound.Add {
    name = "Weapon_Cz93.Magout",
    channel = CHAN_ITEM,
    soundlevel = 80,
    sound = "ZastavaM93BlackArrow/MagOut.wav"
}
sound.Add {
    name = "Weapon_Cz93.Maghit",
    channel = CHAN_ITEM,
    soundlevel = 80,
    sound = "ZastavaM93BlackArrow/MagHit.wav"
}

list.Add( "NPCUsableWeapons", { class = "ZastavaM93BlackArrowShortRangeScope", title = "#ZastavaM93BlackArrowShortRangeScope", category = SWEP.Category } )

function SWEP:DrawWorldModel()
	self:DrewWorldModelAndUsedRenderOverrides()
	local pOwner = self:GetOwner()
	if !IsValid( pOwner ) then self:SetRenderOrigin( nil ) self:SetRenderAngles( nil ) self:DrawModel() return end
	local tHand = pOwner:GetAttachment( pOwner:LookupAttachment "anim_attachment_rh" )
	local ang = tHand.Ang
	local vOffset = ang:Right() * .55 + ang:Up() * 1.7
	ang:RotateAroundAxis( ang:Forward(), 10 )
	ang:RotateAroundAxis( ang:Up(), 180 )
	self:SetRenderOrigin( tHand.Pos + vOffset )
	self:SetRenderAngles( ang )
	self:DrawModel()
end
