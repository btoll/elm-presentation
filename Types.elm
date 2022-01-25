module Main exposing (..)

import Html exposing (Html, div, p, text)



type alias Message a =
    { code : String
    , body : a
    }

main =
    let
        m = Message "1337" [ 1, 2, 4]
        n = ( Message "1337" ) [ "a", "b", "c"]
    in
    div []
        [ p []
            [ Message "1337" "foo" |> toString >> text
            ]
        , p []
            [ toString m |> text
            ]
        , p []
            [ n |> toString >> text
            ]
        , p []
            [ text
                << toString
                << ( "1337" |> Message )
                <| ( "foo", "bar" )
            ]
        ]


