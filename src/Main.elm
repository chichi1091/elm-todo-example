-- Main.elm


module Main exposing (main)

import Browser
import Html exposing (Html, button, div, table, tbody, td, text, th, thead, tr)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Task =
    { id : Int
    , task : String
    }


type alias Model =
    { todoList : List Task }


init : Model
init =
    { todoList =
        [ { id = 1, task = "task1" }
        , { id = 2, task = "task2" }
        ]
    }



-- UPDATE


type Msg
    = Add


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add ->
            { model | todoList = { id = 3, task = "task3" } :: model.todoList }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ table []
                [ thead []
                    [ tr []
                        [ th [] [ text "ID" ]
                        , th [] [ text "TASK" ]
                        ]
                    ]
                ]
            , tbody [] (todoRow model.todoList)
            ]
        ]


todoRow : List Task -> List (Html Msg)
todoRow todos =
    let
        show todo =
            tr []
                [ td [] [ text (String.fromInt todo.id) ]
                , td [] [ text todo.task ]
                ]
    in
    List.map show todos
