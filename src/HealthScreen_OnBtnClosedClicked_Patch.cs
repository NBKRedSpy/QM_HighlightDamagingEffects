using HarmonyLib;
using MGSC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QM_HighlightDamagingEffects
{
    /// <summary>
    /// Update the UI in case any wounds have been fixed.
    /// The game normally has no reason to update the wound panels.
    /// </summary>
    [HarmonyPatch(typeof(HealthScreen), nameof(HealthScreen.OnBtnClosedClicked))]
    public static class HealthScreen_OnBtnClosedClicked_Patch
    {
        public static void Postfix()
        {

            DungeonUI.Instance._dungeonHudScreen.Effects._typeToPanels.Values
                .SelectMany(x => x)
                .Where(x => x.enabled)
                .ToList()
                .ForEach(x => x.RefreshValue(x._effectWithViews));

        }
    }
}
