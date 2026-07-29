import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean

structure WaterQualityPackage where
  eutrophicationModel : Prop
  dissolvedOxygenDynamics : Prop
  nutrientCycling : Prop
  pathogenIndicators : Prop

structure WaterQualityEvidence (P : WaterQualityPackage) where
  eutrophicationModelClosed : P.eutrophicationModel
  dissolvedOxygenDynamicsClosed : P.dissolvedOxygenDynamics
  nutrientCyclingClosed : P.nutrientCycling
  pathogenIndicatorsClosed : P.pathogenIndicators

def WaterQualityClosed (P : WaterQualityPackage) : Prop :=
  P.eutrophicationModel ∧ P.dissolvedOxygenDynamics ∧ P.nutrientCycling ∧ P.pathogenIndicators

theorem water_quality_closed_from_evidence (P : WaterQualityPackage)
    (E : WaterQualityEvidence P) : WaterQualityClosed P := by
  exact And.intro E.eutrophicationModelClosed
    (And.intro E.dissolvedOxygenDynamicsClosed
      (And.intro E.nutrientCyclingClosed E.pathogenIndicatorsClosed))

end EnvironmentalEngineeringEnvironmentalModelingCanonicalLaneLean
end HautevilleHouse