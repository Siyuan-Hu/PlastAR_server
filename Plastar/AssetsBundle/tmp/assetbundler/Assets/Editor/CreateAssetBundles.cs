using UnityEngine;
using UnityEditor;

public class CreateAssetBundles : MonoBehaviour
{
    [MenuItem ("Assets/BuildAllAssetBundles")]
    static void BuildAllAssetBundles ()
    {
        BuildPipeline.BuildAssetBundles ("Assets/AssetBundles", BuildAssetBundleOptions.None, BuildTarget.Android);
    }
}