{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Home where

import Import

data ProjectStatus = TestList | Red | Green | Refactor

data Project = Project
    { projectName   :: Text
    , projectDesc   :: Text
    , projectLang   :: Text
    , projectStatus :: ProjectStatus
    }

statusLabel :: ProjectStatus -> Text
statusLabel TestList = "構想中"
statusLabel Red      = "進行中"
statusLabel Green    = "完成"
statusLabel Refactor = "改善済み"

statusClass :: ProjectStatus -> Text
statusClass TestList = "status-testlist"
statusClass Red      = "status-red"
statusClass Green    = "status-green"
statusClass Refactor = "status-refactor"

testListProjects :: [Project]
testListProjects =
    [ Project "auth-service" "認証マイクロサービス" "Haskell" TestList
    , Project "tdd-tutorial" "TDD チュートリアルサイト" "Haskell" TestList
    ]

redProject :: Project
redProject = Project "my-portfolio" "TDD ポートフォリオサイト" "Haskell" Red

greenProjects :: [Project]
greenProjects =
    [ Project "tdd-calc" "TDD で作った計算機" "Haskell" Green
    , Project "cli-tool" "コマンドラインツール" "Go" Green
    , Project "chat-app" "リアルタイムチャット" "TypeScript" Green
    ]

refactorProjects :: [Project]
refactorProjects =
    [ Project "api-kit" "REST API フレームワーク" "Go" Refactor
    ]

getHomeR :: Handler Html
getHomeR = do
    defaultLayout $ do
        setTitle "TDD野郎 | Red → Green → Refactor"
        $(widgetFile "homepage")
