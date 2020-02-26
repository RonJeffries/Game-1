-- blocks
-- RJ 20200222
-- ERJ 20200226 fixed dirt grass

function blocks()
    scene.voxels.blocks:addAssetPack("Blocks")
    local dirt = scene.voxels.blocks:new("Dirt Grass")
    dirt.setTexture(ALL, "Blocks:Dirt Grass")
    dirt.setTexture(UP, "Blocks:Grass Top")
    dirt.setTexture(DOWN, "Blocks:Dirt")
    local bedrock = scene.voxels.blocks:new("Bedrock")
    bedrock.setTexture(ALL, "Blocks:Greystone")
    local allBlocks = scene.voxels.blocks:all()
    return allBlocks
end
