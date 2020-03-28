-- TestGame
-- RJ 20200316

function testGame1()
    CodeaUnit.detailed = true

    _:describe("Game1 Tests", function()

        _:before(function()
            -- Some setup
        end)

        _:after(function()
            -- Some teardown
        end)
        
        _:test("Try again", function()
            _:expect(2+1).is(3)
        end)
        
        _:test("Angle Between", function()
            local v1 = vec2(0,0)
            local v2 = vec2(1,1)
            local a1 = vec2(1,0):angleBetween(v2)
            local aDeg = math.deg(a1)
            _:expect(aDeg).is(45)
            local a2 = vec2(0,1):angleBetween(v2)
            local a2Deg = math.deg(a2)
            _:expect(a2Deg).is(-45)
        end)

    end)
end