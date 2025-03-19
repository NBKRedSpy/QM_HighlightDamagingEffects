//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using HarmonyLib;
//using MGSC;
//using UnityEngine;


//namespace QM_HighlightDamagingEffects
//{
//    [HarmonyPatch(typeof(CommonEffectPanel), nameof(CommonEffectPanel.Initialize))]
//    internal static class CommonEffectPanel_Initialize_Patch
//    {

//        /// <summary>
//        /// Init the panel.
//        /// </summary>
//        /// <param name="__instance"></param>
//        /// <param name="creatures"></param>
//        /// <param name="effectWithView"></param>
//        public static void Postfix(CommonEffectPanel __instance, Creatures creatures, IEffectWithView effectWithView)
//        {

//            BodyPartWound effect;
//            if ((effect = effectWithView as BodyPartWound) == null) return;

//            if (effect.IsFixated ||
//                !CommonEffectPanel_RefreshValue_Patch.DamageTypes.Contains(effect._woundTypeRecord.DamageType)
//               )
//            {
//                return;
//            }

//            SetColor(__instance, effect, true);
//        }

//        public static void SetColor(CommonEffectPanel instance, BodyPartWound effect, bool showDamageColor)
//        {

//            if (showDamageColor)
//            {
//                instance._bgCover.color = Plugin.Config.HighlightColorUnity;
//            }
//            else
//            {
//                instance._bgCover.color = (effect.IsRedView ? instance._coverRedColor : instance._coverGreenColor);
//            }
//        }


//    }
//}
