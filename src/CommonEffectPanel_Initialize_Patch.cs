﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;
using UnityEngine;


namespace QM_HighlightDamagingEffects
{
    [HarmonyPatch(typeof(CommonEffectPanel), nameof(CommonEffectPanel.Initialize))]
    internal static class CommonEffectPanel_Initialize_Patch
    {

        /// <summary>
        /// Init the panel.
        /// </summary>
        /// <param name="__instance"></param>
        /// <param name="creatures"></param>
        /// <param name="effectWithView"></param>
        public static void Postfix(CommonEffectPanel __instance, Creatures creatures, IEffectWithView effectWithView)
        {

            CommonEffectPanel_RefreshValue_Patch.SetColorForDamageTypes(
                __instance, new List<IEffectWithView>() { effectWithView });

        }

    }
}
