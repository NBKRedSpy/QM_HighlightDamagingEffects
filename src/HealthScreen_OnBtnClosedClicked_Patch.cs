//using HarmonyLib;
//using MGSC;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace QM_HighlightDamagingEffects
//{
//    /// <summary>
//    /// Update the UI in case any wounds have been fixed.
//    /// The game normally has no reason to update the wound panels.
//    /// </summary>
//    [HarmonyPatch(typeof(HealthScreen), nameof(HealthScreen.CloseBtnOnClick))]
//    public static class HealthScreen_CloseBtnOnClick_Patch
//    {
//        public static void Postfix()
//        {
//            UI.Get<DungeonHudScreen>().RefreshAllHud();
//        }
//    }
//}
