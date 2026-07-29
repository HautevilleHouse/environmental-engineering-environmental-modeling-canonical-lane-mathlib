import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure RiverReaerationPackage where
  reaerationRate : ℝ
  deoxygenationRate : ℝ
  initialDO : ℝ
  doDeficit : ℝ → ℝ

structure WaterQualityEvidence (W : RiverReaerationPackage) where
  reaerationRateClosed : W.reaerationRate > 0
  deoxygenationRateClosed : W.deoxygenationRate > 0
  initialDOClosed : W.initialDO ≥ 0
  doDeficitClosed : ∀ t, W.doDeficit t ≥ 0

def WaterQualityClosed (W : RiverReaerationPackage) : Prop :=
  W.reaerationRate > 0 ∧ W.deoxygenationRate > 0 ∧ W.initialDO ≥ 0 ∧ (∀ t, W.doDeficit t ≥ 0)

theorem water_quality_closed_from_evidence (W : RiverReaerationPackage)
    (E : WaterQualityEvidence W) : WaterQualityClosed W := by
  exact And.intro E.reaerationRateClosed (And.intro E.deoxygenationRateClosed
    (And.intro E.initialDOClosed E.doDeficitClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse