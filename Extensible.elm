module Main exposing (..)

import Html exposing (Html, div, text)


type alias BarManager =
    { last : String
    , first : String
    , age : Int
    , location : String
    }

type alias BarEmployee =
    { last : String
    , first : String
    }

type alias Model =
    { user : BarManager
    , city : String
    , state : String
    }


user :
    { n | last : String, first : String }
    -> String
--user : BarEmployee -> String
user data =
    data.first
        ++ " "
        ++ data.last



main =
    let
        model : Model
        model =
            { user =
                { last = "Kelly"
                , first = "Charlie"
                , age = 33
                , location = "South Philly"
                }
            , city = "Philadelphia"
            , state = "PA"
            }
    in
    div [] [ model.user |> user |> text ]


