using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HarmonyLib;
using MGSC;


namespace QM_HighlightDamagingEffects
{
    [HarmonyPatch(typeof(EffectsView), nameof (EffectsView.RefreshBodyPartWoundView))]
    public static class EffectsView_RefreshBodyPartWoundView_Patch
    {
        public static void Postfix(EffectsView __instance)
        {

            foreach (KeyValuePair<string, List<CommonEffectPanel>> typeToPanel in __instance._typeToPanels)
            {
                foreach (CommonEffectPanel item in typeToPanel.Value)
                {
                    CommonEffectPanel_RefreshValue_Patch.SetColorForDamageTypes(
                        item, item._effectWithViews);
                }
            }
        }
    }
}
