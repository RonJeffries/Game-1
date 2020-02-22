-- blocks
-- RJ 20200222

function blocks()
    -- create one block type, Dirt. Stealing from Block Library project.
    scene.voxels.blocks:addAssetPack("Blocks")
    local dirt = scene.voxels.blocks:new("Dirt")
    dirt.setTexture(ALL, "Blocks:Dirt")
    local allBlocks = scene.voxels.blocks:all()
    return allBlocks
end
