module Main exposing (..)

import Bitwise
import Html exposing (Html, button, div, h3, span, text)
import Html.Events exposing (onClick)

-- MODEL

type alias Model
    = Int

-- UPDATE

type Msg
    = Decrease
    | Increase

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Decrease ->
            ( model |> Bitwise.shiftRightBy 1 ) ! []

        Increase ->
            ( model |> Bitwise.shiftLeftBy 1 ) ! []

-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ h3 [] [ "Incremental bit shifting" |> text ]
        , button [ Decrease |> onClick ] [ "Decrease exponentially" |> text ]
        , button [ Increase |> onClick ] [ "Increase exponentially" |> text ]
        , span [] [ text << toString <| model ]
        ]

init : ( Model, Cmd Msg )
init =
    32 ! []

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = always Sub.none
        }

