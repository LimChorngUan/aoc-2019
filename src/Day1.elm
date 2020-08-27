module Day1 exposing (getRequiredFuel, getRequiredFuelRecursive, getTotalFuel, parseAOCInput)

{-
  The Tyranny of the Rocket Equation: https://adventofcode.com/2019/day/1
  To find the fuel required for a module, take its mass, divide by three, round down, and subtract 2.
-}
getRequiredFuel : Int -> Int
getRequiredFuel mass =
    mass // 3 - 2

{-
  Fuel needs fuel too
-}
getRequiredFuelRecursive : Int -> Int
getRequiredFuelRecursive mass =
    let
        fuelRequired = getRequiredFuel mass
    in
         if fuelRequired < 0 then
            0
         else
            fuelRequired + getRequiredFuelRecursive fuelRequired


{-
  To find the total fuel required for all modules on the spacecraft,
  individually calculate the fuel needed for the mass of each module, then add together all the fuel values.
-}
getTotalFuel : List Int -> Int
getTotalFuel moduleMasses =
    List.map getRequiredFuelRecursive moduleMasses
      |> List.foldl (+) 0


{-
  Util for parsing the aoc puzzle inputs to a list which can be fed to getTotalFuel
-}
parseAOCInput : String -> List Int
parseAOCInput inputString =
    String.lines inputString
        |> List.map String.trim
        |> List.map String.toInt
        |> List.map (Maybe.withDefault 0)
        |> List.filter ((/=) 0)