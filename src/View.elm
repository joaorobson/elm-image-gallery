module View exposing (view)

import Array
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (..)
import Update exposing (..)
import ViewFunctions exposing (..)


view : Model -> Html Msg
view model =
    div [ class "main" ]
        [ h1 [] [ text "Welcome to the Gallery!!!" ]
        , showImgs model.imgs
        , bigScreenModal model
        ]


bigScreenModal m =
    div [ style "display" <| getShowBigScreenAttribute m ]
        [ div [ class "overlay" ] []
        , div [ class "bigScreenModal", style "background-image" (getUrlAttribute <| getCurrentUrl m), style "background-size" <| getRealSizeAttribute m ]
            [ img [ class "dismissButton", src m.dismissButton, onClick HideSelected ] []
            , img [ class "leftArrowButton", src m.leftArrowButton, onClick SelectPrev ] []
            , img [ class "rightArrowButton", src m.rightArrowButton, onClick SelectNext ] []
            , div [ class "toolsBar" ]
                [ img [ class "toolButton", src m.realSizeButton, onClick ShowRealSize ] []
                , img [ class "toolButton", src m.fullScreenButton, onClick ShowResized ] []
                ]
            ]
        ]
