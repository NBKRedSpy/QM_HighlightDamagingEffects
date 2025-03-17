//using HarmonyLib;
//using MGSC;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using UnityEngine;

//namespace QM_HighlightDamagingEffects
//{


//    [HarmonyPatch(typeof(CommonEffectPanel), nameof(CommonEffectPanel.RefreshValue), typeof(List<IEffectWithView>))]
//    public static class CommonEffectPanel_RefreshValue_Patch
//    {
//        public static HashSet<string> DamageTypes = new HashSet<string>()
//        {
//            "action_dmg",
//            "apoint_dmg",
//            "dot_dmg",
//            "move_dmg"
//        };

//        public static void Postfix(CommonEffectPanel __instance, List<IEffectWithView> effects)
//        {
//            bool hasDamagingWound = effects
//                .Where(x => x is BodyPartWound)
//                .Cast<BodyPartWound>()
//                .Any(x => x.IsFixated == false && DamageTypes.Contains(x._woundTypeRecord.DamageType));

//            if (hasDamagingWound)
//            {
//                __instance._bgCover.color = Plugin.Config.HighlightColorUnity;
//            }
//            else
//            {
//                __instance._bgCover.color = (effects[0].IsRedView ? __instance._coverRedColor : __instance._coverGreenColor);
//            }
//        }
//    }
//}
