//using System;
//using System.CodeDom.Compiler;
//using System.Collections.Generic;
//using System.Linq;
//using System.Reflection.Emit;
//using System.Text;
//using System.Threading.Tasks;
//using HarmonyLib;
//using MGSC;
//using UnityEngine;
//using UnityEngine.Diagnostics;

//namespace QM_HighlightDamagingEffects
//{
//    [HarmonyPatch(typeof(EffectsView), nameof(EffectsView.RefreshBodyPartWoundView))]
//    public static class EffectsView_RefreshBodyPartWoundView_Patch
//    {
//        /// <summary>
//        /// Invert the wound colors so that fixed wounds are the dark red and unfixed wounds are the
//        /// bright yellow.
//        /// </summary>
//        /// <param name="instructions"></param>
//        /// <returns></returns>
//        public static IEnumerable<CodeInstruction> Transpiler(IEnumerable<CodeInstruction> instructions)
//        {


//            //Original code.  
//            //The goal is to invert the colors by inverting the ternary operator.
//            // Sprite icon = (WoundSystem.AreAllWoundsByDmgTypeFixed(id, _effectsController) ?
//            // damageTypesDescriptor.BodyPartFixedIcon : damageTypesDescriptor.BodyPartTypeIcon);

//            //the original IL can be found at OriginalIL\EffectsView_RefreshBodyPartWoundView.il

//            List<CodeInstruction> original = instructions.ToList();

//            //Utils.LogIL(original);

//            //Match this:
//            //      IL_0053: call bool MGSC.WoundSystem::AreAllWoundsByDmgTypeFixed(string, class MGSC.EffectsController)
//            //      ----Invert this to brfalse.
//            //      IL_0058: brtrue.s IL_0062

//            List<CodeInstruction> result = new CodeMatcher(original)
//                .MatchEndForward(
//                    //CodeMatch.Calls(() => WoundSystem.AreAllWoundsByDmgTypeFixed(default, default)),
//                    CodeMatch.Calls(AccessTools.DeclaredMethod(typeof( WoundSystem), nameof(WoundSystem.AreAllWoundsByDmgTypeFixed),
//                        new Type[] {typeof(string), typeof(EffectsController)})),
//                    new CodeMatch(OpCodes.Brtrue_S))
//                .ThrowIfNotMatch("Did not find AreAllWoundsByDmgTypeFixed")
//                .SetOpcodeAndAdvance(OpCodes.Brfalse_S)
//                .InstructionEnumeration()
//                .ToList();


//            return result;
//        }
//    }
//}
