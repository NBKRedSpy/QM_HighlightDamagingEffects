.method public hidebysig 
	instance void RefreshBodyPartWoundView () cil managed 
{
	// Method begins at RVA 0x8abbc
	// Header size: 12
	// Code size: 298 (0x12a)
	.maxstack 3
	.locals init (
		[0] class [mscorlib]System.Collections.Generic.IEnumerator`1<string>,
		[1] string,
		[2] class MGSC.DamageTypesDescriptor,
		[3] string,
		[4] string,
		[5] class [UnityEngine.CoreModule]UnityEngine.Sprite,
		[6] class [UnityEngine.CoreModule]UnityEngine.Sprite,
		[7] class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>,
		[8] class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>,
		[9] valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.CommonEffectPanel>
	)

	// foreach (string id in Data.DamageTypes.Ids)
	IL_0000: call class MGSC.ConfigRecordCollection`1<class MGSC.DamageTypeRecord> MGSC.Data::get_DamageTypes()
	IL_0005: callvirt instance class [mscorlib]System.Collections.Generic.IEnumerable`1<string> class MGSC.ConfigRecordCollection`1<class MGSC.DamageTypeRecord>::get_Ids()
	IL_000a: callvirt instance class [mscorlib]System.Collections.Generic.IEnumerator`1<!0> class [mscorlib]System.Collections.Generic.IEnumerable`1<string>::GetEnumerator()
	IL_000f: stloc.0
	.try
	{
		// foreach (string id in Data.DamageTypes.Ids)
		IL_0010: br IL_0112
		// loop start (head: IL_0112)
			IL_0015: ldloc.0
			IL_0016: callvirt instance !0 class [mscorlib]System.Collections.Generic.IEnumerator`1<string>::get_Current()
			IL_001b: stloc.1
			// DamageTypesDescriptor damageTypesDescriptor = Data.DamageTypes.GetRecord(id).ContentDescriptor as DamageTypesDescriptor;
			IL_001c: call class MGSC.ConfigRecordCollection`1<class MGSC.DamageTypeRecord> MGSC.Data::get_DamageTypes()
			IL_0021: ldloc.1
			IL_0022: ldc.i4.1
			IL_0023: callvirt instance !0 class MGSC.ConfigRecordCollection`1<class MGSC.DamageTypeRecord>::GetRecord(string, bool)
			IL_0028: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Object MGSC.ConfigTableRecord::get_ContentDescriptor()
			IL_002d: isinst MGSC.DamageTypesDescriptor
			IL_0032: stloc.2
			// string key = "BodyPartWound_" + id;
			IL_0033: ldstr "BodyPartWound_"
			IL_0038: ldloc.1
			IL_0039: call string [mscorlib]System.String::Concat(string, string)
			IL_003e: stloc.3
			// string key2 = "amputation_BodyPartWound_" + id;
			IL_003f: ldstr "amputation_BodyPartWound_"
			IL_0044: ldloc.1
			IL_0045: call string [mscorlib]System.String::Concat(string, string)
			IL_004a: stloc.s 4
			// Sprite icon = (WoundSystem.AreAllWoundsByDmgTypeFixed(id, _effectsController) ? damageTypesDescriptor.BodyPartFixedIcon : damageTypesDescriptor.BodyPartTypeIcon);
			IL_004c: ldloc.1
			IL_004d: ldarg.0
			IL_004e: ldfld class MGSC.EffectsController MGSC.EffectsView::_effectsController
			IL_0053: call bool MGSC.WoundSystem::AreAllWoundsByDmgTypeFixed(string, class MGSC.EffectsController)
			IL_0058: brtrue.s IL_0062

			IL_005a: ldloc.2
			IL_005b: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Sprite MGSC.DamageTypesDescriptor::get_BodyPartTypeIcon()
			IL_0060: br.s IL_0068

			// Sprite icon2 = (WoundSystem.AreAllAmputationsFixed(_effectsController) ? _amputationFixedSprite : _amputationSprite);
			IL_0062: ldloc.2
			IL_0063: callvirt instance class [UnityEngine.CoreModule]UnityEngine.Sprite MGSC.DamageTypesDescriptor::get_BodyPartFixedIcon()

			IL_0068: stloc.s 5
			IL_006a: ldarg.0
			IL_006b: ldfld class MGSC.EffectsController MGSC.EffectsView::_effectsController
			IL_0070: call bool MGSC.WoundSystem::AreAllAmputationsFixed(class MGSC.EffectsController)
			IL_0075: brtrue.s IL_007f

			IL_0077: ldarg.0
			IL_0078: ldfld class [UnityEngine.CoreModule]UnityEngine.Sprite MGSC.EffectsView::_amputationSprite
			IL_007d: br.s IL_0085

			// _typeToPanels.TryGetValue(key, out var value);
			IL_007f: ldarg.0
			IL_0080: ldfld class [UnityEngine.CoreModule]UnityEngine.Sprite MGSC.EffectsView::_amputationFixedSprite

			IL_0085: stloc.s 6
			IL_0087: ldarg.0
			IL_0088: ldfld class [mscorlib]System.Collections.Generic.Dictionary`2<string, class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>> MGSC.EffectsView::_typeToPanels
			IL_008d: ldloc.3
			IL_008e: ldloca.s 7
			IL_0090: callvirt instance bool class [mscorlib]System.Collections.Generic.Dictionary`2<string, class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>>::TryGetValue(!0, !1&)
			IL_0095: pop
			// if (value != null)
			IL_0096: ldloc.s 7
			IL_0098: brfalse.s IL_00cc

			// foreach (CommonEffectPanel item in value)
			IL_009a: ldloc.s 7
			IL_009c: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>::GetEnumerator()
			IL_00a1: stloc.s 9
			.try
			{
				// foreach (CommonEffectPanel item in value)
				IL_00a3: br.s IL_00b3
				// loop start (head: IL_00b3)
					IL_00a5: ldloca.s 9
					IL_00a7: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.CommonEffectPanel>::get_Current()
					// item.UpdateIcon(icon);
					IL_00ac: ldloc.s 5
					IL_00ae: callvirt instance void MGSC.CommonEffectPanel::UpdateIcon(class [UnityEngine.CoreModule]UnityEngine.Sprite)

					// foreach (CommonEffectPanel item in value)
					IL_00b3: ldloca.s 9
					IL_00b5: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.CommonEffectPanel>::MoveNext()
					IL_00ba: brtrue.s IL_00a5
				// end loop

				// (no C# code)
				IL_00bc: leave.s IL_00cc
			} // end .try
			finally
			{
				IL_00be: ldloca.s 9
				IL_00c0: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.CommonEffectPanel>
				IL_00c6: callvirt instance void [mscorlib]System.IDisposable::Dispose()
				// _typeToPanels.TryGetValue(key2, out var value2);
				IL_00cb: endfinally
			} // end handler

			IL_00cc: ldarg.0
			IL_00cd: ldfld class [mscorlib]System.Collections.Generic.Dictionary`2<string, class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>> MGSC.EffectsView::_typeToPanels
			IL_00d2: ldloc.s 4
			IL_00d4: ldloca.s 8
			IL_00d6: callvirt instance bool class [mscorlib]System.Collections.Generic.Dictionary`2<string, class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>>::TryGetValue(!0, !1&)
			IL_00db: pop
			// if (value2 == null)
			IL_00dc: ldloc.s 8
			IL_00de: brfalse.s IL_0112

			// foreach (CommonEffectPanel item2 in value2)
			IL_00e0: ldloc.s 8
			IL_00e2: callvirt instance valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<!0> class [mscorlib]System.Collections.Generic.List`1<class MGSC.CommonEffectPanel>::GetEnumerator()
			IL_00e7: stloc.s 9
			.try
			{
				// foreach (CommonEffectPanel item2 in value2)
				IL_00e9: br.s IL_00f9
				// loop start (head: IL_00f9)
					IL_00eb: ldloca.s 9
					IL_00ed: call instance !0 valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.CommonEffectPanel>::get_Current()
					// item2.UpdateIcon(icon2);
					IL_00f2: ldloc.s 6
					IL_00f4: callvirt instance void MGSC.CommonEffectPanel::UpdateIcon(class [UnityEngine.CoreModule]UnityEngine.Sprite)

					// foreach (CommonEffectPanel item2 in value2)
					IL_00f9: ldloca.s 9
					IL_00fb: call instance bool valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.CommonEffectPanel>::MoveNext()
					IL_0100: brtrue.s IL_00eb
				// end loop

				// continue;
				IL_0102: leave.s IL_0112
			} // end .try
			finally
			{
				// (no C# code)
				IL_0104: ldloca.s 9
				IL_0106: constrained. valuetype [mscorlib]System.Collections.Generic.List`1/Enumerator<class MGSC.CommonEffectPanel>
				IL_010c: callvirt instance void [mscorlib]System.IDisposable::Dispose()
				// foreach (string id in Data.DamageTypes.Ids)
				IL_0111: endfinally
			} // end handler

			IL_0112: ldloc.0
			IL_0113: callvirt instance bool [mscorlib]System.Collections.IEnumerator::MoveNext()
			// (no C# code)
			IL_0118: brtrue IL_0015
		// end loop

		IL_011d: leave.s IL_0129
	} // end .try
	finally
	{
		IL_011f: ldloc.0
		IL_0120: brfalse.s IL_0128

		IL_0122: ldloc.0
		IL_0123: callvirt instance void [mscorlib]System.IDisposable::Dispose()

		IL_0128: endfinally
	} // end handler

	IL_0129: ret
} // end of method EffectsView::RefreshBodyPartWoundView
