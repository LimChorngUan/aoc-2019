module Day1Test exposing (suite)

import Day1 exposing (getRequiredFuel)
import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Day 1"
        [ describe "Given the mass of a module, mgetRequiredFuel should return the fuel needed for launching that module"
            [ test "12 -> 2" <|
                \_ ->
                    Expect.equal (getRequiredFuel 12) 2
            , test "14 -> 2" <|
                \_ ->
                    Expect.equal (getRequiredFuel 14) 2
            , test "1969 -> 654" <|
                \_ ->
                    Expect.equal (getRequiredFuel 1969) 654
            , test "100756 -> 33583" <|
                \_ ->
                    Expect.equal (getRequiredFuel 100756) 33583
            ]
        ]
