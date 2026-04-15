DEFINE_BASECLASS "zastavam93blackarrowshortrangescope"

SWEP.Category = "#Category.SniperRifles"
SWEP.PrintName = "#ZastavaM93BlackArrow"
SWEP.Spawnable = true

SWEP.flZoomFoVMin = 10
SWEP.flZoomFoVMax = 3
SWEP.flCustomZoomFoV = SWEP.flZoomFoVMin

local IsValid = IsValid
function SWEP:Deploy()
	local pOwner = self:GetOwner()
	local pViewModel = pOwner.GetViewModel
	if pViewModel then
		pViewModel = pViewModel( pOwner )
		if IsValid( pViewModel ) then pViewModel:SetColor( self:GetColor() ) pViewModel:SetBodygroup( 1, 2 ) end
	end
	return BaseClass.Deploy( self )
end

function SWEP:Holster( pTo )
	if !BaseClass.Holster( self ) then return end
	local pOwner = self:GetOwner()
	local pViewModel = pOwner.GetViewModel
	if pViewModel then
		pViewModel = pViewModel( pOwner )
		if IsValid( pViewModel ) then pViewModel:SetColor( color_white ) pViewModel:SetBodygroup( 1, 2 ) end
	end
	return true
end
