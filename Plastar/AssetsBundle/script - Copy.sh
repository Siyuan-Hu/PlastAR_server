#!/bin/bash

# Unity path
# project path
# resource path
# assets bundle path

ASSET_BUNDLE_DIR=/c/TangoProject/sample/recognize/backEnd/Plastar/Plastar/AssetsBundle/AssetsBundle

UNITY_EXEC=/c/"Program Files"/Unity/Editor/Unity.exe

# if [ -z "$2" ]; then echo "You must provide a path to the bundle assets and a path to the resulting bundle."; fi
#CREATION_TIME=`date +%s`
CREATION_TIME="123" ASSET_BUNDLE_PROJECT_DIR=/c/TangoProject/sample/recognize/backEnd/Plastar/Plastar/AssetsBundle/tmp/assetbundler

RESOURCE_FILE=/c/TangoProject/sample/recognize/backEnd/Plastar/Plastar/AssetsBundle/resource

mkdir ${ASSET_BUNDLE_DIR}/${CREATION_TIME}

echo "Copying resources from source folder to assets folder."; cd $RESOURCE_FILE; cp -r . ${ASSET_BUNDLE_PROJECT_DIR}/Assets/Resources;


echo "Building the Prefab."; "${UNITY_EXEC}" -batchmode -projectPath ${ASSET_BUNDLE_PROJECT_DIR} -executeMethod Bundler.Init -quit;

echo "Building the Bundle."; "${UNITY_EXEC}" -batchmode -projectPath ${ASSET_BUNDLE_PROJECT_DIR} -executeMethod CreateAssetBundles.BuildAllAssetBundles -quit;

echo "Copying AssetsBundle from project folder to server folder."; cd ${ASSET_BUNDLE_PROJECT_DIR}/Assets/AssetBundles; cp -r . ${ASSET_BUNDLE_DIR}/${CREATION_TIME};

echo "Copying snapshot to server folder."; cp ${RESOURCE_FILE}/cast/model/rotatedView/000.png ${ASSET_BUNDLE_DIR}/${CREATION_TIME};

echo "Copying Prefab from project folder to server folder."; cd ${ASSET_BUNDLE_PROJECT_DIR}/Assets/Prefabs; cp -r . ${ASSET_BUNDLE_DIR}/${CREATION_TIME};

echo "Deleting resource file in the project"; rm -rf ${ASSET_BUNDLE_PROJECT_DIR}/Assets/Resources/*;

echo "Deleting Prefab file in the project"; rm -rf ${ASSET_BUNDLE_PROJECT_DIR}/Assets/Prefabs/*;

echo "Deleting Bundle file in the project"; rm -rf ${ASSET_BUNDLE_PROJECT_DIR}/Assets/AssetBundles/*;

echo "Deleting resource file"; rm -rf ${RESOURCE_FILE}/cast;

#read -p "Press enter to continue"