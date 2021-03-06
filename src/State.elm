module State exposing (..)

import Types exposing (..)

import Login.State as LoginState

emptyModel : Model
emptyModel =
  Model LoginState.model

init : Maybe Model -> ( Model, Cmd Msg )
init savedModel =
  Maybe.withDefault emptyModel savedModel ! []

initialState : Model
initialState =
  emptyModel

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoOp ->
      model ! []
    Login loginMsg ->
      let
        ( newLogin, cmd ) =
          LoginState.update loginMsg model.login
        newCmd =
          Cmd.map Login cmd
      in
        ({ model | login = newLogin }, newCmd )
