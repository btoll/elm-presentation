module Main exposing (..)

import Html exposing (div, li, text, ul)



programmers : List ( List String )
programmers =
    [ [ "Ken", "Thompson", "American", "B" ]
    , [ "Dennis", "Ritchie", "American", "C" ]
    , [ "Bjarne", "Stroustrup", "Danish", "C++" ]
    , [ "Evan", "Czaplicki", "American", "Elm" ]
    , [ "Rob", "Pike", "Canadian", "Go" ]
    , [ "Brendan", "Eich", "American", "JavaScript" ]
    , [ "Guido", "van Rossum", "Danish", "Python" ]
    ]


getLanguages =
    List.map
        ( Maybe.withDefault ""
            << List.head
            << List.reverse
        )


getNationality a =
    List.filter
        ( \r ->
            (==)
                ( List.drop 2 r
                    |> List.head
                    >> Maybe.withDefault ""
                )
                a
        )


--notAmericans =
--    "American" |> getNationality (/=)


getAmericans =
    "American" |> getNationality


getDanes =
    "Danish" |> getNationality


--main =
--    div []
--        [ text
--            << toString
--            << List.reverse
--            << getLanguages
----            << getDanes
--            << ( \p ->
--                List.concat
--                    [ p |> getAmericans
--                    , p |> getDanes
--                    ]
--                )
--            <| programmers
--        ]

makeList =
    List.map
        ( \r -> [ r |> text ] |> li [] )


main =
    ul []
        ( makeList
            << getLanguages
            <| programmers
        )


