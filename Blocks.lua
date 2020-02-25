-- blocks
-- RJ 20200222

function blocks()
    scene.voxels.blocks:addAssetPack("Blocks")
    local dirt = scene.voxels.blocks:new("Dirt Grass")
    dirt.setTexture(ALL, "Blocks:Dirt Grass")
    local bedrock = scene.voxels.blocks:new("Bedrock")
    bedrock.setTexture(ALL, "Blocks:Greystone")
    local allBlocks = scene.voxels.blocks:all()
    return allBlocks
end
