#!/usr/bin/ruby
require_relative 'advent24'
require 'test/unit'
class TestAdvent24 < Test::Unit::TestCase
TestData = <<EOF
sesenwnenenewseeswwswswwnenewsewsw
neeenesenwnwwswnenewnwwsewnenwseswesw
seswneswswsenwwnwse
nwnwneseeswswnenewneswwnewseswneseene
swweswneswnenwsewnwneneseenw
eesenwseswswnenwswnwnwsewwnwsene
sewnenenenesenwsewnenwwwse
wenwwweseeeweswwwnwwe
wsweesenenewnwwnwsenewsenwwsesesenwne
neeswseenwwswnwswswnw
nenwswwsewswnenenewsenwsenwnesesenew
enewnwewneswsewnwswenweswnenwsenwsw
sweneswneswneneenwnewenewwneswswnese
swwesenesewenwneswnwwneseswwne
enesenwswwswneneswsenwnewswseenwsese
wnwnesenesenenwwnenwsewesewsesesew
nenewswnwewswnenesenwnesewesw
eneswnwswnwsenenwnwnwwseeswneewsenese
neswnwewnwnwseenwseesewsenwsweewe
wseweeenwnesenwwwswnew
EOF

  def setup
    @test1_1  = [TestData, 10]
    @test2_1  = [TestData, 2208 ]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent24.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent24.new(@test2_1[0]).part2)
  end
end
