using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace QM_HighlightDamagingEffects
{


    [HarmonyPatch(typeof(CommonEffectPanel), nameof(CommonEffectPanel.RefreshValue), typeof(List<IEffectWithView>))]
    public static class CommonEffectPanel_RefreshValue_Patch
    {
        public static HashSet<Type> DamageTypes = new HashSet<Type>()
        {
        typeof(WoundEffectActionDamage),
        typeof(WoundEffectActionPointDamage),
        typeof(WoundEffectDotDamage),
        typeof(WoundEffectMoveDamage)
        };

        public static void Postfix(CommonEffectPanel __instance, List<IEffectWithView> effects)
        {
            SetColorForDamageTypes(__instance, effects);
        }

        /// <summary>
        /// Sets the color of an effects view to the warning color if the effect pain
        /// contains a wound that is not fixated and has a damaging effect.
        /// </summary>
        /// <param name="effectPanel">The GUI element</param>
        /// <param name="effects">The effects (aka wounds, parks, etc.)</param>
        private static void SetColorForDamageTypes(CommonEffectPanel effectPanel, List<IEffectWithView> effects)
        {
            bool hasDamagingWound = effects
                .Where(x => x is BodyPartWound && ((BodyPartWound)x).IsFixated == false)
                .Cast<BodyPartWound>()
                .Any(x => x.GetFixableWoundEffects()
                    .Any(e => DamageTypes.Contains(e.GetType())))
                ;

            if (hasDamagingWound)
            {
                effectPanel._bgCover.color = Plugin.Config.HighlightColorUnity;
            }
            else
            {
                effectPanel._bgCover.color = (effects[0].IsRedView ? effectPanel._coverRedColor : effectPanel._coverGreenColor);
            }
        }
    }
}
